CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice_den"."assign_admitted" ("scope", "root"), "slice_den"."assign_assignment_input" ("scope", "root"), "slice_den"."assign_assignment_input_exclude" ("scope", "ordinal", "root"), "slice_den"."assign_assignment_input_mode_nearest" ("scope", "root"), "slice_den"."assign_assignment_input_mode_within" ("scope", "root"), "slice_den"."assign_assignment_input_near" ("scope", "ordinal", "root"), "slice_den"."assign_claim" ("step", "root", "attempt"), "slice_den"."assign_decide_input" ("step", "root"), "slice_den"."assign_decide_input_exclude" ("step", "ordinal", "root"), "slice_den"."assign_decide_input_mode_nearest" ("step", "root"), "slice_den"."assign_decide_input_mode_within" ("step", "root"), "slice_den"."assign_decide_output" ("step", "root"), "slice_den"."assign_decide_output_stage_rest" ("step", "root"), "slice_den"."assign_decide_output_stage_serve" ("step", "root"), "slice_den"."assign_decide_output_weighed" ("step", "ordinal", "root"), "slice_den"."assign_decide_read_nearest" ("step", "ordinal", "root"), "slice_den"."assign_decide_read_nearest_row" ("digest"), "slice_den"."assign_decide_read_seen" ("step", "ordinal", "root"), "slice_den"."assign_decide_read_seen_row" ("digest"), "slice_den"."assign_embed_input" ("step", "root"), "slice_den"."assign_embed_input_exclude" ("step", "ordinal", "root"), "slice_den"."assign_embed_input_mode_nearest" ("step", "root"), "slice_den"."assign_embed_input_mode_within" ("step", "root"), "slice_den"."assign_embed_input_near" ("step", "ordinal", "root"), "slice_den"."assign_fenced" ("step", "attempt", "root"), "slice_den"."assign_finish" ("scope", "root"), "slice_den"."assign_held" ("step", "root"), "slice_den"."assign_paused" ("target", "turn"), "slice_den"."assign_result" ("step", "root"), "slice_den"."assign_resumed" ("target", "turn"), "slice_den"."assign_retry" ("step", "attempt", "root"), "slice_den"."assign_root" ("scope"), "slice_den"."assign_scope" ("scope", "root"), "slice_den"."assign_skipped" ("scope", "root"), "slice_den"."assign_step" ("step", "root"), "slice"."assigned" ("learner"), "slice_den"."audit" ("step"), "slice"."built" ("build"), "slice_den"."chain_admitted" ("scope", "root"), "slice_den"."chain_chain_run_input" ("scope", "root"), "slice_den"."chain_claim" ("step", "root", "attempt"), "slice_den"."chain_fenced" ("step", "attempt", "root"), "slice_den"."chain_finish" ("scope", "root"), "slice_den"."chain_held" ("step", "root"), "slice_den"."chain_next" ("from", "ordinal", "root"), "slice_den"."chain_ordered_input" ("scope", "root"), "slice_den"."chain_page_input" ("step", "root"), "slice_den"."chain_page_input_after" ("step", "root"), "slice_den"."chain_page_output" ("step", "root"), "slice_den"."chain_page_output_next" ("step", "root"), "slice_den"."chain_page_read_earlier_row" ("digest"), "slice_den"."chain_page_read_tree" ("step", "ordinal", "root"), "slice_den"."chain_page_read_tree_items" ("digest", "at"), "slice_den"."chain_page_read_tree_row" ("digest"), "slice_den"."chain_page_read_weights" ("step", "ordinal", "root"), "slice_den"."chain_page_read_weights_row" ("digest"), "slice_den"."chain_page_tree_first" ("digest", "at"), "slice_den"."chain_paused" ("target", "turn"), "slice_den"."chain_result" ("step", "root"), "slice_den"."chain_resumed" ("target", "turn"), "slice_den"."chain_retry" ("step", "attempt", "root"), "slice_den"."chain_root" ("scope"), "slice_den"."chain_scope" ("scope", "root"), "slice_den"."chain_skipped" ("scope", "root"), "slice_den"."chain_start_step" ("scope", "ordinal", "root"), "slice_den"."chain_step" ("step", "root"), "slice"."chimed" ("hour", "bell"), "slice_den"."clock_admitted" ("scope", "root"), "slice_den"."clock_chime_input" ("step", "root"), "slice_den"."clock_claim" ("step", "root", "attempt"), "slice_den"."clock_close_input" ("step", "root"), "slice_den"."clock_fenced" ("step", "attempt", "root"), "slice_den"."clock_finish" ("scope", "root"), "slice_den"."clock_held" ("step", "root"), "slice_den"."clock_hourly_input" ("scope", "root"), "slice_den"."clock_paused" ("target", "turn"), "slice_den"."clock_result" ("step", "root"), "slice_den"."clock_resumed" ("target", "turn"), "slice_den"."clock_retry" ("step", "attempt", "root"), "slice_den"."clock_root" ("scope"), "slice_den"."clock_scope" ("scope", "root"), "slice_den"."clock_sitting_input" ("scope", "root"), "slice_den"."clock_skipped" ("scope", "root"), "slice_den"."clock_step" ("step", "root"), "slice"."concluded" ("learner"), "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."delivered" ("attempt"), "slice_den"."fan_admitted" ("scope", "root"), "slice_den"."fan_batch_finish_output" ("step", "root"), "slice_den"."fan_batch_input" ("scope", "root"), "slice_den"."fan_claim" ("step", "root", "attempt"), "slice_den"."fan_dust_input" ("step", "root"), "slice_den"."fan_ended" ("step", "attempt", "root"), "slice_den"."fan_fan_run_input" ("scope", "root"), "slice_den"."fan_fenced" ("step", "attempt", "root"), "slice_den"."fan_finish" ("scope", "root"), "slice_den"."fan_held" ("step", "root"), "slice_den"."fan_hold" ("step", "root", "attempt", "at"), "slice_den"."fan_mop_input" ("step", "root"), "slice_den"."fan_paused" ("target", "turn"), "slice_den"."fan_result" ("step", "root"), "slice_den"."fan_resumed" ("target", "turn"), "slice_den"."fan_retry" ("step", "attempt", "root"), "slice_den"."fan_root" ("scope"), "slice_den"."fan_scope" ("scope", "root"), "slice_den"."fan_skipped" ("scope", "root"), "slice_den"."fan_square_input" ("step", "root"), "slice_den"."fan_square_output" ("step", "root"), "slice_den"."fan_start_scope" ("scope", "ordinal", "root"), "slice_den"."fan_start_step" ("scope", "ordinal", "root"), "slice_den"."fan_step" ("step", "root"), "slice_den"."fan_sweep_input" ("scope", "root"), "slice_den"."fan_within" ("scope", "root"), "slice"."heard" ("key"), "slice"."item" ("feed", "seq", "n"), "slice"."passage", "slice_den"."retry_admitted" ("scope", "root"), "slice_den"."retry_brittle_input" ("step", "root"), "slice_den"."retry_brittle_output" ("step", "root"), "slice_den"."retry_claim" ("step", "root", "attempt"), "slice_den"."retry_exhausted" ("step", "root"), "slice_den"."retry_fenced" ("step", "attempt", "root"), "slice_den"."retry_finish" ("scope", "root"), "slice_den"."retry_held" ("step", "root"), "slice_den"."retry_ladders_input" ("scope", "root"), "slice_den"."retry_patient_input" ("step", "root"), "slice_den"."retry_patient_output" ("step", "root"), "slice_den"."retry_paused" ("target", "turn"), "slice_den"."retry_polite_input" ("step", "root"), "slice_den"."retry_polite_output" ("step", "root"), "slice_den"."retry_result" ("step", "root"), "slice_den"."retry_resumed" ("target", "turn"), "slice_den"."retry_retry" ("step", "attempt", "root"), "slice_den"."retry_root" ("scope"), "slice_den"."retry_scope" ("scope", "root"), "slice_den"."retry_skipped" ("scope", "root"), "slice_den"."retry_steadfast_input" ("step", "root"), "slice_den"."retry_steadfast_output" ("step", "root"), "slice_den"."retry_step" ("step", "root"), "slice_den"."retry_throttled_input" ("scope", "root"), "slice_den"."retry_unhurried_input" ("scope", "root"), "slice_den"."review_admitted" ("scope", "root"), "slice_den"."review_analyze_input" ("step", "root"), "slice_den"."review_analyze_output" ("step", "root"), "slice_den"."review_claim" ("step", "root", "attempt"), "slice_den"."review_ended" ("step", "attempt", "root"), "slice_den"."review_fenced" ("step", "attempt", "root"), "slice_den"."review_finish" ("scope", "root"), "slice_den"."review_gather_input" ("step", "root"), "slice_den"."review_gather_input_sizes" ("step", "ordinal", "root"), "slice_den"."review_held" ("step", "root"), "slice_den"."review_hold" ("step", "root", "attempt", "at"), "slice_den"."review_paused" ("target", "turn"), "slice_den"."review_questions_finish_output" ("step", "root"), "slice_den"."review_questions_input" ("scope", "root"), "slice_den"."review_result" ("step", "root"), "slice_den"."review_resumed" ("target", "turn"), "slice_den"."review_retry" ("step", "attempt", "root"), "slice_den"."review_review_run_input" ("scope", "root"), "slice_den"."review_review_run_input_sizes" ("scope", "ordinal", "root"), "slice_den"."review_root" ("scope"), "slice_den"."review_save_input" ("step", "root"), "slice_den"."review_save_output" ("step", "root"), "slice_den"."review_scope" ("scope", "root"), "slice_den"."review_skipped" ("scope", "root"), "slice_den"."review_step" ("step", "root"), "slice_den"."review_within" ("scope", "root"), "slice"."reviewed" ("review", "group"), "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."summary" ("review"), "slice_den"."sync_admitted" ("scope", "root"), "slice_den"."sync_build_input" ("step", "root"), "slice_den"."sync_claim" ("step", "root", "attempt"), "slice_den"."sync_copy_input" ("step", "root"), "slice_den"."sync_exclusive" ("kind", "key", "turn"), "slice_den"."sync_exclusive_key" ("scope", "root"), "slice_den"."sync_fenced" ("step", "attempt", "root"), "slice_den"."sync_finish" ("scope", "root"), "slice_den"."sync_gold_input" ("scope", "root"), "slice_den"."sync_held" ("step", "root"), "slice_den"."sync_paused" ("target", "turn"), "slice_den"."sync_released" ("kind", "key", "turn"), "slice_den"."sync_result" ("step", "root"), "slice_den"."sync_resumed" ("target", "turn"), "slice_den"."sync_retry" ("step", "attempt", "root"), "slice_den"."sync_root" ("scope"), "slice_den"."sync_scope" ("scope", "root"), "slice_den"."sync_skipped" ("scope", "root"), "slice_den"."sync_step" ("step", "root"), "slice_den"."sync_sync_run_input" ("scope", "root"), "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice_den"."writeback_admitted" ("scope", "root"), "slice_den"."writeback_claim" ("step", "root", "attempt"), "slice_den"."writeback_deliver_input" ("step", "root"), "slice_den"."writeback_fenced" ("step", "attempt", "root"), "slice_den"."writeback_finish" ("scope", "root"), "slice_den"."writeback_held" ("step", "root"), "slice_den"."writeback_paused" ("target", "turn"), "slice_den"."writeback_result" ("step", "root"), "slice_den"."writeback_resumed" ("target", "turn"), "slice_den"."writeback_retry" ("step", "attempt", "root"), "slice_den"."writeback_root" ("scope"), "slice_den"."writeback_scope" ("scope", "root"), "slice_den"."writeback_skipped" ("scope", "root"), "slice_den"."writeback_step" ("step", "root"), "slice_den"."writeback_writeback_input" ("scope", "root"), "slice"."__ledger"
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

CREATE ROLE :"slice_seats__editor" NOLOGIN;

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

CREATE SCHEMA "slice_seats__editor";

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
FROM "slice_den"."assign_paused" AS "r1";

CREATE VIEW "slice_seats__assign_coordinator"."assign_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."assign_resumed" AS "r1";

CREATE VIEW "slice_seats__assign_coordinator"."assign_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."assign_served" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_asked" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."assign_asked" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_assignment_finish_output" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input" ("scope", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_assignment_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_exclude" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_assignment_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_assignment_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_assignment_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_near" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_assignment_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input" ("step", "learner", "topic", "vector", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_decide_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_decide_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_decide_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_decide_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_stage_rest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_decide_output_stage_rest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice_den"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice_den"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_read_nearest" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_read_nearest_row" ("digest", "passage", "topic", "distance") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice_den"."assign_decide_read_nearest_row" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_read_seen" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_seen" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_read_seen_row" ("digest", "learner", "passage") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage"
FROM "slice_den"."assign_decide_read_seen_row" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_done" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input" ("step", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_embed_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_embed_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_embed_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_embed_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_input_near" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_embed_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_embed_output" ("step", "vector", "root") AS
SELECT "r1"."step", "r1"."vector", "r1"."root"
FROM "slice_den"."assign_embed_output" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_ended" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_exhausted" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_failed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_fenced" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."assign_finish" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_held" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."assign_paused" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."assign_refusal" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_result" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."assign_resumed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."assign_root" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."assign_served" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."assign_step" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_asked" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."assign_asked" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_assignment_finish_output" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input" ("scope", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_assignment_input" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_exclude" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_assignment_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_assignment_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_assignment_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_near" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_assignment_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input" ("step", "learner", "topic", "vector", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_decide_input" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_decide_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_decide_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_decide_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output_stage_rest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_decide_output_stage_rest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice_den"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice_den"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_read_nearest" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_read_nearest_row" ("digest", "passage", "topic", "distance") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice_den"."assign_decide_read_nearest_row" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_read_seen" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_seen" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_read_seen_row" ("digest", "learner", "passage") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage"
FROM "slice_den"."assign_decide_read_seen_row" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_done" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input" ("step", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_embed_input" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_embed_input_exclude" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_embed_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_embed_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_input_near" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_embed_input_near" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_embed_output" ("step", "vector", "root") AS
SELECT "r1"."step", "r1"."vector", "r1"."root"
FROM "slice_den"."assign_embed_output" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_ended" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_exhausted" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_failed" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_fenced" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."assign_finish" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_held" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."assign_refusal" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_result" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."assign_root" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__assign_retirer"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."assign_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice_den"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice_den"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_read_nearest" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_nearest" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_read_nearest_row" ("digest", "passage", "topic", "distance") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice_den"."assign_decide_read_nearest_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_read_seen" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_seen" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_decide_read_seen_row" ("digest", "learner", "passage") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage"
FROM "slice_den"."assign_decide_read_seen_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."assign_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

CREATE VIEW "slice_seats__auditor"."audit" ("step", "root", "note") AS
SELECT "r1"."step", "r1"."root", "r1"."note"
FROM "slice_den"."audit" AS "r1";

CREATE VIEW "slice_seats__auditor"."built" ("build") AS
SELECT "r1"."build"
FROM "slice"."built" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_chain_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_done" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_ended" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_exhausted" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_failed" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_fenced" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_held" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."chain_next" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_ordered_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice_den"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_read_earlier" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_earlier" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_read_earlier_row" ("digest", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_earlier_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_read_tree" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_tree" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_read_tree_items" ("digest", "at", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."at", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_tree_items" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_read_tree_row" ("digest", "feed", "feed_name", "factor", "items") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."items"
FROM "slice_den"."chain_page_read_tree_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_read_weights" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_weights" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_read_weights_row" ("digest", "feed", "feed_name", "factor") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice_den"."chain_page_read_weights_row" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_page_tree_first" ("digest", "at") AS
SELECT "r1"."digest", "r1"."at"
FROM "slice_den"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."chain_root" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."chain_step" AS "r1";

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
FROM "slice_den"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice_den"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."fan_root" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice_den"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice_den"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice_den"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."fan_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_within" AS "r1";

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
FROM "slice_den"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__auditor"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__auditor"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."retry_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."retry_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."review_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."review_hold" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."review_step" AS "r1";

CREATE VIEW "slice_seats__auditor"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_within" AS "r1";

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
FROM "slice_den"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."sync_result" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__auditor"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__auditor"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "slice_seats__auditor"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "slice_seats__chain_coordinator"."chain_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_paused" AS "r1";

CREATE VIEW "slice_seats__chain_coordinator"."chain_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_resumed" AS "r1";

CREATE VIEW "slice_seats__chain_coordinator"."chain_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."chain_served" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_chain_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_done" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_ended" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_exhausted" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_failed" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_fenced" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_held" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."chain_next" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_ordered_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice_den"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_read_earlier" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_earlier" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_read_earlier_row" ("digest", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_earlier_row" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_read_tree" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_tree" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_read_tree_items" ("digest", "at", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."at", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_tree_items" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_read_tree_row" ("digest", "feed", "feed_name", "factor", "items") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."items"
FROM "slice_den"."chain_page_read_tree_row" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_read_weights" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_weights" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_read_weights_row" ("digest", "feed", "feed_name", "factor") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice_den"."chain_page_read_weights_row" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_page_tree_first" ("digest", "at") AS
SELECT "r1"."digest", "r1"."at"
FROM "slice_den"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_paused" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_result" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_resumed" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."chain_root" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."chain_served" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__chain_den"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."chain_step" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_chain_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_done" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_ended" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_exhausted" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_failed" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_fenced" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_held" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."chain_next" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_ordered_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice_den"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_read_earlier" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_earlier" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_read_earlier_row" ("digest", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_earlier_row" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_read_tree" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_tree" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_read_tree_items" ("digest", "at", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."at", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_tree_items" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_read_tree_row" ("digest", "feed", "feed_name", "factor", "items") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."items"
FROM "slice_den"."chain_page_read_tree_row" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_read_weights" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_weights" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_read_weights_row" ("digest", "feed", "feed_name", "factor") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice_den"."chain_page_read_weights_row" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_page_tree_first" ("digest", "at") AS
SELECT "r1"."digest", "r1"."at"
FROM "slice_den"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_result" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."chain_root" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__chain_retirer"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."chain_step" AS "r1";

CREATE VIEW "slice_seats__clock_coordinator"."clock_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_paused" AS "r1";

CREATE VIEW "slice_seats__clock_coordinator"."clock_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_resumed" AS "r1";

CREATE VIEW "slice_seats__clock_coordinator"."clock_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."clock_served" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."clock_admitted" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_chime_input" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_input_bell_names_nkzi4dgaig"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_chime_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_chime_output" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_output_bell_names_tzmx63kpb4"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_chime_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."clock_claim" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_close_input" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_close_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_close_output" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_close_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_done" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_ended" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_exhausted" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_failed" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_fenced" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."clock_finish" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_held" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_hourly_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_hourly_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_hourly_input" ("scope", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."scope", "r1"."hour", "r1"."bell", ("slice"."__clock_hourly_input_bell_names_vugtqsvsug"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_hourly_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_paused" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."clock_refusal" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_result" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_resumed" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_retry" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."clock_root" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."clock_scope" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."clock_served" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_sitting_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_sitting_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_sitting_input" ("scope", "sitting", "deadline", "root") AS
SELECT "r1"."scope", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_sitting_input" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."clock_skipped" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."clock_start_step" AS "r1";

CREATE VIEW "slice_seats__clock_den"."clock_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."clock_step" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."clock_admitted" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_chime_input" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_input_bell_names_nkzi4dgaig"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_chime_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_chime_output" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_output_bell_names_tzmx63kpb4"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_chime_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."clock_claim" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_close_input" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_close_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_close_output" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_close_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_done" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_ended" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_exhausted" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_failed" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_fenced" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."clock_finish" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_held" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_hourly_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_hourly_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_hourly_input" ("scope", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."scope", "r1"."hour", "r1"."bell", ("slice"."__clock_hourly_input_bell_names_vugtqsvsug"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_hourly_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."clock_refusal" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_result" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_retry" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."clock_root" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."clock_scope" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_sitting_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_sitting_finish_output" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_sitting_input" ("scope", "sitting", "deadline", "root") AS
SELECT "r1"."scope", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_sitting_input" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."clock_skipped" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."clock_start_step" AS "r1";

CREATE VIEW "slice_seats__clock_retirer"."clock_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."clock_step" AS "r1";

CREATE VIEW "slice_seats__editor"."passage" ("passage", "topic", "embedding") AS
SELECT "r1"."passage", "r1"."topic", "r1"."embedding"
FROM "slice"."passage" AS "r1";

CREATE VIEW "slice_seats__editor"."seen" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."seen" AS "r1";

CREATE VIEW "slice_seats__fan_coordinator"."fan_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__fan_resource_names_tugc7yp6xo"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."fan_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."fan_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."fan_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__fan_coordinator"."fan_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_paused" AS "r1";

CREATE VIEW "slice_seats__fan_coordinator"."fan_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_resumed" AS "r1";

CREATE VIEW "slice_seats__fan_coordinator"."fan_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."fan_served" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_batch_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_batch_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice_den"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_done" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_dust_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_dust_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_dust_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_dust_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_ended" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_exhausted" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_failed" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_fan_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_fan_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_fenced" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_held" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__fan_resource_names_tugc7yp6xo"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."fan_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."fan_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."fan_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__fan_den"."fan_mop_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_mop_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_mop_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_mop_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_paused" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."fan_refusal" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_result" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_7t2samsp7b"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_resumed" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_retry" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."fan_root" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."fan_served" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."fan_skipped" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice_den"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice_den"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice_den"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."fan_step" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_sweep_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_sweep_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_sweep_input" ("scope", "sweep", "root") AS
SELECT "r1"."scope", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_sweep_input" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_within" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_batch_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_batch_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice_den"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_done" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_dust_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_dust_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_dust_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_dust_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_ended" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_exhausted" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_failed" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_fan_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_fan_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_fenced" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_held" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_mop_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_mop_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_mop_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_mop_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."fan_refusal" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_result" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_retry" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."fan_root" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."fan_skipped" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice_den"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice_den"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice_den"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."fan_step" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_sweep_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_sweep_finish_output" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_sweep_input" ("scope", "sweep", "root") AS
SELECT "r1"."scope", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_sweep_input" AS "r1";

CREATE VIEW "slice_seats__fan_retirer"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_asked" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."assign_asked" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_assignment_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input" ("scope", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_assignment_input" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_exclude" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_assignment_input_exclude" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_assignment_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_assignment_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_near" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_assignment_input_near" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input" ("step", "learner", "topic", "vector", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_decide_input" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_decide_input_exclude" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_decide_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_decide_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output" ("step", "confidence", "stage", "stage_name", "root") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output_stage_rest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_decide_output_stage_rest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output_stage_serve" ("step", "passage", "distance", "root") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance", "r1"."root"
FROM "slice_den"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed", "r1"."root"
FROM "slice_den"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_read_nearest" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_nearest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_read_nearest_row" ("digest", "passage", "topic", "distance") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice_den"."assign_decide_read_nearest_row" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_read_seen" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."assign_decide_read_seen" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_decide_read_seen_row" ("digest", "learner", "passage") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage"
FROM "slice_den"."assign_decide_read_seen_row" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_done" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input" ("step", "learner", "topic", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_embed_input" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_exclude" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_embed_input_exclude" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_embed_input_mode_nearest" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice_den"."assign_embed_input_mode_within" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_input_near" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."assign_embed_input_near" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_embed_output" ("step", "vector", "root") AS
SELECT "r1"."step", "r1"."vector", "r1"."root"
FROM "slice_den"."assign_embed_output" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."assign_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."assign_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."assign_held" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."assign_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_result" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."assign_root" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."assign_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."assign_step" AS "r1";

CREATE VIEW "slice_seats__loader"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

CREATE VIEW "slice_seats__loader"."built" ("build") AS
SELECT "r1"."build"
FROM "slice"."built" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_chain_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."chain_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_done" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."chain_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."chain_held" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_next" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."chain_next" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_ordered_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_ordered_input" ("scope", "feed", "feed_name", "pages", "root") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_ordered_input" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages", "root") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages", "r1"."root"
FROM "slice_den"."chain_page_input" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_input_after" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_input_after" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_output" ("step", "seq", "items", "earlier", "root") AS
SELECT "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier", "r1"."root"
FROM "slice_den"."chain_page_output" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_output_next" ("step", "value", "root") AS
SELECT "r1"."step", "r1"."value", "r1"."root"
FROM "slice_den"."chain_page_output_next" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_read_earlier" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_earlier" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_read_earlier_row" ("digest", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_earlier_row" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_read_tree" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_tree" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_read_tree_items" ("digest", "at", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."at", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_tree_items" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_read_tree_row" ("digest", "feed", "feed_name", "factor", "items") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."items"
FROM "slice_den"."chain_page_read_tree_row" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_read_weights" ("step", "ordinal", "digest", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."digest", "r1"."root"
FROM "slice_den"."chain_page_read_weights" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_read_weights_row" ("digest", "feed", "feed_name", "factor") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice_den"."chain_page_read_weights_row" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_page_tree_first" ("digest", "at") AS
SELECT "r1"."digest", "r1"."at"
FROM "slice_den"."chain_page_tree_first" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."chain_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_result" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."chain_root" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."chain_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."chain_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."chain_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."chain_step" AS "r1";

CREATE VIEW "slice_seats__loader"."chimed" ("hour", "bell", "bell_name") AS
SELECT "r1"."hour", "r1"."bell", ("slice"."__bell_names_aiqi4uostx"())["r1"."bell" + 1]::"pg_catalog"."text"
FROM "slice"."chimed" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."clock_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_chime_input" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_input_bell_names_nkzi4dgaig"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_chime_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_chime_output" ("step", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."step", "r1"."hour", "r1"."bell", ("slice"."__clock_chime_output_bell_names_tzmx63kpb4"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_chime_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."clock_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_close_input" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_close_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_close_output" ("step", "sitting", "deadline", "root") AS
SELECT "r1"."step", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_close_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_done" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."clock_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."clock_held" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_hourly_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_hourly_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_hourly_input" ("scope", "hour", "bell", "bell_name", "root") AS
SELECT "r1"."scope", "r1"."hour", "r1"."bell", ("slice"."__clock_hourly_input_bell_names_vugtqsvsug"())["r1"."bell" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_hourly_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."clock_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_result" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."clock_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."clock_root" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."clock_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_sitting_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."clock_sitting_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_sitting_input" ("scope", "sitting", "deadline", "root") AS
SELECT "r1"."scope", "r1"."sitting", "r1"."deadline", "r1"."root"
FROM "slice_den"."clock_sitting_input" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."clock_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."clock_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."clock_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."clock_step" AS "r1";

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
FROM "slice_den"."fan_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_batch_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_batch_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_batch_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_batch_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice_den"."fan_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_done" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_dust_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_dust_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_dust_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_dust_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_fan_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_fan_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_fan_run_input" ("scope", "batch", "size", "root") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size", "r1"."root"
FROM "slice_den"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."fan_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."fan_held" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."fan_hold" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_mop_input" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_mop_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_mop_output" ("step", "sweep", "root") AS
SELECT "r1"."step", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_mop_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."fan_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_result" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_root_kind_names_nagupzc3sq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."fan_root" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."fan_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."fan_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_square_input" ("step", "batch", "n", "root") AS
SELECT "r1"."step", "r1"."batch", "r1"."n", "r1"."root"
FROM "slice_den"."fan_square_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_square_output" ("step", "square", "root") AS
SELECT "r1"."step", "r1"."square", "r1"."root"
FROM "slice_den"."fan_square_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice_den"."fan_start_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."fan_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_rrax7ylsix"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."fan_step" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_sweep_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."fan_sweep_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_sweep_input" ("scope", "sweep", "root") AS
SELECT "r1"."scope", "r1"."sweep", "r1"."root"
FROM "slice_den"."fan_sweep_input" AS "r1";

CREATE VIEW "slice_seats__loader"."fan_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."fan_within" AS "r1";

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
FROM "slice_den"."retry_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_brittle_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_brittle_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_brittle_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_brittle_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_done" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."retry_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_held" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_ladders_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_ladders_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_ladders_input" ("scope", "steadfast", "brittle", "root") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle", "r1"."root"
FROM "slice_den"."retry_ladders_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_patient_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_patient_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_patient_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_patient_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_polite_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_polite_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_polite_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_polite_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."retry_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."retry_result" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."retry_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."retry_root" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."retry_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."retry_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."retry_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_steadfast_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_steadfast_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."retry_step" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_throttled_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_throttled_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_throttled_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice_den"."retry_throttled_input" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_unhurried_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_unhurried_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."retry_unhurried_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice_den"."retry_unhurried_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."review_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."review_analyze_input" ("step", "review", "group", "question", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."question", "r1"."root"
FROM "slice_den"."review_analyze_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_analyze_output" ("step", "score", "root") AS
SELECT "r1"."step", "r1"."score", "r1"."root"
FROM "slice_den"."review_analyze_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice_den"."review_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."review_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_done" AS "r1";

CREATE VIEW "slice_seats__loader"."review_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."review_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."review_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."review_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."review_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."review_gather_input" ("step", "review", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."root"
FROM "slice_den"."review_gather_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_gather_input_sizes" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."review_gather_input_sizes" AS "r1";

CREATE VIEW "slice_seats__loader"."review_gather_output" ("step", "groups", "root") AS
SELECT "r1"."step", "r1"."groups", "r1"."root"
FROM "slice_den"."review_gather_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_held" AS "r1";

CREATE VIEW "slice_seats__loader"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."review_hold" AS "r1";

CREATE VIEW "slice_seats__loader"."review_questions_finish_output" ("step", "count", "total", "root") AS
SELECT "r1"."step", "r1"."count", "r1"."total", "r1"."root"
FROM "slice_den"."review_questions_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_questions_input" ("scope", "review", "group", "size", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."group", "r1"."size", "r1"."root"
FROM "slice_den"."review_questions_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."review_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_result" AS "r1";

CREATE VIEW "slice_seats__loader"."review_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."review_review_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_review_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_review_run_input" ("scope", "review", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."root"
FROM "slice_den"."review_review_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_review_run_input_sizes" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."review_review_run_input_sizes" AS "r1";

CREATE VIEW "slice_seats__loader"."review_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."review_root" AS "r1";

CREATE VIEW "slice_seats__loader"."review_save_input" ("step", "review", "group", "count", "total", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total", "r1"."root"
FROM "slice_den"."review_save_input" AS "r1";

CREATE VIEW "slice_seats__loader"."review_save_output" ("step", "total", "root") AS
SELECT "r1"."step", "r1"."total", "r1"."root"
FROM "slice_den"."review_save_output" AS "r1";

CREATE VIEW "slice_seats__loader"."review_saved" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."review_saved" AS "r1";

CREATE VIEW "slice_seats__loader"."review_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."review_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."review_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."review_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."review_split" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."review_split" AS "r1";

CREATE VIEW "slice_seats__loader"."review_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice_den"."review_start_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."review_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."review_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."review_step" AS "r1";

CREATE VIEW "slice_seats__loader"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_within" AS "r1";

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
FROM "slice_den"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_build_input" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice_den"."sync_build_input" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_build_output" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice_den"."sync_build_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."sync_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_copy_input" ("step", "relation", "run", "root") AS
SELECT "r1"."step", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice_den"."sync_copy_input" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_copy_output" ("step", "run", "root") AS
SELECT "r1"."step", "r1"."run", "r1"."root"
FROM "slice_den"."sync_copy_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_done" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_exclusive_key" ("scope", "key", "id", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."id", "r1"."root"
FROM "slice_den"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_gold_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_gold_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_gold_input" ("scope", "build", "root") AS
SELECT "r1"."scope", "r1"."build", "r1"."root"
FROM "slice_den"."sync_gold_input" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_held" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."sync_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."sync_result" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."sync_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."sync_root" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."sync_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."sync_step" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_sync_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_sync_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."sync_sync_run_input" ("scope", "relation", "run", "root") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice_den"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice_seats__loader"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "slice_seats__loader"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."writeback_admitted" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."writeback_claim" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_deliver_input" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_deliver_input" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_deliver_output" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_deliver_output" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_done" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_ended" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_exhausted" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_failed" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_fenced" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."writeback_finish" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_held" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."writeback_refusal" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."writeback_result" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."writeback_retry" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."writeback_root" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."writeback_scope" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."writeback_skipped" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."writeback_start_step" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."writeback_step" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_writeback_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_writeback_finish_output" AS "r1";

CREATE VIEW "slice_seats__loader"."writeback_writeback_input" ("scope", "attempt", "root") AS
SELECT "r1"."scope", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_writeback_input" AS "r1";

CREATE VIEW "slice_seats__retry_coordinator"."retry_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_paused" AS "r1";

CREATE VIEW "slice_seats__retry_coordinator"."retry_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_resumed" AS "r1";

CREATE VIEW "slice_seats__retry_coordinator"."retry_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."retry_served" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."retry_admitted" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_brittle_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_brittle_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_brittle_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_brittle_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_done" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_ended" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_failed" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_fenced" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."retry_finish" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_held" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_ladders_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_ladders_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_ladders_input" ("scope", "steadfast", "brittle", "root") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle", "r1"."root"
FROM "slice_den"."retry_ladders_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_patient_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_patient_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_patient_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_patient_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_paused" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_polite_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_polite_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_polite_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_polite_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."retry_refusal" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."retry_result" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_resumed" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."retry_retry" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."retry_root" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."retry_scope" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."retry_served" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."retry_skipped" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."retry_start_step" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_steadfast_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_steadfast_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."retry_step" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_throttled_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_throttled_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_throttled_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice_den"."retry_throttled_input" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_unhurried_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_unhurried_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_den"."retry_unhurried_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice_den"."retry_unhurried_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."retry_admitted" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_brittle_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_brittle_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_brittle_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_brittle_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."retry_claim" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_done" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_ended" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_exhausted" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_failed" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_fenced" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."retry_finish" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."retry_held" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_ladders_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_ladders_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_ladders_input" ("scope", "steadfast", "brittle", "root") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle", "r1"."root"
FROM "slice_den"."retry_ladders_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_patient_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_patient_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_patient_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_patient_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_polite_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_polite_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_polite_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_polite_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."retry_refusal" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."retry_result" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."retry_retry" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."retry_root" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."retry_scope" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."retry_skipped" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."retry_start_step" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_steadfast_input" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_steadfast_output" ("step", "key", "root") AS
SELECT "r1"."step", "r1"."key", "r1"."root"
FROM "slice_den"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."retry_step" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_throttled_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_throttled_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_throttled_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice_den"."retry_throttled_input" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_unhurried_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."retry_unhurried_finish_output" AS "r1";

CREATE VIEW "slice_seats__retry_retirer"."retry_unhurried_input" ("scope", "key", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."root"
FROM "slice_den"."retry_unhurried_input" AS "r1";

CREATE VIEW "slice_seats__review_coordinator"."review_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__review_resource_names_ixi3gnpcnp"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."review_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."review_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."review_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."review_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__review_coordinator"."review_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_paused" AS "r1";

CREATE VIEW "slice_seats__review_coordinator"."review_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_resumed" AS "r1";

CREATE VIEW "slice_seats__review_coordinator"."review_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."review_served" AS "r1";

CREATE VIEW "slice_seats__review_den"."delivered" ("attempt") AS
SELECT "r1"."attempt"
FROM "slice"."delivered" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."review_admitted" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_analyze_input" ("step", "review", "group", "question", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."question", "r1"."root"
FROM "slice_den"."review_analyze_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_analyze_output" ("step", "score", "root") AS
SELECT "r1"."step", "r1"."score", "r1"."root"
FROM "slice_den"."review_analyze_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice_den"."review_claim" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_done" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_ended" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_exhausted" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_failed" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_fenced" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."review_finish" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_gather_input" ("step", "review", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."root"
FROM "slice_den"."review_gather_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_gather_input_sizes" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."review_gather_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_gather_output" ("step", "groups", "root") AS
SELECT "r1"."step", "r1"."groups", "r1"."root"
FROM "slice_den"."review_gather_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_held" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."review_hold" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c59", "r17"."c60", ("slice"."__review_resource_names_ixi3gnpcnp"())["r17"."c60" + 1]::"pg_catalog"."text", "r17"."c61", "r17"."c62", "r17"."c63", "r17"."c64"
FROM (SELECT "r16"."c53", "r16"."c54", "r16"."c55", "r16"."c56", "r16"."c57", "r16"."c58" FROM (SELECT DISTINCT "r15"."c51", "r15"."c47", "r15"."c50", "r15"."c48", "r15"."c49", "r15"."c52" FROM (SELECT "r14"."c42", "r14"."c44", "r14"."c45", "r14"."c43", "r14"."c41", "r14"."c46" FROM (SELECT "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21", "r6"."c22" FROM (SELECT "r5"."c13", "r5"."c14", "r5"."c12", "r5"."c15", "r5"."c11", "r5"."c16" FROM (SELECT "r2"."c6", "r2"."c4", "r2"."c2", "r2"."c3", "r2"."c5", "r4"."c10" FROM (SELECT "r1"."at", "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."review_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5", "c6"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."review_claim" AS "r3") AS "r4"("c7", "c8", "c9", "c10") WHERE "r2"."c2" = "r4"."c7" AND "r2"."c4" = "r4"."c8" AND "r2"."c6" = "r4"."c9") AS "r5"("c11", "c12", "c13", "c14", "c15", "c16")) AS "r6"("c17", "c18", "c19", "c20", "c21", "c22") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."review_ended" AS "r7") AS "r8"("c23", "c24", "c25")) AS "r9"("c26", "c27", "c28") WHERE "r9"."c26" = "r6"."c17" AND "r9"."c27" = "r6"."c19" AND "r9"."c28" = "r6"."c21")) AS "r10"("c29", "c30", "c31", "c32", "c33", "c34") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r12"."c35", "r12"."c36", "r12"."c37" FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."review_held" AS "r11") AS "r12"("c35", "c36", "c37")) AS "r13"("c38", "c39", "c40") WHERE "r13"."c38" = "r10"."c29" AND "r13"."c39" = "r10"."c31" AND "r13"."c40" = "r10"."c33")) AS "r14"("c41", "c42", "c43", "c44", "c45", "c46")) AS "r15"("c47", "c48", "c49", "c50", "c51", "c52")) AS "r16"("c53", "c54", "c55", "c56", "c57", "c58")) AS "r17"("c59", "c60", "c61", "c62", "c63", "c64");

CREATE VIEW "slice_seats__review_den"."review_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_paused" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_questions_finish_output" ("step", "count", "total", "root") AS
SELECT "r1"."step", "r1"."count", "r1"."total", "r1"."root"
FROM "slice_den"."review_questions_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_questions_input" ("scope", "review", "group", "size", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."group", "r1"."size", "r1"."root"
FROM "slice_den"."review_questions_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."review_refusal" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_result" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_resumed" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_retry" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_review_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_review_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_review_run_input" ("scope", "review", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."root"
FROM "slice_den"."review_review_run_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_review_run_input_sizes" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."review_review_run_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."review_root" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_save_input" ("step", "review", "group", "count", "total", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total", "r1"."root"
FROM "slice_den"."review_save_input" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_save_output" ("step", "total", "root") AS
SELECT "r1"."step", "r1"."total", "r1"."root"
FROM "slice_den"."review_save_output" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_saved" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."review_saved" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."review_scope" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."review_served" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."review_skipped" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_split" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."review_split" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice_den"."review_start_scope" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."review_start_step" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."review_step" AS "r1";

CREATE VIEW "slice_seats__review_den"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_within" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."review_admitted" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_analyze_input" ("step", "review", "group", "question", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."question", "r1"."root"
FROM "slice_den"."review_analyze_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_analyze_output" ("step", "score", "root") AS
SELECT "r1"."step", "r1"."score", "r1"."root"
FROM "slice_den"."review_analyze_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_claim" ("step", "attempt", "until", "holds", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds", "r1"."root"
FROM "slice_den"."review_claim" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_done" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_ended" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_exhausted" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_failed" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_fenced" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."review_finish" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_gather_input" ("step", "review", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."root"
FROM "slice_den"."review_gather_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_gather_input_sizes" ("step", "ordinal", "value", "root") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."review_gather_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_gather_output" ("step", "groups", "root") AS
SELECT "r1"."step", "r1"."groups", "r1"."root"
FROM "slice_den"."review_gather_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."review_held" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_hold" ("step", "attempt", "at", "resource", "resource_name", "seat", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."root"
FROM "slice_den"."review_hold" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_questions_finish_output" ("step", "count", "total", "root") AS
SELECT "r1"."step", "r1"."count", "r1"."total", "r1"."root"
FROM "slice_den"."review_questions_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_questions_input" ("scope", "review", "group", "size", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."group", "r1"."size", "r1"."root"
FROM "slice_den"."review_questions_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."review_refusal" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_result" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_retry" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_review_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."review_review_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_review_run_input" ("scope", "review", "root") AS
SELECT "r1"."scope", "r1"."review", "r1"."root"
FROM "slice_den"."review_review_run_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_review_run_input_sizes" ("scope", "ordinal", "value", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value", "r1"."root"
FROM "slice_den"."review_review_run_input_sizes" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."review_root" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_save_input" ("step", "review", "group", "count", "total", "root") AS
SELECT "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total", "r1"."root"
FROM "slice_den"."review_save_input" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_save_output" ("step", "total", "root") AS
SELECT "r1"."step", "r1"."total", "r1"."root"
FROM "slice_den"."review_save_output" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_saved" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."review_saved" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."review_scope" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."review_skipped" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_split" ("from", "ordinal", "to", "root") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to", "r1"."root"
FROM "slice_den"."review_split" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_start_scope" ("scope", "ordinal", "child", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child", "r1"."root"
FROM "slice_den"."review_start_scope" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."review_start_step" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."review_step" AS "r1";

CREATE VIEW "slice_seats__review_retirer"."review_within" ("scope", "parent", "kind", "kind_name", "root") AS
SELECT "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."review_within" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice_den"."sync_exclusive" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_paused" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice_den"."sync_released" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_resumed" AS "r1";

CREATE VIEW "slice_seats__sync_coordinator"."sync_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."sync_served" AS "r1";

CREATE VIEW "slice_seats__sync_den"."chain_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."chain_result" AS "r1";

CREATE VIEW "slice_seats__sync_den"."chain_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."chain_step" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_build_input" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice_den"."sync_build_input" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_build_output" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice_den"."sync_build_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."sync_claim" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_copy_input" ("step", "relation", "run", "root") AS
SELECT "r1"."step", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice_den"."sync_copy_input" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_copy_output" ("step", "run", "root") AS
SELECT "r1"."step", "r1"."run", "r1"."root"
FROM "slice_den"."sync_copy_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_done" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_ended" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice_den"."sync_exclusive" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_exclusive_key" ("scope", "key", "id", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."id", "r1"."root"
FROM "slice_den"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_exhausted" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_failed" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_fenced" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_gold_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_gold_finish_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_gold_input" ("scope", "build", "root") AS
SELECT "r1"."scope", "r1"."build", "r1"."root"
FROM "slice_den"."sync_gold_input" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_held" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_paused" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."sync_refusal" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice_den"."sync_released" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."sync_result" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_resumed" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."sync_retry" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."sync_root" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."sync_served" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."sync_start_step" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."sync_step" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_sync_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_sync_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__sync_den"."sync_sync_run_input" ("scope", "relation", "run", "root") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice_den"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."sync_admitted" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_build_input" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice_den"."sync_build_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_build_output" ("step", "build", "root") AS
SELECT "r1"."step", "r1"."build", "r1"."root"
FROM "slice_den"."sync_build_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."sync_claim" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_copy_input" ("step", "relation", "run", "root") AS
SELECT "r1"."step", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice_den"."sync_copy_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_copy_output" ("step", "run", "root") AS
SELECT "r1"."step", "r1"."run", "r1"."root"
FROM "slice_den"."sync_copy_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_done" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_ended" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_exclusive_key" ("scope", "key", "id", "root") AS
SELECT "r1"."scope", "r1"."key", "r1"."id", "r1"."root"
FROM "slice_den"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_exhausted" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_failed" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_fenced" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."sync_finish" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_gold_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_gold_finish_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_gold_input" ("scope", "build", "root") AS
SELECT "r1"."scope", "r1"."build", "r1"."root"
FROM "slice_den"."sync_gold_input" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."sync_held" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."sync_refusal" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."sync_result" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."sync_retry" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."sync_root" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."sync_scope" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."sync_skipped" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."sync_start_step" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."sync_step" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_sync_run_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."sync_sync_run_finish_output" AS "r1";

CREATE VIEW "slice_seats__sync_retirer"."sync_sync_run_input" ("scope", "relation", "run", "root") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run", "r1"."root"
FROM "slice_den"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice_seats__writeback_coordinator"."writeback_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_paused" AS "r1";

CREATE VIEW "slice_seats__writeback_coordinator"."writeback_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_resumed" AS "r1";

CREATE VIEW "slice_seats__writeback_coordinator"."writeback_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."writeback_served" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."writeback_admitted" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."writeback_claim" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_deliver_input" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_deliver_input" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_deliver_output" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_deliver_output" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_done" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_ended" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_exhausted" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_failed" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_fenced" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."writeback_finish" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_held" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_paused" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."writeback_refusal" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."writeback_result" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_resumed" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."writeback_retry" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."writeback_root" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."writeback_scope" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."writeback_served" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."writeback_skipped" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."writeback_start_step" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."writeback_step" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_writeback_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_writeback_finish_output" AS "r1";

CREATE VIEW "slice_seats__writeback_den"."writeback_writeback_input" ("scope", "attempt", "root") AS
SELECT "r1"."scope", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_writeback_input" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_admitted" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."writeback_admitted" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_claim" ("step", "attempt", "until", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."until", "r1"."root"
FROM "slice_den"."writeback_claim" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_deliver_input" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_deliver_input" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_deliver_output" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_deliver_output" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_done" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_done" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_ended" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_ended" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_exhausted" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_exhausted" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_failed" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_failed" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_fenced" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_fenced" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_finish" ("scope", "step", "root") AS
SELECT "r1"."scope", "r1"."step", "r1"."root"
FROM "slice_den"."writeback_finish" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_held" ("step", "attempt", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_held" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_refusal" ("step", "law", "root") AS
SELECT "r1"."step", "r1"."law", "r1"."root"
FROM "slice_den"."writeback_refusal" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_result" ("step", "outcome", "outcome_name", "root") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."writeback_result" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_retry" ("step", "attempt", "at", "why", "why_name", "root") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice_den"."writeback_retry" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_root" ("scope", "kind", "kind_name", "key", "at", "retired") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at", "r1"."retired"
FROM "slice_den"."writeback_root" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_scope" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice_den"."writeback_scope" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_skipped" ("scope", "by", "root") AS
SELECT "r1"."scope", "r1"."by", "r1"."root"
FROM "slice_den"."writeback_skipped" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_start_step" ("scope", "ordinal", "step", "root") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step", "r1"."root"
FROM "slice_den"."writeback_start_step" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_step" ("step", "kind", "kind_name", "scope", "due", "root") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due", "r1"."root"
FROM "slice_den"."writeback_step" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_writeback_finish_output" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice_den"."writeback_writeback_finish_output" AS "r1";

CREATE VIEW "slice_seats__writeback_retirer"."writeback_writeback_input" ("scope", "attempt", "root") AS
SELECT "r1"."scope", "r1"."attempt", "r1"."root"
FROM "slice_den"."writeback_writeback_input" AS "r1";

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

GRANT :"slice_seats__editor" TO :"slice_seats__app" WITH INHERIT FALSE, SET TRUE;

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
GRANT USAGE ON SCHEMA "slice_den", "slice" TO :"slice_seats__app";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__app";

GRANT MAINTAIN ON TABLE "slice_den"."chain_result" TO :"slice_seats__app";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__assign_coordinator" TO :"slice_seats__assign_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind" TO :"slice_seats__assign_coordinator";

GRANT SELECT ON TABLE "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed", "slice_seats__assign_coordinator"."assign_served" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_paused" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_served" TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"() TO :"slice_seats__assign_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__assign_den" TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_den";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_asked", "slice_seats__assign_den"."assign_assignment_finish_output", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_assignment_input_near", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_read_nearest", "slice_seats__assign_den"."assign_decide_read_nearest_row", "slice_seats__assign_den"."assign_decide_read_seen", "slice_seats__assign_den"."assign_decide_read_seen_row", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_embed_input", "slice_seats__assign_den"."assign_embed_input_exclude", "slice_seats__assign_den"."assign_embed_input_mode_nearest", "slice_seats__assign_den"."assign_embed_input_mode_within", "slice_seats__assign_den"."assign_embed_input_near", "slice_seats__assign_den"."assign_embed_output", "slice_seats__assign_den"."assign_ended", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_paused", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_resumed", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_served", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_admitted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_finish_output" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_near" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_claim" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_nearest_row" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_seen" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_seen_row" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_done" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_exclude" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_nearest" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_near" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_ended" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_exhausted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_failed" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_fenced" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_finish" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_held" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_refusal" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_result" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_retry" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_root" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_scope" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_skipped" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_start_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_step" TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"() TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_assign_root_rwboli77cc"("slice"."__sha256"[]), "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__assign_retirer" TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_retirer";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_asked", "slice_seats__assign_retirer"."assign_assignment_finish_output", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_assignment_input_near", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_read_nearest", "slice_seats__assign_retirer"."assign_decide_read_nearest_row", "slice_seats__assign_retirer"."assign_decide_read_seen", "slice_seats__assign_retirer"."assign_decide_read_seen_row", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_embed_input", "slice_seats__assign_retirer"."assign_embed_input_exclude", "slice_seats__assign_retirer"."assign_embed_input_mode_nearest", "slice_seats__assign_retirer"."assign_embed_input_mode_within", "slice_seats__assign_retirer"."assign_embed_input_near", "slice_seats__assign_retirer"."assign_embed_output", "slice_seats__assign_retirer"."assign_ended", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step" TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"() TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_assign_root_hwbj4sewrx"("slice"."__sha256"[]) TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__auditor" TO :"slice_seats__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."assign_decide_output_stage", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice"."bell", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_resource", "slice_den"."fan_root_kind", "slice"."feed", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_resource", "slice_den"."sync_outcome", "slice"."__text_t4rwovzmqj" TO :"slice_seats__auditor";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_read_nearest", "slice_seats__auditor"."assign_decide_read_nearest_row", "slice_seats__auditor"."assign_decide_read_seen", "slice_seats__auditor"."assign_decide_read_seen_row", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_finish_output", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_done", "slice_seats__auditor"."chain_ended", "slice_seats__auditor"."chain_exhausted", "slice_seats__auditor"."chain_failed", "slice_seats__auditor"."chain_fenced", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_held", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_finish_output", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_read_earlier", "slice_seats__auditor"."chain_page_read_earlier_row", "slice_seats__auditor"."chain_page_read_tree", "slice_seats__auditor"."chain_page_read_tree_items", "slice_seats__auditor"."chain_page_read_tree_row", "slice_seats__auditor"."chain_page_read_weights", "slice_seats__auditor"."chain_page_read_weights_row", "slice_seats__auditor"."chain_page_tree_first", "slice_seats__auditor"."chain_refusal", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_retry", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_skipped", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chimed", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_claim", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_hold", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."heard", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."review_finish", "slice_seats__auditor"."review_hold", "slice_seats__auditor"."review_result", "slice_seats__auditor"."review_step", "slice_seats__auditor"."review_within", "slice_seats__auditor"."reviewed", "slice_seats__auditor"."settled", "slice_seats__auditor"."summary", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" TO :"slice_seats__auditor";

GRANT SELECT, INSERT ON TABLE "slice_den"."audit" TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__bell_names_aiqi4uostx"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_root_kind_names_nagupzc3sq"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__bell_live_bk7zau3khi"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_mosnikz3yn"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_root_kind_live_sx7vmfeklj"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__sync_outcome_live_7gndrvrenw"() TO :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__chain_coordinator" TO :"slice_seats__chain_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind" TO :"slice_seats__chain_coordinator";

GRANT SELECT ON TABLE "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed", "slice_seats__chain_coordinator"."chain_served" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_paused" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_resumed" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_served" TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"() TO :"slice_seats__chain_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__chain_den" TO :"slice_seats__chain_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice"."feed" TO :"slice_seats__chain_den";

GRANT SELECT ON TABLE "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_finish_output", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_ended", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_finish_output", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_read_earlier", "slice_seats__chain_den"."chain_page_read_earlier_row", "slice_seats__chain_den"."chain_page_read_tree", "slice_seats__chain_den"."chain_page_read_tree_items", "slice_seats__chain_den"."chain_page_read_tree_row", "slice_seats__chain_den"."chain_page_read_weights", "slice_seats__chain_den"."chain_page_read_weights_row", "slice_seats__chain_den"."chain_page_tree_first", "slice_seats__chain_den"."chain_paused", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_resumed", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_served", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_admitted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_chain_run_finish_output" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_chain_run_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_claim" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_done" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ended" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_exhausted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_failed" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_fenced" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_finish" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_held" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_finish_output" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input_after" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_earlier" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_earlier_row" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_items" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_row" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_weights" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_weights_row" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_tree_first" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_refusal" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_result" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_retry" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_root" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_scope" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_skipped" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_start_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_step" TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__feed_live_pfwkvulieq"() TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_chain_root_wgndggnfwf"("slice"."__sha256"[]), "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__chain_retirer" TO :"slice_seats__chain_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice"."feed" TO :"slice_seats__chain_retirer";

GRANT SELECT ON TABLE "slice_seats__chain_retirer"."chain_admitted", "slice_seats__chain_retirer"."chain_chain_run_finish_output", "slice_seats__chain_retirer"."chain_chain_run_input", "slice_seats__chain_retirer"."chain_claim", "slice_seats__chain_retirer"."chain_done", "slice_seats__chain_retirer"."chain_ended", "slice_seats__chain_retirer"."chain_exhausted", "slice_seats__chain_retirer"."chain_failed", "slice_seats__chain_retirer"."chain_fenced", "slice_seats__chain_retirer"."chain_finish", "slice_seats__chain_retirer"."chain_held", "slice_seats__chain_retirer"."chain_next", "slice_seats__chain_retirer"."chain_ordered_finish_output", "slice_seats__chain_retirer"."chain_ordered_input", "slice_seats__chain_retirer"."chain_page_input", "slice_seats__chain_retirer"."chain_page_input_after", "slice_seats__chain_retirer"."chain_page_output", "slice_seats__chain_retirer"."chain_page_output_next", "slice_seats__chain_retirer"."chain_page_read_earlier", "slice_seats__chain_retirer"."chain_page_read_earlier_row", "slice_seats__chain_retirer"."chain_page_read_tree", "slice_seats__chain_retirer"."chain_page_read_tree_items", "slice_seats__chain_retirer"."chain_page_read_tree_row", "slice_seats__chain_retirer"."chain_page_read_weights", "slice_seats__chain_retirer"."chain_page_read_weights_row", "slice_seats__chain_retirer"."chain_page_tree_first", "slice_seats__chain_retirer"."chain_refusal", "slice_seats__chain_retirer"."chain_result", "slice_seats__chain_retirer"."chain_retry", "slice_seats__chain_retirer"."chain_root", "slice_seats__chain_retirer"."chain_scope", "slice_seats__chain_retirer"."chain_skipped", "slice_seats__chain_retirer"."chain_start_step", "slice_seats__chain_retirer"."chain_step" TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__feed_live_pfwkvulieq"() TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_chain_root_ji6nmac7of"("slice"."__sha256"[]) TO :"slice_seats__chain_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__clock_coordinator" TO :"slice_seats__clock_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."clock_chime_input_bell", "slice_den"."clock_chime_output_bell", "slice_den"."clock_hourly_input_bell", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind" TO :"slice_seats__clock_coordinator";

GRANT SELECT ON TABLE "slice_seats__clock_coordinator"."clock_paused", "slice_seats__clock_coordinator"."clock_resumed", "slice_seats__clock_coordinator"."clock_served" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_paused" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_resumed" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_served" TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_chime_input_bell_live_vs2eypgl4v"(), "slice"."__clock_chime_output_bell_live_ikpwkv25mh"(), "slice"."__clock_hourly_input_bell_live_yfdtebn7na"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"() TO :"slice_seats__clock_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__clock_den" TO :"slice_seats__clock_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."clock_chime_input_bell", "slice_den"."clock_chime_output_bell", "slice_den"."clock_hourly_input_bell", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind" TO :"slice_seats__clock_den";

GRANT SELECT ON TABLE "slice_seats__clock_den"."clock_admitted", "slice_seats__clock_den"."clock_chime_input", "slice_seats__clock_den"."clock_chime_output", "slice_seats__clock_den"."clock_claim", "slice_seats__clock_den"."clock_close_input", "slice_seats__clock_den"."clock_close_output", "slice_seats__clock_den"."clock_done", "slice_seats__clock_den"."clock_ended", "slice_seats__clock_den"."clock_exhausted", "slice_seats__clock_den"."clock_failed", "slice_seats__clock_den"."clock_fenced", "slice_seats__clock_den"."clock_finish", "slice_seats__clock_den"."clock_held", "slice_seats__clock_den"."clock_hourly_finish_output", "slice_seats__clock_den"."clock_hourly_input", "slice_seats__clock_den"."clock_paused", "slice_seats__clock_den"."clock_refusal", "slice_seats__clock_den"."clock_result", "slice_seats__clock_den"."clock_resumed", "slice_seats__clock_den"."clock_retry", "slice_seats__clock_den"."clock_root", "slice_seats__clock_den"."clock_scope", "slice_seats__clock_den"."clock_served", "slice_seats__clock_den"."clock_sitting_finish_output", "slice_seats__clock_den"."clock_sitting_input", "slice_seats__clock_den"."clock_skipped", "slice_seats__clock_den"."clock_start_step", "slice_seats__clock_den"."clock_step" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_admitted" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_chime_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_claim" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_close_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_done" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_ended" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_exhausted" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_failed" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_fenced" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_finish" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_held" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_finish_output" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_refusal" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_result" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_retry" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_root" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_scope" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_sitting_finish_output" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_sitting_input" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_skipped" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_start_step" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_step" TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_chime_input_bell_names_nkzi4dgaig"(), "slice"."__clock_chime_output_bell_names_tzmx63kpb4"(), "slice"."__clock_hourly_input_bell_names_vugtqsvsug"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__clock_chime_input_bell_live_vs2eypgl4v"(), "slice"."__clock_chime_output_bell_live_ikpwkv25mh"(), "slice"."__clock_hourly_input_bell_live_yfdtebn7na"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"() TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_clock_root_bawnkhmkww"("slice"."__sha256"[]), "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__clock_retirer" TO :"slice_seats__clock_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."clock_chime_input_bell", "slice_den"."clock_chime_output_bell", "slice_den"."clock_hourly_input_bell", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind" TO :"slice_seats__clock_retirer";

GRANT SELECT ON TABLE "slice_seats__clock_retirer"."clock_admitted", "slice_seats__clock_retirer"."clock_chime_input", "slice_seats__clock_retirer"."clock_chime_output", "slice_seats__clock_retirer"."clock_claim", "slice_seats__clock_retirer"."clock_close_input", "slice_seats__clock_retirer"."clock_close_output", "slice_seats__clock_retirer"."clock_done", "slice_seats__clock_retirer"."clock_ended", "slice_seats__clock_retirer"."clock_exhausted", "slice_seats__clock_retirer"."clock_failed", "slice_seats__clock_retirer"."clock_fenced", "slice_seats__clock_retirer"."clock_finish", "slice_seats__clock_retirer"."clock_held", "slice_seats__clock_retirer"."clock_hourly_finish_output", "slice_seats__clock_retirer"."clock_hourly_input", "slice_seats__clock_retirer"."clock_refusal", "slice_seats__clock_retirer"."clock_result", "slice_seats__clock_retirer"."clock_retry", "slice_seats__clock_retirer"."clock_root", "slice_seats__clock_retirer"."clock_scope", "slice_seats__clock_retirer"."clock_sitting_finish_output", "slice_seats__clock_retirer"."clock_sitting_input", "slice_seats__clock_retirer"."clock_skipped", "slice_seats__clock_retirer"."clock_start_step", "slice_seats__clock_retirer"."clock_step" TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_chime_input_bell_names_nkzi4dgaig"(), "slice"."__clock_chime_output_bell_names_tzmx63kpb4"(), "slice"."__clock_hourly_input_bell_names_vugtqsvsug"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__clock_chime_input_bell_live_vs2eypgl4v"(), "slice"."__clock_chime_output_bell_live_ikpwkv25mh"(), "slice"."__clock_hourly_input_bell_live_yfdtebn7na"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"() TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_clock_root_6pfo6eeroe"("slice"."__sha256"[]) TO :"slice_seats__clock_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__editor" TO :"slice_seats__editor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__editor";

GRANT USAGE ON DOMAIN "slice"."__text_t4rwovzmqj" TO :"slice_seats__editor";

GRANT SELECT ON TABLE "slice_seats__editor"."passage", "slice_seats__editor"."seen" TO :"slice_seats__editor";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."passage" TO :"slice_seats__editor";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."seen" TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"() TO :"slice_seats__editor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__editor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__fan_coordinator" TO :"slice_seats__fan_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind" TO :"slice_seats__fan_coordinator";

GRANT SELECT ON TABLE "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed", "slice_seats__fan_coordinator"."fan_served" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_paused" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_resumed" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_served" TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_pausable_names_7t2samsp7b"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_mosnikz3yn"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_uymd2oabeh"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_sx7vmfeklj"() TO :"slice_seats__fan_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__fan_den" TO :"slice_seats__fan_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind" TO :"slice_seats__fan_den";

GRANT SELECT ON TABLE "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_finish_output", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_dust_input", "slice_seats__fan_den"."fan_dust_output", "slice_seats__fan_den"."fan_ended", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_finish_output", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_hold", "slice_seats__fan_den"."fan_live", "slice_seats__fan_den"."fan_mop_input", "slice_seats__fan_den"."fan_mop_output", "slice_seats__fan_den"."fan_paused", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_resumed", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_served", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_sweep_finish_output", "slice_seats__fan_den"."fan_sweep_input", "slice_seats__fan_den"."fan_within" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_admitted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_claim" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_done" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_dust_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_ended" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exhausted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_failed" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fan_run_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fan_run_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fenced" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_finish" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_held" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_hold" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_mop_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_refusal" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_result" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_retry" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_root" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_scope" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_skipped" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_square_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_start_scope" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_start_step" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_step" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_sweep_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_sweep_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_within" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_7t2samsp7b"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_nagupzc3sq"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_mosnikz3yn"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_uymd2oabeh"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_sx7vmfeklj"() TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_fan_root_4vwfxofrxw"("slice"."__sha256"[]), "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__fan_retirer" TO :"slice_seats__fan_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind" TO :"slice_seats__fan_retirer";

GRANT SELECT ON TABLE "slice_seats__fan_retirer"."fan_admitted", "slice_seats__fan_retirer"."fan_batch_finish_output", "slice_seats__fan_retirer"."fan_batch_input", "slice_seats__fan_retirer"."fan_claim", "slice_seats__fan_retirer"."fan_done", "slice_seats__fan_retirer"."fan_dust_input", "slice_seats__fan_retirer"."fan_dust_output", "slice_seats__fan_retirer"."fan_ended", "slice_seats__fan_retirer"."fan_exhausted", "slice_seats__fan_retirer"."fan_failed", "slice_seats__fan_retirer"."fan_fan_run_finish_output", "slice_seats__fan_retirer"."fan_fan_run_input", "slice_seats__fan_retirer"."fan_fenced", "slice_seats__fan_retirer"."fan_finish", "slice_seats__fan_retirer"."fan_held", "slice_seats__fan_retirer"."fan_hold", "slice_seats__fan_retirer"."fan_mop_input", "slice_seats__fan_retirer"."fan_mop_output", "slice_seats__fan_retirer"."fan_refusal", "slice_seats__fan_retirer"."fan_result", "slice_seats__fan_retirer"."fan_retry", "slice_seats__fan_retirer"."fan_root", "slice_seats__fan_retirer"."fan_scope", "slice_seats__fan_retirer"."fan_skipped", "slice_seats__fan_retirer"."fan_square_input", "slice_seats__fan_retirer"."fan_square_output", "slice_seats__fan_retirer"."fan_start_scope", "slice_seats__fan_retirer"."fan_start_step", "slice_seats__fan_retirer"."fan_step", "slice_seats__fan_retirer"."fan_sweep_finish_output", "slice_seats__fan_retirer"."fan_sweep_input", "slice_seats__fan_retirer"."fan_within" TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_nagupzc3sq"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_mosnikz3yn"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_uymd2oabeh"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_sx7vmfeklj"() TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_fan_root_niesya7vcd"("slice"."__sha256"[]) TO :"slice_seats__fan_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__loader" TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__loader";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice"."bell", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice_den"."clock_chime_input_bell", "slice_den"."clock_chime_output_bell", "slice_den"."clock_hourly_input_bell", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind", "slice"."feed", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__loader";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_asked", "slice_seats__loader"."assign_assignment_finish_output", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_assignment_input_near", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_read_nearest", "slice_seats__loader"."assign_decide_read_nearest_row", "slice_seats__loader"."assign_decide_read_seen", "slice_seats__loader"."assign_decide_read_seen_row", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_embed_input", "slice_seats__loader"."assign_embed_input_exclude", "slice_seats__loader"."assign_embed_input_mode_nearest", "slice_seats__loader"."assign_embed_input_mode_within", "slice_seats__loader"."assign_embed_input_near", "slice_seats__loader"."assign_embed_output", "slice_seats__loader"."assign_ended", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_finish_output", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_ended", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_finish_output", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_read_earlier", "slice_seats__loader"."chain_page_read_earlier_row", "slice_seats__loader"."chain_page_read_tree", "slice_seats__loader"."chain_page_read_tree_items", "slice_seats__loader"."chain_page_read_tree_row", "slice_seats__loader"."chain_page_read_weights", "slice_seats__loader"."chain_page_read_weights_row", "slice_seats__loader"."chain_page_tree_first", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chimed", "slice_seats__loader"."clock_admitted", "slice_seats__loader"."clock_chime_input", "slice_seats__loader"."clock_chime_output", "slice_seats__loader"."clock_claim", "slice_seats__loader"."clock_close_input", "slice_seats__loader"."clock_close_output", "slice_seats__loader"."clock_done", "slice_seats__loader"."clock_ended", "slice_seats__loader"."clock_exhausted", "slice_seats__loader"."clock_failed", "slice_seats__loader"."clock_fenced", "slice_seats__loader"."clock_finish", "slice_seats__loader"."clock_held", "slice_seats__loader"."clock_hourly_finish_output", "slice_seats__loader"."clock_hourly_input", "slice_seats__loader"."clock_refusal", "slice_seats__loader"."clock_result", "slice_seats__loader"."clock_retry", "slice_seats__loader"."clock_root", "slice_seats__loader"."clock_scope", "slice_seats__loader"."clock_sitting_finish_output", "slice_seats__loader"."clock_sitting_input", "slice_seats__loader"."clock_skipped", "slice_seats__loader"."clock_start_step", "slice_seats__loader"."clock_step", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."delivered", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_finish_output", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_dust_input", "slice_seats__loader"."fan_dust_output", "slice_seats__loader"."fan_ended", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_finish_output", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_hold", "slice_seats__loader"."fan_mop_input", "slice_seats__loader"."fan_mop_output", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_sweep_finish_output", "slice_seats__loader"."fan_sweep_input", "slice_seats__loader"."fan_within", "slice_seats__loader"."heard", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_ended", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_finish_output", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_patient_input", "slice_seats__loader"."retry_patient_output", "slice_seats__loader"."retry_polite_input", "slice_seats__loader"."retry_polite_output", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_throttled_finish_output", "slice_seats__loader"."retry_throttled_input", "slice_seats__loader"."retry_unhurried_finish_output", "slice_seats__loader"."retry_unhurried_input", "slice_seats__loader"."review_admitted", "slice_seats__loader"."review_analyze_input", "slice_seats__loader"."review_analyze_output", "slice_seats__loader"."review_claim", "slice_seats__loader"."review_done", "slice_seats__loader"."review_ended", "slice_seats__loader"."review_exhausted", "slice_seats__loader"."review_failed", "slice_seats__loader"."review_fenced", "slice_seats__loader"."review_finish", "slice_seats__loader"."review_gather_input", "slice_seats__loader"."review_gather_input_sizes", "slice_seats__loader"."review_gather_output", "slice_seats__loader"."review_held", "slice_seats__loader"."review_hold", "slice_seats__loader"."review_questions_finish_output", "slice_seats__loader"."review_questions_input", "slice_seats__loader"."review_refusal", "slice_seats__loader"."review_result", "slice_seats__loader"."review_retry", "slice_seats__loader"."review_review_run_finish_output", "slice_seats__loader"."review_review_run_input", "slice_seats__loader"."review_review_run_input_sizes", "slice_seats__loader"."review_root", "slice_seats__loader"."review_save_input", "slice_seats__loader"."review_save_output", "slice_seats__loader"."review_saved", "slice_seats__loader"."review_scope", "slice_seats__loader"."review_skipped", "slice_seats__loader"."review_split", "slice_seats__loader"."review_start_scope", "slice_seats__loader"."review_start_step", "slice_seats__loader"."review_step", "slice_seats__loader"."review_within", "slice_seats__loader"."reviewed", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."summary", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_ended", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_finish_output", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_finish_output", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__loader"."writeback_admitted", "slice_seats__loader"."writeback_claim", "slice_seats__loader"."writeback_deliver_input", "slice_seats__loader"."writeback_deliver_output", "slice_seats__loader"."writeback_done", "slice_seats__loader"."writeback_ended", "slice_seats__loader"."writeback_exhausted", "slice_seats__loader"."writeback_failed", "slice_seats__loader"."writeback_fenced", "slice_seats__loader"."writeback_finish", "slice_seats__loader"."writeback_held", "slice_seats__loader"."writeback_refusal", "slice_seats__loader"."writeback_result", "slice_seats__loader"."writeback_retry", "slice_seats__loader"."writeback_root", "slice_seats__loader"."writeback_scope", "slice_seats__loader"."writeback_skipped", "slice_seats__loader"."writeback_start_step", "slice_seats__loader"."writeback_step", "slice_seats__loader"."writeback_writeback_finish_output", "slice_seats__loader"."writeback_writeback_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_asked" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_exclude" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_nearest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output_stage_rest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output_stage_serve" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output_weighed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_nearest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_nearest_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_seen" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_seen_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_exclude" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_nearest" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_near" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assigned" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."built" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_chain_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_next" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input_after" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_output_next" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_earlier" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_earlier_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_items" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_weights" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_weights_row" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_tree_first" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_root" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chimed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_chime_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_close_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_sitting_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."concluded" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."copied" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."cursor" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."delivered" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_dust_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fan_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_mop_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_square_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_sweep_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."heard" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."item" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."order" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."passage" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_brittle_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ladders_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_patient_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_polite_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_steadfast_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_throttled_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_unhurried_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_analyze_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_analyze_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input_sizes" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_save_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_save_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_saved" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_split" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."reviewed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."seen" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."settled" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."summary" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_build_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_copy_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_gold_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_sync_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."tally" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."weight" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_deliver_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_writeback_finish_output" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__bell_names_aiqi4uostx"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__clock_chime_input_bell_names_nkzi4dgaig"(), "slice"."__clock_chime_output_bell_names_tzmx63kpb4"(), "slice"."__clock_hourly_input_bell_names_vugtqsvsug"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_rrax7ylsix"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_nagupzc3sq"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"(), "slice"."__bell_live_bk7zau3khi"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__clock_chime_input_bell_live_vs2eypgl4v"(), "slice"."__clock_chime_output_bell_live_ikpwkv25mh"(), "slice"."__clock_hourly_input_bell_live_yfdtebn7na"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_mosnikz3yn"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_uymd2oabeh"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_sx7vmfeklj"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_assign_root_rwboli77cc"("slice"."__sha256"[]), "slice_den"."__hold_chain_root_wgndggnfwf"("slice"."__sha256"[]), "slice_den"."__hold_clock_root_bawnkhmkww"("slice"."__sha256"[]), "slice_den"."__hold_fan_root_4vwfxofrxw"("slice"."__sha256"[]), "slice_den"."__hold_retry_root_54bybhkxg6"("slice"."__sha256"[]), "slice_den"."__hold_review_root_j3blgclwnl"("slice"."__sha256"[]), "slice_den"."__hold_sync_root_6ita6q5wxi"("slice"."__sha256"[]), "slice_den"."__hold_writeback_root_msmvpm3j7g"("slice"."__sha256"[]) TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__retry_coordinator" TO :"slice_seats__retry_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind" TO :"slice_seats__retry_coordinator";

GRANT SELECT ON TABLE "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed", "slice_seats__retry_coordinator"."retry_served" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_paused" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_resumed" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_served" TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__retry_den" TO :"slice_seats__retry_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind" TO :"slice_seats__retry_den";

GRANT SELECT ON TABLE "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_ended", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_finish_output", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_patient_input", "slice_seats__retry_den"."retry_patient_output", "slice_seats__retry_den"."retry_paused", "slice_seats__retry_den"."retry_polite_input", "slice_seats__retry_den"."retry_polite_output", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_resumed", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_served", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_throttled_finish_output", "slice_seats__retry_den"."retry_throttled_input", "slice_seats__retry_den"."retry_unhurried_finish_output", "slice_seats__retry_den"."retry_unhurried_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_admitted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_brittle_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_claim" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_done" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ended" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_exhausted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_failed" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_fenced" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_finish" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_held" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ladders_finish_output" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ladders_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_patient_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_polite_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_refusal" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_result" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_retry" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_root" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_scope" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_skipped" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_start_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_steadfast_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_throttled_finish_output" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_throttled_input" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_unhurried_finish_output" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_unhurried_input" TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_retry_root_54bybhkxg6"("slice"."__sha256"[]), "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__retry_retirer" TO :"slice_seats__retry_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind" TO :"slice_seats__retry_retirer";

GRANT SELECT ON TABLE "slice_seats__retry_retirer"."retry_admitted", "slice_seats__retry_retirer"."retry_brittle_input", "slice_seats__retry_retirer"."retry_brittle_output", "slice_seats__retry_retirer"."retry_claim", "slice_seats__retry_retirer"."retry_done", "slice_seats__retry_retirer"."retry_ended", "slice_seats__retry_retirer"."retry_exhausted", "slice_seats__retry_retirer"."retry_failed", "slice_seats__retry_retirer"."retry_fenced", "slice_seats__retry_retirer"."retry_finish", "slice_seats__retry_retirer"."retry_held", "slice_seats__retry_retirer"."retry_ladders_finish_output", "slice_seats__retry_retirer"."retry_ladders_input", "slice_seats__retry_retirer"."retry_patient_input", "slice_seats__retry_retirer"."retry_patient_output", "slice_seats__retry_retirer"."retry_polite_input", "slice_seats__retry_retirer"."retry_polite_output", "slice_seats__retry_retirer"."retry_refusal", "slice_seats__retry_retirer"."retry_result", "slice_seats__retry_retirer"."retry_retry", "slice_seats__retry_retirer"."retry_root", "slice_seats__retry_retirer"."retry_scope", "slice_seats__retry_retirer"."retry_skipped", "slice_seats__retry_retirer"."retry_start_step", "slice_seats__retry_retirer"."retry_steadfast_input", "slice_seats__retry_retirer"."retry_steadfast_output", "slice_seats__retry_retirer"."retry_step", "slice_seats__retry_retirer"."retry_throttled_finish_output", "slice_seats__retry_retirer"."retry_throttled_input", "slice_seats__retry_retirer"."retry_unhurried_finish_output", "slice_seats__retry_retirer"."retry_unhurried_input" TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_retry_root_kays5vv5ic"("slice"."__sha256"[]) TO :"slice_seats__retry_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__review_coordinator" TO :"slice_seats__review_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind" TO :"slice_seats__review_coordinator";

GRANT SELECT ON TABLE "slice_seats__review_coordinator"."review_live", "slice_seats__review_coordinator"."review_paused", "slice_seats__review_coordinator"."review_resumed", "slice_seats__review_coordinator"."review_served" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_paused" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_resumed" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_served" TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__review_den" TO :"slice_seats__review_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__review_den";

GRANT SELECT ON TABLE "slice_seats__review_den"."delivered", "slice_seats__review_den"."review_admitted", "slice_seats__review_den"."review_analyze_input", "slice_seats__review_den"."review_analyze_output", "slice_seats__review_den"."review_claim", "slice_seats__review_den"."review_done", "slice_seats__review_den"."review_ended", "slice_seats__review_den"."review_exhausted", "slice_seats__review_den"."review_failed", "slice_seats__review_den"."review_fenced", "slice_seats__review_den"."review_finish", "slice_seats__review_den"."review_gather_input", "slice_seats__review_den"."review_gather_input_sizes", "slice_seats__review_den"."review_gather_output", "slice_seats__review_den"."review_held", "slice_seats__review_den"."review_hold", "slice_seats__review_den"."review_live", "slice_seats__review_den"."review_paused", "slice_seats__review_den"."review_questions_finish_output", "slice_seats__review_den"."review_questions_input", "slice_seats__review_den"."review_refusal", "slice_seats__review_den"."review_result", "slice_seats__review_den"."review_resumed", "slice_seats__review_den"."review_retry", "slice_seats__review_den"."review_review_run_finish_output", "slice_seats__review_den"."review_review_run_input", "slice_seats__review_den"."review_review_run_input_sizes", "slice_seats__review_den"."review_root", "slice_seats__review_den"."review_save_input", "slice_seats__review_den"."review_save_output", "slice_seats__review_den"."review_saved", "slice_seats__review_den"."review_scope", "slice_seats__review_den"."review_served", "slice_seats__review_den"."review_skipped", "slice_seats__review_den"."review_split", "slice_seats__review_den"."review_start_scope", "slice_seats__review_den"."review_start_step", "slice_seats__review_den"."review_step", "slice_seats__review_den"."review_within" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_admitted" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_analyze_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_claim" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_done" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_ended" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_exhausted" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_failed" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_fenced" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_finish" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input_sizes" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_held" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_hold" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_finish_output" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_refusal" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_result" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_retry" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_finish_output" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_input_sizes" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_root" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_save_input" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_scope" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_skipped" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_scope" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_step" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_step" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_within" TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_review_root_j3blgclwnl"("slice"."__sha256"[]), "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__review_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__review_retirer" TO :"slice_seats__review_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__review_retirer";

GRANT SELECT ON TABLE "slice_seats__review_retirer"."review_admitted", "slice_seats__review_retirer"."review_analyze_input", "slice_seats__review_retirer"."review_analyze_output", "slice_seats__review_retirer"."review_claim", "slice_seats__review_retirer"."review_done", "slice_seats__review_retirer"."review_ended", "slice_seats__review_retirer"."review_exhausted", "slice_seats__review_retirer"."review_failed", "slice_seats__review_retirer"."review_fenced", "slice_seats__review_retirer"."review_finish", "slice_seats__review_retirer"."review_gather_input", "slice_seats__review_retirer"."review_gather_input_sizes", "slice_seats__review_retirer"."review_gather_output", "slice_seats__review_retirer"."review_held", "slice_seats__review_retirer"."review_hold", "slice_seats__review_retirer"."review_questions_finish_output", "slice_seats__review_retirer"."review_questions_input", "slice_seats__review_retirer"."review_refusal", "slice_seats__review_retirer"."review_result", "slice_seats__review_retirer"."review_retry", "slice_seats__review_retirer"."review_review_run_finish_output", "slice_seats__review_retirer"."review_review_run_input", "slice_seats__review_retirer"."review_review_run_input_sizes", "slice_seats__review_retirer"."review_root", "slice_seats__review_retirer"."review_save_input", "slice_seats__review_retirer"."review_save_output", "slice_seats__review_retirer"."review_saved", "slice_seats__review_retirer"."review_scope", "slice_seats__review_retirer"."review_skipped", "slice_seats__review_retirer"."review_split", "slice_seats__review_retirer"."review_start_scope", "slice_seats__review_retirer"."review_start_step", "slice_seats__review_retirer"."review_step", "slice_seats__review_retirer"."review_within" TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_review_root_itykotyltd"("slice"."__sha256"[]) TO :"slice_seats__review_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__sync_coordinator" TO :"slice_seats__sync_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind" TO :"slice_seats__sync_coordinator";

GRANT SELECT ON TABLE "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed", "slice_seats__sync_coordinator"."sync_served" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_exclusive" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_paused" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_released" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_resumed" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_served" TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__sync_den" TO :"slice_seats__sync_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."chain_kind", "slice_den"."chain_outcome", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind" TO :"slice_seats__sync_den";

GRANT SELECT ON TABLE "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_ended", "slice_seats__sync_den"."sync_exclusive", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_finish_output", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_paused", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_released", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_resumed", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_served", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_finish_output", "slice_seats__sync_den"."sync_sync_run_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_admitted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_build_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_claim" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_copy_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_done" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_ended" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_exclusive_key" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_exhausted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_failed" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_fenced" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_finish" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_gold_finish_output" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_gold_input" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_held" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_refusal" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_result" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_retry" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_root" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_scope" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_skipped" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_start_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_sync_run_finish_output" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_sync_run_input" TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_sync_root_6ita6q5wxi"("slice"."__sha256"[]), "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__sync_retirer" TO :"slice_seats__sync_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind" TO :"slice_seats__sync_retirer";

GRANT SELECT ON TABLE "slice_seats__sync_retirer"."sync_admitted", "slice_seats__sync_retirer"."sync_build_input", "slice_seats__sync_retirer"."sync_build_output", "slice_seats__sync_retirer"."sync_claim", "slice_seats__sync_retirer"."sync_copy_input", "slice_seats__sync_retirer"."sync_copy_output", "slice_seats__sync_retirer"."sync_done", "slice_seats__sync_retirer"."sync_ended", "slice_seats__sync_retirer"."sync_exclusive_key", "slice_seats__sync_retirer"."sync_exhausted", "slice_seats__sync_retirer"."sync_failed", "slice_seats__sync_retirer"."sync_fenced", "slice_seats__sync_retirer"."sync_finish", "slice_seats__sync_retirer"."sync_gold_finish_output", "slice_seats__sync_retirer"."sync_gold_input", "slice_seats__sync_retirer"."sync_held", "slice_seats__sync_retirer"."sync_refusal", "slice_seats__sync_retirer"."sync_result", "slice_seats__sync_retirer"."sync_retry", "slice_seats__sync_retirer"."sync_root", "slice_seats__sync_retirer"."sync_scope", "slice_seats__sync_retirer"."sync_skipped", "slice_seats__sync_retirer"."sync_start_step", "slice_seats__sync_retirer"."sync_step", "slice_seats__sync_retirer"."sync_sync_run_finish_output", "slice_seats__sync_retirer"."sync_sync_run_input" TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_sync_root_ygktrpeohu"("slice"."__sha256"[]) TO :"slice_seats__sync_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice_den", "slice" TO :"slice_seats__worker";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__worker";

GRANT MAINTAIN ON TABLE "slice_den"."chain_result" TO :"slice_seats__worker";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__writeback_coordinator" TO :"slice_seats__writeback_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind" TO :"slice_seats__writeback_coordinator";

GRANT SELECT ON TABLE "slice_seats__writeback_coordinator"."writeback_paused", "slice_seats__writeback_coordinator"."writeback_resumed", "slice_seats__writeback_coordinator"."writeback_served" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_paused" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_resumed" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_served" TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__writeback_den" TO :"slice_seats__writeback_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind" TO :"slice_seats__writeback_den";

GRANT SELECT ON TABLE "slice_seats__writeback_den"."writeback_admitted", "slice_seats__writeback_den"."writeback_claim", "slice_seats__writeback_den"."writeback_deliver_input", "slice_seats__writeback_den"."writeback_deliver_output", "slice_seats__writeback_den"."writeback_done", "slice_seats__writeback_den"."writeback_ended", "slice_seats__writeback_den"."writeback_exhausted", "slice_seats__writeback_den"."writeback_failed", "slice_seats__writeback_den"."writeback_fenced", "slice_seats__writeback_den"."writeback_finish", "slice_seats__writeback_den"."writeback_held", "slice_seats__writeback_den"."writeback_paused", "slice_seats__writeback_den"."writeback_refusal", "slice_seats__writeback_den"."writeback_result", "slice_seats__writeback_den"."writeback_resumed", "slice_seats__writeback_den"."writeback_retry", "slice_seats__writeback_den"."writeback_root", "slice_seats__writeback_den"."writeback_scope", "slice_seats__writeback_den"."writeback_served", "slice_seats__writeback_den"."writeback_skipped", "slice_seats__writeback_den"."writeback_start_step", "slice_seats__writeback_den"."writeback_step", "slice_seats__writeback_den"."writeback_writeback_finish_output", "slice_seats__writeback_den"."writeback_writeback_input" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_admitted" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_claim" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_deliver_input" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_done" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_ended" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_exhausted" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_failed" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_fenced" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_finish" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_held" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_refusal" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_result" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_retry" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_root" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_scope" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_skipped" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_start_step" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_step" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_writeback_finish_output" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_writeback_input" TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__hold_writeback_root_msmvpm3j7g"("slice"."__sha256"[]), "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]) TO :"slice_seats__writeback_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__writeback_retirer" TO :"slice_seats__writeback_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind" TO :"slice_seats__writeback_retirer";

GRANT SELECT ON TABLE "slice_seats__writeback_retirer"."writeback_admitted", "slice_seats__writeback_retirer"."writeback_claim", "slice_seats__writeback_retirer"."writeback_deliver_input", "slice_seats__writeback_retirer"."writeback_deliver_output", "slice_seats__writeback_retirer"."writeback_done", "slice_seats__writeback_retirer"."writeback_ended", "slice_seats__writeback_retirer"."writeback_exhausted", "slice_seats__writeback_retirer"."writeback_failed", "slice_seats__writeback_retirer"."writeback_fenced", "slice_seats__writeback_retirer"."writeback_finish", "slice_seats__writeback_retirer"."writeback_held", "slice_seats__writeback_retirer"."writeback_refusal", "slice_seats__writeback_retirer"."writeback_result", "slice_seats__writeback_retirer"."writeback_retry", "slice_seats__writeback_retirer"."writeback_root", "slice_seats__writeback_retirer"."writeback_scope", "slice_seats__writeback_retirer"."writeback_skipped", "slice_seats__writeback_retirer"."writeback_start_step", "slice_seats__writeback_retirer"."writeback_step", "slice_seats__writeback_retirer"."writeback_writeback_finish_output", "slice_seats__writeback_retirer"."writeback_writeback_input" TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__retire_writeback_root_oprw3k6une"("slice"."__sha256"[]) TO :"slice_seats__writeback_retirer";

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

ALTER ROLE :"slice_seats__app" SET plan_cache_mode = 'force_generic_plan';

ALTER ROLE :"slice_seats__worker" SET search_path = "pg_catalog", "pg_temp";

ALTER ROLE :"slice_seats__worker" SET extra_float_digits = '1';

ALTER ROLE :"slice_seats__worker" SET DateStyle = 'ISO, YMD';

ALTER ROLE :"slice_seats__worker" SET bytea_output = 'hex';

ALTER ROLE :"slice_seats__worker" SET lc_monetary = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET lc_numeric = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET lc_time = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET plan_cache_mode = 'force_generic_plan';

SELECT "vector_ext"."vector_dims"('[1]'::"vector_ext"."vector");

ALTER ROLE :"slice_seats__app" SET hnsw.iterative_scan = 'strict_order';

ALTER ROLE :"slice_seats__worker" SET hnsw.iterative_scan = 'strict_order';

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE ALL ON SCHEMA "slice", "slice_den", "slice_seats", "slice_seats__auditor", "slice_seats__editor", "slice_seats__loader", "slice_seats__assign_coordinator", "slice_seats__assign_den", "slice_seats__assign_retirer", "slice_seats__chain_coordinator", "slice_seats__chain_den", "slice_seats__chain_retirer", "slice_seats__clock_coordinator", "slice_seats__clock_den", "slice_seats__clock_retirer", "slice_seats__fan_coordinator", "slice_seats__fan_den", "slice_seats__fan_retirer", "slice_seats__retry_coordinator", "slice_seats__retry_den", "slice_seats__retry_retirer", "slice_seats__review_coordinator", "slice_seats__review_den", "slice_seats__review_retirer", "slice_seats__sync_coordinator", "slice_seats__sync_den", "slice_seats__sync_retirer", "slice_seats__writeback_coordinator", "slice_seats__writeback_den", "slice_seats__writeback_retirer" FROM PUBLIC;

REVOKE ALL ON TABLE "slice_den"."assign_admitted", "slice_den"."assign_asked", "slice_den"."assign_assignment_finish_output", "slice_den"."assign_assignment_input", "slice_den"."assign_assignment_input_exclude", "slice_den"."assign_assignment_input_mode_nearest", "slice_den"."assign_assignment_input_mode_within", "slice_den"."assign_assignment_input_near", "slice_den"."assign_claim", "slice_den"."assign_decide_input", "slice_den"."assign_decide_input_exclude", "slice_den"."assign_decide_input_mode_nearest", "slice_den"."assign_decide_input_mode_within", "slice_den"."assign_decide_output", "slice_den"."assign_decide_output_stage_rest", "slice_den"."assign_decide_output_stage_serve", "slice_den"."assign_decide_output_weighed", "slice_den"."assign_decide_read_nearest", "slice_den"."assign_decide_read_nearest_row", "slice_den"."assign_decide_read_seen", "slice_den"."assign_decide_read_seen_row", "slice_den"."assign_done", "slice_den"."assign_embed_input", "slice_den"."assign_embed_input_exclude", "slice_den"."assign_embed_input_mode_nearest", "slice_den"."assign_embed_input_mode_within", "slice_den"."assign_embed_input_near", "slice_den"."assign_embed_output", "slice_den"."assign_ended", "slice_den"."assign_exhausted", "slice_den"."assign_failed", "slice_den"."assign_fenced", "slice_den"."assign_finish", "slice_den"."assign_held", "slice_den"."assign_paused", "slice_den"."assign_refusal", "slice_den"."assign_result", "slice_den"."assign_resumed", "slice_den"."assign_retry", "slice_den"."assign_root", "slice_den"."assign_scope", "slice_den"."assign_served", "slice_den"."assign_skipped", "slice_den"."assign_start_step", "slice_den"."assign_step", "slice"."assigned", "slice_den"."audit", "slice"."built", "slice_den"."chain_admitted", "slice_den"."chain_chain_run_finish_output", "slice_den"."chain_chain_run_input", "slice_den"."chain_claim", "slice_den"."chain_done", "slice_den"."chain_ended", "slice_den"."chain_exhausted", "slice_den"."chain_failed", "slice_den"."chain_fenced", "slice_den"."chain_finish", "slice_den"."chain_held", "slice_den"."chain_next", "slice_den"."chain_ordered_finish_output", "slice_den"."chain_ordered_input", "slice_den"."chain_page_input", "slice_den"."chain_page_input_after", "slice_den"."chain_page_output", "slice_den"."chain_page_output_next", "slice_den"."chain_page_read_earlier", "slice_den"."chain_page_read_earlier_row", "slice_den"."chain_page_read_tree", "slice_den"."chain_page_read_tree_items", "slice_den"."chain_page_read_tree_row", "slice_den"."chain_page_read_weights", "slice_den"."chain_page_read_weights_row", "slice_den"."chain_page_tree_first", "slice_den"."chain_paused", "slice_den"."chain_refusal", "slice_den"."chain_result", "slice_den"."chain_resumed", "slice_den"."chain_retry", "slice_den"."chain_root", "slice_den"."chain_scope", "slice_den"."chain_served", "slice_den"."chain_skipped", "slice_den"."chain_start_step", "slice_den"."chain_step", "slice"."chimed", "slice_den"."clock_admitted", "slice_den"."clock_chime_input", "slice_den"."clock_chime_output", "slice_den"."clock_claim", "slice_den"."clock_close_input", "slice_den"."clock_close_output", "slice_den"."clock_done", "slice_den"."clock_ended", "slice_den"."clock_exhausted", "slice_den"."clock_failed", "slice_den"."clock_fenced", "slice_den"."clock_finish", "slice_den"."clock_held", "slice_den"."clock_hourly_finish_output", "slice_den"."clock_hourly_input", "slice_den"."clock_paused", "slice_den"."clock_refusal", "slice_den"."clock_result", "slice_den"."clock_resumed", "slice_den"."clock_retry", "slice_den"."clock_root", "slice_den"."clock_scope", "slice_den"."clock_served", "slice_den"."clock_sitting_finish_output", "slice_den"."clock_sitting_input", "slice_den"."clock_skipped", "slice_den"."clock_start_step", "slice_den"."clock_step", "slice"."concluded", "slice"."copied", "slice"."cursor", "slice"."delivered", "slice_den"."fan_admitted", "slice_den"."fan_batch_finish_output", "slice_den"."fan_batch_input", "slice_den"."fan_claim", "slice_den"."fan_done", "slice_den"."fan_dust_input", "slice_den"."fan_dust_output", "slice_den"."fan_ended", "slice_den"."fan_exhausted", "slice_den"."fan_failed", "slice_den"."fan_fan_run_finish_output", "slice_den"."fan_fan_run_input", "slice_den"."fan_fenced", "slice_den"."fan_finish", "slice_den"."fan_held", "slice_den"."fan_hold", "slice_den"."fan_mop_input", "slice_den"."fan_mop_output", "slice_den"."fan_paused", "slice_den"."fan_refusal", "slice_den"."fan_result", "slice_den"."fan_resumed", "slice_den"."fan_retry", "slice_den"."fan_root", "slice_den"."fan_scope", "slice_den"."fan_served", "slice_den"."fan_skipped", "slice_den"."fan_square_input", "slice_den"."fan_square_output", "slice_den"."fan_start_scope", "slice_den"."fan_start_step", "slice_den"."fan_step", "slice_den"."fan_sweep_finish_output", "slice_den"."fan_sweep_input", "slice_den"."fan_within", "slice"."heard", "slice"."item", "slice"."order", "slice"."passage", "slice_den"."retry_admitted", "slice_den"."retry_brittle_input", "slice_den"."retry_brittle_output", "slice_den"."retry_claim", "slice_den"."retry_done", "slice_den"."retry_ended", "slice_den"."retry_exhausted", "slice_den"."retry_failed", "slice_den"."retry_fenced", "slice_den"."retry_finish", "slice_den"."retry_held", "slice_den"."retry_ladders_finish_output", "slice_den"."retry_ladders_input", "slice_den"."retry_patient_input", "slice_den"."retry_patient_output", "slice_den"."retry_paused", "slice_den"."retry_polite_input", "slice_den"."retry_polite_output", "slice_den"."retry_refusal", "slice_den"."retry_result", "slice_den"."retry_resumed", "slice_den"."retry_retry", "slice_den"."retry_root", "slice_den"."retry_scope", "slice_den"."retry_served", "slice_den"."retry_skipped", "slice_den"."retry_start_step", "slice_den"."retry_steadfast_input", "slice_den"."retry_steadfast_output", "slice_den"."retry_step", "slice_den"."retry_throttled_finish_output", "slice_den"."retry_throttled_input", "slice_den"."retry_unhurried_finish_output", "slice_den"."retry_unhurried_input", "slice_den"."review_admitted", "slice_den"."review_analyze_input", "slice_den"."review_analyze_output", "slice_den"."review_claim", "slice_den"."review_done", "slice_den"."review_ended", "slice_den"."review_exhausted", "slice_den"."review_failed", "slice_den"."review_fenced", "slice_den"."review_finish", "slice_den"."review_gather_input", "slice_den"."review_gather_input_sizes", "slice_den"."review_gather_output", "slice_den"."review_held", "slice_den"."review_hold", "slice_den"."review_paused", "slice_den"."review_questions_finish_output", "slice_den"."review_questions_input", "slice_den"."review_refusal", "slice_den"."review_result", "slice_den"."review_resumed", "slice_den"."review_retry", "slice_den"."review_review_run_finish_output", "slice_den"."review_review_run_input", "slice_den"."review_review_run_input_sizes", "slice_den"."review_root", "slice_den"."review_save_input", "slice_den"."review_save_output", "slice_den"."review_saved", "slice_den"."review_scope", "slice_den"."review_served", "slice_den"."review_skipped", "slice_den"."review_split", "slice_den"."review_start_scope", "slice_den"."review_start_step", "slice_den"."review_step", "slice_den"."review_within", "slice"."reviewed", "slice"."seen", "slice"."settled", "slice"."summary", "slice_den"."sync_admitted", "slice_den"."sync_build_input", "slice_den"."sync_build_output", "slice_den"."sync_claim", "slice_den"."sync_copy_input", "slice_den"."sync_copy_output", "slice_den"."sync_done", "slice_den"."sync_ended", "slice_den"."sync_exclusive", "slice_den"."sync_exclusive_key", "slice_den"."sync_exhausted", "slice_den"."sync_failed", "slice_den"."sync_fenced", "slice_den"."sync_finish", "slice_den"."sync_gold_finish_output", "slice_den"."sync_gold_input", "slice_den"."sync_held", "slice_den"."sync_paused", "slice_den"."sync_refusal", "slice_den"."sync_released", "slice_den"."sync_result", "slice_den"."sync_resumed", "slice_den"."sync_retry", "slice_den"."sync_root", "slice_den"."sync_scope", "slice_den"."sync_served", "slice_den"."sync_skipped", "slice_den"."sync_start_step", "slice_den"."sync_step", "slice_den"."sync_sync_run_finish_output", "slice_den"."sync_sync_run_input", "slice"."tally", "slice"."weight", "slice_den"."writeback_admitted", "slice_den"."writeback_claim", "slice_den"."writeback_deliver_input", "slice_den"."writeback_deliver_output", "slice_den"."writeback_done", "slice_den"."writeback_ended", "slice_den"."writeback_exhausted", "slice_den"."writeback_failed", "slice_den"."writeback_fenced", "slice_den"."writeback_finish", "slice_den"."writeback_held", "slice_den"."writeback_paused", "slice_den"."writeback_refusal", "slice_den"."writeback_result", "slice_den"."writeback_resumed", "slice_den"."writeback_retry", "slice_den"."writeback_root", "slice_den"."writeback_scope", "slice_den"."writeback_served", "slice_den"."writeback_skipped", "slice_den"."writeback_start_step", "slice_den"."writeback_step", "slice_den"."writeback_writeback_finish_output", "slice_den"."writeback_writeback_input", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_read_nearest", "slice_seats__auditor"."assign_decide_read_nearest_row", "slice_seats__auditor"."assign_decide_read_seen", "slice_seats__auditor"."assign_decide_read_seen_row", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_finish_output", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_done", "slice_seats__auditor"."chain_ended", "slice_seats__auditor"."chain_exhausted", "slice_seats__auditor"."chain_failed", "slice_seats__auditor"."chain_fenced", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_held", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_finish_output", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_read_earlier", "slice_seats__auditor"."chain_page_read_earlier_row", "slice_seats__auditor"."chain_page_read_tree", "slice_seats__auditor"."chain_page_read_tree_items", "slice_seats__auditor"."chain_page_read_tree_row", "slice_seats__auditor"."chain_page_read_weights", "slice_seats__auditor"."chain_page_read_weights_row", "slice_seats__auditor"."chain_page_tree_first", "slice_seats__auditor"."chain_refusal", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_retry", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_skipped", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chimed", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_claim", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_hold", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."heard", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."review_finish", "slice_seats__auditor"."review_hold", "slice_seats__auditor"."review_result", "slice_seats__auditor"."review_step", "slice_seats__auditor"."review_within", "slice_seats__auditor"."reviewed", "slice_seats__auditor"."settled", "slice_seats__auditor"."summary", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight", "slice_seats__editor"."passage", "slice_seats__editor"."seen", "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_asked", "slice_seats__loader"."assign_assignment_finish_output", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_assignment_input_near", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_read_nearest", "slice_seats__loader"."assign_decide_read_nearest_row", "slice_seats__loader"."assign_decide_read_seen", "slice_seats__loader"."assign_decide_read_seen_row", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_embed_input", "slice_seats__loader"."assign_embed_input_exclude", "slice_seats__loader"."assign_embed_input_mode_nearest", "slice_seats__loader"."assign_embed_input_mode_within", "slice_seats__loader"."assign_embed_input_near", "slice_seats__loader"."assign_embed_output", "slice_seats__loader"."assign_ended", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_finish_output", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_ended", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_finish_output", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_read_earlier", "slice_seats__loader"."chain_page_read_earlier_row", "slice_seats__loader"."chain_page_read_tree", "slice_seats__loader"."chain_page_read_tree_items", "slice_seats__loader"."chain_page_read_tree_row", "slice_seats__loader"."chain_page_read_weights", "slice_seats__loader"."chain_page_read_weights_row", "slice_seats__loader"."chain_page_tree_first", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chimed", "slice_seats__loader"."clock_admitted", "slice_seats__loader"."clock_chime_input", "slice_seats__loader"."clock_chime_output", "slice_seats__loader"."clock_claim", "slice_seats__loader"."clock_close_input", "slice_seats__loader"."clock_close_output", "slice_seats__loader"."clock_done", "slice_seats__loader"."clock_ended", "slice_seats__loader"."clock_exhausted", "slice_seats__loader"."clock_failed", "slice_seats__loader"."clock_fenced", "slice_seats__loader"."clock_finish", "slice_seats__loader"."clock_held", "slice_seats__loader"."clock_hourly_finish_output", "slice_seats__loader"."clock_hourly_input", "slice_seats__loader"."clock_refusal", "slice_seats__loader"."clock_result", "slice_seats__loader"."clock_retry", "slice_seats__loader"."clock_root", "slice_seats__loader"."clock_scope", "slice_seats__loader"."clock_sitting_finish_output", "slice_seats__loader"."clock_sitting_input", "slice_seats__loader"."clock_skipped", "slice_seats__loader"."clock_start_step", "slice_seats__loader"."clock_step", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."delivered", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_finish_output", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_dust_input", "slice_seats__loader"."fan_dust_output", "slice_seats__loader"."fan_ended", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_finish_output", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_hold", "slice_seats__loader"."fan_mop_input", "slice_seats__loader"."fan_mop_output", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_sweep_finish_output", "slice_seats__loader"."fan_sweep_input", "slice_seats__loader"."fan_within", "slice_seats__loader"."heard", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_ended", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_finish_output", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_patient_input", "slice_seats__loader"."retry_patient_output", "slice_seats__loader"."retry_polite_input", "slice_seats__loader"."retry_polite_output", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_throttled_finish_output", "slice_seats__loader"."retry_throttled_input", "slice_seats__loader"."retry_unhurried_finish_output", "slice_seats__loader"."retry_unhurried_input", "slice_seats__loader"."review_admitted", "slice_seats__loader"."review_analyze_input", "slice_seats__loader"."review_analyze_output", "slice_seats__loader"."review_claim", "slice_seats__loader"."review_done", "slice_seats__loader"."review_ended", "slice_seats__loader"."review_exhausted", "slice_seats__loader"."review_failed", "slice_seats__loader"."review_fenced", "slice_seats__loader"."review_finish", "slice_seats__loader"."review_gather_input", "slice_seats__loader"."review_gather_input_sizes", "slice_seats__loader"."review_gather_output", "slice_seats__loader"."review_held", "slice_seats__loader"."review_hold", "slice_seats__loader"."review_questions_finish_output", "slice_seats__loader"."review_questions_input", "slice_seats__loader"."review_refusal", "slice_seats__loader"."review_result", "slice_seats__loader"."review_retry", "slice_seats__loader"."review_review_run_finish_output", "slice_seats__loader"."review_review_run_input", "slice_seats__loader"."review_review_run_input_sizes", "slice_seats__loader"."review_root", "slice_seats__loader"."review_save_input", "slice_seats__loader"."review_save_output", "slice_seats__loader"."review_saved", "slice_seats__loader"."review_scope", "slice_seats__loader"."review_skipped", "slice_seats__loader"."review_split", "slice_seats__loader"."review_start_scope", "slice_seats__loader"."review_start_step", "slice_seats__loader"."review_step", "slice_seats__loader"."review_within", "slice_seats__loader"."reviewed", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."summary", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_ended", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_finish_output", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_finish_output", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__loader"."writeback_admitted", "slice_seats__loader"."writeback_claim", "slice_seats__loader"."writeback_deliver_input", "slice_seats__loader"."writeback_deliver_output", "slice_seats__loader"."writeback_done", "slice_seats__loader"."writeback_ended", "slice_seats__loader"."writeback_exhausted", "slice_seats__loader"."writeback_failed", "slice_seats__loader"."writeback_fenced", "slice_seats__loader"."writeback_finish", "slice_seats__loader"."writeback_held", "slice_seats__loader"."writeback_refusal", "slice_seats__loader"."writeback_result", "slice_seats__loader"."writeback_retry", "slice_seats__loader"."writeback_root", "slice_seats__loader"."writeback_scope", "slice_seats__loader"."writeback_skipped", "slice_seats__loader"."writeback_start_step", "slice_seats__loader"."writeback_step", "slice_seats__loader"."writeback_writeback_finish_output", "slice_seats__loader"."writeback_writeback_input", "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed", "slice_seats__assign_coordinator"."assign_served", "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_asked", "slice_seats__assign_den"."assign_assignment_finish_output", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_assignment_input_near", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_read_nearest", "slice_seats__assign_den"."assign_decide_read_nearest_row", "slice_seats__assign_den"."assign_decide_read_seen", "slice_seats__assign_den"."assign_decide_read_seen_row", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_embed_input", "slice_seats__assign_den"."assign_embed_input_exclude", "slice_seats__assign_den"."assign_embed_input_mode_nearest", "slice_seats__assign_den"."assign_embed_input_mode_within", "slice_seats__assign_den"."assign_embed_input_near", "slice_seats__assign_den"."assign_embed_output", "slice_seats__assign_den"."assign_ended", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_paused", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_resumed", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_served", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_asked", "slice_seats__assign_retirer"."assign_assignment_finish_output", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_assignment_input_near", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_read_nearest", "slice_seats__assign_retirer"."assign_decide_read_nearest_row", "slice_seats__assign_retirer"."assign_decide_read_seen", "slice_seats__assign_retirer"."assign_decide_read_seen_row", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_embed_input", "slice_seats__assign_retirer"."assign_embed_input_exclude", "slice_seats__assign_retirer"."assign_embed_input_mode_nearest", "slice_seats__assign_retirer"."assign_embed_input_mode_within", "slice_seats__assign_retirer"."assign_embed_input_near", "slice_seats__assign_retirer"."assign_embed_output", "slice_seats__assign_retirer"."assign_ended", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step", "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed", "slice_seats__chain_coordinator"."chain_served", "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_finish_output", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_ended", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_finish_output", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_read_earlier", "slice_seats__chain_den"."chain_page_read_earlier_row", "slice_seats__chain_den"."chain_page_read_tree", "slice_seats__chain_den"."chain_page_read_tree_items", "slice_seats__chain_den"."chain_page_read_tree_row", "slice_seats__chain_den"."chain_page_read_weights", "slice_seats__chain_den"."chain_page_read_weights_row", "slice_seats__chain_den"."chain_page_tree_first", "slice_seats__chain_den"."chain_paused", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_resumed", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_served", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_retirer"."chain_admitted", "slice_seats__chain_retirer"."chain_chain_run_finish_output", "slice_seats__chain_retirer"."chain_chain_run_input", "slice_seats__chain_retirer"."chain_claim", "slice_seats__chain_retirer"."chain_done", "slice_seats__chain_retirer"."chain_ended", "slice_seats__chain_retirer"."chain_exhausted", "slice_seats__chain_retirer"."chain_failed", "slice_seats__chain_retirer"."chain_fenced", "slice_seats__chain_retirer"."chain_finish", "slice_seats__chain_retirer"."chain_held", "slice_seats__chain_retirer"."chain_next", "slice_seats__chain_retirer"."chain_ordered_finish_output", "slice_seats__chain_retirer"."chain_ordered_input", "slice_seats__chain_retirer"."chain_page_input", "slice_seats__chain_retirer"."chain_page_input_after", "slice_seats__chain_retirer"."chain_page_output", "slice_seats__chain_retirer"."chain_page_output_next", "slice_seats__chain_retirer"."chain_page_read_earlier", "slice_seats__chain_retirer"."chain_page_read_earlier_row", "slice_seats__chain_retirer"."chain_page_read_tree", "slice_seats__chain_retirer"."chain_page_read_tree_items", "slice_seats__chain_retirer"."chain_page_read_tree_row", "slice_seats__chain_retirer"."chain_page_read_weights", "slice_seats__chain_retirer"."chain_page_read_weights_row", "slice_seats__chain_retirer"."chain_page_tree_first", "slice_seats__chain_retirer"."chain_refusal", "slice_seats__chain_retirer"."chain_result", "slice_seats__chain_retirer"."chain_retry", "slice_seats__chain_retirer"."chain_root", "slice_seats__chain_retirer"."chain_scope", "slice_seats__chain_retirer"."chain_skipped", "slice_seats__chain_retirer"."chain_start_step", "slice_seats__chain_retirer"."chain_step", "slice_seats__clock_coordinator"."clock_paused", "slice_seats__clock_coordinator"."clock_resumed", "slice_seats__clock_coordinator"."clock_served", "slice_seats__clock_den"."clock_admitted", "slice_seats__clock_den"."clock_chime_input", "slice_seats__clock_den"."clock_chime_output", "slice_seats__clock_den"."clock_claim", "slice_seats__clock_den"."clock_close_input", "slice_seats__clock_den"."clock_close_output", "slice_seats__clock_den"."clock_done", "slice_seats__clock_den"."clock_ended", "slice_seats__clock_den"."clock_exhausted", "slice_seats__clock_den"."clock_failed", "slice_seats__clock_den"."clock_fenced", "slice_seats__clock_den"."clock_finish", "slice_seats__clock_den"."clock_held", "slice_seats__clock_den"."clock_hourly_finish_output", "slice_seats__clock_den"."clock_hourly_input", "slice_seats__clock_den"."clock_paused", "slice_seats__clock_den"."clock_refusal", "slice_seats__clock_den"."clock_result", "slice_seats__clock_den"."clock_resumed", "slice_seats__clock_den"."clock_retry", "slice_seats__clock_den"."clock_root", "slice_seats__clock_den"."clock_scope", "slice_seats__clock_den"."clock_served", "slice_seats__clock_den"."clock_sitting_finish_output", "slice_seats__clock_den"."clock_sitting_input", "slice_seats__clock_den"."clock_skipped", "slice_seats__clock_den"."clock_start_step", "slice_seats__clock_den"."clock_step", "slice_seats__clock_retirer"."clock_admitted", "slice_seats__clock_retirer"."clock_chime_input", "slice_seats__clock_retirer"."clock_chime_output", "slice_seats__clock_retirer"."clock_claim", "slice_seats__clock_retirer"."clock_close_input", "slice_seats__clock_retirer"."clock_close_output", "slice_seats__clock_retirer"."clock_done", "slice_seats__clock_retirer"."clock_ended", "slice_seats__clock_retirer"."clock_exhausted", "slice_seats__clock_retirer"."clock_failed", "slice_seats__clock_retirer"."clock_fenced", "slice_seats__clock_retirer"."clock_finish", "slice_seats__clock_retirer"."clock_held", "slice_seats__clock_retirer"."clock_hourly_finish_output", "slice_seats__clock_retirer"."clock_hourly_input", "slice_seats__clock_retirer"."clock_refusal", "slice_seats__clock_retirer"."clock_result", "slice_seats__clock_retirer"."clock_retry", "slice_seats__clock_retirer"."clock_root", "slice_seats__clock_retirer"."clock_scope", "slice_seats__clock_retirer"."clock_sitting_finish_output", "slice_seats__clock_retirer"."clock_sitting_input", "slice_seats__clock_retirer"."clock_skipped", "slice_seats__clock_retirer"."clock_start_step", "slice_seats__clock_retirer"."clock_step", "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed", "slice_seats__fan_coordinator"."fan_served", "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_finish_output", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_dust_input", "slice_seats__fan_den"."fan_dust_output", "slice_seats__fan_den"."fan_ended", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_finish_output", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_hold", "slice_seats__fan_den"."fan_live", "slice_seats__fan_den"."fan_mop_input", "slice_seats__fan_den"."fan_mop_output", "slice_seats__fan_den"."fan_paused", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_resumed", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_served", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_sweep_finish_output", "slice_seats__fan_den"."fan_sweep_input", "slice_seats__fan_den"."fan_within", "slice_seats__fan_retirer"."fan_admitted", "slice_seats__fan_retirer"."fan_batch_finish_output", "slice_seats__fan_retirer"."fan_batch_input", "slice_seats__fan_retirer"."fan_claim", "slice_seats__fan_retirer"."fan_done", "slice_seats__fan_retirer"."fan_dust_input", "slice_seats__fan_retirer"."fan_dust_output", "slice_seats__fan_retirer"."fan_ended", "slice_seats__fan_retirer"."fan_exhausted", "slice_seats__fan_retirer"."fan_failed", "slice_seats__fan_retirer"."fan_fan_run_finish_output", "slice_seats__fan_retirer"."fan_fan_run_input", "slice_seats__fan_retirer"."fan_fenced", "slice_seats__fan_retirer"."fan_finish", "slice_seats__fan_retirer"."fan_held", "slice_seats__fan_retirer"."fan_hold", "slice_seats__fan_retirer"."fan_mop_input", "slice_seats__fan_retirer"."fan_mop_output", "slice_seats__fan_retirer"."fan_refusal", "slice_seats__fan_retirer"."fan_result", "slice_seats__fan_retirer"."fan_retry", "slice_seats__fan_retirer"."fan_root", "slice_seats__fan_retirer"."fan_scope", "slice_seats__fan_retirer"."fan_skipped", "slice_seats__fan_retirer"."fan_square_input", "slice_seats__fan_retirer"."fan_square_output", "slice_seats__fan_retirer"."fan_start_scope", "slice_seats__fan_retirer"."fan_start_step", "slice_seats__fan_retirer"."fan_step", "slice_seats__fan_retirer"."fan_sweep_finish_output", "slice_seats__fan_retirer"."fan_sweep_input", "slice_seats__fan_retirer"."fan_within", "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed", "slice_seats__retry_coordinator"."retry_served", "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_ended", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_finish_output", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_patient_input", "slice_seats__retry_den"."retry_patient_output", "slice_seats__retry_den"."retry_paused", "slice_seats__retry_den"."retry_polite_input", "slice_seats__retry_den"."retry_polite_output", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_resumed", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_served", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_throttled_finish_output", "slice_seats__retry_den"."retry_throttled_input", "slice_seats__retry_den"."retry_unhurried_finish_output", "slice_seats__retry_den"."retry_unhurried_input", "slice_seats__retry_retirer"."retry_admitted", "slice_seats__retry_retirer"."retry_brittle_input", "slice_seats__retry_retirer"."retry_brittle_output", "slice_seats__retry_retirer"."retry_claim", "slice_seats__retry_retirer"."retry_done", "slice_seats__retry_retirer"."retry_ended", "slice_seats__retry_retirer"."retry_exhausted", "slice_seats__retry_retirer"."retry_failed", "slice_seats__retry_retirer"."retry_fenced", "slice_seats__retry_retirer"."retry_finish", "slice_seats__retry_retirer"."retry_held", "slice_seats__retry_retirer"."retry_ladders_finish_output", "slice_seats__retry_retirer"."retry_ladders_input", "slice_seats__retry_retirer"."retry_patient_input", "slice_seats__retry_retirer"."retry_patient_output", "slice_seats__retry_retirer"."retry_polite_input", "slice_seats__retry_retirer"."retry_polite_output", "slice_seats__retry_retirer"."retry_refusal", "slice_seats__retry_retirer"."retry_result", "slice_seats__retry_retirer"."retry_retry", "slice_seats__retry_retirer"."retry_root", "slice_seats__retry_retirer"."retry_scope", "slice_seats__retry_retirer"."retry_skipped", "slice_seats__retry_retirer"."retry_start_step", "slice_seats__retry_retirer"."retry_steadfast_input", "slice_seats__retry_retirer"."retry_steadfast_output", "slice_seats__retry_retirer"."retry_step", "slice_seats__retry_retirer"."retry_throttled_finish_output", "slice_seats__retry_retirer"."retry_throttled_input", "slice_seats__retry_retirer"."retry_unhurried_finish_output", "slice_seats__retry_retirer"."retry_unhurried_input", "slice_seats__review_coordinator"."review_live", "slice_seats__review_coordinator"."review_paused", "slice_seats__review_coordinator"."review_resumed", "slice_seats__review_coordinator"."review_served", "slice_seats__review_den"."delivered", "slice_seats__review_den"."review_admitted", "slice_seats__review_den"."review_analyze_input", "slice_seats__review_den"."review_analyze_output", "slice_seats__review_den"."review_claim", "slice_seats__review_den"."review_done", "slice_seats__review_den"."review_ended", "slice_seats__review_den"."review_exhausted", "slice_seats__review_den"."review_failed", "slice_seats__review_den"."review_fenced", "slice_seats__review_den"."review_finish", "slice_seats__review_den"."review_gather_input", "slice_seats__review_den"."review_gather_input_sizes", "slice_seats__review_den"."review_gather_output", "slice_seats__review_den"."review_held", "slice_seats__review_den"."review_hold", "slice_seats__review_den"."review_live", "slice_seats__review_den"."review_paused", "slice_seats__review_den"."review_questions_finish_output", "slice_seats__review_den"."review_questions_input", "slice_seats__review_den"."review_refusal", "slice_seats__review_den"."review_result", "slice_seats__review_den"."review_resumed", "slice_seats__review_den"."review_retry", "slice_seats__review_den"."review_review_run_finish_output", "slice_seats__review_den"."review_review_run_input", "slice_seats__review_den"."review_review_run_input_sizes", "slice_seats__review_den"."review_root", "slice_seats__review_den"."review_save_input", "slice_seats__review_den"."review_save_output", "slice_seats__review_den"."review_saved", "slice_seats__review_den"."review_scope", "slice_seats__review_den"."review_served", "slice_seats__review_den"."review_skipped", "slice_seats__review_den"."review_split", "slice_seats__review_den"."review_start_scope", "slice_seats__review_den"."review_start_step", "slice_seats__review_den"."review_step", "slice_seats__review_den"."review_within", "slice_seats__review_retirer"."review_admitted", "slice_seats__review_retirer"."review_analyze_input", "slice_seats__review_retirer"."review_analyze_output", "slice_seats__review_retirer"."review_claim", "slice_seats__review_retirer"."review_done", "slice_seats__review_retirer"."review_ended", "slice_seats__review_retirer"."review_exhausted", "slice_seats__review_retirer"."review_failed", "slice_seats__review_retirer"."review_fenced", "slice_seats__review_retirer"."review_finish", "slice_seats__review_retirer"."review_gather_input", "slice_seats__review_retirer"."review_gather_input_sizes", "slice_seats__review_retirer"."review_gather_output", "slice_seats__review_retirer"."review_held", "slice_seats__review_retirer"."review_hold", "slice_seats__review_retirer"."review_questions_finish_output", "slice_seats__review_retirer"."review_questions_input", "slice_seats__review_retirer"."review_refusal", "slice_seats__review_retirer"."review_result", "slice_seats__review_retirer"."review_retry", "slice_seats__review_retirer"."review_review_run_finish_output", "slice_seats__review_retirer"."review_review_run_input", "slice_seats__review_retirer"."review_review_run_input_sizes", "slice_seats__review_retirer"."review_root", "slice_seats__review_retirer"."review_save_input", "slice_seats__review_retirer"."review_save_output", "slice_seats__review_retirer"."review_saved", "slice_seats__review_retirer"."review_scope", "slice_seats__review_retirer"."review_skipped", "slice_seats__review_retirer"."review_split", "slice_seats__review_retirer"."review_start_scope", "slice_seats__review_retirer"."review_start_step", "slice_seats__review_retirer"."review_step", "slice_seats__review_retirer"."review_within", "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed", "slice_seats__sync_coordinator"."sync_served", "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_ended", "slice_seats__sync_den"."sync_exclusive", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_finish_output", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_paused", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_released", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_resumed", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_served", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_finish_output", "slice_seats__sync_den"."sync_sync_run_input", "slice_seats__sync_retirer"."sync_admitted", "slice_seats__sync_retirer"."sync_build_input", "slice_seats__sync_retirer"."sync_build_output", "slice_seats__sync_retirer"."sync_claim", "slice_seats__sync_retirer"."sync_copy_input", "slice_seats__sync_retirer"."sync_copy_output", "slice_seats__sync_retirer"."sync_done", "slice_seats__sync_retirer"."sync_ended", "slice_seats__sync_retirer"."sync_exclusive_key", "slice_seats__sync_retirer"."sync_exhausted", "slice_seats__sync_retirer"."sync_failed", "slice_seats__sync_retirer"."sync_fenced", "slice_seats__sync_retirer"."sync_finish", "slice_seats__sync_retirer"."sync_gold_finish_output", "slice_seats__sync_retirer"."sync_gold_input", "slice_seats__sync_retirer"."sync_held", "slice_seats__sync_retirer"."sync_refusal", "slice_seats__sync_retirer"."sync_result", "slice_seats__sync_retirer"."sync_retry", "slice_seats__sync_retirer"."sync_root", "slice_seats__sync_retirer"."sync_scope", "slice_seats__sync_retirer"."sync_skipped", "slice_seats__sync_retirer"."sync_start_step", "slice_seats__sync_retirer"."sync_step", "slice_seats__sync_retirer"."sync_sync_run_finish_output", "slice_seats__sync_retirer"."sync_sync_run_input", "slice_seats__writeback_coordinator"."writeback_paused", "slice_seats__writeback_coordinator"."writeback_resumed", "slice_seats__writeback_coordinator"."writeback_served", "slice_seats__writeback_den"."writeback_admitted", "slice_seats__writeback_den"."writeback_claim", "slice_seats__writeback_den"."writeback_deliver_input", "slice_seats__writeback_den"."writeback_deliver_output", "slice_seats__writeback_den"."writeback_done", "slice_seats__writeback_den"."writeback_ended", "slice_seats__writeback_den"."writeback_exhausted", "slice_seats__writeback_den"."writeback_failed", "slice_seats__writeback_den"."writeback_fenced", "slice_seats__writeback_den"."writeback_finish", "slice_seats__writeback_den"."writeback_held", "slice_seats__writeback_den"."writeback_paused", "slice_seats__writeback_den"."writeback_refusal", "slice_seats__writeback_den"."writeback_result", "slice_seats__writeback_den"."writeback_resumed", "slice_seats__writeback_den"."writeback_retry", "slice_seats__writeback_den"."writeback_root", "slice_seats__writeback_den"."writeback_scope", "slice_seats__writeback_den"."writeback_served", "slice_seats__writeback_den"."writeback_skipped", "slice_seats__writeback_den"."writeback_start_step", "slice_seats__writeback_den"."writeback_step", "slice_seats__writeback_den"."writeback_writeback_finish_output", "slice_seats__writeback_den"."writeback_writeback_input", "slice_seats__writeback_retirer"."writeback_admitted", "slice_seats__writeback_retirer"."writeback_claim", "slice_seats__writeback_retirer"."writeback_deliver_input", "slice_seats__writeback_retirer"."writeback_deliver_output", "slice_seats__writeback_retirer"."writeback_done", "slice_seats__writeback_retirer"."writeback_ended", "slice_seats__writeback_retirer"."writeback_exhausted", "slice_seats__writeback_retirer"."writeback_failed", "slice_seats__writeback_retirer"."writeback_fenced", "slice_seats__writeback_retirer"."writeback_finish", "slice_seats__writeback_retirer"."writeback_held", "slice_seats__writeback_retirer"."writeback_refusal", "slice_seats__writeback_retirer"."writeback_result", "slice_seats__writeback_retirer"."writeback_retry", "slice_seats__writeback_retirer"."writeback_root", "slice_seats__writeback_retirer"."writeback_scope", "slice_seats__writeback_retirer"."writeback_skipped", "slice_seats__writeback_retirer"."writeback_start_step", "slice_seats__writeback_retirer"."writeback_step", "slice_seats__writeback_retirer"."writeback_writeback_finish_output", "slice_seats__writeback_retirer"."writeback_writeback_input" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice"."bell", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice_den"."clock_chime_input_bell", "slice_den"."clock_chime_output_bell", "slice_den"."clock_hourly_input_bell", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind", "slice"."feed", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind", "slice"."__text_t4rwovzmqj", "slice"."__domain_e5fpjchj5r", "slice"."__domain_mxhao3k6ss", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph", "slice"."__domain_p7dj7oebtz", "slice"."__param_nearest_topic_4eruqlfauv", "slice"."__param_seen_learner_exdgowkpja" FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON TABLES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON SEQUENCES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_den" REVOKE ALL ON TABLES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_den" REVOKE ALL ON SEQUENCES FROM PUBLIC;

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

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() IS 'names of roster ChainPageInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

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

COMMENT ON FUNCTION "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"() IS 'live codes of roster AssignAssignmentInputMode (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"() IS 'live codes of roster AssignDecideInputMode (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_decide_output_stage_live_j54g2pdkhy"() IS 'live codes of roster AssignDecideOutputStage (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_embed_input_mode_live_r26iyj4yp6"() IS 'live codes of roster AssignEmbedInputMode (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_kind_live_epoonlekfm"() IS 'live codes of roster AssignKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__assign_outcome_live_3t7oirgwzl"() IS 'live codes of roster AssignOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_pausable_live_spku342qp6"() IS 'live codes of roster AssignPausable (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__assign_retry_why_live_qfzksuyq3m"() IS 'live codes of roster AssignRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__assign_root_kind_live_nccqmed4lq"() IS 'live codes of roster AssignRootKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__bell_live_bk7zau3khi"() IS 'live codes of roster Bell (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_live_iopwed3csj"() IS 'live codes of roster ChainChainRunInputFeed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_kind_live_4t2tj7pchx"() IS 'live codes of roster ChainKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"() IS 'live codes of roster ChainOrderedInputFeed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_outcome_live_azc7nb42gy"() IS 'live codes of roster ChainOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_live_zxgp5dub6j"() IS 'live codes of roster ChainPageInputFeed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_pausable_live_ozpbw3gnsu"() IS 'live codes of roster ChainPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_retry_why_live_m5qnitynhz"() IS 'live codes of roster ChainRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__chain_root_kind_live_mnlnztwbz2"() IS 'live codes of roster ChainRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_chime_input_bell_live_vs2eypgl4v"() IS 'live codes of roster ClockChimeInputBell (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_chime_output_bell_live_ikpwkv25mh"() IS 'live codes of roster ClockChimeOutputBell (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_hourly_input_bell_live_yfdtebn7na"() IS 'live codes of roster ClockHourlyInputBell (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_kind_live_kem5uxahz7"() IS 'live codes of roster ClockKind (b74579d3b64ecff081cab2731adb2464f839e99b2eed45d65b3c1547c74f2de1)';

COMMENT ON FUNCTION "slice"."__clock_outcome_live_q7vjmi72sr"() IS 'live codes of roster ClockOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_pausable_live_waldzggn7s"() IS 'live codes of roster ClockPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_retry_why_live_auqnukeed5"() IS 'live codes of roster ClockRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__clock_root_kind_live_dkya2k5nqw"() IS 'live codes of roster ClockRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__fan_child_kind_live_lzght2aqpn"() IS 'live codes of roster FanChildKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__fan_kind_live_mosnikz3yn"() IS 'live codes of roster FanKind (ff25cb7ef936c9a259d64952fb881db2ec478880c026b52a90e1c8d8fa961147)';

COMMENT ON FUNCTION "slice"."__fan_outcome_live_nos3iqln54"() IS 'live codes of roster FanOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__fan_pausable_live_uymd2oabeh"() IS 'live codes of roster FanPausable (b74579d3b64ecff081cab2731adb2464f839e99b2eed45d65b3c1547c74f2de1)';

COMMENT ON FUNCTION "slice"."__fan_resource_live_yqyw4ee5fp"() IS 'live codes of roster FanResource (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__fan_retry_why_live_yom5egfb4x"() IS 'live codes of roster FanRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__fan_root_kind_live_sx7vmfeklj"() IS 'live codes of roster FanRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__feed_live_pfwkvulieq"() IS 'live codes of roster Feed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__retry_kind_live_lujs5xc25d"() IS 'live codes of roster RetryKind (81c5f5fc8ba40698944d57540929dee29893d3bf66a84aacfe8dc2be09d996e3)';

COMMENT ON FUNCTION "slice"."__retry_outcome_live_fdo5qezp4f"() IS 'live codes of roster RetryOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__retry_pausable_live_buioe34fit"() IS 'live codes of roster RetryPausable (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__retry_retry_why_live_p4et7ysqjo"() IS 'live codes of roster RetryRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__retry_root_kind_live_euautuyuhd"() IS 'live codes of roster RetryRootKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__review_child_kind_live_xb5v52t6gq"() IS 'live codes of roster ReviewChildKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__review_kind_live_3egbkjww5a"() IS 'live codes of roster ReviewKind (591ae590686ec68aa03e699030fe62fdeae06b893d263428aab7d66397d0f1fe)';

COMMENT ON FUNCTION "slice"."__review_outcome_live_svq4irpcsp"() IS 'live codes of roster ReviewOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__review_pausable_live_at7bdrj2is"() IS 'live codes of roster ReviewPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__review_resource_live_bbskolaran"() IS 'live codes of roster ReviewResource (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__review_retry_why_live_sp7od4pwim"() IS 'live codes of roster ReviewRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__review_root_kind_live_vkjzjpusnp"() IS 'live codes of roster ReviewRootKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__sync_kind_live_mrzzgu2rqf"() IS 'live codes of roster SyncKind (b74579d3b64ecff081cab2731adb2464f839e99b2eed45d65b3c1547c74f2de1)';

COMMENT ON FUNCTION "slice"."__sync_outcome_live_7gndrvrenw"() IS 'live codes of roster SyncOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__sync_pausable_live_7gx4kdgs6e"() IS 'live codes of roster SyncPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__sync_retry_why_live_t6r5ysh2pa"() IS 'live codes of roster SyncRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__sync_root_kind_live_vi4cdymudd"() IS 'live codes of roster SyncRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__writeback_kind_live_gxqp25qbem"() IS 'live codes of roster WritebackKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__writeback_outcome_live_haxkgy2wa4"() IS 'live codes of roster WritebackOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__writeback_pausable_live_rwjxemvunq"() IS 'live codes of roster WritebackPausable (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__writeback_retry_why_live_6vffrr6k2o"() IS 'live codes of roster WritebackRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__writeback_root_kind_live_ifibfl2f7i"() IS 'live codes of roster WritebackRootKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON DOMAIN "slice"."__domain_gfw43vigph" IS 'domain of definition 39922592cedecf769d6df372d6df99e0b82206b0bf6dacd9722d0490f83cc782';

COMMENT ON DOMAIN "slice"."__domain_mxhao3k6ss" IS 'domain of definition be4e1f34160619e14c4a8009e96d1ced7b683a1e169a9e4d0e9e10640701b8aa';

COMMENT ON DOMAIN "slice"."__domain_e5fpjchj5r" IS 'domain of definition c6c35aac57a789c3caa4b6344f7458c40632585c23667de7b724659d897647e5';

COMMENT ON DOMAIN "slice"."__domain_p7dj7oebtz" IS 'domain of definition db25dd39e94cd7f1ccb54e669ba299e617489799d273326e340a1a533e0b94bd';

COMMENT ON DOMAIN "slice"."__text_t4rwovzmqj" IS 'text domain of definition 6f5ba169462bdb47db4c56bb5fe21d5091867333e4952f2c20b18e8fa085befc';

COMMENT ON DOMAIN "slice"."__param_nearest_topic_4eruqlfauv" IS 'pattern domain of parameter nearest.topic of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON DOMAIN "slice"."__param_seen_learner_exdgowkpja" IS 'pattern domain of parameter seen.learner of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON TYPE "slice"."__row_news_assign_assignment_input_lznek7z3du" IS 'the row type of the delta of news of AssignAssignmentInput';

COMMENT ON TYPE "slice"."__row_olds_assign_assignment_input_wdttr53scw" IS 'the row type of the delta of olds of AssignAssignmentInput';

COMMENT ON TYPE "slice"."__row_news_assign_assignment_input_mode_nearest_pyupadvtv2" IS 'the row type of the delta of news of AssignAssignmentInputModeNearest';

COMMENT ON TYPE "slice"."__row_olds_assign_assignment_input_mode_nearest_b5quid2s5d" IS 'the row type of the delta of olds of AssignAssignmentInputModeNearest';

COMMENT ON TYPE "slice"."__row_news_assign_assignment_input_mode_within_oeznxymcws" IS 'the row type of the delta of news of AssignAssignmentInputModeWithin';

COMMENT ON TYPE "slice"."__row_olds_assign_assignment_input_mode_within_36u3nuqbae" IS 'the row type of the delta of olds of AssignAssignmentInputModeWithin';

COMMENT ON TYPE "slice"."__row_news_assign_decide_input_5m3wrrmet4" IS 'the row type of the delta of news of AssignDecideInput';

COMMENT ON TYPE "slice"."__row_olds_assign_decide_input_f2jcgvtjac" IS 'the row type of the delta of olds of AssignDecideInput';

COMMENT ON TYPE "slice"."__row_news_assign_decide_input_mode_nearest_cprjb2hbu2" IS 'the row type of the delta of news of AssignDecideInputModeNearest';

COMMENT ON TYPE "slice"."__row_olds_assign_decide_input_mode_nearest_ec6iwlipow" IS 'the row type of the delta of olds of AssignDecideInputModeNearest';

COMMENT ON TYPE "slice"."__row_news_assign_decide_input_mode_within_ihopx5v773" IS 'the row type of the delta of news of AssignDecideInputModeWithin';

COMMENT ON TYPE "slice"."__row_olds_assign_decide_input_mode_within_hr4hmenptp" IS 'the row type of the delta of olds of AssignDecideInputModeWithin';

COMMENT ON TYPE "slice"."__row_news_assign_decide_output_oxbktxq2qm" IS 'the row type of the delta of news of AssignDecideOutput';

COMMENT ON TYPE "slice"."__row_olds_assign_decide_output_h4e5chlp62" IS 'the row type of the delta of olds of AssignDecideOutput';

COMMENT ON TYPE "slice"."__row_news_assign_decide_output_stage_rest_gygfjwjnji" IS 'the row type of the delta of news of AssignDecideOutputStageRest';

COMMENT ON TYPE "slice"."__row_olds_assign_decide_output_stage_rest_tqv3wuzdwv" IS 'the row type of the delta of olds of AssignDecideOutputStageRest';

COMMENT ON TYPE "slice"."__row_news_assign_decide_output_stage_serve_kbo2spylsa" IS 'the row type of the delta of news of AssignDecideOutputStageServe';

COMMENT ON TYPE "slice"."__row_olds_assign_decide_output_stage_serve_rsiololngr" IS 'the row type of the delta of olds of AssignDecideOutputStageServe';

COMMENT ON TYPE "slice"."__row_news_assign_done_ccijo7hiah" IS 'the row type of the delta of news of AssignDone';

COMMENT ON TYPE "slice"."__row_news_assign_embed_input_dwxj6bdcbx" IS 'the row type of the delta of news of AssignEmbedInput';

COMMENT ON TYPE "slice"."__row_olds_assign_embed_input_sxmwptaczg" IS 'the row type of the delta of olds of AssignEmbedInput';

COMMENT ON TYPE "slice"."__row_news_assign_embed_input_mode_nearest_ux5e4fp7sl" IS 'the row type of the delta of news of AssignEmbedInputModeNearest';

COMMENT ON TYPE "slice"."__row_olds_assign_embed_input_mode_nearest_vvtc3n4nsg" IS 'the row type of the delta of olds of AssignEmbedInputModeNearest';

COMMENT ON TYPE "slice"."__row_news_assign_embed_input_mode_within_7gysq5v2nb" IS 'the row type of the delta of news of AssignEmbedInputModeWithin';

COMMENT ON TYPE "slice"."__row_olds_assign_embed_input_mode_within_2ubf7bqv7n" IS 'the row type of the delta of olds of AssignEmbedInputModeWithin';

COMMENT ON TYPE "slice"."__row_news_assign_failed_lpxnyexx73" IS 'the row type of the delta of news of AssignFailed';

COMMENT ON TYPE "slice"."__row_olds_assign_result_y6xdg27a27" IS 'the row type of the delta of olds of AssignResult';

COMMENT ON TYPE "slice"."__row_olds_assign_root_bs3pmmub6n" IS 'the row type of the delta of olds of AssignRoot';

COMMENT ON TYPE "slice"."__row_olds_assign_step_zrm5kjcsbb" IS 'the row type of the delta of olds of AssignStep';

COMMENT ON TYPE "slice"."__row_news_chain_chain_run_input_gaq6aeskef" IS 'the row type of the delta of news of ChainChainRunInput';

COMMENT ON TYPE "slice"."__row_news_chain_done_ipbxekr3jk" IS 'the row type of the delta of news of ChainDone';

COMMENT ON TYPE "slice"."__row_news_chain_failed_4o3dxe5oq4" IS 'the row type of the delta of news of ChainFailed';

COMMENT ON TYPE "slice"."__row_news_chain_ordered_input_ihrfqowbow" IS 'the row type of the delta of news of ChainOrderedInput';

COMMENT ON TYPE "slice"."__row_news_chain_page_input_5vfsi4iuxb" IS 'the row type of the delta of news of ChainPageInput';

COMMENT ON TYPE "slice"."__row_olds_chain_result_zhxr3n3y5v" IS 'the row type of the delta of olds of ChainResult';

COMMENT ON TYPE "slice"."__row_olds_chain_root_hdm2pkmf3e" IS 'the row type of the delta of olds of ChainRoot';

COMMENT ON TYPE "slice"."__row_olds_chain_step_a4auuc4j32" IS 'the row type of the delta of olds of ChainStep';

COMMENT ON TYPE "slice"."__row_news_clock_chime_input_rfzc5ysow2" IS 'the row type of the delta of news of ClockChimeInput';

COMMENT ON TYPE "slice"."__row_news_clock_close_input_f7grz5pq5d" IS 'the row type of the delta of news of ClockCloseInput';

COMMENT ON TYPE "slice"."__row_news_clock_done_f4gq5vnwiu" IS 'the row type of the delta of news of ClockDone';

COMMENT ON TYPE "slice"."__row_news_clock_failed_banad75ik7" IS 'the row type of the delta of news of ClockFailed';

COMMENT ON TYPE "slice"."__row_news_clock_hourly_input_gg3t7s65fx" IS 'the row type of the delta of news of ClockHourlyInput';

COMMENT ON TYPE "slice"."__row_olds_clock_result_xmvy6bruki" IS 'the row type of the delta of olds of ClockResult';

COMMENT ON TYPE "slice"."__row_olds_clock_root_2y5wmdqlqn" IS 'the row type of the delta of olds of ClockRoot';

COMMENT ON TYPE "slice"."__row_news_clock_sitting_input_y2n5djkoat" IS 'the row type of the delta of news of ClockSittingInput';

COMMENT ON TYPE "slice"."__row_olds_clock_step_ro3hcnnd7q" IS 'the row type of the delta of olds of ClockStep';

COMMENT ON TYPE "slice"."__row_news_fan_batch_input_zpegwpv2iw" IS 'the row type of the delta of news of FanBatchInput';

COMMENT ON TYPE "slice"."__row_news_fan_claim_7nx4hyfgum" IS 'the row type of the delta of news of FanClaim';

COMMENT ON TYPE "slice"."__row_olds_fan_claim_ftpuskh4xp" IS 'the row type of the delta of olds of FanClaim';

COMMENT ON TYPE "slice"."__row_news_fan_done_bm2pdkfeew" IS 'the row type of the delta of news of FanDone';

COMMENT ON TYPE "slice"."__row_news_fan_dust_input_eirsjaffsy" IS 'the row type of the delta of news of FanDustInput';

COMMENT ON TYPE "slice"."__row_olds_fan_ended_fjp3muqjpi" IS 'the row type of the delta of olds of FanEnded';

COMMENT ON TYPE "slice"."__row_news_fan_failed_wcom3bevi4" IS 'the row type of the delta of news of FanFailed';

COMMENT ON TYPE "slice"."__row_news_fan_fan_run_input_kgkgksef6k" IS 'the row type of the delta of news of FanFanRunInput';

COMMENT ON TYPE "slice"."__row_olds_fan_held_6pxeeuxzx5" IS 'the row type of the delta of olds of FanHeld';

COMMENT ON TYPE "slice"."__row_news_fan_hold_fiz7xnswto" IS 'the row type of the delta of news of FanHold';

COMMENT ON TYPE "slice"."__row_news_fan_mop_input_vkauufcv3s" IS 'the row type of the delta of news of FanMopInput';

COMMENT ON TYPE "slice"."__row_olds_fan_result_cfwjurochh" IS 'the row type of the delta of olds of FanResult';

COMMENT ON TYPE "slice"."__row_olds_fan_root_o4syajqynp" IS 'the row type of the delta of olds of FanRoot';

COMMENT ON TYPE "slice"."__row_news_fan_square_input_oooc5jrvqp" IS 'the row type of the delta of news of FanSquareInput';

COMMENT ON TYPE "slice"."__row_olds_fan_step_e5cdd74oi6" IS 'the row type of the delta of olds of FanStep';

COMMENT ON TYPE "slice"."__row_news_fan_sweep_input_pbkw5exdue" IS 'the row type of the delta of news of FanSweepInput';

COMMENT ON TYPE "slice"."__row_olds_fan_within_igrko3tlla" IS 'the row type of the delta of olds of FanWithin';

COMMENT ON TYPE "slice"."__row_news_retry_brittle_input_gi4pw323hl" IS 'the row type of the delta of news of RetryBrittleInput';

COMMENT ON TYPE "slice"."__row_news_retry_done_3xnhmplocl" IS 'the row type of the delta of news of RetryDone';

COMMENT ON TYPE "slice"."__row_news_retry_failed_ht6i2dxi6i" IS 'the row type of the delta of news of RetryFailed';

COMMENT ON TYPE "slice"."__row_news_retry_ladders_input_asdxns2se7" IS 'the row type of the delta of news of RetryLaddersInput';

COMMENT ON TYPE "slice"."__row_news_retry_patient_input_ujn3j6okjm" IS 'the row type of the delta of news of RetryPatientInput';

COMMENT ON TYPE "slice"."__row_news_retry_polite_input_6z54vs4crc" IS 'the row type of the delta of news of RetryPoliteInput';

COMMENT ON TYPE "slice"."__row_olds_retry_result_sawexe6rws" IS 'the row type of the delta of olds of RetryResult';

COMMENT ON TYPE "slice"."__row_olds_retry_root_c2bpor5b2w" IS 'the row type of the delta of olds of RetryRoot';

COMMENT ON TYPE "slice"."__row_news_retry_steadfast_input_6gk4r2it4l" IS 'the row type of the delta of news of RetrySteadfastInput';

COMMENT ON TYPE "slice"."__row_olds_retry_step_7e2dops6yg" IS 'the row type of the delta of olds of RetryStep';

COMMENT ON TYPE "slice"."__row_news_retry_throttled_input_oeoagh4tv7" IS 'the row type of the delta of news of RetryThrottledInput';

COMMENT ON TYPE "slice"."__row_news_retry_unhurried_input_eu2xrrfwwr" IS 'the row type of the delta of news of RetryUnhurriedInput';

COMMENT ON TYPE "slice"."__row_news_review_analyze_input_ahzjb4juuh" IS 'the row type of the delta of news of ReviewAnalyzeInput';

COMMENT ON TYPE "slice"."__row_news_review_claim_ku2calk2a4" IS 'the row type of the delta of news of ReviewClaim';

COMMENT ON TYPE "slice"."__row_olds_review_claim_ykpmev3w36" IS 'the row type of the delta of olds of ReviewClaim';

COMMENT ON TYPE "slice"."__row_news_review_done_i5yrctmmrt" IS 'the row type of the delta of news of ReviewDone';

COMMENT ON TYPE "slice"."__row_olds_review_ended_3vbje7ziry" IS 'the row type of the delta of olds of ReviewEnded';

COMMENT ON TYPE "slice"."__row_news_review_failed_o2i2xvx3ox" IS 'the row type of the delta of news of ReviewFailed';

COMMENT ON TYPE "slice"."__row_news_review_gather_input_3xhqgy4d4y" IS 'the row type of the delta of news of ReviewGatherInput';

COMMENT ON TYPE "slice"."__row_olds_review_held_aio2rgomle" IS 'the row type of the delta of olds of ReviewHeld';

COMMENT ON TYPE "slice"."__row_news_review_hold_s3lo4pqs6u" IS 'the row type of the delta of news of ReviewHold';

COMMENT ON TYPE "slice"."__row_news_review_questions_input_xqapos33bv" IS 'the row type of the delta of news of ReviewQuestionsInput';

COMMENT ON TYPE "slice"."__row_olds_review_result_4edqg37cfx" IS 'the row type of the delta of olds of ReviewResult';

COMMENT ON TYPE "slice"."__row_news_review_review_run_input_ystzoy7vhk" IS 'the row type of the delta of news of ReviewReviewRunInput';

COMMENT ON TYPE "slice"."__row_olds_review_root_2cfb5ddcap" IS 'the row type of the delta of olds of ReviewRoot';

COMMENT ON TYPE "slice"."__row_news_review_save_input_g4felfy764" IS 'the row type of the delta of news of ReviewSaveInput';

COMMENT ON TYPE "slice"."__row_olds_review_step_5ly7sn3crk" IS 'the row type of the delta of olds of ReviewStep';

COMMENT ON TYPE "slice"."__row_olds_review_within_7w5djnlfoo" IS 'the row type of the delta of olds of ReviewWithin';

COMMENT ON TYPE "slice"."__row_news_sync_build_input_7gtarvuzgd" IS 'the row type of the delta of news of SyncBuildInput';

COMMENT ON TYPE "slice"."__row_news_sync_copy_input_cmgovnrtbu" IS 'the row type of the delta of news of SyncCopyInput';

COMMENT ON TYPE "slice"."__row_news_sync_done_srwysx2oys" IS 'the row type of the delta of news of SyncDone';

COMMENT ON TYPE "slice"."__row_news_sync_failed_uo7agxnsp7" IS 'the row type of the delta of news of SyncFailed';

COMMENT ON TYPE "slice"."__row_news_sync_gold_input_pvguclsxml" IS 'the row type of the delta of news of SyncGoldInput';

COMMENT ON TYPE "slice"."__row_olds_sync_result_5yd36qoig4" IS 'the row type of the delta of olds of SyncResult';

COMMENT ON TYPE "slice"."__row_olds_sync_root_da6za4qe6v" IS 'the row type of the delta of olds of SyncRoot';

COMMENT ON TYPE "slice"."__row_olds_sync_step_24id3jri34" IS 'the row type of the delta of olds of SyncStep';

COMMENT ON TYPE "slice"."__row_news_sync_sync_run_input_kpz3kpsmil" IS 'the row type of the delta of news of SyncSyncRunInput';

COMMENT ON TYPE "slice"."__row_news_writeback_deliver_input_fl5m4s5p77" IS 'the row type of the delta of news of WritebackDeliverInput';

COMMENT ON TYPE "slice"."__row_news_writeback_done_l54jw73tg7" IS 'the row type of the delta of news of WritebackDone';

COMMENT ON TYPE "slice"."__row_news_writeback_failed_o2vuzrgz2y" IS 'the row type of the delta of news of WritebackFailed';

COMMENT ON TYPE "slice"."__row_olds_writeback_result_ctqblben4u" IS 'the row type of the delta of olds of WritebackResult';

COMMENT ON TYPE "slice"."__row_olds_writeback_root_a437my7lv6" IS 'the row type of the delta of olds of WritebackRoot';

COMMENT ON TYPE "slice"."__row_olds_writeback_step_rvrwqy67gp" IS 'the row type of the delta of olds of WritebackStep';

COMMENT ON TYPE "slice"."__row_news_writeback_writeback_input_wqkezoqusc" IS 'the row type of the delta of news of WritebackWritebackInput';

COMMENT ON CONSTRAINT "__assigned_pk_72xowecbf7" ON "slice"."assigned" IS 'primary key of Assigned';

COMMENT ON CONSTRAINT "__built_pk_5tj25hcq6k" ON "slice"."built" IS 'primary key of Built';

COMMENT ON CONSTRAINT "__chimed_pk_7p6ypuplhn" ON "slice"."chimed" IS 'primary key of Chimed';

COMMENT ON CONSTRAINT "__concluded_pk_b44jbktrki" ON "slice"."concluded" IS 'primary key of Concluded';

COMMENT ON CONSTRAINT "__copied_pk_6dsi4gohbu" ON "slice"."copied" IS 'primary key of Copied';

COMMENT ON CONSTRAINT "__cursor_pk_wl2ngqny4j" ON "slice"."cursor" IS 'primary key of Cursor';

COMMENT ON CONSTRAINT "__delivered_pk_xzukubt47t" ON "slice"."delivered" IS 'primary key of Delivered';

COMMENT ON CONSTRAINT "__heard_pk_sdu7ysinks" ON "slice"."heard" IS 'primary key of Heard';

COMMENT ON CONSTRAINT "__item_pk_ai4obgmq4k" ON "slice"."item" IS 'primary key of Item';

COMMENT ON CONSTRAINT "__order_pk_qodq3est7o" ON "slice"."order" IS 'primary key of Order';

COMMENT ON CONSTRAINT "__passage_pk_kayjlxd3gv" ON "slice"."passage" IS 'primary key of Passage';

COMMENT ON CONSTRAINT "__passage_norm_embedding_d2siyt575a" ON "slice"."passage" IS 'cosine norm check of Passage.embedding';

COMMENT ON CONSTRAINT "__reviewed_pk_z3sm6wzse2" ON "slice"."reviewed" IS 'primary key of Reviewed';

COMMENT ON CONSTRAINT "__seen_pk_g4ptcxwowb" ON "slice"."seen" IS 'primary key of Seen';

COMMENT ON CONSTRAINT "__settled_pk_yitdz6z3ts" ON "slice"."settled" IS 'primary key of Settled';

COMMENT ON CONSTRAINT "__summary_pk_rpajkerfah" ON "slice"."summary" IS 'primary key of Summary';

COMMENT ON CONSTRAINT "__tally_pk_7jc66uxxx4" ON "slice"."tally" IS 'primary key of Tally';

COMMENT ON CONSTRAINT "__weight_pk_p77rl634io" ON "slice"."weight" IS 'primary key of Weight';

COMMENT ON CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" ON "slice_den"."assign_admitted" IS 'primary key of AssignAdmitted';

COMMENT ON CONSTRAINT "__assign_asked_pk_5hpdamg2sv" ON "slice_den"."assign_asked" IS 'primary key of AssignAsked';

COMMENT ON CONSTRAINT "__assign_asked_key_to_root_7prfl6pubf" ON "slice_den"."assign_asked" IS 'key AssignAsked(to, root)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_pk_djholiuras" ON "slice_den"."assign_assignment_finish_output" IS 'primary key of AssignAssignmentFinishOutput';

COMMENT ON CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" ON "slice_den"."assign_assignment_input" IS 'primary key of AssignAssignmentInput';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" ON "slice_den"."assign_assignment_input_exclude" IS 'primary key of AssignAssignmentInputExclude';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" ON "slice_den"."assign_assignment_input_mode_nearest" IS 'primary key of AssignAssignmentInputModeNearest';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" ON "slice_den"."assign_assignment_input_mode_within" IS 'primary key of AssignAssignmentInputModeWithin';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_pk_yr4pki7m7t" ON "slice_den"."assign_assignment_input_near" IS 'primary key of AssignAssignmentInputNear';

COMMENT ON CONSTRAINT "__assign_claim_pk_gy4yhzk2me" ON "slice_den"."assign_claim" IS 'primary key of AssignClaim';

COMMENT ON CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" ON "slice_den"."assign_decide_input" IS 'primary key of AssignDecideInput';

COMMENT ON CONSTRAINT "__assign_decide_input_norm_vector_it3heqzuab" ON "slice_den"."assign_decide_input" IS 'cosine norm check of AssignDecideInput.vector';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" ON "slice_den"."assign_decide_input_exclude" IS 'primary key of AssignDecideInputExclude';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" ON "slice_den"."assign_decide_input_mode_nearest" IS 'primary key of AssignDecideInputModeNearest';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" ON "slice_den"."assign_decide_input_mode_within" IS 'primary key of AssignDecideInputModeWithin';

COMMENT ON CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" ON "slice_den"."assign_decide_output" IS 'primary key of AssignDecideOutput';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" ON "slice_den"."assign_decide_output_stage_rest" IS 'primary key of AssignDecideOutputStageRest';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" ON "slice_den"."assign_decide_output_stage_serve" IS 'primary key of AssignDecideOutputStageServe';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" ON "slice_den"."assign_decide_output_weighed" IS 'primary key of AssignDecideOutputWeighed';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_pk_22bk6frvyf" ON "slice_den"."assign_decide_read_nearest" IS 'primary key of AssignDecideReadNearest';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_row_pk_j5pwukyltc" ON "slice_den"."assign_decide_read_nearest_row" IS 'primary key of AssignDecideReadNearestRow';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_pk_wllnx7uy5j" ON "slice_den"."assign_decide_read_seen" IS 'primary key of AssignDecideReadSeen';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_row_pk_fab2ngfdqq" ON "slice_den"."assign_decide_read_seen_row" IS 'primary key of AssignDecideReadSeenRow';

COMMENT ON CONSTRAINT "__assign_done_pk_gzil7jvxpz" ON "slice_den"."assign_done" IS 'primary key of AssignDone';

COMMENT ON CONSTRAINT "__assign_embed_input_pk_q4ezcfvwia" ON "slice_den"."assign_embed_input" IS 'primary key of AssignEmbedInput';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_pk_5bklowmkgt" ON "slice_den"."assign_embed_input_exclude" IS 'primary key of AssignEmbedInputExclude';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_nearest_pk_wiskd5j54m" ON "slice_den"."assign_embed_input_mode_nearest" IS 'primary key of AssignEmbedInputModeNearest';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_within_pk_zldmxccjlo" ON "slice_den"."assign_embed_input_mode_within" IS 'primary key of AssignEmbedInputModeWithin';

COMMENT ON CONSTRAINT "__assign_embed_input_near_pk_bkusmda72a" ON "slice_den"."assign_embed_input_near" IS 'primary key of AssignEmbedInputNear';

COMMENT ON CONSTRAINT "__assign_embed_output_pk_noiv3qgtry" ON "slice_den"."assign_embed_output" IS 'primary key of AssignEmbedOutput';

COMMENT ON CONSTRAINT "__assign_embed_output_norm_vector_yuy6gaplly" ON "slice_den"."assign_embed_output" IS 'cosine norm check of AssignEmbedOutput.vector';

COMMENT ON CONSTRAINT "__assign_ended_pk_nriwwbcneu" ON "slice_den"."assign_ended" IS 'primary key of AssignEnded';

COMMENT ON CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" ON "slice_den"."assign_exhausted" IS 'primary key of AssignExhausted';

COMMENT ON CONSTRAINT "__assign_failed_pk_ygxslcya4o" ON "slice_den"."assign_failed" IS 'primary key of AssignFailed';

COMMENT ON CONSTRAINT "__assign_fenced_pk_y6jyfviepa" ON "slice_den"."assign_fenced" IS 'primary key of AssignFenced';

COMMENT ON CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" ON "slice_den"."assign_finish" IS 'primary key of AssignFinish';

COMMENT ON CONSTRAINT "__assign_finish_key_step_root_4woj5zibbd" ON "slice_den"."assign_finish" IS 'key AssignFinish(step, root)';

COMMENT ON CONSTRAINT "__assign_held_pk_by245z7t45" ON "slice_den"."assign_held" IS 'primary key of AssignHeld';

COMMENT ON CONSTRAINT "__assign_paused_pk_ulo4grv4e2" ON "slice_den"."assign_paused" IS 'primary key of AssignPaused';

COMMENT ON CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" ON "slice_den"."assign_refusal" IS 'primary key of AssignRefusal';

COMMENT ON CONSTRAINT "__assign_result_pk_i2yxmpkyzr" ON "slice_den"."assign_result" IS 'primary key of AssignResult';

COMMENT ON CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" ON "slice_den"."assign_resumed" IS 'primary key of AssignResumed';

COMMENT ON CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" ON "slice_den"."assign_retry" IS 'primary key of AssignRetry';

COMMENT ON CONSTRAINT "__assign_root_pk_b23qqyryx4" ON "slice_den"."assign_root" IS 'primary key of AssignRoot';

COMMENT ON CONSTRAINT "__assign_scope_pk_xytntbncid" ON "slice_den"."assign_scope" IS 'primary key of AssignScope';

COMMENT ON CONSTRAINT "__assign_served_pk_gahaxyiegw" ON "slice_den"."assign_served" IS 'primary key of AssignServed';

COMMENT ON CONSTRAINT "__assign_skipped_pk_5qhgbueof7" ON "slice_den"."assign_skipped" IS 'primary key of AssignSkipped';

COMMENT ON CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" ON "slice_den"."assign_start_step" IS 'primary key of AssignStartStep';

COMMENT ON CONSTRAINT "__assign_start_step_key_step_root_k27j2tutjj" ON "slice_den"."assign_start_step" IS 'key AssignStartStep(step, root)';

COMMENT ON CONSTRAINT "__assign_step_pk_2oc4ehvfzd" ON "slice_den"."assign_step" IS 'primary key of AssignStep';

COMMENT ON CONSTRAINT "__audit_pk_dcvpvv5cjz" ON "slice_den"."audit" IS 'primary key of Audit';

COMMENT ON CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" ON "slice_den"."chain_admitted" IS 'primary key of ChainAdmitted';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_pk_hj22ebjnf7" ON "slice_den"."chain_chain_run_finish_output" IS 'primary key of ChainChainRunFinishOutput';

COMMENT ON CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" ON "slice_den"."chain_chain_run_input" IS 'primary key of ChainChainRunInput';

COMMENT ON CONSTRAINT "__chain_claim_pk_nrr2rn3gui" ON "slice_den"."chain_claim" IS 'primary key of ChainClaim';

COMMENT ON CONSTRAINT "__chain_done_pk_tyyx2hmu3r" ON "slice_den"."chain_done" IS 'primary key of ChainDone';

COMMENT ON CONSTRAINT "__chain_ended_pk_wusc7vjjx6" ON "slice_den"."chain_ended" IS 'primary key of ChainEnded';

COMMENT ON CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" ON "slice_den"."chain_exhausted" IS 'primary key of ChainExhausted';

COMMENT ON CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" ON "slice_den"."chain_failed" IS 'primary key of ChainFailed';

COMMENT ON CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" ON "slice_den"."chain_fenced" IS 'primary key of ChainFenced';

COMMENT ON CONSTRAINT "__chain_finish_pk_ebe75jmnzy" ON "slice_den"."chain_finish" IS 'primary key of ChainFinish';

COMMENT ON CONSTRAINT "__chain_finish_key_step_root_5aj26igjty" ON "slice_den"."chain_finish" IS 'key ChainFinish(step, root)';

COMMENT ON CONSTRAINT "__chain_held_pk_73idl7oo5c" ON "slice_den"."chain_held" IS 'primary key of ChainHeld';

COMMENT ON CONSTRAINT "__chain_next_pk_qeumlilvtk" ON "slice_den"."chain_next" IS 'primary key of ChainNext';

COMMENT ON CONSTRAINT "__chain_next_key_to_root_qxqaughmvp" ON "slice_den"."chain_next" IS 'key ChainNext(to, root)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_pk_t5k5pqxfdo" ON "slice_den"."chain_ordered_finish_output" IS 'primary key of ChainOrderedFinishOutput';

COMMENT ON CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" ON "slice_den"."chain_ordered_input" IS 'primary key of ChainOrderedInput';

COMMENT ON CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" ON "slice_den"."chain_page_input" IS 'primary key of ChainPageInput';

COMMENT ON CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" ON "slice_den"."chain_page_input_after" IS 'primary key of ChainPageInputAfter';

COMMENT ON CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" ON "slice_den"."chain_page_output" IS 'primary key of ChainPageOutput';

COMMENT ON CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" ON "slice_den"."chain_page_output_next" IS 'primary key of ChainPageOutputNext';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_pk_2xyyf45r3u" ON "slice_den"."chain_page_read_earlier" IS 'primary key of ChainPageReadEarlier';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_row_pk_fzp2fq7wlv" ON "slice_den"."chain_page_read_earlier_row" IS 'primary key of ChainPageReadEarlierRow';

COMMENT ON CONSTRAINT "__chain_page_read_tree_pk_yi4lj5ou7f" ON "slice_den"."chain_page_read_tree" IS 'primary key of ChainPageReadTree';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_pk_fay3dxulye" ON "slice_den"."chain_page_read_tree_items" IS 'primary key of ChainPageReadTreeItems';

COMMENT ON CONSTRAINT "__chain_page_read_tree_row_pk_krei6zvz6t" ON "slice_den"."chain_page_read_tree_row" IS 'primary key of ChainPageReadTreeRow';

COMMENT ON CONSTRAINT "__chain_page_read_tree_row_key_digest_items_s2jrbtqovl" ON "slice_den"."chain_page_read_tree_row" IS 'key ChainPageReadTreeRow(digest, items)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_pk_7oohwtj6x4" ON "slice_den"."chain_page_read_weights" IS 'primary key of ChainPageReadWeights';

COMMENT ON CONSTRAINT "__chain_page_read_weights_row_pk_bmwffycauu" ON "slice_den"."chain_page_read_weights_row" IS 'primary key of ChainPageReadWeightsRow';

COMMENT ON CONSTRAINT "__chain_page_tree_first_pk_zmjcrvbs5g" ON "slice_den"."chain_page_tree_first" IS 'primary key of ChainPageTreeFirst';

COMMENT ON CONSTRAINT "__chain_paused_pk_oorovhvyps" ON "slice_den"."chain_paused" IS 'primary key of ChainPaused';

COMMENT ON CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" ON "slice_den"."chain_refusal" IS 'primary key of ChainRefusal';

COMMENT ON CONSTRAINT "__chain_result_pk_btw3jzlkgl" ON "slice_den"."chain_result" IS 'primary key of ChainResult';

COMMENT ON CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" ON "slice_den"."chain_resumed" IS 'primary key of ChainResumed';

COMMENT ON CONSTRAINT "__chain_retry_pk_522nodru3s" ON "slice_den"."chain_retry" IS 'primary key of ChainRetry';

COMMENT ON CONSTRAINT "__chain_root_pk_wqfycdg3x5" ON "slice_den"."chain_root" IS 'primary key of ChainRoot';

COMMENT ON CONSTRAINT "__chain_scope_pk_fxzt444lf6" ON "slice_den"."chain_scope" IS 'primary key of ChainScope';

COMMENT ON CONSTRAINT "__chain_served_pk_wzbdafznld" ON "slice_den"."chain_served" IS 'primary key of ChainServed';

COMMENT ON CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" ON "slice_den"."chain_skipped" IS 'primary key of ChainSkipped';

COMMENT ON CONSTRAINT "__chain_start_step_pk_dgda7shxb4" ON "slice_den"."chain_start_step" IS 'primary key of ChainStartStep';

COMMENT ON CONSTRAINT "__chain_start_step_key_step_root_sgonmabfyw" ON "slice_den"."chain_start_step" IS 'key ChainStartStep(step, root)';

COMMENT ON CONSTRAINT "__chain_step_pk_u6x5wnvfbv" ON "slice_den"."chain_step" IS 'primary key of ChainStep';

COMMENT ON CONSTRAINT "__clock_admitted_pk_a7wwsyakra" ON "slice_den"."clock_admitted" IS 'primary key of ClockAdmitted';

COMMENT ON CONSTRAINT "__clock_chime_input_pk_rx6722hrpy" ON "slice_den"."clock_chime_input" IS 'primary key of ClockChimeInput';

COMMENT ON CONSTRAINT "__clock_chime_output_pk_aqm3k5vyxa" ON "slice_den"."clock_chime_output" IS 'primary key of ClockChimeOutput';

COMMENT ON CONSTRAINT "__clock_claim_pk_ihqmnokjqm" ON "slice_den"."clock_claim" IS 'primary key of ClockClaim';

COMMENT ON CONSTRAINT "__clock_close_input_pk_kzcush3qdx" ON "slice_den"."clock_close_input" IS 'primary key of ClockCloseInput';

COMMENT ON CONSTRAINT "__clock_close_output_pk_ckrp5oabyy" ON "slice_den"."clock_close_output" IS 'primary key of ClockCloseOutput';

COMMENT ON CONSTRAINT "__clock_done_pk_f4vl6frrax" ON "slice_den"."clock_done" IS 'primary key of ClockDone';

COMMENT ON CONSTRAINT "__clock_ended_pk_pqp6yh3qgg" ON "slice_den"."clock_ended" IS 'primary key of ClockEnded';

COMMENT ON CONSTRAINT "__clock_exhausted_pk_4m2tieyrky" ON "slice_den"."clock_exhausted" IS 'primary key of ClockExhausted';

COMMENT ON CONSTRAINT "__clock_failed_pk_6twuzcs6kf" ON "slice_den"."clock_failed" IS 'primary key of ClockFailed';

COMMENT ON CONSTRAINT "__clock_fenced_pk_mzppv2rrab" ON "slice_den"."clock_fenced" IS 'primary key of ClockFenced';

COMMENT ON CONSTRAINT "__clock_finish_pk_eqj7fcnrnq" ON "slice_den"."clock_finish" IS 'primary key of ClockFinish';

COMMENT ON CONSTRAINT "__clock_finish_key_step_root_qqome46md2" ON "slice_den"."clock_finish" IS 'key ClockFinish(step, root)';

COMMENT ON CONSTRAINT "__clock_held_pk_qqxrvee2gy" ON "slice_den"."clock_held" IS 'primary key of ClockHeld';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_pk_6bcdc5q3dt" ON "slice_den"."clock_hourly_finish_output" IS 'primary key of ClockHourlyFinishOutput';

COMMENT ON CONSTRAINT "__clock_hourly_input_pk_s536mhvux3" ON "slice_den"."clock_hourly_input" IS 'primary key of ClockHourlyInput';

COMMENT ON CONSTRAINT "__clock_paused_pk_fsld2lekav" ON "slice_den"."clock_paused" IS 'primary key of ClockPaused';

COMMENT ON CONSTRAINT "__clock_refusal_pk_dslb6cgxa3" ON "slice_den"."clock_refusal" IS 'primary key of ClockRefusal';

COMMENT ON CONSTRAINT "__clock_result_pk_yptcdjm6pu" ON "slice_den"."clock_result" IS 'primary key of ClockResult';

COMMENT ON CONSTRAINT "__clock_resumed_pk_iqjwv5tioc" ON "slice_den"."clock_resumed" IS 'primary key of ClockResumed';

COMMENT ON CONSTRAINT "__clock_retry_pk_4kyiqeoeqd" ON "slice_den"."clock_retry" IS 'primary key of ClockRetry';

COMMENT ON CONSTRAINT "__clock_root_pk_rnmiw3efr2" ON "slice_den"."clock_root" IS 'primary key of ClockRoot';

COMMENT ON CONSTRAINT "__clock_scope_pk_dux445xz6c" ON "slice_den"."clock_scope" IS 'primary key of ClockScope';

COMMENT ON CONSTRAINT "__clock_served_pk_t5lm3cvd5b" ON "slice_den"."clock_served" IS 'primary key of ClockServed';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_pk_pejmuwtji5" ON "slice_den"."clock_sitting_finish_output" IS 'primary key of ClockSittingFinishOutput';

COMMENT ON CONSTRAINT "__clock_sitting_input_pk_le4qxvpabo" ON "slice_den"."clock_sitting_input" IS 'primary key of ClockSittingInput';

COMMENT ON CONSTRAINT "__clock_skipped_pk_2whj2jo6zo" ON "slice_den"."clock_skipped" IS 'primary key of ClockSkipped';

COMMENT ON CONSTRAINT "__clock_start_step_pk_qgw6bnuo54" ON "slice_den"."clock_start_step" IS 'primary key of ClockStartStep';

COMMENT ON CONSTRAINT "__clock_start_step_key_step_root_oseon2uqng" ON "slice_den"."clock_start_step" IS 'key ClockStartStep(step, root)';

COMMENT ON CONSTRAINT "__clock_step_pk_jjmk3diqpl" ON "slice_den"."clock_step" IS 'primary key of ClockStep';

COMMENT ON CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" ON "slice_den"."fan_admitted" IS 'primary key of FanAdmitted';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_pk_mq5omzswqd" ON "slice_den"."fan_batch_finish_output" IS 'primary key of FanBatchFinishOutput';

COMMENT ON CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" ON "slice_den"."fan_batch_input" IS 'primary key of FanBatchInput';

COMMENT ON CONSTRAINT "__fan_claim_pk_e7zimqppco" ON "slice_den"."fan_claim" IS 'primary key of FanClaim';

COMMENT ON CONSTRAINT "__fan_claim_key_step_root_attempt_holds_iqkydblyix" ON "slice_den"."fan_claim" IS 'key FanClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_done_pk_5u65252q52" ON "slice_den"."fan_done" IS 'primary key of FanDone';

COMMENT ON CONSTRAINT "__fan_dust_input_pk_xyleoykgmc" ON "slice_den"."fan_dust_input" IS 'primary key of FanDustInput';

COMMENT ON CONSTRAINT "__fan_dust_output_pk_3ve4gi5x6b" ON "slice_den"."fan_dust_output" IS 'primary key of FanDustOutput';

COMMENT ON CONSTRAINT "__fan_ended_pk_23aeteyyv7" ON "slice_den"."fan_ended" IS 'primary key of FanEnded';

COMMENT ON CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" ON "slice_den"."fan_exhausted" IS 'primary key of FanExhausted';

COMMENT ON CONSTRAINT "__fan_failed_pk_z4etp5dmax" ON "slice_den"."fan_failed" IS 'primary key of FanFailed';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_pk_rhhjregxru" ON "slice_den"."fan_fan_run_finish_output" IS 'primary key of FanFanRunFinishOutput';

COMMENT ON CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" ON "slice_den"."fan_fan_run_input" IS 'primary key of FanFanRunInput';

COMMENT ON CONSTRAINT "__fan_fenced_pk_6tkvirerez" ON "slice_den"."fan_fenced" IS 'primary key of FanFenced';

COMMENT ON CONSTRAINT "__fan_finish_pk_6mb33urjra" ON "slice_den"."fan_finish" IS 'primary key of FanFinish';

COMMENT ON CONSTRAINT "__fan_finish_key_step_root_xshxj2rwb2" ON "slice_den"."fan_finish" IS 'key FanFinish(step, root)';

COMMENT ON CONSTRAINT "__fan_held_pk_4ic6tjvac4" ON "slice_den"."fan_held" IS 'primary key of FanHeld';

COMMENT ON CONSTRAINT "__fan_hold_pk_avuqdkljvb" ON "slice_den"."fan_hold" IS 'primary key of FanHold';

COMMENT ON CONSTRAINT "__fan_mop_input_pk_jwnqekad76" ON "slice_den"."fan_mop_input" IS 'primary key of FanMopInput';

COMMENT ON CONSTRAINT "__fan_mop_output_pk_rcebyoc32v" ON "slice_den"."fan_mop_output" IS 'primary key of FanMopOutput';

COMMENT ON CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" ON "slice_den"."fan_paused" IS 'primary key of FanPaused';

COMMENT ON CONSTRAINT "__fan_refusal_pk_7va55wo2wj" ON "slice_den"."fan_refusal" IS 'primary key of FanRefusal';

COMMENT ON CONSTRAINT "__fan_result_pk_yeear352sx" ON "slice_den"."fan_result" IS 'primary key of FanResult';

COMMENT ON CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" ON "slice_den"."fan_resumed" IS 'primary key of FanResumed';

COMMENT ON CONSTRAINT "__fan_retry_pk_7xubce4v66" ON "slice_den"."fan_retry" IS 'primary key of FanRetry';

COMMENT ON CONSTRAINT "__fan_root_pk_jesu7xtefn" ON "slice_den"."fan_root" IS 'primary key of FanRoot';

COMMENT ON CONSTRAINT "__fan_scope_pk_7bvjfihnef" ON "slice_den"."fan_scope" IS 'primary key of FanScope';

COMMENT ON CONSTRAINT "__fan_served_pk_hcfoxxhdsr" ON "slice_den"."fan_served" IS 'primary key of FanServed';

COMMENT ON CONSTRAINT "__fan_skipped_pk_22erbmfzer" ON "slice_den"."fan_skipped" IS 'primary key of FanSkipped';

COMMENT ON CONSTRAINT "__fan_square_input_pk_uzumoizv53" ON "slice_den"."fan_square_input" IS 'primary key of FanSquareInput';

COMMENT ON CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" ON "slice_den"."fan_square_output" IS 'primary key of FanSquareOutput';

COMMENT ON CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" ON "slice_den"."fan_start_scope" IS 'primary key of FanStartScope';

COMMENT ON CONSTRAINT "__fan_start_scope_key_child_root_twylnvawre" ON "slice_den"."fan_start_scope" IS 'key FanStartScope(child, root)';

COMMENT ON CONSTRAINT "__fan_start_step_pk_7e247xk4mz" ON "slice_den"."fan_start_step" IS 'primary key of FanStartStep';

COMMENT ON CONSTRAINT "__fan_start_step_key_step_root_h32wwrpq3c" ON "slice_den"."fan_start_step" IS 'key FanStartStep(step, root)';

COMMENT ON CONSTRAINT "__fan_step_pk_2f4tcxnofk" ON "slice_den"."fan_step" IS 'primary key of FanStep';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_pk_7dvx2ngckn" ON "slice_den"."fan_sweep_finish_output" IS 'primary key of FanSweepFinishOutput';

COMMENT ON CONSTRAINT "__fan_sweep_input_pk_zzlgjjqr6f" ON "slice_den"."fan_sweep_input" IS 'primary key of FanSweepInput';

COMMENT ON CONSTRAINT "__fan_within_pk_g5tswgjfa6" ON "slice_den"."fan_within" IS 'primary key of FanWithin';

COMMENT ON CONSTRAINT "__retry_admitted_pk_qyp7cminjx" ON "slice_den"."retry_admitted" IS 'primary key of RetryAdmitted';

COMMENT ON CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" ON "slice_den"."retry_brittle_input" IS 'primary key of RetryBrittleInput';

COMMENT ON CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" ON "slice_den"."retry_brittle_output" IS 'primary key of RetryBrittleOutput';

COMMENT ON CONSTRAINT "__retry_claim_pk_aayzt5ni6z" ON "slice_den"."retry_claim" IS 'primary key of RetryClaim';

COMMENT ON CONSTRAINT "__retry_done_pk_vtkpce7rkq" ON "slice_den"."retry_done" IS 'primary key of RetryDone';

COMMENT ON CONSTRAINT "__retry_ended_pk_hq35r7u2t2" ON "slice_den"."retry_ended" IS 'primary key of RetryEnded';

COMMENT ON CONSTRAINT "__retry_exhausted_pk_v56c23krid" ON "slice_den"."retry_exhausted" IS 'primary key of RetryExhausted';

COMMENT ON CONSTRAINT "__retry_failed_pk_mygc4onczp" ON "slice_den"."retry_failed" IS 'primary key of RetryFailed';

COMMENT ON CONSTRAINT "__retry_fenced_pk_umzicmiruo" ON "slice_den"."retry_fenced" IS 'primary key of RetryFenced';

COMMENT ON CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" ON "slice_den"."retry_finish" IS 'primary key of RetryFinish';

COMMENT ON CONSTRAINT "__retry_finish_key_step_root_a7vhiwagne" ON "slice_den"."retry_finish" IS 'key RetryFinish(step, root)';

COMMENT ON CONSTRAINT "__retry_held_pk_nvgeylmjp2" ON "slice_den"."retry_held" IS 'primary key of RetryHeld';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_pk_5352zkn7xu" ON "slice_den"."retry_ladders_finish_output" IS 'primary key of RetryLaddersFinishOutput';

COMMENT ON CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" ON "slice_den"."retry_ladders_input" IS 'primary key of RetryLaddersInput';

COMMENT ON CONSTRAINT "__retry_patient_input_pk_74247zb7wo" ON "slice_den"."retry_patient_input" IS 'primary key of RetryPatientInput';

COMMENT ON CONSTRAINT "__retry_patient_output_pk_whtgus732k" ON "slice_den"."retry_patient_output" IS 'primary key of RetryPatientOutput';

COMMENT ON CONSTRAINT "__retry_paused_pk_umm2nscqny" ON "slice_den"."retry_paused" IS 'primary key of RetryPaused';

COMMENT ON CONSTRAINT "__retry_polite_input_pk_ptzd72dxff" ON "slice_den"."retry_polite_input" IS 'primary key of RetryPoliteInput';

COMMENT ON CONSTRAINT "__retry_polite_output_pk_2kuwfluplv" ON "slice_den"."retry_polite_output" IS 'primary key of RetryPoliteOutput';

COMMENT ON CONSTRAINT "__retry_refusal_pk_nifndsd6pp" ON "slice_den"."retry_refusal" IS 'primary key of RetryRefusal';

COMMENT ON CONSTRAINT "__retry_result_pk_5fegihvmml" ON "slice_den"."retry_result" IS 'primary key of RetryResult';

COMMENT ON CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" ON "slice_den"."retry_resumed" IS 'primary key of RetryResumed';

COMMENT ON CONSTRAINT "__retry_retry_pk_slrwn4rt5d" ON "slice_den"."retry_retry" IS 'primary key of RetryRetry';

COMMENT ON CONSTRAINT "__retry_root_pk_qi2iw36jky" ON "slice_den"."retry_root" IS 'primary key of RetryRoot';

COMMENT ON CONSTRAINT "__retry_scope_pk_fgji2phvxy" ON "slice_den"."retry_scope" IS 'primary key of RetryScope';

COMMENT ON CONSTRAINT "__retry_served_pk_wgxtug7z34" ON "slice_den"."retry_served" IS 'primary key of RetryServed';

COMMENT ON CONSTRAINT "__retry_skipped_pk_au5z33ql7a" ON "slice_den"."retry_skipped" IS 'primary key of RetrySkipped';

COMMENT ON CONSTRAINT "__retry_start_step_pk_mp77csmi26" ON "slice_den"."retry_start_step" IS 'primary key of RetryStartStep';

COMMENT ON CONSTRAINT "__retry_start_step_key_step_root_fudt2vk7zs" ON "slice_den"."retry_start_step" IS 'key RetryStartStep(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" ON "slice_den"."retry_steadfast_input" IS 'primary key of RetrySteadfastInput';

COMMENT ON CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" ON "slice_den"."retry_steadfast_output" IS 'primary key of RetrySteadfastOutput';

COMMENT ON CONSTRAINT "__retry_step_pk_opjqidwhzg" ON "slice_den"."retry_step" IS 'primary key of RetryStep';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_pk_o6epepnuox" ON "slice_den"."retry_throttled_finish_output" IS 'primary key of RetryThrottledFinishOutput';

COMMENT ON CONSTRAINT "__retry_throttled_input_pk_zv264azw4s" ON "slice_den"."retry_throttled_input" IS 'primary key of RetryThrottledInput';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_pk_d5mmuqfkuq" ON "slice_den"."retry_unhurried_finish_output" IS 'primary key of RetryUnhurriedFinishOutput';

COMMENT ON CONSTRAINT "__retry_unhurried_input_pk_g5dkiedexm" ON "slice_den"."retry_unhurried_input" IS 'primary key of RetryUnhurriedInput';

COMMENT ON CONSTRAINT "__review_admitted_pk_woy7ee4y4p" ON "slice_den"."review_admitted" IS 'primary key of ReviewAdmitted';

COMMENT ON CONSTRAINT "__review_analyze_input_pk_jr7qmhqwgi" ON "slice_den"."review_analyze_input" IS 'primary key of ReviewAnalyzeInput';

COMMENT ON CONSTRAINT "__review_analyze_output_pk_35aclxnkmb" ON "slice_den"."review_analyze_output" IS 'primary key of ReviewAnalyzeOutput';

COMMENT ON CONSTRAINT "__review_claim_pk_twa72qaol7" ON "slice_den"."review_claim" IS 'primary key of ReviewClaim';

COMMENT ON CONSTRAINT "__review_claim_key_step_root_attempt_holds_25ppgtp6nm" ON "slice_den"."review_claim" IS 'key ReviewClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__review_done_pk_ve6inioidy" ON "slice_den"."review_done" IS 'primary key of ReviewDone';

COMMENT ON CONSTRAINT "__review_ended_pk_2hihcuxln2" ON "slice_den"."review_ended" IS 'primary key of ReviewEnded';

COMMENT ON CONSTRAINT "__review_exhausted_pk_5bmktauwd3" ON "slice_den"."review_exhausted" IS 'primary key of ReviewExhausted';

COMMENT ON CONSTRAINT "__review_failed_pk_7iszsjaybr" ON "slice_den"."review_failed" IS 'primary key of ReviewFailed';

COMMENT ON CONSTRAINT "__review_fenced_pk_chaexdbnzu" ON "slice_den"."review_fenced" IS 'primary key of ReviewFenced';

COMMENT ON CONSTRAINT "__review_finish_pk_ovczbakxjz" ON "slice_den"."review_finish" IS 'primary key of ReviewFinish';

COMMENT ON CONSTRAINT "__review_finish_key_step_root_tcsouam46b" ON "slice_den"."review_finish" IS 'key ReviewFinish(step, root)';

COMMENT ON CONSTRAINT "__review_gather_input_pk_rllaxtocmq" ON "slice_den"."review_gather_input" IS 'primary key of ReviewGatherInput';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_pk_w5cgw65wpx" ON "slice_den"."review_gather_input_sizes" IS 'primary key of ReviewGatherInputSizes';

COMMENT ON CONSTRAINT "__review_gather_output_pk_fecesmjazj" ON "slice_den"."review_gather_output" IS 'primary key of ReviewGatherOutput';

COMMENT ON CONSTRAINT "__review_held_pk_cwyo7jovuu" ON "slice_den"."review_held" IS 'primary key of ReviewHeld';

COMMENT ON CONSTRAINT "__review_hold_pk_uhb6w3fp5v" ON "slice_den"."review_hold" IS 'primary key of ReviewHold';

COMMENT ON CONSTRAINT "__review_paused_pk_eamccblv6g" ON "slice_den"."review_paused" IS 'primary key of ReviewPaused';

COMMENT ON CONSTRAINT "__review_questions_finish_output_pk_36plo53gmb" ON "slice_den"."review_questions_finish_output" IS 'primary key of ReviewQuestionsFinishOutput';

COMMENT ON CONSTRAINT "__review_questions_input_pk_4d27veaz4g" ON "slice_den"."review_questions_input" IS 'primary key of ReviewQuestionsInput';

COMMENT ON CONSTRAINT "__review_refusal_pk_ajyglinn6r" ON "slice_den"."review_refusal" IS 'primary key of ReviewRefusal';

COMMENT ON CONSTRAINT "__review_result_pk_o5x5griurk" ON "slice_den"."review_result" IS 'primary key of ReviewResult';

COMMENT ON CONSTRAINT "__review_resumed_pk_jqgqbkvl65" ON "slice_den"."review_resumed" IS 'primary key of ReviewResumed';

COMMENT ON CONSTRAINT "__review_retry_pk_is3m5sa5tx" ON "slice_den"."review_retry" IS 'primary key of ReviewRetry';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_pk_qwfb4ycp7r" ON "slice_den"."review_review_run_finish_output" IS 'primary key of ReviewReviewRunFinishOutput';

COMMENT ON CONSTRAINT "__review_review_run_input_pk_7ommryhd6b" ON "slice_den"."review_review_run_input" IS 'primary key of ReviewReviewRunInput';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_pk_bguaae726h" ON "slice_den"."review_review_run_input_sizes" IS 'primary key of ReviewReviewRunInputSizes';

COMMENT ON CONSTRAINT "__review_root_pk_btvrw2kxvs" ON "slice_den"."review_root" IS 'primary key of ReviewRoot';

COMMENT ON CONSTRAINT "__review_save_input_pk_iaqr5cg2c2" ON "slice_den"."review_save_input" IS 'primary key of ReviewSaveInput';

COMMENT ON CONSTRAINT "__review_save_output_pk_usbddkytv7" ON "slice_den"."review_save_output" IS 'primary key of ReviewSaveOutput';

COMMENT ON CONSTRAINT "__review_saved_pk_mrkz2ovxcx" ON "slice_den"."review_saved" IS 'primary key of ReviewSaved';

COMMENT ON CONSTRAINT "__review_saved_key_to_root_ah3zbczbbn" ON "slice_den"."review_saved" IS 'key ReviewSaved(to, root)';

COMMENT ON CONSTRAINT "__review_scope_pk_grsivyyp7b" ON "slice_den"."review_scope" IS 'primary key of ReviewScope';

COMMENT ON CONSTRAINT "__review_served_pk_bkbrtbk3k7" ON "slice_den"."review_served" IS 'primary key of ReviewServed';

COMMENT ON CONSTRAINT "__review_skipped_pk_ymsn25w74u" ON "slice_den"."review_skipped" IS 'primary key of ReviewSkipped';

COMMENT ON CONSTRAINT "__review_split_pk_im65kbvnho" ON "slice_den"."review_split" IS 'primary key of ReviewSplit';

COMMENT ON CONSTRAINT "__review_split_key_to_root_d3l6kwiq3j" ON "slice_den"."review_split" IS 'key ReviewSplit(to, root)';

COMMENT ON CONSTRAINT "__review_start_scope_pk_qlm2r5uhqp" ON "slice_den"."review_start_scope" IS 'primary key of ReviewStartScope';

COMMENT ON CONSTRAINT "__review_start_scope_key_child_root_vwlxhagth3" ON "slice_den"."review_start_scope" IS 'key ReviewStartScope(child, root)';

COMMENT ON CONSTRAINT "__review_start_step_pk_w5suwqqg4p" ON "slice_den"."review_start_step" IS 'primary key of ReviewStartStep';

COMMENT ON CONSTRAINT "__review_start_step_key_step_root_lnw5ylpuoc" ON "slice_den"."review_start_step" IS 'key ReviewStartStep(step, root)';

COMMENT ON CONSTRAINT "__review_step_pk_gfbmnzqbc3" ON "slice_den"."review_step" IS 'primary key of ReviewStep';

COMMENT ON CONSTRAINT "__review_within_pk_ohgogpkz4s" ON "slice_den"."review_within" IS 'primary key of ReviewWithin';

COMMENT ON CONSTRAINT "__sync_admitted_pk_ral53o3fpi" ON "slice_den"."sync_admitted" IS 'primary key of SyncAdmitted';

COMMENT ON CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" ON "slice_den"."sync_build_input" IS 'primary key of SyncBuildInput';

COMMENT ON CONSTRAINT "__sync_build_output_pk_rhnco3epch" ON "slice_den"."sync_build_output" IS 'primary key of SyncBuildOutput';

COMMENT ON CONSTRAINT "__sync_claim_pk_s2tqnziq4u" ON "slice_den"."sync_claim" IS 'primary key of SyncClaim';

COMMENT ON CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" ON "slice_den"."sync_copy_input" IS 'primary key of SyncCopyInput';

COMMENT ON CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" ON "slice_den"."sync_copy_output" IS 'primary key of SyncCopyOutput';

COMMENT ON CONSTRAINT "__sync_done_pk_nllomjb7og" ON "slice_den"."sync_done" IS 'primary key of SyncDone';

COMMENT ON CONSTRAINT "__sync_ended_pk_uxijjz7koz" ON "slice_den"."sync_ended" IS 'primary key of SyncEnded';

COMMENT ON CONSTRAINT "__sync_exclusive_pk_joiibnjuvf" ON "slice_den"."sync_exclusive" IS 'primary key of SyncExclusive';

COMMENT ON CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" ON "slice_den"."sync_exclusive_key" IS 'primary key of SyncExclusiveKey';

COMMENT ON CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" ON "slice_den"."sync_exhausted" IS 'primary key of SyncExhausted';

COMMENT ON CONSTRAINT "__sync_failed_pk_gqykngewxb" ON "slice_den"."sync_failed" IS 'primary key of SyncFailed';

COMMENT ON CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" ON "slice_den"."sync_fenced" IS 'primary key of SyncFenced';

COMMENT ON CONSTRAINT "__sync_finish_pk_hn7tmx25xc" ON "slice_den"."sync_finish" IS 'primary key of SyncFinish';

COMMENT ON CONSTRAINT "__sync_finish_key_step_root_kpt2idultt" ON "slice_den"."sync_finish" IS 'key SyncFinish(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_pk_3z5gemduto" ON "slice_den"."sync_gold_finish_output" IS 'primary key of SyncGoldFinishOutput';

COMMENT ON CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" ON "slice_den"."sync_gold_input" IS 'primary key of SyncGoldInput';

COMMENT ON CONSTRAINT "__sync_held_pk_wsme4moka4" ON "slice_den"."sync_held" IS 'primary key of SyncHeld';

COMMENT ON CONSTRAINT "__sync_paused_pk_tstk2okngj" ON "slice_den"."sync_paused" IS 'primary key of SyncPaused';

COMMENT ON CONSTRAINT "__sync_refusal_pk_mbmfornc5c" ON "slice_den"."sync_refusal" IS 'primary key of SyncRefusal';

COMMENT ON CONSTRAINT "__sync_released_pk_k7qaw2iram" ON "slice_den"."sync_released" IS 'primary key of SyncReleased';

COMMENT ON CONSTRAINT "__sync_result_pk_jmwy2p3mqf" ON "slice_den"."sync_result" IS 'primary key of SyncResult';

COMMENT ON CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" ON "slice_den"."sync_resumed" IS 'primary key of SyncResumed';

COMMENT ON CONSTRAINT "__sync_retry_pk_6q52red7iw" ON "slice_den"."sync_retry" IS 'primary key of SyncRetry';

COMMENT ON CONSTRAINT "__sync_root_pk_daktpubfe2" ON "slice_den"."sync_root" IS 'primary key of SyncRoot';

COMMENT ON CONSTRAINT "__sync_scope_pk_bg72sm6p4z" ON "slice_den"."sync_scope" IS 'primary key of SyncScope';

COMMENT ON CONSTRAINT "__sync_served_pk_ed5gkrpyzv" ON "slice_den"."sync_served" IS 'primary key of SyncServed';

COMMENT ON CONSTRAINT "__sync_skipped_pk_yutjqacvws" ON "slice_den"."sync_skipped" IS 'primary key of SyncSkipped';

COMMENT ON CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" ON "slice_den"."sync_start_step" IS 'primary key of SyncStartStep';

COMMENT ON CONSTRAINT "__sync_start_step_key_step_root_rkceslwobo" ON "slice_den"."sync_start_step" IS 'key SyncStartStep(step, root)';

COMMENT ON CONSTRAINT "__sync_step_pk_wfgcxdvbwo" ON "slice_den"."sync_step" IS 'primary key of SyncStep';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_pk_n74f63qvg6" ON "slice_den"."sync_sync_run_finish_output" IS 'primary key of SyncSyncRunFinishOutput';

COMMENT ON CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" ON "slice_den"."sync_sync_run_input" IS 'primary key of SyncSyncRunInput';

COMMENT ON CONSTRAINT "__writeback_admitted_pk_eplj3gsbzy" ON "slice_den"."writeback_admitted" IS 'primary key of WritebackAdmitted';

COMMENT ON CONSTRAINT "__writeback_claim_pk_j7bglnjq7b" ON "slice_den"."writeback_claim" IS 'primary key of WritebackClaim';

COMMENT ON CONSTRAINT "__writeback_deliver_input_pk_i7vk7dq3eb" ON "slice_den"."writeback_deliver_input" IS 'primary key of WritebackDeliverInput';

COMMENT ON CONSTRAINT "__writeback_deliver_output_pk_jkhggp3cer" ON "slice_den"."writeback_deliver_output" IS 'primary key of WritebackDeliverOutput';

COMMENT ON CONSTRAINT "__writeback_done_pk_x32l3wxb3c" ON "slice_den"."writeback_done" IS 'primary key of WritebackDone';

COMMENT ON CONSTRAINT "__writeback_ended_pk_atnezxtfz6" ON "slice_den"."writeback_ended" IS 'primary key of WritebackEnded';

COMMENT ON CONSTRAINT "__writeback_exhausted_pk_sqddw6eedo" ON "slice_den"."writeback_exhausted" IS 'primary key of WritebackExhausted';

COMMENT ON CONSTRAINT "__writeback_failed_pk_g4uud6r5kb" ON "slice_den"."writeback_failed" IS 'primary key of WritebackFailed';

COMMENT ON CONSTRAINT "__writeback_fenced_pk_exblcoemag" ON "slice_den"."writeback_fenced" IS 'primary key of WritebackFenced';

COMMENT ON CONSTRAINT "__writeback_finish_pk_htcvidwpy6" ON "slice_den"."writeback_finish" IS 'primary key of WritebackFinish';

COMMENT ON CONSTRAINT "__writeback_finish_key_step_root_cz7xuvvbbm" ON "slice_den"."writeback_finish" IS 'key WritebackFinish(step, root)';

COMMENT ON CONSTRAINT "__writeback_held_pk_5tktjcet5w" ON "slice_den"."writeback_held" IS 'primary key of WritebackHeld';

COMMENT ON CONSTRAINT "__writeback_paused_pk_ncs2aff76t" ON "slice_den"."writeback_paused" IS 'primary key of WritebackPaused';

COMMENT ON CONSTRAINT "__writeback_refusal_pk_lqictdn67w" ON "slice_den"."writeback_refusal" IS 'primary key of WritebackRefusal';

COMMENT ON CONSTRAINT "__writeback_result_pk_lygppaax77" ON "slice_den"."writeback_result" IS 'primary key of WritebackResult';

COMMENT ON CONSTRAINT "__writeback_resumed_pk_qrrua45xou" ON "slice_den"."writeback_resumed" IS 'primary key of WritebackResumed';

COMMENT ON CONSTRAINT "__writeback_retry_pk_j2ien3obty" ON "slice_den"."writeback_retry" IS 'primary key of WritebackRetry';

COMMENT ON CONSTRAINT "__writeback_root_pk_a5puwyrem6" ON "slice_den"."writeback_root" IS 'primary key of WritebackRoot';

COMMENT ON CONSTRAINT "__writeback_scope_pk_aywjorzcsy" ON "slice_den"."writeback_scope" IS 'primary key of WritebackScope';

COMMENT ON CONSTRAINT "__writeback_served_pk_pw2fwekjjm" ON "slice_den"."writeback_served" IS 'primary key of WritebackServed';

COMMENT ON CONSTRAINT "__writeback_skipped_pk_3pijvusl26" ON "slice_den"."writeback_skipped" IS 'primary key of WritebackSkipped';

COMMENT ON CONSTRAINT "__writeback_start_step_pk_sp7hkcjz7m" ON "slice_den"."writeback_start_step" IS 'primary key of WritebackStartStep';

COMMENT ON CONSTRAINT "__writeback_start_step_key_step_root_dqjb67a3dj" ON "slice_den"."writeback_start_step" IS 'key WritebackStartStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_step_pk_xsrl5j4mlf" ON "slice_den"."writeback_step" IS 'primary key of WritebackStep';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_pk_payvcqalt7" ON "slice_den"."writeback_writeback_finish_output" IS 'primary key of WritebackWritebackFinishOutput';

COMMENT ON CONSTRAINT "__writeback_writeback_input_pk_ejs235aju2" ON "slice_den"."writeback_writeback_input" IS 'primary key of WritebackWritebackInput';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_exclude"."__scope_u6ypqf2r2z" IS 'scope where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_near"."__scope_u6ypqf2r2z" IS 'scope where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_near"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."assign_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."assign_decide_input_exclude"."__step_mjpuijzth4" IS 'step where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_decide_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_decide_output_weighed"."__step_mjpuijzth4" IS 'step where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_decide_output_weighed"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_exclude"."__step_mjpuijzth4" IS 'step where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_near"."__step_mjpuijzth4" IS 'step where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_near"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."assign_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON COLUMN "slice_den"."chain_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."chain_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_items"."__copy_items_jii5wy7azg" IS 'the owner''s count of the family ChainPageReadTreeRow.items';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_items"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_row"."__pred_items_3qltx5cx27" IS 'pred(items)';

COMMENT ON COLUMN "slice_den"."chain_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."chain_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON COLUMN "slice_den"."clock_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."clock_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."clock_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."clock_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON COLUMN "slice_den"."fan_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."fan_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."fan_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice_den"."fan_hold"."__copy_holds_c6hi2i2kfb" IS 'the owner''s count of the family FanClaim.holds';

COMMENT ON COLUMN "slice_den"."fan_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."fan_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."fan_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON COLUMN "slice_den"."retry_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."retry_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."retry_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."retry_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON COLUMN "slice_den"."review_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."review_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."review_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice_den"."review_gather_input_sizes"."__step_mjpuijzth4" IS 'step where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."review_gather_input_sizes"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."review_hold"."__copy_holds_j7qe5qdydj" IS 'the owner''s count of the family ReviewClaim.holds';

COMMENT ON COLUMN "slice_den"."review_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."review_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."review_review_run_input_sizes"."__scope_u6ypqf2r2z" IS 'scope where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."review_review_run_input_sizes"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."review_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON COLUMN "slice_den"."sync_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."sync_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."sync_exclusive"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."sync_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."sync_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON COLUMN "slice_den"."writeback_claim"."__step_ouvkclqzzd" IS 'step where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."writeback_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."writeback_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."writeback_root"."__scope_jdl7uajdrr" IS 'scope where Logic.eq(retired, false)';

COMMENT ON CONSTRAINT "__assign_root_key_scope_77r36z7vhn" ON "slice_den"."assign_root" IS 'key AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_key_digest_pred_at_ipnjzk4wne" ON "slice_den"."chain_page_read_tree_items" IS 'key ChainPageReadTreeItems(digest, pred(at))';

COMMENT ON CONSTRAINT "__chain_root_key_scope_prbadyie6j" ON "slice_den"."chain_root" IS 'key ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_root_key_scope_cpqrcv6qzu" ON "slice_den"."clock_root" IS 'key ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_hold_key_step_root_attempt_pred_at_kgbxki2ddu" ON "slice_den"."fan_hold" IS 'key FanHold(step, root, attempt, pred(at))';

COMMENT ON CONSTRAINT "__fan_root_key_scope_i3qel4nyj5" ON "slice_den"."fan_root" IS 'key FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_root_key_scope_yc7em5k35u" ON "slice_den"."retry_root" IS 'key RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_hold_key_step_root_attempt_pred_at_kuzm5unl2b" ON "slice_den"."review_hold" IS 'key ReviewHold(step, root, attempt, pred(at))';

COMMENT ON CONSTRAINT "__review_root_key_scope_db6eo7ifjm" ON "slice_den"."review_root" IS 'key ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_root_key_scope_lxj4sb3mcx" ON "slice_den"."sync_root" IS 'key SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_root_key_scope_epb6awnxkj" ON "slice_den"."writeback_root" IS 'key WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_check_chain_page_read_yoect27eee" ON "slice_den"."chain_page_read_tree_items" IS 'check of ChainPageReadTreeItems for law ordered ChainPageReadTreeItems(digest, at) in fin(ChainPageReadTreeRow, items)';

COMMENT ON CONSTRAINT "__fan_hold_check_fan_hold_ordered_fan_claim_holds_bb3ww7vxet" ON "slice_den"."fan_hold" IS 'check of FanHold for law ordered FanHold(step, root, attempt, at) in fin(FanClaim, holds)';

COMMENT ON CONSTRAINT "__review_hold_check_review_hold_ordered_review_claim_2wbcergshn" ON "slice_den"."review_hold" IS 'check of ReviewHold for law ordered ReviewHold(step, root, attempt, at) in fin(ReviewClaim, holds)';

COMMENT ON CONSTRAINT "__assign_admitted_fk_root_a4ab52rbpf" ON "slice_den"."assign_admitted" IS 'foreign key AssignAdmitted(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_admitted_fk_scope_root_axpol5zgcd" ON "slice_den"."assign_admitted" IS 'foreign key AssignAdmitted(scope, root) to AssignScope(scope, root)';

COMMENT ON CONSTRAINT "__assign_asked_fk_from_root_jbwoju3nkb" ON "slice_den"."assign_asked" IS 'foreign key AssignAsked(from, root) to AssignEmbedOutput(step, root)';

COMMENT ON CONSTRAINT "__assign_asked_fk_root_zheeongpsu" ON "slice_den"."assign_asked" IS 'foreign key AssignAsked(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_asked_fk_to_root_kg4yqbs5ps" ON "slice_den"."assign_asked" IS 'foreign key AssignAsked(to, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_fk_root_cxywb372kl" ON "slice_den"."assign_assignment_finish_output" IS 'foreign key AssignAssignmentFinishOutput(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_fk_step_root_btb6cwfo73" ON "slice_den"."assign_assignment_finish_output" IS 'foreign key AssignAssignmentFinishOutput(step, root) to AssignDone(step, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_root_7vcxtkof42" ON "slice_den"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_root_kuvjl3s6t5" ON "slice_den"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_root_z5moccsgvx" ON "slice_den"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope, root) to AssignAssignmentInput(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_yyclsqsijg" ON "slice_den"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope where Logic.ge(ordinal, 1n), pred(ordinal), root) to AssignAssignmentInputExclude(scope, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_t23ef5vjhv" ON "slice_den"."assign_assignment_input_mode_nearest" IS 'foreign key AssignAssignmentInputModeNearest(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_fk_root_jimtsl3pcm" ON "slice_den"."assign_assignment_input_mode_within" IS 'foreign key AssignAssignmentInputModeWithin(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_root_6cdqioe6mu" ON "slice_den"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_scope_root_lyuzgkqxtu" ON "slice_den"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(scope, root) to AssignAssignmentInput(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_scope_pred_ordinal_m5mnmsqnzk" ON "slice_den"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(scope where Logic.ge(ordinal, 1n), pred(ordinal), root) to AssignAssignmentInputNear(scope, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_claim_fk_root_tccogfd3gj" ON "slice_den"."assign_claim" IS 'foreign key AssignClaim(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_root_i4wvemd6lc" ON "slice_den"."assign_claim" IS 'foreign key AssignClaim(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_pred_attempt_root_qq7m4vgq5c" ON "slice_den"."assign_claim" IS 'foreign key AssignClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to AssignEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_root_2ru7zbrfcg" ON "slice_den"."assign_decide_input" IS 'foreign key AssignDecideInput(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_root_ms4jvh65c5" ON "slice_den"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_root_in6yyrl43w" ON "slice_den"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_ud7okz5qbt" ON "slice_den"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step where Logic.ge(ordinal, 1n), pred(ordinal), root) to AssignDecideInputExclude(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_vgxth6ulqd" ON "slice_den"."assign_decide_input_mode_nearest" IS 'foreign key AssignDecideInputModeNearest(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fk_root_5fhvbm7o2j" ON "slice_den"."assign_decide_input_mode_within" IS 'foreign key AssignDecideInputModeWithin(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_root_keez6pmczm" ON "slice_den"."assign_decide_output" IS 'foreign key AssignDecideOutput(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_oxey3s55bw" ON "slice_den"."assign_decide_output" IS 'foreign key AssignDecideOutput(step, root) to AssignDecideInput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_root_b4qrx4ukam" ON "slice_den"."assign_decide_output" IS 'foreign key AssignDecideOutput(step, root) to AssignDone(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_fk_root_emwjzdjgvs" ON "slice_den"."assign_decide_output_stage_rest" IS 'foreign key AssignDecideOutputStageRest(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_fk_root_nv2zgv5hrt" ON "slice_den"."assign_decide_output_stage_serve" IS 'foreign key AssignDecideOutputStageServe(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_root_tymno4wjr4" ON "slice_den"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_root_nkudthcgg2" ON "slice_den"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step, root) to AssignDecideOutput(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_6nj2mzauma" ON "slice_den"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step where Logic.ge(ordinal, 1n), pred(ordinal), root) to AssignDecideOutputWeighed(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_fk_digest_bpdnxpzp5m" ON "slice_den"."assign_decide_read_nearest" IS 'foreign key AssignDecideReadNearest(digest) to AssignDecideReadNearestRow(digest)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_fk_root_ycz25zxkwm" ON "slice_den"."assign_decide_read_nearest" IS 'foreign key AssignDecideReadNearest(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_fk_step_root_6zy7kdf72j" ON "slice_den"."assign_decide_read_nearest" IS 'foreign key AssignDecideReadNearest(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_fk_digest_zjwk3f7pfz" ON "slice_den"."assign_decide_read_seen" IS 'foreign key AssignDecideReadSeen(digest) to AssignDecideReadSeenRow(digest)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_fk_root_mmjkzkootc" ON "slice_den"."assign_decide_read_seen" IS 'foreign key AssignDecideReadSeen(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_fk_step_root_digi5lcvpw" ON "slice_den"."assign_decide_read_seen" IS 'foreign key AssignDecideReadSeen(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_done_fk_root_bm6oxygwbu" ON "slice_den"."assign_done" IS 'foreign key AssignDone(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_embed_input_fk_root_cwfcfjex6q" ON "slice_den"."assign_embed_input" IS 'foreign key AssignEmbedInput(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_root_ukjqxbt7ap" ON "slice_den"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_step_root_wl7z42ozbz" ON "slice_den"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(step, root) to AssignEmbedInput(step, root)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_step_pred_ordinal_uyhiasutyq" ON "slice_den"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(step where Logic.ge(ordinal, 1n), pred(ordinal), root) to AssignEmbedInputExclude(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_nearest_fk_root_4znytbmmeu" ON "slice_den"."assign_embed_input_mode_nearest" IS 'foreign key AssignEmbedInputModeNearest(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_within_fk_root_sntsbzyy4j" ON "slice_den"."assign_embed_input_mode_within" IS 'foreign key AssignEmbedInputModeWithin(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_root_tre2sdwjfz" ON "slice_den"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_step_root_rjswhmogx2" ON "slice_den"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(step, root) to AssignEmbedInput(step, root)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_step_pred_ordinal_root_4z756q6ieo" ON "slice_den"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(step where Logic.ge(ordinal, 1n), pred(ordinal), root) to AssignEmbedInputNear(step, ordinal, root)';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_root_2s3kxqf4fq" ON "slice_den"."assign_embed_output" IS 'foreign key AssignEmbedOutput(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_step_root_amg3l6sdib" ON "slice_den"."assign_embed_output" IS 'foreign key AssignEmbedOutput(step, root) to AssignDone(step, root)';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_step_root_yoz2l6kzsz" ON "slice_den"."assign_embed_output" IS 'foreign key AssignEmbedOutput(step, root) to AssignEmbedInput(step, root)';

COMMENT ON CONSTRAINT "__assign_ended_fk_root_snn64so4y5" ON "slice_den"."assign_ended" IS 'foreign key AssignEnded(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_ended_fk_step_attempt_root_6glu7zitw6" ON "slice_den"."assign_ended" IS 'foreign key AssignEnded(step, attempt, root) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_root_vljhubi73b" ON "slice_den"."assign_exhausted" IS 'foreign key AssignExhausted(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_step_root_juabgscovy" ON "slice_den"."assign_exhausted" IS 'foreign key AssignExhausted(step, root) to AssignFailed(step, root)';

COMMENT ON CONSTRAINT "__assign_failed_fk_root_oyplqvhznf" ON "slice_den"."assign_failed" IS 'foreign key AssignFailed(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_fenced_fk_root_53vovdvcd2" ON "slice_den"."assign_fenced" IS 'foreign key AssignFenced(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_fenced_fk_step_attempt_root_ibfrwtujam" ON "slice_den"."assign_fenced" IS 'foreign key AssignFenced(step, attempt, root) to AssignEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_6bbfqqziln" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_finish_fk_scope_root_fasrssafod" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_finish_fk_step_root_uqhlnaqgqc" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_ugjqx6ie3f" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_held_fk_step_attempt_root_5ffh4ch5vo" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(step, attempt, root) to AssignClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_held_fk_step_root_yvbigkwvhi" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(step, root) to AssignResult(step, root)';

COMMENT ON CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" ON "slice_den"."assign_paused" IS 'foreign key AssignPaused(target, pred(turn)) to AssignResumed(target, turn)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_root_ikkkxnypbg" ON "slice_den"."assign_refusal" IS 'foreign key AssignRefusal(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_refusal_fk_step_root_4pwostl6w4" ON "slice_den"."assign_refusal" IS 'foreign key AssignRefusal(step, root) to AssignFailed(step, root)';

COMMENT ON CONSTRAINT "__assign_result_fk_root_mbig2yym5s" ON "slice_den"."assign_result" IS 'foreign key AssignResult(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_result_fk_step_root_ie57r22uco" ON "slice_den"."assign_result" IS 'foreign key AssignResult(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" ON "slice_den"."assign_resumed" IS 'foreign key AssignResumed(target, turn) to AssignPaused(target, turn)';

COMMENT ON CONSTRAINT "__assign_retry_fk_root_g7cxz6uouh" ON "slice_den"."assign_retry" IS 'foreign key AssignRetry(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_retry_fk_step_attempt_root_gsye2j667t" ON "slice_den"."assign_retry" IS 'foreign key AssignRetry(step, attempt, root) to AssignEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__assign_scope_fk_root_aqbd5fs63t" ON "slice_den"."assign_scope" IS 'foreign key AssignScope(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_skipped_fk_by_yi4ixsfumz" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(by) to AssignRoot(scope)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_root_uyud3yb6zy" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_skipped_fk_scope_6ks53lak4r" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(scope) to AssignRoot(scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_me4zj64243" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_start_step_fk_scope_root_grairzt42v" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_step_root_2bw3dd6v6d" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(step, root) to AssignStep(step, root)';

COMMENT ON CONSTRAINT "__assign_step_fk_root_qky3m5h2ys" ON "slice_den"."assign_step" IS 'foreign key AssignStep(root) to AssignRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__assign_step_fk_scope_root_rr5jplc2ua" ON "slice_den"."assign_step" IS 'foreign key AssignStep(scope, root) to AssignAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" ON "slice_den"."audit" IS 'foreign key Audit(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_admitted_fk_root_abvywhprzd" ON "slice_den"."chain_admitted" IS 'foreign key ChainAdmitted(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_admitted_fk_scope_root_ee5yuzxero" ON "slice_den"."chain_admitted" IS 'foreign key ChainAdmitted(scope, root) to ChainScope(scope, root)';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_fk_root_4rmekbji4d" ON "slice_den"."chain_chain_run_finish_output" IS 'foreign key ChainChainRunFinishOutput(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_fk_step_root_xr4ypwejog" ON "slice_den"."chain_chain_run_finish_output" IS 'foreign key ChainChainRunFinishOutput(step, root) to ChainDone(step, root)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_root_eyhkir2ten" ON "slice_den"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_claim_fk_root_e4z56epu62" ON "slice_den"."chain_claim" IS 'foreign key ChainClaim(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_root_dz35k5kajb" ON "slice_den"."chain_claim" IS 'foreign key ChainClaim(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_pred_attempt_root_mekmccmxkt" ON "slice_den"."chain_claim" IS 'foreign key ChainClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to ChainEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_done_fk_root_p5unbx53ay" ON "slice_den"."chain_done" IS 'foreign key ChainDone(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_ended_fk_root_mzyjkgh7kn" ON "slice_den"."chain_ended" IS 'foreign key ChainEnded(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_ended_fk_step_attempt_root_hqs5hboik5" ON "slice_den"."chain_ended" IS 'foreign key ChainEnded(step, attempt, root) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_root_az7it7tady" ON "slice_den"."chain_exhausted" IS 'foreign key ChainExhausted(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_step_root_x7otp3oe7t" ON "slice_den"."chain_exhausted" IS 'foreign key ChainExhausted(step, root) to ChainFailed(step, root)';

COMMENT ON CONSTRAINT "__chain_failed_fk_root_ku7hd36hr4" ON "slice_den"."chain_failed" IS 'foreign key ChainFailed(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_fenced_fk_root_dpd2zsy45p" ON "slice_den"."chain_fenced" IS 'foreign key ChainFenced(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_fenced_fk_step_attempt_root_wtvf2kpo3y" ON "slice_den"."chain_fenced" IS 'foreign key ChainFenced(step, attempt, root) to ChainEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_b4s3b6gb4a" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_finish_fk_scope_root_bm7lzlvp35" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_finish_fk_step_root_7gwsgngr6z" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_7gjoucbs6t" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_held_fk_step_attempt_root_aqmobtk3xc" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(step, attempt, root) to ChainClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_held_fk_step_root_mrcpyhmlko" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_next_fk_from_root_fp74n4ao6b" ON "slice_den"."chain_next" IS 'foreign key ChainNext(from, root) to ChainPageOutput(step, root)';

COMMENT ON CONSTRAINT "__chain_next_fk_root_ymhq5qkp7g" ON "slice_den"."chain_next" IS 'foreign key ChainNext(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_next_fk_to_root_juwf5tsgbs" ON "slice_den"."chain_next" IS 'foreign key ChainNext(to, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_fk_root_dbbcetmlpl" ON "slice_den"."chain_ordered_finish_output" IS 'foreign key ChainOrderedFinishOutput(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_fk_step_root_jvdqnoziiv" ON "slice_den"."chain_ordered_finish_output" IS 'foreign key ChainOrderedFinishOutput(step, root) to ChainDone(step, root)';

COMMENT ON CONSTRAINT "__chain_ordered_input_fk_root_yo2fvi6v6v" ON "slice_den"."chain_ordered_input" IS 'foreign key ChainOrderedInput(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_input_fk_root_s74r6jkeai" ON "slice_den"."chain_page_input" IS 'foreign key ChainPageInput(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_root_uksq5ttkd4" ON "slice_den"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_step_root_pqhheaahab" ON "slice_den"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(step, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_root_ez5wgbipj5" ON "slice_den"."chain_page_output" IS 'foreign key ChainPageOutput(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_root_nesuhzkml5" ON "slice_den"."chain_page_output" IS 'foreign key ChainPageOutput(step, root) to ChainDone(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_root_gyxfrq7ubp" ON "slice_den"."chain_page_output" IS 'foreign key ChainPageOutput(step, root) to ChainPageInput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_root_x6esxudkux" ON "slice_den"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_step_root_srapg45mao" ON "slice_den"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(step, root) to ChainPageOutput(step, root)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_fk_digest_draxd5jrld" ON "slice_den"."chain_page_read_earlier" IS 'foreign key ChainPageReadEarlier(digest) to ChainPageReadEarlierRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_fk_root_skex2y53oj" ON "slice_den"."chain_page_read_earlier" IS 'foreign key ChainPageReadEarlier(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_fk_step_root_heb6lu6om7" ON "slice_den"."chain_page_read_earlier" IS 'foreign key ChainPageReadEarlier(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_fk_digest_cz6fzlmtk4" ON "slice_den"."chain_page_read_tree" IS 'foreign key ChainPageReadTree(digest) to ChainPageReadTreeRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_fk_root_rjrvetlv52" ON "slice_den"."chain_page_read_tree" IS 'foreign key ChainPageReadTree(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_read_tree_fk_step_root_ryeeje5uel" ON "slice_den"."chain_page_read_tree" IS 'foreign key ChainPageReadTree(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_fk_digest_copy_items_sicbcwc4zb" ON "slice_den"."chain_page_read_tree_items" IS 'foreign key ChainPageReadTreeItems(digest, the owner''s count of the family ChainPageReadTreeRow.items) to ChainPageReadTreeRow(digest, items)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_fk_digest_pred_at_r7gpc2igze" ON "slice_den"."chain_page_read_tree_items" IS 'foreign key ChainPageReadTreeItems(digest, pred(at)) to ChainPageReadTreeItems(digest, at)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_row_fk_digest_pred_items_7rh66dc67t" ON "slice_den"."chain_page_read_tree_row" IS 'foreign key ChainPageReadTreeRow(digest, pred(items)) to ChainPageReadTreeItems(digest, at)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_fk_digest_73zfvhpwus" ON "slice_den"."chain_page_read_weights" IS 'foreign key ChainPageReadWeights(digest) to ChainPageReadWeightsRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_fk_root_iuoy4px74k" ON "slice_den"."chain_page_read_weights" IS 'foreign key ChainPageReadWeights(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_page_read_weights_fk_step_root_kdopovc7p6" ON "slice_den"."chain_page_read_weights" IS 'foreign key ChainPageReadWeights(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_page_tree_first_fk_digest_at_thwgbmxhwl" ON "slice_den"."chain_page_tree_first" IS 'foreign key ChainPageTreeFirst(digest, at) to ChainPageReadTreeItems(digest, at)';

COMMENT ON CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" ON "slice_den"."chain_paused" IS 'foreign key ChainPaused(target, pred(turn)) to ChainResumed(target, turn)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_root_np3fiq6hlf" ON "slice_den"."chain_refusal" IS 'foreign key ChainRefusal(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_refusal_fk_step_root_2xohwjf6ov" ON "slice_den"."chain_refusal" IS 'foreign key ChainRefusal(step, root) to ChainFailed(step, root)';

COMMENT ON CONSTRAINT "__chain_result_fk_root_cqy7fgz6gd" ON "slice_den"."chain_result" IS 'foreign key ChainResult(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_result_fk_step_root_rytllwqxot" ON "slice_den"."chain_result" IS 'foreign key ChainResult(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" ON "slice_den"."chain_resumed" IS 'foreign key ChainResumed(target, turn) to ChainPaused(target, turn)';

COMMENT ON CONSTRAINT "__chain_retry_fk_root_mrtnq2ndso" ON "slice_den"."chain_retry" IS 'foreign key ChainRetry(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_retry_fk_step_attempt_root_mwa5szmjq5" ON "slice_den"."chain_retry" IS 'foreign key ChainRetry(step, attempt, root) to ChainEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__chain_scope_fk_root_5dnilqnmua" ON "slice_den"."chain_scope" IS 'foreign key ChainScope(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_skipped_fk_by_zwz72yquyv" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(by) to ChainRoot(scope)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_root_yi73nwhhy4" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_skipped_fk_scope_ozicxyda6o" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(scope) to ChainRoot(scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_gh44bcwmwg" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_start_step_fk_scope_root_eab47owgce" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_step_root_llhvckjbu2" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(step, root) to ChainStep(step, root)';

COMMENT ON CONSTRAINT "__chain_step_fk_root_n4wedmpzhn" ON "slice_den"."chain_step" IS 'foreign key ChainStep(root) to ChainRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__chain_step_fk_scope_root_jmx7nw7i4f" ON "slice_den"."chain_step" IS 'foreign key ChainStep(scope, root) to ChainAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__clock_admitted_fk_root_7dydra2fa6" ON "slice_den"."clock_admitted" IS 'foreign key ClockAdmitted(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_admitted_fk_scope_root_iq667y6auq" ON "slice_den"."clock_admitted" IS 'foreign key ClockAdmitted(scope, root) to ClockScope(scope, root)';

COMMENT ON CONSTRAINT "__clock_chime_input_fk_root_plvhx4qyi5" ON "slice_den"."clock_chime_input" IS 'foreign key ClockChimeInput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_root_75doh4g3jb" ON "slice_den"."clock_chime_output" IS 'foreign key ClockChimeOutput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_step_root_x3amhltgq6" ON "slice_den"."clock_chime_output" IS 'foreign key ClockChimeOutput(step, root) to ClockChimeInput(step, root)';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_step_root_3wm3i6ov6f" ON "slice_den"."clock_chime_output" IS 'foreign key ClockChimeOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_claim_fk_root_hmpra5qlcp" ON "slice_den"."clock_claim" IS 'foreign key ClockClaim(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_claim_fk_step_root_vptogyiqam" ON "slice_den"."clock_claim" IS 'foreign key ClockClaim(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_claim_fk_step_pred_attempt_root_qvfbouzl5p" ON "slice_den"."clock_claim" IS 'foreign key ClockClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to ClockEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_close_input_fk_root_txagvl3rnl" ON "slice_den"."clock_close_input" IS 'foreign key ClockCloseInput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_close_output_fk_root_5jk2orzbti" ON "slice_den"."clock_close_output" IS 'foreign key ClockCloseOutput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_close_output_fk_step_root_fooxwxkcx3" ON "slice_den"."clock_close_output" IS 'foreign key ClockCloseOutput(step, root) to ClockCloseInput(step, root)';

COMMENT ON CONSTRAINT "__clock_close_output_fk_step_root_accrzxyiql" ON "slice_den"."clock_close_output" IS 'foreign key ClockCloseOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_done_fk_root_soqskjsjao" ON "slice_den"."clock_done" IS 'foreign key ClockDone(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_ended_fk_root_g3cnl7xafr" ON "slice_den"."clock_ended" IS 'foreign key ClockEnded(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_ended_fk_step_attempt_root_dimjqmfaqh" ON "slice_den"."clock_ended" IS 'foreign key ClockEnded(step, attempt, root) to ClockClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_root_xskm7prc74" ON "slice_den"."clock_exhausted" IS 'foreign key ClockExhausted(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_step_root_ydvibsvd3a" ON "slice_den"."clock_exhausted" IS 'foreign key ClockExhausted(step, root) to ClockFailed(step, root)';

COMMENT ON CONSTRAINT "__clock_failed_fk_root_tkhs7qqr4z" ON "slice_den"."clock_failed" IS 'foreign key ClockFailed(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_fenced_fk_root_t4ntcqjpyp" ON "slice_den"."clock_fenced" IS 'foreign key ClockFenced(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_fenced_fk_step_attempt_root_6wai42b7gk" ON "slice_den"."clock_fenced" IS 'foreign key ClockFenced(step, attempt, root) to ClockEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_pmnnbogxf6" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_finish_fk_scope_root_ncra3pc2vm" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(scope, root) to ClockAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__clock_finish_fk_step_root_kr2hfecrdl" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_u3vxrlyseh" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_held_fk_step_attempt_root_rggju54zr5" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(step, attempt, root) to ClockClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_held_fk_step_root_oboys6ct6s" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(step, root) to ClockResult(step, root)';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_fk_root_wn7gvu3f26" ON "slice_den"."clock_hourly_finish_output" IS 'foreign key ClockHourlyFinishOutput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_fk_step_root_xwntxefqc6" ON "slice_den"."clock_hourly_finish_output" IS 'foreign key ClockHourlyFinishOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_hourly_input_fk_root_ixovd5y6h4" ON "slice_den"."clock_hourly_input" IS 'foreign key ClockHourlyInput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_paused_fk_target_pred_turn_7tgjovpr6x" ON "slice_den"."clock_paused" IS 'foreign key ClockPaused(target, pred(turn)) to ClockResumed(target, turn)';

COMMENT ON CONSTRAINT "__clock_refusal_fk_root_ekomnyuzgo" ON "slice_den"."clock_refusal" IS 'foreign key ClockRefusal(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_refusal_fk_step_root_cwz55xrfvz" ON "slice_den"."clock_refusal" IS 'foreign key ClockRefusal(step, root) to ClockFailed(step, root)';

COMMENT ON CONSTRAINT "__clock_result_fk_root_mlw7uyvsd5" ON "slice_den"."clock_result" IS 'foreign key ClockResult(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_result_fk_step_root_ywzn6yx56v" ON "slice_den"."clock_result" IS 'foreign key ClockResult(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_resumed_fk_target_turn_45dwn4cwo5" ON "slice_den"."clock_resumed" IS 'foreign key ClockResumed(target, turn) to ClockPaused(target, turn)';

COMMENT ON CONSTRAINT "__clock_retry_fk_root_zrptzgm66d" ON "slice_den"."clock_retry" IS 'foreign key ClockRetry(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_retry_fk_step_attempt_root_rbqzkwnwmy" ON "slice_den"."clock_retry" IS 'foreign key ClockRetry(step, attempt, root) to ClockEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__clock_scope_fk_root_2os4agb6vo" ON "slice_den"."clock_scope" IS 'foreign key ClockScope(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_fk_root_5s5nbif4nr" ON "slice_den"."clock_sitting_finish_output" IS 'foreign key ClockSittingFinishOutput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_fk_step_root_mkypttatse" ON "slice_den"."clock_sitting_finish_output" IS 'foreign key ClockSittingFinishOutput(step, root) to ClockDone(step, root)';

COMMENT ON CONSTRAINT "__clock_sitting_input_fk_root_pedoscj3vp" ON "slice_den"."clock_sitting_input" IS 'foreign key ClockSittingInput(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_skipped_fk_by_joxrltqt4a" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(by) to ClockRoot(scope)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_root_w4ixxvhwt2" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_skipped_fk_scope_e5ndey7rqw" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(scope) to ClockRoot(scope)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_s7u7hg3lzj" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_start_step_fk_scope_root_oqopxtg4cc" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(scope, root) to ClockAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_step_root_7tv5nylxvh" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(step, root) to ClockStep(step, root)';

COMMENT ON CONSTRAINT "__clock_step_fk_root_pi7kop6duk" ON "slice_den"."clock_step" IS 'foreign key ClockStep(root) to ClockRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__clock_step_fk_scope_root_ivit5j6zqd" ON "slice_den"."clock_step" IS 'foreign key ClockStep(scope, root) to ClockAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_admitted_fk_root_ui6p5vdrhk" ON "slice_den"."fan_admitted" IS 'foreign key FanAdmitted(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_admitted_fk_scope_root_zj52ntgcx6" ON "slice_den"."fan_admitted" IS 'foreign key FanAdmitted(scope, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_fk_root_dpzlswayvb" ON "slice_den"."fan_batch_finish_output" IS 'foreign key FanBatchFinishOutput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_fk_step_root_hhniyvx63e" ON "slice_den"."fan_batch_finish_output" IS 'foreign key FanBatchFinishOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_batch_input_fk_root_d4g2u2spvl" ON "slice_den"."fan_batch_input" IS 'foreign key FanBatchInput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_t3hwth6mh7" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_root_6jsjsejmab" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_root_attempt_pred_holds_jqx7ma7cam" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(step, root, attempt, pred(holds)) to FanHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_pred_attempt_root_lvu6wwhaq3" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to FanEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_done_fk_root_cfizuozacw" ON "slice_den"."fan_done" IS 'foreign key FanDone(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_dust_input_fk_root_3733wzdt23" ON "slice_den"."fan_dust_input" IS 'foreign key FanDustInput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_root_6dquh32eog" ON "slice_den"."fan_dust_output" IS 'foreign key FanDustOutput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_step_root_qzoffoc32g" ON "slice_den"."fan_dust_output" IS 'foreign key FanDustOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_step_root_nxpsu4ielv" ON "slice_den"."fan_dust_output" IS 'foreign key FanDustOutput(step, root) to FanDustInput(step, root)';

COMMENT ON CONSTRAINT "__fan_ended_fk_root_uaaz527dex" ON "slice_den"."fan_ended" IS 'foreign key FanEnded(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_ended_fk_step_attempt_root_guai42fujd" ON "slice_den"."fan_ended" IS 'foreign key FanEnded(step, attempt, root) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_root_mlbxyrjdjk" ON "slice_den"."fan_exhausted" IS 'foreign key FanExhausted(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_step_root_jyggt4fgpd" ON "slice_den"."fan_exhausted" IS 'foreign key FanExhausted(step, root) to FanFailed(step, root)';

COMMENT ON CONSTRAINT "__fan_failed_fk_root_3gq7ifprza" ON "slice_den"."fan_failed" IS 'foreign key FanFailed(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_fk_root_ttt7pw4dnn" ON "slice_den"."fan_fan_run_finish_output" IS 'foreign key FanFanRunFinishOutput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_fk_step_root_yjy4xmcplw" ON "slice_den"."fan_fan_run_finish_output" IS 'foreign key FanFanRunFinishOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_root_oztqak3s27" ON "slice_den"."fan_fan_run_input" IS 'foreign key FanFanRunInput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_fenced_fk_root_2vu32qtss5" ON "slice_den"."fan_fenced" IS 'foreign key FanFenced(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_fenced_fk_step_attempt_root_resahyn2ym" ON "slice_den"."fan_fenced" IS 'foreign key FanFenced(step, attempt, root) to FanEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_evgrt3slao" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_finish_fk_scope_root_xpvycdjjiy" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_finish_fk_step_root_bpqxxtu4ab" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_cnpqjrp534" ON "slice_den"."fan_held" IS 'foreign key FanHeld(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_held_fk_step_attempt_root_c33imj7zo6" ON "slice_den"."fan_held" IS 'foreign key FanHeld(step, attempt, root) to FanClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_held_fk_step_root_ob2yj5i5h3" ON "slice_den"."fan_held" IS 'foreign key FanHeld(step, root) to FanResult(step, root)';

COMMENT ON CONSTRAINT "__fan_hold_fk_root_4at7ny23la" ON "slice_den"."fan_hold" IS 'foreign key FanHold(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_hold_fk_step_root_attempt_copy_holds_jzk5g7klso" ON "slice_den"."fan_hold" IS 'foreign key FanHold(step, root, attempt, the owner''s count of the family FanClaim.holds) to FanClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_hold_fk_step_root_attempt_pred_at_p4adu554h3" ON "slice_den"."fan_hold" IS 'foreign key FanHold(step, root, attempt, pred(at)) to FanHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__fan_mop_input_fk_root_iflswncgct" ON "slice_den"."fan_mop_input" IS 'foreign key FanMopInput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_root_2oyshrk7i2" ON "slice_den"."fan_mop_output" IS 'foreign key FanMopOutput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_step_root_dsgqll32vr" ON "slice_den"."fan_mop_output" IS 'foreign key FanMopOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_step_root_j2cwqnpbda" ON "slice_den"."fan_mop_output" IS 'foreign key FanMopOutput(step, root) to FanMopInput(step, root)';

COMMENT ON CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" ON "slice_den"."fan_paused" IS 'foreign key FanPaused(target, pred(turn)) to FanResumed(target, turn)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_root_zep5evjd2e" ON "slice_den"."fan_refusal" IS 'foreign key FanRefusal(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_refusal_fk_step_root_5qjei2ie7w" ON "slice_den"."fan_refusal" IS 'foreign key FanRefusal(step, root) to FanFailed(step, root)';

COMMENT ON CONSTRAINT "__fan_result_fk_root_m233bhejob" ON "slice_den"."fan_result" IS 'foreign key FanResult(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_result_fk_step_root_kkph4igmst" ON "slice_den"."fan_result" IS 'foreign key FanResult(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" ON "slice_den"."fan_resumed" IS 'foreign key FanResumed(target, turn) to FanPaused(target, turn)';

COMMENT ON CONSTRAINT "__fan_retry_fk_root_hoqgudhhyh" ON "slice_den"."fan_retry" IS 'foreign key FanRetry(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_retry_fk_step_attempt_root_jw7ijf5nre" ON "slice_den"."fan_retry" IS 'foreign key FanRetry(step, attempt, root) to FanEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__fan_scope_fk_root_3c5fvemkr6" ON "slice_den"."fan_scope" IS 'foreign key FanScope(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_skipped_fk_by_o76cwxye2w" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(by) to FanRoot(scope)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_root_j6gpqvvx57" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_skipped_fk_scope_eomkgfbxwj" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(scope) to FanRoot(scope)';

COMMENT ON CONSTRAINT "__fan_square_input_fk_root_gpj7rrapja" ON "slice_den"."fan_square_input" IS 'foreign key FanSquareInput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_square_output_fk_root_dpyr2dahw3" ON "slice_den"."fan_square_output" IS 'foreign key FanSquareOutput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_root_ibp6l2tkc5" ON "slice_den"."fan_square_output" IS 'foreign key FanSquareOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_root_kilcbg5jn4" ON "slice_den"."fan_square_output" IS 'foreign key FanSquareOutput(step, root) to FanSquareInput(step, root)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_child_root_dn65r3vwqt" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(child, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_24pfkxnibn" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_scope_root_clsa2be3m7" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_4rwp7q56wg" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_start_step_fk_scope_root_vh2ut5ssmk" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_step_root_din6bp4kp3" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(step, root) to FanStep(step, root)';

COMMENT ON CONSTRAINT "__fan_step_fk_root_eueisdyp32" ON "slice_den"."fan_step" IS 'foreign key FanStep(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_step_fk_scope_root_dyjpxhnjhz" ON "slice_den"."fan_step" IS 'foreign key FanStep(scope, root) to FanAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_fk_root_wuiuxdlyfz" ON "slice_den"."fan_sweep_finish_output" IS 'foreign key FanSweepFinishOutput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_fk_step_root_hvu6m73esm" ON "slice_den"."fan_sweep_finish_output" IS 'foreign key FanSweepFinishOutput(step, root) to FanDone(step, root)';

COMMENT ON CONSTRAINT "__fan_sweep_input_fk_root_uobuoei5yy" ON "slice_den"."fan_sweep_input" IS 'foreign key FanSweepInput(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_within_fk_parent_root_uep5w6udoh" ON "slice_den"."fan_within" IS 'foreign key FanWithin(parent, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__fan_within_fk_root_k7476egnhf" ON "slice_den"."fan_within" IS 'foreign key FanWithin(root) to FanRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__fan_within_fk_scope_root_ej3crstjip" ON "slice_den"."fan_within" IS 'foreign key FanWithin(scope, root) to FanScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_admitted_fk_root_n65ucxnw7g" ON "slice_den"."retry_admitted" IS 'foreign key RetryAdmitted(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_admitted_fk_scope_root_kufu5v4g3v" ON "slice_den"."retry_admitted" IS 'foreign key RetryAdmitted(scope, root) to RetryScope(scope, root)';

COMMENT ON CONSTRAINT "__retry_brittle_input_fk_root_3kdpo5sepg" ON "slice_den"."retry_brittle_input" IS 'foreign key RetryBrittleInput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_root_baznemh4df" ON "slice_den"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_root_o5pt3hukix" ON "slice_den"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step, root) to RetryBrittleInput(step, root)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_root_jnbgyogqxn" ON "slice_den"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_claim_fk_root_ilxn6ulsuq" ON "slice_den"."retry_claim" IS 'foreign key RetryClaim(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_root_zffmzj357l" ON "slice_den"."retry_claim" IS 'foreign key RetryClaim(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_pred_attempt_root_pnatu7db5m" ON "slice_den"."retry_claim" IS 'foreign key RetryClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to RetryEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_done_fk_root_eegigvha5p" ON "slice_den"."retry_done" IS 'foreign key RetryDone(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_ended_fk_root_h23o2xvf4e" ON "slice_den"."retry_ended" IS 'foreign key RetryEnded(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_ended_fk_step_attempt_root_25duapnk22" ON "slice_den"."retry_ended" IS 'foreign key RetryEnded(step, attempt, root) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_root_fetyfw4rhv" ON "slice_den"."retry_exhausted" IS 'foreign key RetryExhausted(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_step_root_pj2owyq2rw" ON "slice_den"."retry_exhausted" IS 'foreign key RetryExhausted(step, root) to RetryFailed(step, root)';

COMMENT ON CONSTRAINT "__retry_failed_fk_root_uy6ypbkhl7" ON "slice_den"."retry_failed" IS 'foreign key RetryFailed(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_fenced_fk_root_q2hes57bil" ON "slice_den"."retry_fenced" IS 'foreign key RetryFenced(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_fenced_fk_step_attempt_root_laqomvgkpu" ON "slice_den"."retry_fenced" IS 'foreign key RetryFenced(step, attempt, root) to RetryEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_iv6szs7lco" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_finish_fk_scope_root_odh4hpe5hc" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_finish_fk_step_root_o54jpsxlmy" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_3v46rzikqg" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_held_fk_step_attempt_root_cnveo6n2ex" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(step, attempt, root) to RetryClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_held_fk_step_root_m5b3t566ya" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(step, root) to RetryResult(step, root)';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_fk_root_gmq3iutwdv" ON "slice_den"."retry_ladders_finish_output" IS 'foreign key RetryLaddersFinishOutput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_fk_step_root_l5sosf3h23" ON "slice_den"."retry_ladders_finish_output" IS 'foreign key RetryLaddersFinishOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fk_root_cnlwmpha3w" ON "slice_den"."retry_ladders_input" IS 'foreign key RetryLaddersInput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_patient_input_fk_root_x4fak4nifc" ON "slice_den"."retry_patient_input" IS 'foreign key RetryPatientInput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_root_36wgu5rnaa" ON "slice_den"."retry_patient_output" IS 'foreign key RetryPatientOutput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_step_root_waswby3piq" ON "slice_den"."retry_patient_output" IS 'foreign key RetryPatientOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_step_root_buctg5fpry" ON "slice_den"."retry_patient_output" IS 'foreign key RetryPatientOutput(step, root) to RetryPatientInput(step, root)';

COMMENT ON CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" ON "slice_den"."retry_paused" IS 'foreign key RetryPaused(target, pred(turn)) to RetryResumed(target, turn)';

COMMENT ON CONSTRAINT "__retry_polite_input_fk_root_5mkc2d4wg5" ON "slice_den"."retry_polite_input" IS 'foreign key RetryPoliteInput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_root_hgdssuqq43" ON "slice_den"."retry_polite_output" IS 'foreign key RetryPoliteOutput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_step_root_n3pnixozej" ON "slice_den"."retry_polite_output" IS 'foreign key RetryPoliteOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_step_root_dzlpbomecj" ON "slice_den"."retry_polite_output" IS 'foreign key RetryPoliteOutput(step, root) to RetryPoliteInput(step, root)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_root_jr53wy3j5v" ON "slice_den"."retry_refusal" IS 'foreign key RetryRefusal(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_refusal_fk_step_root_sqt67v76ib" ON "slice_den"."retry_refusal" IS 'foreign key RetryRefusal(step, root) to RetryFailed(step, root)';

COMMENT ON CONSTRAINT "__retry_result_fk_root_zoskj252jz" ON "slice_den"."retry_result" IS 'foreign key RetryResult(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_result_fk_step_root_ulmjckkvmq" ON "slice_den"."retry_result" IS 'foreign key RetryResult(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" ON "slice_den"."retry_resumed" IS 'foreign key RetryResumed(target, turn) to RetryPaused(target, turn)';

COMMENT ON CONSTRAINT "__retry_retry_fk_root_gfdc3bi7a3" ON "slice_den"."retry_retry" IS 'foreign key RetryRetry(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_retry_fk_step_attempt_root_xrpolbmg32" ON "slice_den"."retry_retry" IS 'foreign key RetryRetry(step, attempt, root) to RetryEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__retry_scope_fk_root_veata66enh" ON "slice_den"."retry_scope" IS 'foreign key RetryScope(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_skipped_fk_by_iokgypc6cl" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(by) to RetryRoot(scope)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_root_rfxaxqegr7" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_skipped_fk_scope_q4224gzqrl" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(scope) to RetryRoot(scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_lgh6lskept" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_start_step_fk_scope_root_va3ypig5rc" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_step_root_wftarsumzh" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(step, root) to RetryStep(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_fk_root_4xkwhc353t" ON "slice_den"."retry_steadfast_input" IS 'foreign key RetrySteadfastInput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_root_ypuiq33fkv" ON "slice_den"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_root_3x6tbszpyw" ON "slice_den"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_root_y3we3qusrs" ON "slice_den"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step, root) to RetrySteadfastInput(step, root)';

COMMENT ON CONSTRAINT "__retry_step_fk_root_zww4hkltkz" ON "slice_den"."retry_step" IS 'foreign key RetryStep(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_step_fk_scope_root_xl7rht6tyq" ON "slice_den"."retry_step" IS 'foreign key RetryStep(scope, root) to RetryAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_fk_root_aoghadcbu7" ON "slice_den"."retry_throttled_finish_output" IS 'foreign key RetryThrottledFinishOutput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_fk_step_root_7s3twuagha" ON "slice_den"."retry_throttled_finish_output" IS 'foreign key RetryThrottledFinishOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_throttled_input_fk_root_gx2jscz4sq" ON "slice_den"."retry_throttled_input" IS 'foreign key RetryThrottledInput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_fk_root_jiiefymglf" ON "slice_den"."retry_unhurried_finish_output" IS 'foreign key RetryUnhurriedFinishOutput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_fk_step_root_65bjp55xj7" ON "slice_den"."retry_unhurried_finish_output" IS 'foreign key RetryUnhurriedFinishOutput(step, root) to RetryDone(step, root)';

COMMENT ON CONSTRAINT "__retry_unhurried_input_fk_root_eff4ilou6c" ON "slice_den"."retry_unhurried_input" IS 'foreign key RetryUnhurriedInput(root) to RetryRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_admitted_fk_root_5a2j3m7nju" ON "slice_den"."review_admitted" IS 'foreign key ReviewAdmitted(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_admitted_fk_scope_root_bzpl734wrx" ON "slice_den"."review_admitted" IS 'foreign key ReviewAdmitted(scope, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__review_analyze_input_fk_root_73upzaj4eg" ON "slice_den"."review_analyze_input" IS 'foreign key ReviewAnalyzeInput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_root_qlfzwtt6d2" ON "slice_den"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_step_root_axdif7cyxp" ON "slice_den"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(step, root) to ReviewAnalyzeInput(step, root)';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_step_root_arcu4coozk" ON "slice_den"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_z2utn3xauo" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_claim_fk_step_root_yqgzabonm6" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_claim_fk_step_root_attempt_pred_holds_arudmqwanl" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(step, root, attempt, pred(holds)) to ReviewHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__review_claim_fk_step_pred_attempt_root_jwqvbkxdcf" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to ReviewEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_done_fk_root_f374tjslpg" ON "slice_den"."review_done" IS 'foreign key ReviewDone(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_ended_fk_root_o6manlpvtk" ON "slice_den"."review_ended" IS 'foreign key ReviewEnded(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_ended_fk_step_attempt_root_a7ck6js3qb" ON "slice_den"."review_ended" IS 'foreign key ReviewEnded(step, attempt, root) to ReviewClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_exhausted_fk_root_odke37pg7n" ON "slice_den"."review_exhausted" IS 'foreign key ReviewExhausted(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_exhausted_fk_step_root_74mlwghlwh" ON "slice_den"."review_exhausted" IS 'foreign key ReviewExhausted(step, root) to ReviewFailed(step, root)';

COMMENT ON CONSTRAINT "__review_failed_fk_root_vohwwobyj7" ON "slice_den"."review_failed" IS 'foreign key ReviewFailed(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_fenced_fk_root_clolofwycr" ON "slice_den"."review_fenced" IS 'foreign key ReviewFenced(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_fenced_fk_step_attempt_root_zpc4oiatc2" ON "slice_den"."review_fenced" IS 'foreign key ReviewFenced(step, attempt, root) to ReviewEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_yivqae7o2r" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_finish_fk_scope_root_wjpg56iirx" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_finish_fk_step_root_assajgbrsg" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_gather_input_fk_root_m5n5ulcugs" ON "slice_den"."review_gather_input" IS 'foreign key ReviewGatherInput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_root_4jycj2gg73" ON "slice_den"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_step_root_xkxj3c72dv" ON "slice_den"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(step, root) to ReviewGatherInput(step, root)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_step_pred_ordinal_h3lguuktus" ON "slice_den"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(step where Logic.ge(ordinal, 1n), pred(ordinal), root) to ReviewGatherInputSizes(step, ordinal, root)';

COMMENT ON CONSTRAINT "__review_gather_output_fk_root_pfl7uynvxk" ON "slice_den"."review_gather_output" IS 'foreign key ReviewGatherOutput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_gather_output_fk_step_root_kfxlxydhp2" ON "slice_den"."review_gather_output" IS 'foreign key ReviewGatherOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_gather_output_fk_step_root_sijekb5wr7" ON "slice_den"."review_gather_output" IS 'foreign key ReviewGatherOutput(step, root) to ReviewGatherInput(step, root)';

COMMENT ON CONSTRAINT "__review_held_fk_root_cq4jfaijwu" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_held_fk_step_attempt_root_63jdmcjpmk" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(step, attempt, root) to ReviewClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_held_fk_step_root_463posmneo" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(step, root) to ReviewResult(step, root)';

COMMENT ON CONSTRAINT "__review_hold_fk_root_smobn52snr" ON "slice_den"."review_hold" IS 'foreign key ReviewHold(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_hold_fk_step_root_attempt_copy_holds_syccyd3g3d" ON "slice_den"."review_hold" IS 'foreign key ReviewHold(step, root, attempt, the owner''s count of the family ReviewClaim.holds) to ReviewClaim(step, root, attempt, holds)';

COMMENT ON CONSTRAINT "__review_hold_fk_step_root_attempt_pred_at_6m6hmj5lir" ON "slice_den"."review_hold" IS 'foreign key ReviewHold(step, root, attempt, pred(at)) to ReviewHold(step, root, attempt, at)';

COMMENT ON CONSTRAINT "__review_paused_fk_target_pred_turn_rig5fmgcvc" ON "slice_den"."review_paused" IS 'foreign key ReviewPaused(target, pred(turn)) to ReviewResumed(target, turn)';

COMMENT ON CONSTRAINT "__review_questions_finish_output_fk_root_lhkngtysmk" ON "slice_den"."review_questions_finish_output" IS 'foreign key ReviewQuestionsFinishOutput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_questions_finish_output_fk_step_root_hw7trgc4tp" ON "slice_den"."review_questions_finish_output" IS 'foreign key ReviewQuestionsFinishOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_questions_input_fk_root_smgug66jwc" ON "slice_den"."review_questions_input" IS 'foreign key ReviewQuestionsInput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_refusal_fk_root_qvufijkx4k" ON "slice_den"."review_refusal" IS 'foreign key ReviewRefusal(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_refusal_fk_step_root_dhnaknctqw" ON "slice_den"."review_refusal" IS 'foreign key ReviewRefusal(step, root) to ReviewFailed(step, root)';

COMMENT ON CONSTRAINT "__review_result_fk_root_go4w3a44a2" ON "slice_den"."review_result" IS 'foreign key ReviewResult(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_result_fk_step_root_nfnufhm5fh" ON "slice_den"."review_result" IS 'foreign key ReviewResult(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_resumed_fk_target_turn_nvm252hscc" ON "slice_den"."review_resumed" IS 'foreign key ReviewResumed(target, turn) to ReviewPaused(target, turn)';

COMMENT ON CONSTRAINT "__review_retry_fk_root_szjiq4sdny" ON "slice_den"."review_retry" IS 'foreign key ReviewRetry(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_retry_fk_step_attempt_root_fuuiurkjt7" ON "slice_den"."review_retry" IS 'foreign key ReviewRetry(step, attempt, root) to ReviewEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fk_root_ttnfn2lndg" ON "slice_den"."review_review_run_finish_output" IS 'foreign key ReviewReviewRunFinishOutput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fk_step_root_2c63nc4bm4" ON "slice_den"."review_review_run_finish_output" IS 'foreign key ReviewReviewRunFinishOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_review_run_input_fk_root_nkwzzml3bh" ON "slice_den"."review_review_run_input" IS 'foreign key ReviewReviewRunInput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_root_otll5lik2n" ON "slice_den"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_scope_root_qld3u5js7a" ON "slice_den"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(scope, root) to ReviewReviewRunInput(scope, root)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_scope_pred_2ecx6mfelf" ON "slice_den"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(scope where Logic.ge(ordinal, 1n), pred(ordinal), root) to ReviewReviewRunInputSizes(scope, ordinal, root)';

COMMENT ON CONSTRAINT "__review_save_input_fk_root_75g3g3e6l3" ON "slice_den"."review_save_input" IS 'foreign key ReviewSaveInput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_save_output_fk_root_v6vey436ah" ON "slice_den"."review_save_output" IS 'foreign key ReviewSaveOutput(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_save_output_fk_step_root_5hdksxptvu" ON "slice_den"."review_save_output" IS 'foreign key ReviewSaveOutput(step, root) to ReviewDone(step, root)';

COMMENT ON CONSTRAINT "__review_save_output_fk_step_root_jzs34zo56u" ON "slice_den"."review_save_output" IS 'foreign key ReviewSaveOutput(step, root) to ReviewSaveInput(step, root)';

COMMENT ON CONSTRAINT "__review_saved_fk_from_root_sm7hkqib23" ON "slice_den"."review_saved" IS 'foreign key ReviewSaved(from, root) to ReviewQuestionsFinishOutput(step, root)';

COMMENT ON CONSTRAINT "__review_saved_fk_root_4xrfr45gdd" ON "slice_den"."review_saved" IS 'foreign key ReviewSaved(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_saved_fk_to_root_owp4kjzfm6" ON "slice_den"."review_saved" IS 'foreign key ReviewSaved(to, root) to ReviewSaveInput(step, root)';

COMMENT ON CONSTRAINT "__review_scope_fk_root_xio6pw6voh" ON "slice_den"."review_scope" IS 'foreign key ReviewScope(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_skipped_fk_by_ry2tc7ng2c" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(by) to ReviewRoot(scope)';

COMMENT ON CONSTRAINT "__review_skipped_fk_root_pp4l3yk33h" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_skipped_fk_scope_fduacpn4ws" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(scope) to ReviewRoot(scope)';

COMMENT ON CONSTRAINT "__review_split_fk_from_root_ep5f5t573x" ON "slice_den"."review_split" IS 'foreign key ReviewSplit(from, root) to ReviewGatherOutput(step, root)';

COMMENT ON CONSTRAINT "__review_split_fk_root_7vz6jy3jnt" ON "slice_den"."review_split" IS 'foreign key ReviewSplit(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_split_fk_to_root_ilwolhg4sy" ON "slice_den"."review_split" IS 'foreign key ReviewSplit(to, root) to ReviewQuestionsInput(scope, root)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_child_root_ntci6w5prg" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(child, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_ijnygpifkq" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_start_scope_fk_scope_root_4dnwn3qe7t" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_qixpuodpgi" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_start_step_fk_scope_root_ex5wrmacrb" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_start_step_fk_step_root_e5z3u72syf" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(step, root) to ReviewStep(step, root)';

COMMENT ON CONSTRAINT "__review_step_fk_root_s325zhfm22" ON "slice_den"."review_step" IS 'foreign key ReviewStep(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_step_fk_scope_root_eb2a3dvk6c" ON "slice_den"."review_step" IS 'foreign key ReviewStep(scope, root) to ReviewAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__review_within_fk_parent_root_4wk35gfdq4" ON "slice_den"."review_within" IS 'foreign key ReviewWithin(parent, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__review_within_fk_root_ksa5lhbp2j" ON "slice_den"."review_within" IS 'foreign key ReviewWithin(root) to ReviewRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__review_within_fk_scope_root_e63iwx6wm2" ON "slice_den"."review_within" IS 'foreign key ReviewWithin(scope, root) to ReviewScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_admitted_fk_root_pazobscutb" ON "slice_den"."sync_admitted" IS 'foreign key SyncAdmitted(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_admitted_fk_scope_root_ieiyxemub7" ON "slice_den"."sync_admitted" IS 'foreign key SyncAdmitted(scope, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_build_input_fk_root_qlycqp6gk2" ON "slice_den"."sync_build_input" IS 'foreign key SyncBuildInput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_build_output_fk_root_grwezm3fcr" ON "slice_den"."sync_build_output" IS 'foreign key SyncBuildOutput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_root_o3zx5hom3t" ON "slice_den"."sync_build_output" IS 'foreign key SyncBuildOutput(step, root) to SyncBuildInput(step, root)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_root_aksn6onpma" ON "slice_den"."sync_build_output" IS 'foreign key SyncBuildOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_claim_fk_root_4qbs7pxn2t" ON "slice_den"."sync_claim" IS 'foreign key SyncClaim(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_root_gvtcn764xc" ON "slice_den"."sync_claim" IS 'foreign key SyncClaim(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_pred_attempt_root_aeg32ogl5b" ON "slice_den"."sync_claim" IS 'foreign key SyncClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to SyncEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_copy_input_fk_root_d7u63yuxxs" ON "slice_den"."sync_copy_input" IS 'foreign key SyncCopyInput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_root_x2xt2l75vg" ON "slice_den"."sync_copy_output" IS 'foreign key SyncCopyOutput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_root_65fyg7xb6t" ON "slice_den"."sync_copy_output" IS 'foreign key SyncCopyOutput(step, root) to SyncCopyInput(step, root)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_root_gfjlcri22w" ON "slice_den"."sync_copy_output" IS 'foreign key SyncCopyOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_done_fk_root_kbt6t66k7r" ON "slice_den"."sync_done" IS 'foreign key SyncDone(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_ended_fk_root_6yfa76vqgo" ON "slice_den"."sync_ended" IS 'foreign key SyncEnded(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_ended_fk_step_attempt_root_43aj3jw3bk" ON "slice_den"."sync_ended" IS 'foreign key SyncEnded(step, attempt, root) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" ON "slice_den"."sync_exclusive" IS 'foreign key SyncExclusive(kind, key, pred(turn)) to SyncReleased(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_root_jfvgxfgxk7" ON "slice_den"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_scope_root_cl36evoxyb" ON "slice_den"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(scope, root) to SyncScope(scope, root)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_root_w5rujdfs5u" ON "slice_den"."sync_exhausted" IS 'foreign key SyncExhausted(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_step_root_vd7jhdnvet" ON "slice_den"."sync_exhausted" IS 'foreign key SyncExhausted(step, root) to SyncFailed(step, root)';

COMMENT ON CONSTRAINT "__sync_failed_fk_root_utdobwjqln" ON "slice_den"."sync_failed" IS 'foreign key SyncFailed(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_fenced_fk_root_pft7kt3u6c" ON "slice_den"."sync_fenced" IS 'foreign key SyncFenced(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_fenced_fk_step_attempt_root_ddezsoici7" ON "slice_den"."sync_fenced" IS 'foreign key SyncFenced(step, attempt, root) to SyncEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_jesvnqpmqt" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_finish_fk_scope_root_bjgk4nxo7e" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_finish_fk_step_root_mmscezhzyq" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_fk_root_w6bne6fmx4" ON "slice_den"."sync_gold_finish_output" IS 'foreign key SyncGoldFinishOutput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_fk_step_root_2qkffyqtvq" ON "slice_den"."sync_gold_finish_output" IS 'foreign key SyncGoldFinishOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_gold_input_fk_root_dearji3wtq" ON "slice_den"."sync_gold_input" IS 'foreign key SyncGoldInput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_held_fk_root_62s5pmsoqa" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_held_fk_step_attempt_root_46zydmfnyy" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(step, attempt, root) to SyncClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_held_fk_step_root_waydyqivsc" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(step, root) to SyncResult(step, root)';

COMMENT ON CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" ON "slice_den"."sync_paused" IS 'foreign key SyncPaused(target, pred(turn)) to SyncResumed(target, turn)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_root_3f2zmczqcu" ON "slice_den"."sync_refusal" IS 'foreign key SyncRefusal(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_refusal_fk_step_root_igzyfxl4o3" ON "slice_den"."sync_refusal" IS 'foreign key SyncRefusal(step, root) to SyncFailed(step, root)';

COMMENT ON CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" ON "slice_den"."sync_released" IS 'foreign key SyncReleased(kind, key, turn) to SyncExclusive(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_result_fk_root_vnymla3qhz" ON "slice_den"."sync_result" IS 'foreign key SyncResult(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_result_fk_step_root_x2umddyh22" ON "slice_den"."sync_result" IS 'foreign key SyncResult(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" ON "slice_den"."sync_resumed" IS 'foreign key SyncResumed(target, turn) to SyncPaused(target, turn)';

COMMENT ON CONSTRAINT "__sync_retry_fk_root_wl34w4vs2m" ON "slice_den"."sync_retry" IS 'foreign key SyncRetry(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_retry_fk_step_attempt_root_wr6wrg43i4" ON "slice_den"."sync_retry" IS 'foreign key SyncRetry(step, attempt, root) to SyncEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__sync_scope_fk_root_whqzszw2jj" ON "slice_den"."sync_scope" IS 'foreign key SyncScope(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_skipped_fk_by_zsxc5osgwh" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(by) to SyncRoot(scope)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_root_33hfwafoud" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_skipped_fk_scope_33qsksdlcc" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(scope) to SyncRoot(scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_2jg4xkdldt" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_start_step_fk_scope_root_vedcbu54xe" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_step_root_jas4o3xkqs" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(step, root) to SyncStep(step, root)';

COMMENT ON CONSTRAINT "__sync_step_fk_root_rmc4nivt3i" ON "slice_den"."sync_step" IS 'foreign key SyncStep(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_step_fk_scope_root_sfdyvsar2y" ON "slice_den"."sync_step" IS 'foreign key SyncStep(scope, root) to SyncAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_fk_root_khqmodw54k" ON "slice_den"."sync_sync_run_finish_output" IS 'foreign key SyncSyncRunFinishOutput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_fk_step_root_n3vgglnveu" ON "slice_den"."sync_sync_run_finish_output" IS 'foreign key SyncSyncRunFinishOutput(step, root) to SyncDone(step, root)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_fk_root_ifd4bfberz" ON "slice_den"."sync_sync_run_input" IS 'foreign key SyncSyncRunInput(root) to SyncRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_admitted_fk_root_zzhx3ymsmx" ON "slice_den"."writeback_admitted" IS 'foreign key WritebackAdmitted(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_admitted_fk_scope_root_bgkzavlmet" ON "slice_den"."writeback_admitted" IS 'foreign key WritebackAdmitted(scope, root) to WritebackScope(scope, root)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_root_7agc267qm7" ON "slice_den"."writeback_claim" IS 'foreign key WritebackClaim(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_claim_fk_step_root_vh7k4u5nuz" ON "slice_den"."writeback_claim" IS 'foreign key WritebackClaim(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_step_pred_attempt_root_qpbpmxuik3" ON "slice_den"."writeback_claim" IS 'foreign key WritebackClaim(step where Logic.ge(attempt, 1n), pred(attempt), root) to WritebackEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_deliver_input_fk_root_khq2esrmmb" ON "slice_den"."writeback_deliver_input" IS 'foreign key WritebackDeliverInput(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_root_e4xa5oep52" ON "slice_den"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_step_root_3p47hjlrfd" ON "slice_den"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(step, root) to WritebackDeliverInput(step, root)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_step_root_trjdigghf7" ON "slice_den"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(step, root) to WritebackDone(step, root)';

COMMENT ON CONSTRAINT "__writeback_done_fk_root_3lnpe5h2ex" ON "slice_den"."writeback_done" IS 'foreign key WritebackDone(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_ended_fk_root_h7zxc3wrem" ON "slice_den"."writeback_ended" IS 'foreign key WritebackEnded(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_ended_fk_step_attempt_root_laqrk2e3dt" ON "slice_den"."writeback_ended" IS 'foreign key WritebackEnded(step, attempt, root) to WritebackClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_root_m3qvioeeek" ON "slice_den"."writeback_exhausted" IS 'foreign key WritebackExhausted(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_step_root_cwhwzf2upp" ON "slice_den"."writeback_exhausted" IS 'foreign key WritebackExhausted(step, root) to WritebackFailed(step, root)';

COMMENT ON CONSTRAINT "__writeback_failed_fk_root_ddkqjmy3le" ON "slice_den"."writeback_failed" IS 'foreign key WritebackFailed(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_root_cishzkxig6" ON "slice_den"."writeback_fenced" IS 'foreign key WritebackFenced(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_step_attempt_root_7uikhcfpkf" ON "slice_den"."writeback_fenced" IS 'foreign key WritebackFenced(step, attempt, root) to WritebackEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_4suiathayz" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_finish_fk_scope_root_rp7v2vj6l6" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(scope, root) to WritebackAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_step_root_7ny2yumuvy" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_dady3frmfj" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_held_fk_step_attempt_root_2i7p4i2alp" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(step, attempt, root) to WritebackClaim(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_held_fk_step_root_7yahu5vvit" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(step, root) to WritebackResult(step, root)';

COMMENT ON CONSTRAINT "__writeback_paused_fk_target_pred_turn_rvsgo6wgpe" ON "slice_den"."writeback_paused" IS 'foreign key WritebackPaused(target, pred(turn)) to WritebackResumed(target, turn)';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_root_hbzez4kebv" ON "slice_den"."writeback_refusal" IS 'foreign key WritebackRefusal(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_step_root_xf2b5o76fl" ON "slice_den"."writeback_refusal" IS 'foreign key WritebackRefusal(step, root) to WritebackFailed(step, root)';

COMMENT ON CONSTRAINT "__writeback_result_fk_root_2ds3etg4pt" ON "slice_den"."writeback_result" IS 'foreign key WritebackResult(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_result_fk_step_root_52vlcqzy4o" ON "slice_den"."writeback_result" IS 'foreign key WritebackResult(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_resumed_fk_target_turn_vfx6l6vk75" ON "slice_den"."writeback_resumed" IS 'foreign key WritebackResumed(target, turn) to WritebackPaused(target, turn)';

COMMENT ON CONSTRAINT "__writeback_retry_fk_root_7expqnzkek" ON "slice_den"."writeback_retry" IS 'foreign key WritebackRetry(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_retry_fk_step_attempt_root_5cwcgqo5s7" ON "slice_den"."writeback_retry" IS 'foreign key WritebackRetry(step, attempt, root) to WritebackEnded(step, attempt, root)';

COMMENT ON CONSTRAINT "__writeback_scope_fk_root_7hgmsmhohr" ON "slice_den"."writeback_scope" IS 'foreign key WritebackScope(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_by_dm2bpfflyw" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(by) to WritebackRoot(scope)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_root_a3d7uviq7u" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_scope_veikkumie6" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(scope) to WritebackRoot(scope)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_r7w5ogs6pb" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_scope_root_dnvan4vxav" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(scope, root) to WritebackAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_step_root_zuw7g6khi3" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(step, root) to WritebackStep(step, root)';

COMMENT ON CONSTRAINT "__writeback_step_fk_root_ikezfkedwk" ON "slice_den"."writeback_step" IS 'foreign key WritebackStep(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_step_fk_scope_root_htnuvc75ao" ON "slice_den"."writeback_step" IS 'foreign key WritebackStep(scope, root) to WritebackAdmitted(scope, root)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_fk_root_jvtr4eenzd" ON "slice_den"."writeback_writeback_finish_output" IS 'foreign key WritebackWritebackFinishOutput(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_fk_step_root_fygai72drs" ON "slice_den"."writeback_writeback_finish_output" IS 'foreign key WritebackWritebackFinishOutput(step, root) to WritebackDone(step, root)';

COMMENT ON CONSTRAINT "__writeback_writeback_input_fk_root_mwnbphwqvk" ON "slice_den"."writeback_writeback_input" IS 'foreign key WritebackWritebackInput(root) to WritebackRoot(scope where Logic.eq(retired, false))';

COMMENT ON FUNCTION "slice_den"."__hold_assign_root_rwboli77cc"("slice"."__sha256"[]) IS 'hold function of the groups of AssignRoot';

COMMENT ON FUNCTION "slice_den"."__hold_chain_root_wgndggnfwf"("slice"."__sha256"[]) IS 'hold function of the groups of ChainRoot';

COMMENT ON FUNCTION "slice_den"."__hold_clock_root_bawnkhmkww"("slice"."__sha256"[]) IS 'hold function of the groups of ClockRoot';

COMMENT ON FUNCTION "slice_den"."__hold_fan_root_4vwfxofrxw"("slice"."__sha256"[]) IS 'hold function of the groups of FanRoot';

COMMENT ON FUNCTION "slice_den"."__hold_retry_root_54bybhkxg6"("slice"."__sha256"[]) IS 'hold function of the groups of RetryRoot';

COMMENT ON FUNCTION "slice_den"."__hold_review_root_j3blgclwnl"("slice"."__sha256"[]) IS 'hold function of the groups of ReviewRoot';

COMMENT ON FUNCTION "slice_den"."__hold_sync_root_6ita6q5wxi"("slice"."__sha256"[]) IS 'hold function of the groups of SyncRoot';

COMMENT ON FUNCTION "slice_den"."__hold_writeback_root_msmvpm3j7g"("slice"."__sha256"[]) IS 'hold function of the groups of WritebackRoot';

COMMENT ON FUNCTION "slice_den"."__retire_assign_root_hwbj4sewrx"("slice"."__sha256"[]) IS 'retire function of the groups of AssignRoot';

COMMENT ON FUNCTION "slice_den"."__retire_chain_root_ji6nmac7of"("slice"."__sha256"[]) IS 'retire function of the groups of ChainRoot';

COMMENT ON FUNCTION "slice_den"."__retire_clock_root_6pfo6eeroe"("slice"."__sha256"[]) IS 'retire function of the groups of ClockRoot';

COMMENT ON FUNCTION "slice_den"."__retire_fan_root_niesya7vcd"("slice"."__sha256"[]) IS 'retire function of the groups of FanRoot';

COMMENT ON FUNCTION "slice_den"."__retire_retry_root_kays5vv5ic"("slice"."__sha256"[]) IS 'retire function of the groups of RetryRoot';

COMMENT ON FUNCTION "slice_den"."__retire_review_root_itykotyltd"("slice"."__sha256"[]) IS 'retire function of the groups of ReviewRoot';

COMMENT ON FUNCTION "slice_den"."__retire_sync_root_ygktrpeohu"("slice"."__sha256"[]) IS 'retire function of the groups of SyncRoot';

COMMENT ON FUNCTION "slice_den"."__retire_writeback_root_oprw3k6une"("slice"."__sha256"[]) IS 'retire function of the groups of WritebackRoot';

COMMENT ON TABLE "slice_den"."__head_assign_claim_attempt_h744pvqs3v" IS 'head table of AssignClaim.attempt';

COMMENT ON CONSTRAINT "__head_assign_claim_attempt_pk_ukplhioyap" ON "slice_den"."__head_assign_claim_attempt_h744pvqs3v" IS 'primary key of the head table of AssignClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of AssignClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" IS 'head table of ChainClaim.attempt';

COMMENT ON CONSTRAINT "__head_chain_claim_attempt_pk_uil6dupsak" ON "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" IS 'primary key of the head table of ChainClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of ChainClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" IS 'head table of ClockClaim.attempt';

COMMENT ON CONSTRAINT "__head_clock_claim_attempt_pk_qk5yhk2dpe" ON "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" IS 'primary key of the head table of ClockClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of ClockClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_fan_claim_attempt_u34lm72lgr" IS 'head table of FanClaim.attempt';

COMMENT ON CONSTRAINT "__head_fan_claim_attempt_pk_fxxlbksulz" ON "slice_den"."__head_fan_claim_attempt_u34lm72lgr" IS 'primary key of the head table of FanClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of FanClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_retry_claim_attempt_exbl6vgycp" IS 'head table of RetryClaim.attempt';

COMMENT ON CONSTRAINT "__head_retry_claim_attempt_pk_ejhdquayr7" ON "slice_den"."__head_retry_claim_attempt_exbl6vgycp" IS 'primary key of the head table of RetryClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of RetryClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" IS 'head table of ReviewClaim.attempt';

COMMENT ON CONSTRAINT "__head_review_claim_attempt_pk_zws5xp3jki" ON "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" IS 'primary key of the head table of ReviewClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of ReviewClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" IS 'head table of SyncClaim.attempt';

COMMENT ON CONSTRAINT "__head_sync_claim_attempt_pk_xgyze7x7sx" ON "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" IS 'primary key of the head table of SyncClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of SyncClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_writeback_claim_attempt_pk673p2jar" IS 'head table of WritebackClaim.attempt';

COMMENT ON CONSTRAINT "__head_writeback_claim_attempt_pk_iervt3geuj" ON "slice_den"."__head_writeback_claim_attempt_pk673p2jar" IS 'primary key of the head table of WritebackClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of WritebackClaim.attempt';

COMMENT ON INDEX "slice"."__passage_ix_topic_lzh6djzwn4" IS 'btree index Passage(topic)';

COMMENT ON INDEX "slice"."__passage_ix_embedding_ujugi77ft2" IS 'hnsw index Passage(embedding vectorCosine)';

COMMENT ON INDEX "slice_den"."__assign_admitted_ix_root_pot3vpqjrt" IS 'btree index AssignAdmitted(root)';

COMMENT ON INDEX "slice_den"."__assign_asked_ix_root_from_tqt7dg3fxl" IS 'btree index AssignAsked(root, from)';

COMMENT ON INDEX "slice_den"."__assign_assignment_finish_output_ix_root_t2nmfubzxm" IS 'btree index AssignAssignmentFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_ix_root_scope_ndn57wfv5p" IS 'btree index AssignAssignmentInput(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_exclude_ix_root_scope_u_6_7ph7zpbtp2" IS 'btree index AssignAssignmentInputExclude(root, __scope_u6ypqf2r2z, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb" IS 'btree index AssignAssignmentInputExclude(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_mode_nearest_ix_root_scope_2jryb7pj2a" IS 'btree index AssignAssignmentInputModeNearest(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_mode_within_ix_root_scope_yleeo72liv" IS 'btree index AssignAssignmentInputModeWithin(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_near_ix_root_scope_u_6_eoy4ujrqzz" IS 'btree index AssignAssignmentInputNear(root, __scope_u6ypqf2r2z, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_near_ix_root_scope_gswnizhczo" IS 'btree index AssignAssignmentInputNear(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_claim_ix_root_step_ouvkclqzzd_pred_attempt_wrkk7rllts" IS 'btree index AssignClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_ix_root_step_erwflqvcsk" IS 'btree index AssignDecideInput(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_exclude_ix_root_step_mjpuijzth_26rzz2ekud" IS 'btree index AssignDecideInputExclude(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_exclude_ix_root_step_ksgou2rpv4" IS 'btree index AssignDecideInputExclude(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_mode_nearest_ix_root_step_v54e6no7cj" IS 'btree index AssignDecideInputModeNearest(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_mode_within_ix_root_step_trlkcqxcfp" IS 'btree index AssignDecideInputModeWithin(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_ix_root_step_uxq3vbvjoa" IS 'btree index AssignDecideOutput(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_stage_rest_ix_root_step_hkqbk442cr" IS 'btree index AssignDecideOutputStageRest(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_stage_serve_ix_root_step_65h35vi6kz" IS 'btree index AssignDecideOutputStageServe(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_weighed_ix_root_step_5pk2o2aayf" IS 'btree index AssignDecideOutputWeighed(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_weighed_ix_root_step_gncwdipl43" IS 'btree index AssignDecideOutputWeighed(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_nearest_ix_digest_tm2whkfyjf" IS 'btree index AssignDecideReadNearest(digest)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_nearest_ix_root_step_6br7o7z6sz" IS 'btree index AssignDecideReadNearest(root, step)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_seen_ix_digest_q7rgkxywvx" IS 'btree index AssignDecideReadSeen(digest)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_seen_ix_root_step_d6mfz7qi6f" IS 'btree index AssignDecideReadSeen(root, step)';

COMMENT ON INDEX "slice_den"."__assign_done_ix_root_step_edz2spjbbn" IS 'btree index AssignDone(root, step)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_ix_root_step_5ltjxo25vr" IS 'btree index AssignEmbedInput(root, step)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_exclude_ix_root_step_mjpuijzth_7bmkgreoup" IS 'btree index AssignEmbedInputExclude(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_exclude_ix_root_step_hkkmfupglo" IS 'btree index AssignEmbedInputExclude(root, step)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_mode_nearest_ix_root_step_nyvoanaxpc" IS 'btree index AssignEmbedInputModeNearest(root, step)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_mode_within_ix_root_step_jaqihe4eqt" IS 'btree index AssignEmbedInputModeWithin(root, step)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_near_ix_root_step_mjpuijzth_4_p67hugda6z" IS 'btree index AssignEmbedInputNear(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_near_ix_root_step_lkjh7aey4z" IS 'btree index AssignEmbedInputNear(root, step)';

COMMENT ON INDEX "slice_den"."__assign_embed_output_ix_root_qha7oj27r7" IS 'btree index AssignEmbedOutput(root)';

COMMENT ON INDEX "slice_den"."__assign_ended_ix_root_dw6oimqu3h" IS 'btree index AssignEnded(root)';

COMMENT ON INDEX "slice_den"."__assign_exhausted_ix_root_gsga5kdkq3" IS 'btree index AssignExhausted(root)';

COMMENT ON INDEX "slice_den"."__assign_failed_ix_root_step_i7nxwkjb5e" IS 'btree index AssignFailed(root, step)';

COMMENT ON INDEX "slice_den"."__assign_fenced_ix_root_jvlqbasn7e" IS 'btree index AssignFenced(root)';

COMMENT ON INDEX "slice_den"."__assign_finish_ix_root_ilehlpwnxm" IS 'btree index AssignFinish(root)';

COMMENT ON INDEX "slice_den"."__assign_finish_ix_scope_step_53o4eorqpr" IS 'btree index AssignFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__assign_held_ix_root_35l4gc35rc" IS 'btree index AssignHeld(root)';

COMMENT ON INDEX "slice_den"."__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" IS 'btree index AssignPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__assign_refusal_ix_root_qadi23h44a" IS 'btree index AssignRefusal(root)';

COMMENT ON INDEX "slice_den"."__assign_result_ix_root_step_yuug5el3pq" IS 'btree index AssignResult(root, step)';

COMMENT ON INDEX "slice_den"."__assign_result_ix_step_outcome_root_35vmqe5lxj" IS 'btree index AssignResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__assign_retry_ix_root_oaojw2snch" IS 'btree index AssignRetry(root)';

COMMENT ON INDEX "slice_den"."__assign_scope_ix_root_v6jmsbgzsq" IS 'btree index AssignScope(root)';

COMMENT ON INDEX "slice_den"."__assign_skipped_ix_by_phe5rdziqg" IS 'btree index AssignSkipped(by)';

COMMENT ON INDEX "slice_den"."__assign_skipped_ix_root_dzieud2d67" IS 'btree index AssignSkipped(root)';

COMMENT ON INDEX "slice_den"."__assign_start_step_ix_root_scope_j5eqvalej3" IS 'btree index AssignStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_step_ix_root_scope_64vujnvoiu" IS 'btree index AssignStep(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_step_ix_scope_kind_step_xn2zxx73po" IS 'btree index AssignStep(scope, kind, step)';

COMMENT ON INDEX "slice_den"."__chain_admitted_ix_root_3xhdqkpeqw" IS 'btree index ChainAdmitted(root)';

COMMENT ON INDEX "slice_den"."__chain_chain_run_finish_output_ix_root_wb6phhwc2j" IS 'btree index ChainChainRunFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__chain_chain_run_input_ix_root_7abe6kcg67" IS 'btree index ChainChainRunInput(root)';

COMMENT ON INDEX "slice_den"."__chain_claim_ix_root_step_ouvkclqzzd_pred_attempt_azuejmwwty" IS 'btree index ChainClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__chain_done_ix_root_step_nymmh7bgnk" IS 'btree index ChainDone(root, step)';

COMMENT ON INDEX "slice_den"."__chain_ended_ix_root_e73xltety4" IS 'btree index ChainEnded(root)';

COMMENT ON INDEX "slice_den"."__chain_exhausted_ix_root_fjn7tzhjc7" IS 'btree index ChainExhausted(root)';

COMMENT ON INDEX "slice_den"."__chain_failed_ix_root_step_bmwbd7vlrh" IS 'btree index ChainFailed(root, step)';

COMMENT ON INDEX "slice_den"."__chain_fenced_ix_root_mnawzvb34e" IS 'btree index ChainFenced(root)';

COMMENT ON INDEX "slice_den"."__chain_finish_ix_root_ypjcgcan7b" IS 'btree index ChainFinish(root)';

COMMENT ON INDEX "slice_den"."__chain_finish_ix_scope_step_om6bljb56e" IS 'btree index ChainFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__chain_held_ix_root_havzgkxex3" IS 'btree index ChainHeld(root)';

COMMENT ON INDEX "slice_den"."__chain_next_ix_root_from_5hhx2qutdl" IS 'btree index ChainNext(root, from)';

COMMENT ON INDEX "slice_den"."__chain_ordered_finish_output_ix_root_hrdok3djgq" IS 'btree index ChainOrderedFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__chain_ordered_input_ix_root_wmmk2yqn4t" IS 'btree index ChainOrderedInput(root)';

COMMENT ON INDEX "slice_den"."__chain_page_input_ix_root_step_25b4lmpnjr" IS 'btree index ChainPageInput(root, step)';

COMMENT ON INDEX "slice_den"."__chain_page_input_after_ix_root_hmbetlosxh" IS 'btree index ChainPageInputAfter(root)';

COMMENT ON INDEX "slice_den"."__chain_page_output_ix_root_g3alpbog4o" IS 'btree index ChainPageOutput(root)';

COMMENT ON INDEX "slice_den"."__chain_page_output_next_ix_root_r662e4fglp" IS 'btree index ChainPageOutputNext(root)';

COMMENT ON INDEX "slice_den"."__chain_page_read_earlier_ix_digest_p7rrxdx4kq" IS 'btree index ChainPageReadEarlier(digest)';

COMMENT ON INDEX "slice_den"."__chain_page_read_earlier_ix_root_step_x3sjcqoydn" IS 'btree index ChainPageReadEarlier(root, step)';

COMMENT ON INDEX "slice_den"."__chain_page_read_tree_ix_digest_qz4flptsbe" IS 'btree index ChainPageReadTree(digest)';

COMMENT ON INDEX "slice_den"."__chain_page_read_tree_ix_root_step_dahkztzxnh" IS 'btree index ChainPageReadTree(root, step)';

COMMENT ON INDEX "slice_den"."__chain_page_read_weights_ix_digest_p6eekmx2x6" IS 'btree index ChainPageReadWeights(digest)';

COMMENT ON INDEX "slice_den"."__chain_page_read_weights_ix_root_step_ukdzwgkuna" IS 'btree index ChainPageReadWeights(root, step)';

COMMENT ON INDEX "slice_den"."__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" IS 'btree index ChainPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__chain_refusal_ix_root_t2ancje4qy" IS 'btree index ChainRefusal(root)';

COMMENT ON INDEX "slice_den"."__chain_result_ix_root_step_32kpfjvum5" IS 'btree index ChainResult(root, step)';

COMMENT ON INDEX "slice_den"."__chain_result_ix_step_outcome_root_ipaxj3wl7z" IS 'btree index ChainResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__chain_retry_ix_root_nhtemmz6f2" IS 'btree index ChainRetry(root)';

COMMENT ON INDEX "slice_den"."__chain_scope_ix_root_idrabjw6oz" IS 'btree index ChainScope(root)';

COMMENT ON INDEX "slice_den"."__chain_skipped_ix_by_2c45vyfwzy" IS 'btree index ChainSkipped(by)';

COMMENT ON INDEX "slice_den"."__chain_skipped_ix_root_4knz5mxvl4" IS 'btree index ChainSkipped(root)';

COMMENT ON INDEX "slice_den"."__chain_start_step_ix_root_scope_76rv5icpsa" IS 'btree index ChainStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__chain_step_ix_root_scope_srrhrbyetn" IS 'btree index ChainStep(root, scope)';

COMMENT ON INDEX "slice_den"."__chain_step_ix_scope_kind_step_tsdjtgaey5" IS 'btree index ChainStep(scope, kind, step)';

COMMENT ON INDEX "slice_den"."__chain_step_ix_step_kind_root_2pdoze4bhr" IS 'btree index ChainStep(step, kind, root)';

COMMENT ON INDEX "slice_den"."__clock_admitted_ix_root_s7zcjrj5vn" IS 'btree index ClockAdmitted(root)';

COMMENT ON INDEX "slice_den"."__clock_chime_input_ix_root_step_ctwanc2seb" IS 'btree index ClockChimeInput(root, step)';

COMMENT ON INDEX "slice_den"."__clock_chime_output_ix_root_ivn554pu5g" IS 'btree index ClockChimeOutput(root)';

COMMENT ON INDEX "slice_den"."__clock_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ndcvaxclz" IS 'btree index ClockClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__clock_close_input_ix_root_step_3i3uxrbbrh" IS 'btree index ClockCloseInput(root, step)';

COMMENT ON INDEX "slice_den"."__clock_close_output_ix_root_56kq4rywmc" IS 'btree index ClockCloseOutput(root)';

COMMENT ON INDEX "slice_den"."__clock_done_ix_root_step_y7b7fracbz" IS 'btree index ClockDone(root, step)';

COMMENT ON INDEX "slice_den"."__clock_ended_ix_root_brohrxygrw" IS 'btree index ClockEnded(root)';

COMMENT ON INDEX "slice_den"."__clock_exhausted_ix_root_mqjwzmnkg2" IS 'btree index ClockExhausted(root)';

COMMENT ON INDEX "slice_den"."__clock_failed_ix_root_step_h2u36dbqyr" IS 'btree index ClockFailed(root, step)';

COMMENT ON INDEX "slice_den"."__clock_fenced_ix_root_os2tzc4ej6" IS 'btree index ClockFenced(root)';

COMMENT ON INDEX "slice_den"."__clock_finish_ix_root_dig34tapz4" IS 'btree index ClockFinish(root)';

COMMENT ON INDEX "slice_den"."__clock_finish_ix_scope_step_q2cyoxfrgy" IS 'btree index ClockFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__clock_held_ix_root_x4d2isfem4" IS 'btree index ClockHeld(root)';

COMMENT ON INDEX "slice_den"."__clock_hourly_finish_output_ix_root_fcxtbzly5h" IS 'btree index ClockHourlyFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__clock_hourly_input_ix_root_nsyqbwry4l" IS 'btree index ClockHourlyInput(root)';

COMMENT ON INDEX "slice_den"."__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" IS 'btree index ClockPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__clock_refusal_ix_root_xdxq3ho5kd" IS 'btree index ClockRefusal(root)';

COMMENT ON INDEX "slice_den"."__clock_result_ix_root_step_vo4ykwoczk" IS 'btree index ClockResult(root, step)';

COMMENT ON INDEX "slice_den"."__clock_retry_ix_root_zejdeyf4de" IS 'btree index ClockRetry(root)';

COMMENT ON INDEX "slice_den"."__clock_scope_ix_root_5jnjt75iyn" IS 'btree index ClockScope(root)';

COMMENT ON INDEX "slice_den"."__clock_sitting_finish_output_ix_root_lvaxizxoa5" IS 'btree index ClockSittingFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__clock_sitting_input_ix_root_zwyu7ep5i3" IS 'btree index ClockSittingInput(root)';

COMMENT ON INDEX "slice_den"."__clock_skipped_ix_by_252vuphujb" IS 'btree index ClockSkipped(by)';

COMMENT ON INDEX "slice_den"."__clock_skipped_ix_root_f3tj6hnqvq" IS 'btree index ClockSkipped(root)';

COMMENT ON INDEX "slice_den"."__clock_start_step_ix_root_scope_xs5a3wv234" IS 'btree index ClockStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__clock_step_ix_root_scope_xautpoatwk" IS 'btree index ClockStep(root, scope)';

COMMENT ON INDEX "slice_den"."__clock_step_ix_scope_ttvc76thdq" IS 'btree index ClockStep(scope)';

COMMENT ON INDEX "slice_den"."__fan_admitted_ix_root_cjavzjrmil" IS 'btree index FanAdmitted(root)';

COMMENT ON INDEX "slice_den"."__fan_batch_finish_output_ix_root_xzmsfqk7gw" IS 'btree index FanBatchFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__fan_batch_input_ix_root_scope_24ynzsffio" IS 'btree index FanBatchInput(root, scope)';

COMMENT ON INDEX "slice_den"."__fan_claim_ix_root_step_ouvkclqzzd_pred_attempt_oey_kkpmouft4i" IS 'btree index FanClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__fan_done_ix_root_step_nrkfpkvyya" IS 'btree index FanDone(root, step)';

COMMENT ON INDEX "slice_den"."__fan_dust_input_ix_root_step_3aq67uii4u" IS 'btree index FanDustInput(root, step)';

COMMENT ON INDEX "slice_den"."__fan_dust_output_ix_root_72ib45pvnf" IS 'btree index FanDustOutput(root)';

COMMENT ON INDEX "slice_den"."__fan_ended_ix_root_step_unjzbpnw46" IS 'btree index FanEnded(root, step)';

COMMENT ON INDEX "slice_den"."__fan_exhausted_ix_root_2diuxfgt5s" IS 'btree index FanExhausted(root)';

COMMENT ON INDEX "slice_den"."__fan_failed_ix_root_step_ciyeplozai" IS 'btree index FanFailed(root, step)';

COMMENT ON INDEX "slice_den"."__fan_fan_run_finish_output_ix_root_gol6fu3ini" IS 'btree index FanFanRunFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__fan_fan_run_input_ix_root_25alzzoykh" IS 'btree index FanFanRunInput(root)';

COMMENT ON INDEX "slice_den"."__fan_fenced_ix_root_3xl5uhzvmu" IS 'btree index FanFenced(root)';

COMMENT ON INDEX "slice_den"."__fan_finish_ix_root_i6xnvwhwty" IS 'btree index FanFinish(root)';

COMMENT ON INDEX "slice_den"."__fan_finish_ix_scope_step_gv7mbzp7pp" IS 'btree index FanFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__fan_held_ix_root_step_hgpfyg562f" IS 'btree index FanHeld(root, step)';

COMMENT ON INDEX "slice_den"."__fan_hold_ix_resource_seat_s7bnw22355" IS 'btree index FanHold(resource, seat)';

COMMENT ON INDEX "slice_den"."__fan_hold_ix_root_ral35akxi3" IS 'btree index FanHold(root)';

COMMENT ON INDEX "slice_den"."__fan_mop_input_ix_root_step_fyigtnzcib" IS 'btree index FanMopInput(root, step)';

COMMENT ON INDEX "slice_den"."__fan_mop_output_ix_root_sl77vgnqfl" IS 'btree index FanMopOutput(root)';

COMMENT ON INDEX "slice_den"."__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" IS 'btree index FanPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__fan_refusal_ix_root_s5ydavkzd3" IS 'btree index FanRefusal(root)';

COMMENT ON INDEX "slice_den"."__fan_result_ix_root_step_zpvuqrugvb" IS 'btree index FanResult(root, step)';

COMMENT ON INDEX "slice_den"."__fan_result_ix_step_outcome_root_udaij7stvj" IS 'btree index FanResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__fan_retry_ix_root_sirifasnll" IS 'btree index FanRetry(root)';

COMMENT ON INDEX "slice_den"."__fan_scope_ix_root_a5wtvynqul" IS 'btree index FanScope(root)';

COMMENT ON INDEX "slice_den"."__fan_skipped_ix_by_3aejofkhor" IS 'btree index FanSkipped(by)';

COMMENT ON INDEX "slice_den"."__fan_skipped_ix_root_7ktlrax2wh" IS 'btree index FanSkipped(root)';

COMMENT ON INDEX "slice_den"."__fan_square_input_ix_root_step_dhgolhjnxl" IS 'btree index FanSquareInput(root, step)';

COMMENT ON INDEX "slice_den"."__fan_square_output_ix_root_vc5qn45ria" IS 'btree index FanSquareOutput(root)';

COMMENT ON INDEX "slice_den"."__fan_start_scope_ix_root_scope_t5ybmxw7ah" IS 'btree index FanStartScope(root, scope)';

COMMENT ON INDEX "slice_den"."__fan_start_step_ix_root_scope_vn7amkfoey" IS 'btree index FanStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__fan_step_ix_root_scope_aw525h7gua" IS 'btree index FanStep(root, scope)';

COMMENT ON INDEX "slice_den"."__fan_step_ix_scope_kind_step_5arz2gb4sb" IS 'btree index FanStep(scope, kind, step)';

COMMENT ON INDEX "slice_den"."__fan_sweep_finish_output_ix_root_xyklupvq4l" IS 'btree index FanSweepFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__fan_sweep_input_ix_root_txcp3teesu" IS 'btree index FanSweepInput(root)';

COMMENT ON INDEX "slice_den"."__fan_within_ix_parent_kind_scope_5ywepfmzj2" IS 'btree index FanWithin(parent, kind, scope)';

COMMENT ON INDEX "slice_den"."__fan_within_ix_root_parent_ivgq62e3yc" IS 'btree index FanWithin(root, parent)';

COMMENT ON INDEX "slice_den"."__retry_admitted_ix_root_ewgjxicsia" IS 'btree index RetryAdmitted(root)';

COMMENT ON INDEX "slice_den"."__retry_brittle_input_ix_root_step_hn2bnvkmi5" IS 'btree index RetryBrittleInput(root, step)';

COMMENT ON INDEX "slice_den"."__retry_brittle_output_ix_root_zbwyfvhpop" IS 'btree index RetryBrittleOutput(root)';

COMMENT ON INDEX "slice_den"."__retry_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ee63gc76g" IS 'btree index RetryClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__retry_done_ix_root_step_2l3rh6d5g6" IS 'btree index RetryDone(root, step)';

COMMENT ON INDEX "slice_den"."__retry_ended_ix_root_qdnd63ykxk" IS 'btree index RetryEnded(root)';

COMMENT ON INDEX "slice_den"."__retry_exhausted_ix_root_zequtvgrfg" IS 'btree index RetryExhausted(root)';

COMMENT ON INDEX "slice_den"."__retry_failed_ix_root_step_7objnilm6u" IS 'btree index RetryFailed(root, step)';

COMMENT ON INDEX "slice_den"."__retry_fenced_ix_root_4x3i3cxxnz" IS 'btree index RetryFenced(root)';

COMMENT ON INDEX "slice_den"."__retry_finish_ix_root_sr33zcrg2m" IS 'btree index RetryFinish(root)';

COMMENT ON INDEX "slice_den"."__retry_finish_ix_scope_step_6tswescc6v" IS 'btree index RetryFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__retry_held_ix_root_ytwhkhubpt" IS 'btree index RetryHeld(root)';

COMMENT ON INDEX "slice_den"."__retry_ladders_finish_output_ix_root_trnh6kkzim" IS 'btree index RetryLaddersFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__retry_ladders_input_ix_root_co4bnpgzm5" IS 'btree index RetryLaddersInput(root)';

COMMENT ON INDEX "slice_den"."__retry_patient_input_ix_root_step_ghlof24jma" IS 'btree index RetryPatientInput(root, step)';

COMMENT ON INDEX "slice_den"."__retry_patient_output_ix_root_zxxckjnki6" IS 'btree index RetryPatientOutput(root)';

COMMENT ON INDEX "slice_den"."__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" IS 'btree index RetryPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__retry_polite_input_ix_root_step_begldsasuy" IS 'btree index RetryPoliteInput(root, step)';

COMMENT ON INDEX "slice_den"."__retry_polite_output_ix_root_x5djpoz7ix" IS 'btree index RetryPoliteOutput(root)';

COMMENT ON INDEX "slice_den"."__retry_refusal_ix_root_7f4y3ykjiz" IS 'btree index RetryRefusal(root)';

COMMENT ON INDEX "slice_den"."__retry_result_ix_root_step_n7qrlleymb" IS 'btree index RetryResult(root, step)';

COMMENT ON INDEX "slice_den"."__retry_result_ix_step_outcome_root_5x6caywnin" IS 'btree index RetryResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__retry_retry_ix_root_pkjsumgznf" IS 'btree index RetryRetry(root)';

COMMENT ON INDEX "slice_den"."__retry_scope_ix_root_7gpsngzwhs" IS 'btree index RetryScope(root)';

COMMENT ON INDEX "slice_den"."__retry_skipped_ix_by_s7pekf7xtg" IS 'btree index RetrySkipped(by)';

COMMENT ON INDEX "slice_den"."__retry_skipped_ix_root_uaslhltkgy" IS 'btree index RetrySkipped(root)';

COMMENT ON INDEX "slice_den"."__retry_start_step_ix_root_scope_f733eg3dwz" IS 'btree index RetryStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__retry_steadfast_input_ix_root_step_2oipswgr7i" IS 'btree index RetrySteadfastInput(root, step)';

COMMENT ON INDEX "slice_den"."__retry_steadfast_output_ix_root_sp7in5arxz" IS 'btree index RetrySteadfastOutput(root)';

COMMENT ON INDEX "slice_den"."__retry_step_ix_root_scope_ogbhay3han" IS 'btree index RetryStep(root, scope)';

COMMENT ON INDEX "slice_den"."__retry_step_ix_scope_kind_step_m6ufaqcqmk" IS 'btree index RetryStep(scope, kind, step)';

COMMENT ON INDEX "slice_den"."__retry_throttled_finish_output_ix_root_tjndqsonfa" IS 'btree index RetryThrottledFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__retry_throttled_input_ix_root_jl6ezw6jux" IS 'btree index RetryThrottledInput(root)';

COMMENT ON INDEX "slice_den"."__retry_unhurried_finish_output_ix_root_32l3jvurao" IS 'btree index RetryUnhurriedFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__retry_unhurried_input_ix_root_fuypwcangl" IS 'btree index RetryUnhurriedInput(root)';

COMMENT ON INDEX "slice_den"."__review_admitted_ix_root_yaphj2wqrq" IS 'btree index ReviewAdmitted(root)';

COMMENT ON INDEX "slice_den"."__review_analyze_input_ix_root_step_bdsim6bffp" IS 'btree index ReviewAnalyzeInput(root, step)';

COMMENT ON INDEX "slice_den"."__review_analyze_output_ix_root_txmlnhynqs" IS 'btree index ReviewAnalyzeOutput(root)';

COMMENT ON INDEX "slice_den"."__review_claim_ix_root_step_ouvkclqzzd_pred_attempt_y5c5zv3vi7" IS 'btree index ReviewClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__review_done_ix_root_step_wex3643ujb" IS 'btree index ReviewDone(root, step)';

COMMENT ON INDEX "slice_den"."__review_ended_ix_root_step_7lrp7igbee" IS 'btree index ReviewEnded(root, step)';

COMMENT ON INDEX "slice_den"."__review_exhausted_ix_root_a6onvxywcp" IS 'btree index ReviewExhausted(root)';

COMMENT ON INDEX "slice_den"."__review_failed_ix_root_step_cegc4opyjz" IS 'btree index ReviewFailed(root, step)';

COMMENT ON INDEX "slice_den"."__review_fenced_ix_root_hfika5dgn2" IS 'btree index ReviewFenced(root)';

COMMENT ON INDEX "slice_den"."__review_finish_ix_root_vnnzpwlvrw" IS 'btree index ReviewFinish(root)';

COMMENT ON INDEX "slice_den"."__review_finish_ix_scope_step_4k6s2nqgyy" IS 'btree index ReviewFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__review_gather_input_ix_review_f2zafhsmtj" IS 'btree index ReviewGatherInput(review)';

COMMENT ON INDEX "slice_den"."__review_gather_input_ix_root_step_wsoyzlnuyr" IS 'btree index ReviewGatherInput(root, step)';

COMMENT ON INDEX "slice_den"."__review_gather_input_sizes_ix_root_step_mjpuijzth_4_kjg5fulkoq" IS 'btree index ReviewGatherInputSizes(root, __step_mjpuijzth4, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__review_gather_input_sizes_ix_root_step_dargnvbdje" IS 'btree index ReviewGatherInputSizes(root, step)';

COMMENT ON INDEX "slice_den"."__review_gather_output_ix_root_5h75f2sreb" IS 'btree index ReviewGatherOutput(root)';

COMMENT ON INDEX "slice_den"."__review_held_ix_root_step_2vt6xmsrfi" IS 'btree index ReviewHeld(root, step)';

COMMENT ON INDEX "slice_den"."__review_hold_ix_resource_seat_3p66dnxzad" IS 'btree index ReviewHold(resource, seat)';

COMMENT ON INDEX "slice_den"."__review_hold_ix_root_escg5zeez6" IS 'btree index ReviewHold(root)';

COMMENT ON INDEX "slice_den"."__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" IS 'btree index ReviewPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__review_questions_finish_output_ix_root_4nx3bn5p6q" IS 'btree index ReviewQuestionsFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__review_questions_input_ix_root_scope_sy2ibbggdo" IS 'btree index ReviewQuestionsInput(root, scope)';

COMMENT ON INDEX "slice_den"."__review_refusal_ix_root_mlhjigotld" IS 'btree index ReviewRefusal(root)';

COMMENT ON INDEX "slice_den"."__review_result_ix_root_step_h2vlej63gu" IS 'btree index ReviewResult(root, step)';

COMMENT ON INDEX "slice_den"."__review_result_ix_step_outcome_root_lbrp6nyb6i" IS 'btree index ReviewResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__review_retry_ix_root_jzaljr6st4" IS 'btree index ReviewRetry(root)';

COMMENT ON INDEX "slice_den"."__review_review_run_finish_output_ix_root_qafu34k5sc" IS 'btree index ReviewReviewRunFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__review_review_run_input_ix_root_abc3mheba4" IS 'btree index ReviewReviewRunInput(root)';

COMMENT ON INDEX "slice_den"."__review_review_run_input_sizes_ix_root_scope_u_6_4kpsy5wss6" IS 'btree index ReviewReviewRunInputSizes(root, __scope_u6ypqf2r2z, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__review_review_run_input_sizes_ix_root_scope_2dnx7skohl" IS 'btree index ReviewReviewRunInputSizes(root, scope)';

COMMENT ON INDEX "slice_den"."__review_save_input_ix_root_step_xd5keujf45" IS 'btree index ReviewSaveInput(root, step)';

COMMENT ON INDEX "slice_den"."__review_save_output_ix_root_kjgtclpf33" IS 'btree index ReviewSaveOutput(root)';

COMMENT ON INDEX "slice_den"."__review_saved_ix_root_from_v3hbuyomqf" IS 'btree index ReviewSaved(root, from)';

COMMENT ON INDEX "slice_den"."__review_scope_ix_root_riuyuqzrup" IS 'btree index ReviewScope(root)';

COMMENT ON INDEX "slice_den"."__review_skipped_ix_by_6z5g634njq" IS 'btree index ReviewSkipped(by)';

COMMENT ON INDEX "slice_den"."__review_skipped_ix_root_qms5trih4o" IS 'btree index ReviewSkipped(root)';

COMMENT ON INDEX "slice_den"."__review_split_ix_root_from_p42z7fr7z4" IS 'btree index ReviewSplit(root, from)';

COMMENT ON INDEX "slice_den"."__review_start_scope_ix_root_scope_nki37x7g5o" IS 'btree index ReviewStartScope(root, scope)';

COMMENT ON INDEX "slice_den"."__review_start_step_ix_root_scope_hmuyhclidm" IS 'btree index ReviewStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__review_step_ix_root_scope_jvmzqg2kjy" IS 'btree index ReviewStep(root, scope)';

COMMENT ON INDEX "slice_den"."__review_step_ix_scope_kind_step_udhxex4i5c" IS 'btree index ReviewStep(scope, kind, step)';

COMMENT ON INDEX "slice_den"."__review_within_ix_parent_kind_scope_dtilr5xomp" IS 'btree index ReviewWithin(parent, kind, scope)';

COMMENT ON INDEX "slice_den"."__review_within_ix_root_parent_ah77vqo2bx" IS 'btree index ReviewWithin(root, parent)';

COMMENT ON INDEX "slice_den"."__sync_admitted_ix_root_vormyuqk5x" IS 'btree index SyncAdmitted(root)';

COMMENT ON INDEX "slice_den"."__sync_build_input_ix_root_step_azxcsmj373" IS 'btree index SyncBuildInput(root, step)';

COMMENT ON INDEX "slice_den"."__sync_build_output_ix_root_amskeycb7k" IS 'btree index SyncBuildOutput(root)';

COMMENT ON INDEX "slice_den"."__sync_claim_ix_root_step_ouvkclqzzd_pred_attempt_f3q5xsae3q" IS 'btree index SyncClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__sync_copy_input_ix_root_step_42uulsghoj" IS 'btree index SyncCopyInput(root, step)';

COMMENT ON INDEX "slice_den"."__sync_copy_output_ix_root_k6ia72urcq" IS 'btree index SyncCopyOutput(root)';

COMMENT ON INDEX "slice_den"."__sync_done_ix_root_step_ionbtp5et7" IS 'btree index SyncDone(root, step)';

COMMENT ON INDEX "slice_den"."__sync_ended_ix_root_xi7qlk4cj4" IS 'btree index SyncEnded(root)';

COMMENT ON INDEX "slice_den"."__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" IS 'btree index SyncExclusive(kind, key, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__sync_exclusive_key_ix_root_tfhjjf4qg2" IS 'btree index SyncExclusiveKey(root)';

COMMENT ON INDEX "slice_den"."__sync_exhausted_ix_root_yqhpt7jtz4" IS 'btree index SyncExhausted(root)';

COMMENT ON INDEX "slice_den"."__sync_failed_ix_root_step_iieo2dpdbf" IS 'btree index SyncFailed(root, step)';

COMMENT ON INDEX "slice_den"."__sync_fenced_ix_root_peedftug4f" IS 'btree index SyncFenced(root)';

COMMENT ON INDEX "slice_den"."__sync_finish_ix_root_zrpyhvrere" IS 'btree index SyncFinish(root)';

COMMENT ON INDEX "slice_den"."__sync_finish_ix_scope_step_owsw7m5w74" IS 'btree index SyncFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__sync_gold_finish_output_ix_root_gqwdl72ukv" IS 'btree index SyncGoldFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__sync_gold_input_ix_root_fmnsnept43" IS 'btree index SyncGoldInput(root)';

COMMENT ON INDEX "slice_den"."__sync_held_ix_root_yxqvodlkmy" IS 'btree index SyncHeld(root)';

COMMENT ON INDEX "slice_den"."__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" IS 'btree index SyncPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__sync_refusal_ix_root_642sem4ijz" IS 'btree index SyncRefusal(root)';

COMMENT ON INDEX "slice_den"."__sync_result_ix_root_step_t2jh3c7vsq" IS 'btree index SyncResult(root, step)';

COMMENT ON INDEX "slice_den"."__sync_retry_ix_root_j5nndics7d" IS 'btree index SyncRetry(root)';

COMMENT ON INDEX "slice_den"."__sync_scope_ix_root_7f6s5dqo5t" IS 'btree index SyncScope(root)';

COMMENT ON INDEX "slice_den"."__sync_skipped_ix_by_ttq6dm55n2" IS 'btree index SyncSkipped(by)';

COMMENT ON INDEX "slice_den"."__sync_skipped_ix_root_cjefss5pid" IS 'btree index SyncSkipped(root)';

COMMENT ON INDEX "slice_den"."__sync_start_step_ix_root_scope_5d3x6uas5c" IS 'btree index SyncStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__sync_step_ix_root_scope_l4sfn7gzd3" IS 'btree index SyncStep(root, scope)';

COMMENT ON INDEX "slice_den"."__sync_step_ix_scope_qlsdbwk3lt" IS 'btree index SyncStep(scope)';

COMMENT ON INDEX "slice_den"."__sync_sync_run_finish_output_ix_root_7lxs3t6qrm" IS 'btree index SyncSyncRunFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__sync_sync_run_input_ix_root_bp43cbf2uj" IS 'btree index SyncSyncRunInput(root)';

COMMENT ON INDEX "slice_den"."__writeback_admitted_ix_root_h3gyzivmzl" IS 'btree index WritebackAdmitted(root)';

COMMENT ON INDEX "slice_den"."__writeback_claim_ix_root_step_ouvkclqzzd_pred_vsh4c26q54" IS 'btree index WritebackClaim(root, __step_ouvkclqzzd, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__writeback_deliver_input_ix_root_step_42hexztzwm" IS 'btree index WritebackDeliverInput(root, step)';

COMMENT ON INDEX "slice_den"."__writeback_deliver_output_ix_root_65uep5rbzs" IS 'btree index WritebackDeliverOutput(root)';

COMMENT ON INDEX "slice_den"."__writeback_done_ix_root_step_dxzcxsyzki" IS 'btree index WritebackDone(root, step)';

COMMENT ON INDEX "slice_den"."__writeback_ended_ix_root_22eyuup6mt" IS 'btree index WritebackEnded(root)';

COMMENT ON INDEX "slice_den"."__writeback_exhausted_ix_root_cvj7pxcezh" IS 'btree index WritebackExhausted(root)';

COMMENT ON INDEX "slice_den"."__writeback_failed_ix_root_step_r27jysgea6" IS 'btree index WritebackFailed(root, step)';

COMMENT ON INDEX "slice_den"."__writeback_fenced_ix_root_jynr6i3m3n" IS 'btree index WritebackFenced(root)';

COMMENT ON INDEX "slice_den"."__writeback_finish_ix_root_7jp3nmlcxk" IS 'btree index WritebackFinish(root)';

COMMENT ON INDEX "slice_den"."__writeback_finish_ix_scope_step_6ooh2ahmws" IS 'btree index WritebackFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__writeback_held_ix_root_htj435svmc" IS 'btree index WritebackHeld(root)';

COMMENT ON INDEX "slice_den"."__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" IS 'btree index WritebackPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__writeback_refusal_ix_root_rpqfuncax3" IS 'btree index WritebackRefusal(root)';

COMMENT ON INDEX "slice_den"."__writeback_result_ix_root_step_m7c5flfb7z" IS 'btree index WritebackResult(root, step)';

COMMENT ON INDEX "slice_den"."__writeback_retry_ix_root_jksgr5toee" IS 'btree index WritebackRetry(root)';

COMMENT ON INDEX "slice_den"."__writeback_scope_ix_root_kaxydmiokb" IS 'btree index WritebackScope(root)';

COMMENT ON INDEX "slice_den"."__writeback_skipped_ix_by_3ei4k4fj53" IS 'btree index WritebackSkipped(by)';

COMMENT ON INDEX "slice_den"."__writeback_skipped_ix_root_ss2ptzee7p" IS 'btree index WritebackSkipped(root)';

COMMENT ON INDEX "slice_den"."__writeback_start_step_ix_root_scope_azon5ljjqq" IS 'btree index WritebackStartStep(root, scope)';

COMMENT ON INDEX "slice_den"."__writeback_step_ix_root_scope_oebhktgfcr" IS 'btree index WritebackStep(root, scope)';

COMMENT ON INDEX "slice_den"."__writeback_step_ix_scope_smnbmwitav" IS 'btree index WritebackStep(scope)';

COMMENT ON INDEX "slice_den"."__writeback_writeback_finish_output_ix_root_4g3n3nyiax" IS 'btree index WritebackWritebackFinishOutput(root)';

COMMENT ON INDEX "slice_den"."__writeback_writeback_input_ix_root_fhpchifc4b" IS 'btree index WritebackWritebackInput(root)';

COMMENT ON STATISTICS "slice_den"."__assign_finish_stats_scope_step_ld6jyxztu6" IS 'statistics AssignFinish(scope, step)';

COMMENT ON STATISTICS "slice_den"."__assign_step_stats_kind_scope_wiztsdmmtf" IS 'statistics AssignStep(kind, scope)';

COMMENT ON STATISTICS "slice_den"."__chain_finish_stats_scope_step_z7lvm6j2l6" IS 'statistics ChainFinish(scope, step)';

COMMENT ON STATISTICS "slice_den"."__chain_step_stats_kind_scope_tc5nmidpxu" IS 'statistics ChainStep(kind, scope)';

COMMENT ON STATISTICS "slice_den"."__clock_finish_stats_scope_step_ejqaucw3q4" IS 'statistics ClockFinish(scope, step)';

COMMENT ON STATISTICS "slice_den"."__fan_finish_stats_scope_step_4mm4p6zm66" IS 'statistics FanFinish(scope, step)';

COMMENT ON STATISTICS "slice_den"."__fan_step_stats_kind_scope_xmuvugpu6n" IS 'statistics FanStep(kind, scope)';

COMMENT ON STATISTICS "slice_den"."__fan_within_stats_kind_parent_3vvpgco4da" IS 'statistics FanWithin(kind, parent)';

COMMENT ON STATISTICS "slice_den"."__retry_finish_stats_scope_step_2nxi4d7tdj" IS 'statistics RetryFinish(scope, step)';

COMMENT ON STATISTICS "slice_den"."__retry_step_stats_kind_scope_osnqmvpfhd" IS 'statistics RetryStep(kind, scope)';

COMMENT ON STATISTICS "slice_den"."__review_finish_stats_scope_step_ac6ft3yr6e" IS 'statistics ReviewFinish(scope, step)';

COMMENT ON STATISTICS "slice_den"."__review_step_stats_kind_scope_kgaij4jpus" IS 'statistics ReviewStep(kind, scope)';

COMMENT ON STATISTICS "slice_den"."__review_within_stats_kind_parent_w3ajh3gekc" IS 'statistics ReviewWithin(kind, parent)';

COMMENT ON STATISTICS "slice_den"."__sync_exclusive_stats_key_kind_smed76p3zh" IS 'statistics SyncExclusive(key, kind)';

COMMENT ON STATISTICS "slice_den"."__sync_finish_stats_scope_step_xiaq6np7mf" IS 'statistics SyncFinish(scope, step)';

COMMENT ON STATISTICS "slice_den"."__writeback_finish_stats_scope_step_3knpjnabow" IS 'statistics WritebackFinish(scope, step)';

COMMENT ON FUNCTION "slice"."__reader_news_assign_assignment_input_veyxb2wi4k"() IS 'the reader of the delta of news of AssignAssignmentInput';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_assignment_input_ueoz7uj2et"() IS 'the reader of the delta of olds of AssignAssignmentInput';

COMMENT ON FUNCTION "slice"."__reader_news_assign_assignment_input_mode_nearest_6th6cbuqwb"() IS 'the reader of the delta of news of AssignAssignmentInputModeNearest';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_assignment_input_mode_nearest_ykzrrv4ft7"() IS 'the reader of the delta of olds of AssignAssignmentInputModeNearest';

COMMENT ON FUNCTION "slice"."__reader_news_assign_assignment_input_mode_within_7kcj4smusi"() IS 'the reader of the delta of news of AssignAssignmentInputModeWithin';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_assignment_input_mode_within_dyusbik3ul"() IS 'the reader of the delta of olds of AssignAssignmentInputModeWithin';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_fg3qammcok"() IS 'the reader of the delta of news of AssignDecideInput';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_input_5h5ccyocm7"() IS 'the reader of the delta of olds of AssignDecideInput';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_mode_nearest_gb4gtm3ryn"() IS 'the reader of the delta of news of AssignDecideInputModeNearest';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_input_mode_nearest_aimvhdfleo"() IS 'the reader of the delta of olds of AssignDecideInputModeNearest';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_mode_within_7tva4i3iph"() IS 'the reader of the delta of news of AssignDecideInputModeWithin';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_input_mode_within_2weywdd2zq"() IS 'the reader of the delta of olds of AssignDecideInputModeWithin';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_output_xaj2vprd4q"() IS 'the reader of the delta of news of AssignDecideOutput';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_output_efvbruv34o"() IS 'the reader of the delta of olds of AssignDecideOutput';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_output_stage_rest_y7e6zv4m2m"() IS 'the reader of the delta of news of AssignDecideOutputStageRest';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_output_stage_rest_wmwxfaf2qm"() IS 'the reader of the delta of olds of AssignDecideOutputStageRest';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_output_stage_serve_27litht4tq"() IS 'the reader of the delta of news of AssignDecideOutputStageServe';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_output_stage_serve_kjkxthc47t"() IS 'the reader of the delta of olds of AssignDecideOutputStageServe';

COMMENT ON FUNCTION "slice"."__reader_news_assign_done_t6zgmbnf5g"() IS 'the reader of the delta of news of AssignDone';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_h7m4bpt2hd"() IS 'the reader of the delta of news of AssignEmbedInput';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_embed_input_6i7aqfbvee"() IS 'the reader of the delta of olds of AssignEmbedInput';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_mode_nearest_grselmywxw"() IS 'the reader of the delta of news of AssignEmbedInputModeNearest';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_embed_input_mode_nearest_5lwnu4ih5d"() IS 'the reader of the delta of olds of AssignEmbedInputModeNearest';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_mode_within_zjtexkggl6"() IS 'the reader of the delta of news of AssignEmbedInputModeWithin';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_embed_input_mode_within_o6gzsx6tic"() IS 'the reader of the delta of olds of AssignEmbedInputModeWithin';

COMMENT ON FUNCTION "slice"."__reader_news_assign_failed_3fwuzoo5wq"() IS 'the reader of the delta of news of AssignFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_result_jkusfe56os"() IS 'the reader of the delta of olds of AssignResult';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_root_bo6iae5w4l"() IS 'the reader of the delta of olds of AssignRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_step_zgkm42uz2f"() IS 'the reader of the delta of olds of AssignStep';

COMMENT ON FUNCTION "slice"."__reader_news_chain_chain_run_input_ayshrrgjp7"() IS 'the reader of the delta of news of ChainChainRunInput';

COMMENT ON FUNCTION "slice"."__reader_news_chain_done_spjx62oij2"() IS 'the reader of the delta of news of ChainDone';

COMMENT ON FUNCTION "slice"."__reader_news_chain_failed_slqqazjxe5"() IS 'the reader of the delta of news of ChainFailed';

COMMENT ON FUNCTION "slice"."__reader_news_chain_ordered_input_2a5i7dk7zu"() IS 'the reader of the delta of news of ChainOrderedInput';

COMMENT ON FUNCTION "slice"."__reader_news_chain_page_input_obmb52egoq"() IS 'the reader of the delta of news of ChainPageInput';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_result_nva6clqovh"() IS 'the reader of the delta of olds of ChainResult';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_root_ni4mqcrglt"() IS 'the reader of the delta of olds of ChainRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_step_yztqk3nrsj"() IS 'the reader of the delta of olds of ChainStep';

COMMENT ON FUNCTION "slice"."__reader_news_clock_chime_input_bdjnydebk4"() IS 'the reader of the delta of news of ClockChimeInput';

COMMENT ON FUNCTION "slice"."__reader_news_clock_close_input_ew3vn6itfg"() IS 'the reader of the delta of news of ClockCloseInput';

COMMENT ON FUNCTION "slice"."__reader_news_clock_done_wdid4fihtt"() IS 'the reader of the delta of news of ClockDone';

COMMENT ON FUNCTION "slice"."__reader_news_clock_failed_valmjzds6g"() IS 'the reader of the delta of news of ClockFailed';

COMMENT ON FUNCTION "slice"."__reader_news_clock_hourly_input_egxn7iaxe3"() IS 'the reader of the delta of news of ClockHourlyInput';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_result_j3aouqlor5"() IS 'the reader of the delta of olds of ClockResult';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_root_c4qx533oyq"() IS 'the reader of the delta of olds of ClockRoot';

COMMENT ON FUNCTION "slice"."__reader_news_clock_sitting_input_4lbgwsxqze"() IS 'the reader of the delta of news of ClockSittingInput';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_step_pgxck5ertr"() IS 'the reader of the delta of olds of ClockStep';

COMMENT ON FUNCTION "slice"."__reader_news_fan_batch_input_zlj2bvajxq"() IS 'the reader of the delta of news of FanBatchInput';

COMMENT ON FUNCTION "slice"."__reader_news_fan_claim_c3x5lsopvv"() IS 'the reader of the delta of news of FanClaim';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_claim_ay7krkpmts"() IS 'the reader of the delta of olds of FanClaim';

COMMENT ON FUNCTION "slice"."__reader_news_fan_done_qikk2ro7ie"() IS 'the reader of the delta of news of FanDone';

COMMENT ON FUNCTION "slice"."__reader_news_fan_dust_input_jfwjtz36au"() IS 'the reader of the delta of news of FanDustInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_ended_gs4jd5beu6"() IS 'the reader of the delta of olds of FanEnded';

COMMENT ON FUNCTION "slice"."__reader_news_fan_failed_dhjopwnfpe"() IS 'the reader of the delta of news of FanFailed';

COMMENT ON FUNCTION "slice"."__reader_news_fan_fan_run_input_d3a2vsmwx6"() IS 'the reader of the delta of news of FanFanRunInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_held_nqvfb5gffm"() IS 'the reader of the delta of olds of FanHeld';

COMMENT ON FUNCTION "slice"."__reader_news_fan_hold_2iorpqkqi2"() IS 'the reader of the delta of news of FanHold';

COMMENT ON FUNCTION "slice"."__reader_news_fan_mop_input_y2wt46ygp5"() IS 'the reader of the delta of news of FanMopInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_result_5zw7ij7lso"() IS 'the reader of the delta of olds of FanResult';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_root_abpcubdn64"() IS 'the reader of the delta of olds of FanRoot';

COMMENT ON FUNCTION "slice"."__reader_news_fan_square_input_p7ron44s5l"() IS 'the reader of the delta of news of FanSquareInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_step_aw2226k2ta"() IS 'the reader of the delta of olds of FanStep';

COMMENT ON FUNCTION "slice"."__reader_news_fan_sweep_input_c5ive5rbnx"() IS 'the reader of the delta of news of FanSweepInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_within_aj2imfabum"() IS 'the reader of the delta of olds of FanWithin';

COMMENT ON FUNCTION "slice"."__reader_news_retry_brittle_input_cpjzfvx4th"() IS 'the reader of the delta of news of RetryBrittleInput';

COMMENT ON FUNCTION "slice"."__reader_news_retry_done_37ae4vspu2"() IS 'the reader of the delta of news of RetryDone';

COMMENT ON FUNCTION "slice"."__reader_news_retry_failed_axjpxxtyqh"() IS 'the reader of the delta of news of RetryFailed';

COMMENT ON FUNCTION "slice"."__reader_news_retry_ladders_input_kiwkqvgdlb"() IS 'the reader of the delta of news of RetryLaddersInput';

COMMENT ON FUNCTION "slice"."__reader_news_retry_patient_input_gmjeirl4oe"() IS 'the reader of the delta of news of RetryPatientInput';

COMMENT ON FUNCTION "slice"."__reader_news_retry_polite_input_ldefi4pvmz"() IS 'the reader of the delta of news of RetryPoliteInput';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_result_uld336hsbx"() IS 'the reader of the delta of olds of RetryResult';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_root_zt6nf2bapk"() IS 'the reader of the delta of olds of RetryRoot';

COMMENT ON FUNCTION "slice"."__reader_news_retry_steadfast_input_vfnxzktspv"() IS 'the reader of the delta of news of RetrySteadfastInput';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_step_amtt4wxs2b"() IS 'the reader of the delta of olds of RetryStep';

COMMENT ON FUNCTION "slice"."__reader_news_retry_throttled_input_kpr6dfwzt7"() IS 'the reader of the delta of news of RetryThrottledInput';

COMMENT ON FUNCTION "slice"."__reader_news_retry_unhurried_input_l62mxbi2cf"() IS 'the reader of the delta of news of RetryUnhurriedInput';

COMMENT ON FUNCTION "slice"."__reader_news_review_analyze_input_rsdjisdchq"() IS 'the reader of the delta of news of ReviewAnalyzeInput';

COMMENT ON FUNCTION "slice"."__reader_news_review_claim_xp5d4drk2z"() IS 'the reader of the delta of news of ReviewClaim';

COMMENT ON FUNCTION "slice"."__reader_olds_review_claim_z5cfjlvxqp"() IS 'the reader of the delta of olds of ReviewClaim';

COMMENT ON FUNCTION "slice"."__reader_news_review_done_p46zdvulgf"() IS 'the reader of the delta of news of ReviewDone';

COMMENT ON FUNCTION "slice"."__reader_olds_review_ended_ghabg3qvka"() IS 'the reader of the delta of olds of ReviewEnded';

COMMENT ON FUNCTION "slice"."__reader_news_review_failed_7yyyyl5zn7"() IS 'the reader of the delta of news of ReviewFailed';

COMMENT ON FUNCTION "slice"."__reader_news_review_gather_input_u5td2p2bbb"() IS 'the reader of the delta of news of ReviewGatherInput';

COMMENT ON FUNCTION "slice"."__reader_olds_review_held_xy53svgi5w"() IS 'the reader of the delta of olds of ReviewHeld';

COMMENT ON FUNCTION "slice"."__reader_news_review_hold_6wykfhuqkv"() IS 'the reader of the delta of news of ReviewHold';

COMMENT ON FUNCTION "slice"."__reader_news_review_questions_input_ds6zex53wd"() IS 'the reader of the delta of news of ReviewQuestionsInput';

COMMENT ON FUNCTION "slice"."__reader_olds_review_result_kqmhnbcsva"() IS 'the reader of the delta of olds of ReviewResult';

COMMENT ON FUNCTION "slice"."__reader_news_review_review_run_input_3kyxfgfsa6"() IS 'the reader of the delta of news of ReviewReviewRunInput';

COMMENT ON FUNCTION "slice"."__reader_olds_review_root_l2ui7dc3mf"() IS 'the reader of the delta of olds of ReviewRoot';

COMMENT ON FUNCTION "slice"."__reader_news_review_save_input_wwipjutxrs"() IS 'the reader of the delta of news of ReviewSaveInput';

COMMENT ON FUNCTION "slice"."__reader_olds_review_step_e6ycahnwqn"() IS 'the reader of the delta of olds of ReviewStep';

COMMENT ON FUNCTION "slice"."__reader_olds_review_within_pymnrslua3"() IS 'the reader of the delta of olds of ReviewWithin';

COMMENT ON FUNCTION "slice"."__reader_news_sync_build_input_eom6nwox2q"() IS 'the reader of the delta of news of SyncBuildInput';

COMMENT ON FUNCTION "slice"."__reader_news_sync_copy_input_vsrhmkgpx4"() IS 'the reader of the delta of news of SyncCopyInput';

COMMENT ON FUNCTION "slice"."__reader_news_sync_done_ug7pesikef"() IS 'the reader of the delta of news of SyncDone';

COMMENT ON FUNCTION "slice"."__reader_news_sync_failed_2ecpcuza2e"() IS 'the reader of the delta of news of SyncFailed';

COMMENT ON FUNCTION "slice"."__reader_news_sync_gold_input_n3swhlud7k"() IS 'the reader of the delta of news of SyncGoldInput';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_result_zh6zs3n256"() IS 'the reader of the delta of olds of SyncResult';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_root_4bbgymjint"() IS 'the reader of the delta of olds of SyncRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_step_tfxcx6pquc"() IS 'the reader of the delta of olds of SyncStep';

COMMENT ON FUNCTION "slice"."__reader_news_sync_sync_run_input_rw5sv56z2f"() IS 'the reader of the delta of news of SyncSyncRunInput';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_deliver_input_3mejicjxtj"() IS 'the reader of the delta of news of WritebackDeliverInput';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_done_np4xezy62h"() IS 'the reader of the delta of news of WritebackDone';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_failed_66tuuxudwu"() IS 'the reader of the delta of news of WritebackFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_result_pcbgqjqnz3"() IS 'the reader of the delta of olds of WritebackResult';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_root_g37ojsvjj2"() IS 'the reader of the delta of olds of WritebackRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_step_5z6akmweto"() IS 'the reader of the delta of olds of WritebackStep';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_writeback_input_jtjqqvb2rh"() IS 'the reader of the delta of news of WritebackWritebackInput';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_6e3nlau6nz"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over its units';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_y62xbwmnnf"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_in_assign_root_fucur5xtc2"() IS 'the rule judge''s block of rule AssignAssignmentInput(scope) in AssignRoot(scope) where Logic.eq(kind, "Assignment") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_in_assign_jyp7e2lrzq"() IS 'the rule judge''s block of rule AssignAssignmentInput(scope, root) where Logic.eq(mode, "Nearest") in AssignAssignmentInputModeNearest(scope, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_in_assign_tgr3baerv7"() IS 'the rule judge''s block of rule AssignAssignmentInput(scope, root) where Logic.eq(mode, "Within") in AssignAssignmentInputModeWithin(scope, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_in_mo3j6uqsnf"() IS 'the rule judge''s block of rule AssignAssignmentInputModeNearest(scope, root) in AssignAssignmentInput(scope, root) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_within_in_il2qvjj37u"() IS 'the rule judge''s block of rule AssignAssignmentInputModeWithin(scope, root) in AssignAssignmentInput(scope, root) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_in_assign_step_hfbi43oizs"() IS 'the rule judge''s block of rule AssignDecideInput(step, root) in AssignStep(step, root) where Logic.eq(kind, "Decide") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_in_assign_decide_clfryockug"() IS 'the rule judge''s block of rule AssignDecideInput(step, root) where Logic.eq(mode, "Nearest") in AssignDecideInputModeNearest(step, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_in_assign_decide_ojsup375nb"() IS 'the rule judge''s block of rule AssignDecideInput(step, root) where Logic.eq(mode, "Within") in AssignDecideInputModeWithin(step, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_in_assign_y2w6nsotun"() IS 'the rule judge''s block of rule AssignDecideInputModeNearest(step, root) in AssignDecideInput(step, root) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_within_in_assign_2oydvottnt"() IS 'the rule judge''s block of rule AssignDecideInputModeWithin(step, root) in AssignDecideInput(step, root) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_in_assign_decide_hzvhvy4pkp"() IS 'the rule judge''s block of rule AssignDecideOutput(step, root) where Logic.eq(stage, "Rest") in AssignDecideOutputStageRest(step, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_in_assign_decide_zaxniaogzl"() IS 'the rule judge''s block of rule AssignDecideOutput(step, root) where Logic.eq(stage, "Serve") in AssignDecideOutputStageServe(step, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_in_assign_4ubf2lemaj"() IS 'the rule judge''s block of rule AssignDecideOutputStageRest(step, root) in AssignDecideOutput(step, root) where Logic.eq(stage, "Rest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_serve_in_assign_2jnl3lwnmh"() IS 'the rule judge''s block of rule AssignDecideOutputStageServe(step, root) in AssignDecideOutput(step, root) where Logic.eq(stage, "Serve") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_done_in_assign_result_j6c4uiros5"() IS 'the rule judge''s block of rule AssignDone(step, root) in AssignResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_in_assign_step_wrsrhwzyst"() IS 'the rule judge''s block of rule AssignEmbedInput(step, root) in AssignStep(step, root) where Logic.eq(kind, "Embed") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_in_assign_embed_2rth3nslo2"() IS 'the rule judge''s block of rule AssignEmbedInput(step, root) where Logic.eq(mode, "Nearest") in AssignEmbedInputModeNearest(step, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_in_assign_embed_pm4oczf3sa"() IS 'the rule judge''s block of rule AssignEmbedInput(step, root) where Logic.eq(mode, "Within") in AssignEmbedInputModeWithin(step, root) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_nearest_in_assign_acwx4vbq35"() IS 'the rule judge''s block of rule AssignEmbedInputModeNearest(step, root) in AssignEmbedInput(step, root) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_within_in_assign_aijacij5el"() IS 'the rule judge''s block of rule AssignEmbedInputModeWithin(step, root) in AssignEmbedInput(step, root) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_failed_in_assign_result_ticeu2j7t2"() IS 'the rule judge''s block of rule AssignFailed(step, root) in AssignResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_chain_run_input_in_chain_root_ux4ikrdsgt"() IS 'the rule judge''s block of rule ChainChainRunInput(scope) in ChainRoot(scope) where Logic.eq(kind, "ChainRun") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_done_in_chain_result_wnhaqzyijh"() IS 'the rule judge''s block of rule ChainDone(step, root) in ChainResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_failed_in_chain_result_tfttqv3aiv"() IS 'the rule judge''s block of rule ChainFailed(step, root) in ChainResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_ordered_input_in_chain_root_rvnnqex5ml"() IS 'the rule judge''s block of rule ChainOrderedInput(scope) in ChainRoot(scope) where Logic.eq(kind, "Ordered") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_page_input_in_chain_step_jate5ppivp"() IS 'the rule judge''s block of rule ChainPageInput(step, root) in ChainStep(step, root) where Logic.eq(kind, "Page") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_chime_input_in_clock_step_spbf5y4jrm"() IS 'the rule judge''s block of rule ClockChimeInput(step, root) in ClockStep(step, root) where Logic.eq(kind, "Chime") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_close_input_in_clock_step_6ly2bkkca6"() IS 'the rule judge''s block of rule ClockCloseInput(step, root) in ClockStep(step, root) where Logic.eq(kind, "Close") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_done_in_clock_result_33mmpntm6t"() IS 'the rule judge''s block of rule ClockDone(step, root) in ClockResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_failed_in_clock_result_pg3e6echho"() IS 'the rule judge''s block of rule ClockFailed(step, root) in ClockResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_input_in_clock_root_xgdkpdjg3e"() IS 'the rule judge''s block of rule ClockHourlyInput(scope) in ClockRoot(scope) where Logic.eq(kind, "Hourly") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_sitting_input_in_clock_root_7t3nbt3t7m"() IS 'the rule judge''s block of rule ClockSittingInput(scope) in ClockRoot(scope) where Logic.eq(kind, "Sitting") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_batch_input_in_fan_within_ppdif25y44"() IS 'the rule judge''s block of rule FanBatchInput(scope, root) in FanWithin(scope, root) where Logic.eq(kind, "Batch") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_done_in_fan_result_wushxyarzm"() IS 'the rule judge''s block of rule FanDone(step, root) in FanResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_dust_input_in_fan_step_izcmwrsl4s"() IS 'the rule judge''s block of rule FanDustInput(step, root) in FanStep(step, root) where Logic.eq(kind, "Dust") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_failed_in_fan_result_kktt5kynos"() IS 'the rule judge''s block of rule FanFailed(step, root) in FanResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_fan_run_input_in_fan_root_ossndrkclk"() IS 'the rule judge''s block of rule FanFanRunInput(scope) in FanRoot(scope) where Logic.eq(kind, "FanRun") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_mop_input_in_fan_step_j6abycd64c"() IS 'the rule judge''s block of rule FanMopInput(step, root) in FanStep(step, root) where Logic.eq(kind, "Mop") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_square_input_in_fan_step_4e6tv7sdz5"() IS 'the rule judge''s block of rule FanSquareInput(step, root) in FanStep(step, root) where Logic.eq(kind, "Square") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_sweep_input_in_fan_root_uzzo4js56i"() IS 'the rule judge''s block of rule FanSweepInput(scope) in FanRoot(scope) where Logic.eq(kind, "Sweep") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_brittle_input_in_retry_step_23i7vhzkia"() IS 'the rule judge''s block of rule RetryBrittleInput(step, root) in RetryStep(step, root) where Logic.eq(kind, "Brittle") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_done_in_retry_result_5brvxprgnj"() IS 'the rule judge''s block of rule RetryDone(step, root) in RetryResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_failed_in_retry_result_n5bywcag6u"() IS 'the rule judge''s block of rule RetryFailed(step, root) in RetryResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_ladders_input_in_retry_root_xv6getxuuy"() IS 'the rule judge''s block of rule RetryLaddersInput(scope) in RetryRoot(scope) where Logic.eq(kind, "Ladders") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_patient_input_in_retry_step_xywdowirct"() IS 'the rule judge''s block of rule RetryPatientInput(step, root) in RetryStep(step, root) where Logic.eq(kind, "Patient") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_polite_input_in_retry_step_nbcuyd2ijc"() IS 'the rule judge''s block of rule RetryPoliteInput(step, root) in RetryStep(step, root) where Logic.eq(kind, "Polite") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_steadfast_input_in_retry_step_vryivumwcc"() IS 'the rule judge''s block of rule RetrySteadfastInput(step, root) in RetryStep(step, root) where Logic.eq(kind, "Steadfast") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_throttled_input_in_retry_root_rhnudvt2p2"() IS 'the rule judge''s block of rule RetryThrottledInput(scope) in RetryRoot(scope) where Logic.eq(kind, "Throttled") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_unhurried_input_in_retry_root_tqbunf4bhq"() IS 'the rule judge''s block of rule RetryUnhurriedInput(scope) in RetryRoot(scope) where Logic.eq(kind, "Unhurried") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_analyze_input_in_review_step_oobtlr3tcd"() IS 'the rule judge''s block of rule ReviewAnalyzeInput(step, root) in ReviewStep(step, root) where Logic.eq(kind, "Analyze") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_done_in_review_result_hxvg2w4cbf"() IS 'the rule judge''s block of rule ReviewDone(step, root) in ReviewResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_failed_in_review_result_chl4yi5pgr"() IS 'the rule judge''s block of rule ReviewFailed(step, root) in ReviewResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_gather_input_in_review_step_4ipeynhyjw"() IS 'the rule judge''s block of rule ReviewGatherInput(step, root) in ReviewStep(step, root) where Logic.eq(kind, "Gather") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_questions_input_in_review_within_t3stnfku6a"() IS 'the rule judge''s block of rule ReviewQuestionsInput(scope, root) in ReviewWithin(scope, root) where Logic.eq(kind, "Questions") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_review_run_input_in_review_root_b6hoarpitr"() IS 'the rule judge''s block of rule ReviewReviewRunInput(scope) in ReviewRoot(scope) where Logic.eq(kind, "ReviewRun") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_save_input_in_review_step_kbxiktw5le"() IS 'the rule judge''s block of rule ReviewSaveInput(step, root) in ReviewStep(step, root) where Logic.eq(kind, "Save") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_build_input_in_sync_step_5hb3b2qr4g"() IS 'the rule judge''s block of rule SyncBuildInput(step, root) in SyncStep(step, root) where Logic.eq(kind, "Build") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_copy_input_in_sync_step_mtfbq5j4zz"() IS 'the rule judge''s block of rule SyncCopyInput(step, root) in SyncStep(step, root) where Logic.eq(kind, "Copy") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_done_in_sync_result_2xloi3e4ph"() IS 'the rule judge''s block of rule SyncDone(step, root) in SyncResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_failed_in_sync_result_mgqtpflxyw"() IS 'the rule judge''s block of rule SyncFailed(step, root) in SyncResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_gold_input_in_sync_root_tpcbxewzp5"() IS 'the rule judge''s block of rule SyncGoldInput(scope) in SyncRoot(scope) where Logic.eq(kind, "Gold") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_sync_run_input_in_sync_root_gfkias4ih5"() IS 'the rule judge''s block of rule SyncSyncRunInput(scope) in SyncRoot(scope) where Logic.eq(kind, "SyncRun") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_deliver_input_in_writeback_step_joegaqav3s"() IS 'the rule judge''s block of rule WritebackDeliverInput(step, root) in WritebackStep(step, root) where Logic.eq(kind, "Deliver") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_done_in_writeback_result_uv6qtolmg7"() IS 'the rule judge''s block of rule WritebackDone(step, root) in WritebackResult(step, root) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_failed_in_writeback_result_byweufumph"() IS 'the rule judge''s block of rule WritebackFailed(step, root) in WritebackResult(step, root) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_writeback_input_in_writeback_root_ok6yqclv73"() IS 'the rule judge''s block of rule WritebackWritebackInput(scope) in WritebackRoot(scope) where Logic.eq(kind, "Writeback") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_tml3jzipqt"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write adds to FanClaim';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_rsvzhfp6ug"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write removes from FanEnded';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_5pedmcfadq"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write removes from FanHeld';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_nru5iz6quv"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write adds to FanHold';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_546bvon4yy"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write adds to ReviewClaim';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_ogqous6mhr"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write removes from ReviewEnded';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_btbkuztx56"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write removes from ReviewHeld';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_ahhaxk5zwx"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write adds to ReviewHold';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_cfpudo5xt3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignAssignmentInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_jiz464vxuo"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignAssignmentInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_ryk4kznrmg"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_hc5ilv4sea"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_uprvea4no6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideOutput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_irdavmdqjh"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideOutputStageRest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_done_hjsux6cb6r"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_nearest_3xhwbfkrlv"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignEmbedInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_chain_run_input_4tynr34uo4"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainChainRunInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_done_7blz2jjczl"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_page_input_22qgggq3id"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainPageInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_chime_input_qujlwtonhn"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockChimeInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_done_nw5m6y7otq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_input_bhn32ylnog"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockHourlyInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_batch_input_zonhzu34ui"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanBatchInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_claim_rhdccyzbft"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_done_2nmscmmvlu"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_dust_input_6snexwuzoz"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanDustInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_fan_run_input_nkqfphwq7l"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanFanRunInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_brittle_input_ltwi3gczlm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryBrittleInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_done_us2mduacrm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_ladders_input_qztbyqmgj4"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryLaddersInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_analyze_input_cfqtz7uc7g"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewAnalyzeInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_claim_mpwuwsjlyd"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_done_xzuqwzrsjm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_questions_input_bu3kdyq5g3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewQuestionsInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_review_run_input_wzvehym5wt"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewReviewRunInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_build_input_eaxvc2njxf"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncBuildInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_done_psjgmjlxp6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_gold_input_fizcntmwej"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncGoldInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_deliver_input_fun3xqfq7u"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackDeliverInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_done_c7valompmz"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_writeback_input_thz656irsp"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackWritebackInput and the relations its rules join it to';

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

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_q7sye4ocju"() IS 'immutability guard of AssignDecideOutput';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_stage_rest_2l67dyutkv"() IS 'immutability guard of AssignDecideOutputStageRest';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_stage_serve_bqiqmjczjs"() IS 'immutability guard of AssignDecideOutputStageServe';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_output_weighed_yiycf2llnn"() IS 'immutability guard of AssignDecideOutputWeighed';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_nearest_tjmdpadpgk"() IS 'immutability guard of AssignDecideReadNearest';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_nearest_row_lab3k5wovp"() IS 'immutability guard of AssignDecideReadNearestRow';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_seen_mmfte56fyk"() IS 'immutability guard of AssignDecideReadSeen';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_seen_row_fueqjd7hpy"() IS 'immutability guard of AssignDecideReadSeenRow';

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

COMMENT ON FUNCTION "slice"."__immutable_assign_served_7za7irllan"() IS 'immutability guard of AssignServed';

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

COMMENT ON FUNCTION "slice"."__immutable_chain_page_input_ygs3x37afz"() IS 'immutability guard of ChainPageInput';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_input_after_ebt6pg2db2"() IS 'immutability guard of ChainPageInputAfter';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_output_jgnuxzjizs"() IS 'immutability guard of ChainPageOutput';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_output_next_lihvo4atmg"() IS 'immutability guard of ChainPageOutputNext';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_earlier_yueqwonh4d"() IS 'immutability guard of ChainPageReadEarlier';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_earlier_row_fptnzqkviy"() IS 'immutability guard of ChainPageReadEarlierRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_qm6sxo3gir"() IS 'immutability guard of ChainPageReadTree';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_items_qhpl2uhihv"() IS 'immutability guard of ChainPageReadTreeItems';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_row_vrfgoh54h3"() IS 'immutability guard of ChainPageReadTreeRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_weights_yybbt7ya2z"() IS 'immutability guard of ChainPageReadWeights';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_weights_row_gkwz27ked3"() IS 'immutability guard of ChainPageReadWeightsRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_tree_first_dx6efgvl7m"() IS 'immutability guard of ChainPageTreeFirst';

COMMENT ON FUNCTION "slice"."__immutable_chain_paused_aoyhzggt5w"() IS 'immutability guard of ChainPaused';

COMMENT ON FUNCTION "slice"."__immutable_chain_refusal_26czlahjb4"() IS 'immutability guard of ChainRefusal';

COMMENT ON FUNCTION "slice"."__immutable_chain_result_vjxlyihjif"() IS 'immutability guard of ChainResult';

COMMENT ON FUNCTION "slice"."__immutable_chain_resumed_pyb74if2ds"() IS 'immutability guard of ChainResumed';

COMMENT ON FUNCTION "slice"."__immutable_chain_retry_buegvn7dom"() IS 'immutability guard of ChainRetry';

COMMENT ON FUNCTION "slice"."__immutable_chain_root_kfhmbkwvfv"() IS 'immutability guard of ChainRoot';

COMMENT ON FUNCTION "slice"."__immutable_chain_scope_gfs52bg6zj"() IS 'immutability guard of ChainScope';

COMMENT ON FUNCTION "slice"."__immutable_chain_served_dqa4yeivrn"() IS 'immutability guard of ChainServed';

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

COMMENT ON FUNCTION "slice"."__immutable_clock_served_rxiknybpmu"() IS 'immutability guard of ClockServed';

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

COMMENT ON FUNCTION "slice"."__immutable_fan_served_xsm6rsme66"() IS 'immutability guard of FanServed';

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

COMMENT ON FUNCTION "slice"."__immutable_retry_served_hyzc4o4ezw"() IS 'immutability guard of RetryServed';

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

COMMENT ON FUNCTION "slice"."__immutable_review_served_klodk5ysgl"() IS 'immutability guard of ReviewServed';

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

COMMENT ON FUNCTION "slice"."__immutable_sync_served_a7364rtkid"() IS 'immutability guard of SyncServed';

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

COMMENT ON FUNCTION "slice"."__immutable_writeback_served_eyz5dxxige"() IS 'immutability guard of WritebackServed';

COMMENT ON FUNCTION "slice"."__immutable_writeback_skipped_mfw3kwqglv"() IS 'immutability guard of WritebackSkipped';

COMMENT ON FUNCTION "slice"."__immutable_writeback_start_step_b6lnnboie7"() IS 'immutability guard of WritebackStartStep';

COMMENT ON FUNCTION "slice"."__immutable_writeback_step_cr32x75nun"() IS 'immutability guard of WritebackStep';

COMMENT ON FUNCTION "slice"."__immutable_writeback_writeback_finish_output_uug5ky36fj"() IS 'immutability guard of WritebackWritebackFinishOutput';

COMMENT ON FUNCTION "slice"."__immutable_writeback_writeback_input_o6v4lziekt"() IS 'immutability guard of WritebackWritebackInput';

COMMENT ON ROLE :"__live_wzkq6p2yii" IS 'live source of slice';
