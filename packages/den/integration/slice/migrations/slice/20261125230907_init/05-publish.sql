CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice_den"."assign_admitted" ("root", "scope"), "slice_den"."assign_assignment_input" ("root", "scope"), "slice_den"."assign_assignment_input_exclude" ("root", "scope", "ordinal"), "slice_den"."assign_assignment_input_mode_nearest" ("root", "scope"), "slice_den"."assign_assignment_input_mode_within" ("root", "scope"), "slice_den"."assign_assignment_input_near" ("root", "scope", "ordinal"), "slice_den"."assign_claim" ("root", "step", "attempt"), "slice_den"."assign_decide_input" ("root", "step"), "slice_den"."assign_decide_input_exclude" ("root", "step", "ordinal"), "slice_den"."assign_decide_input_mode_nearest" ("root", "step"), "slice_den"."assign_decide_input_mode_within" ("root", "step"), "slice_den"."assign_decide_output" ("root", "step"), "slice_den"."assign_decide_output_stage_rest" ("root", "step"), "slice_den"."assign_decide_output_stage_serve" ("root", "step"), "slice_den"."assign_decide_output_weighed" ("root", "step", "ordinal"), "slice_den"."assign_decide_read_nearest" ("root", "step", "ordinal"), "slice_den"."assign_decide_read_nearest_row" ("digest"), "slice_den"."assign_decide_read_seen" ("root", "step", "ordinal"), "slice_den"."assign_decide_read_seen_row" ("digest"), "slice_den"."assign_embed_input" ("root", "step"), "slice_den"."assign_embed_input_exclude" ("root", "step", "ordinal"), "slice_den"."assign_embed_input_mode_nearest" ("root", "step"), "slice_den"."assign_embed_input_mode_within" ("root", "step"), "slice_den"."assign_embed_input_near" ("root", "step", "ordinal"), "slice_den"."assign_fenced" ("root", "step", "attempt"), "slice_den"."assign_finish" ("root", "scope"), "slice_den"."assign_held" ("root", "step"), "slice_den"."assign_paused" ("target", "turn"), "slice_den"."assign_result" ("root", "step"), "slice_den"."assign_resumed" ("target", "turn"), "slice_den"."assign_retry" ("root", "step", "attempt"), "slice_den"."assign_root" ("root"), "slice_den"."assign_scope" ("root", "scope"), "slice_den"."assign_skipped" ("root", "scope"), "slice_den"."assign_step" ("root", "step"), "slice"."assigned" ("learner"), "slice_den"."audit" ("step"), "slice"."built" ("build"), "slice_den"."chain_admitted" ("root", "scope"), "slice_den"."chain_chain_run_input" ("root", "scope"), "slice_den"."chain_claim" ("root", "step", "attempt"), "slice_den"."chain_fenced" ("root", "step", "attempt"), "slice_den"."chain_finish" ("root", "scope"), "slice_den"."chain_held" ("root", "step"), "slice_den"."chain_next" ("root", "from", "ordinal"), "slice_den"."chain_ordered_input" ("root", "scope"), "slice_den"."chain_page_input" ("root", "step"), "slice_den"."chain_page_input_after" ("root", "step"), "slice_den"."chain_page_output" ("root", "step"), "slice_den"."chain_page_output_next" ("root", "step"), "slice_den"."chain_page_read_earlier_row" ("digest"), "slice_den"."chain_page_read_tree" ("root", "step", "ordinal"), "slice_den"."chain_page_read_tree_items" ("digest", "at"), "slice_den"."chain_page_read_tree_row" ("digest"), "slice_den"."chain_page_read_weights" ("root", "step", "ordinal"), "slice_den"."chain_page_read_weights_row" ("digest"), "slice_den"."chain_page_tree_first" ("digest", "at"), "slice_den"."chain_paused" ("target", "turn"), "slice_den"."chain_requested_with" ("root"), "slice_den"."chain_result" ("root", "step"), "slice_den"."chain_resumed" ("target", "turn"), "slice_den"."chain_retry" ("root", "step", "attempt"), "slice_den"."chain_root" ("root"), "slice_den"."chain_scope" ("root", "scope"), "slice_den"."chain_skipped" ("root", "scope"), "slice_den"."chain_start_step" ("root", "scope", "ordinal"), "slice_den"."chain_step" ("root", "step"), "slice"."chimed" ("hour", "bell"), "slice_den"."clock_admitted" ("root", "scope"), "slice_den"."clock_chime_input" ("root", "step"), "slice_den"."clock_claim" ("root", "step", "attempt"), "slice_den"."clock_close_input" ("root", "step"), "slice_den"."clock_fenced" ("root", "step", "attempt"), "slice_den"."clock_finish" ("root", "scope"), "slice_den"."clock_held" ("root", "step"), "slice_den"."clock_hourly_input" ("root", "scope"), "slice_den"."clock_paused" ("target", "turn"), "slice_den"."clock_result" ("root", "step"), "slice_den"."clock_resumed" ("target", "turn"), "slice_den"."clock_retry" ("root", "step", "attempt"), "slice_den"."clock_root" ("root"), "slice_den"."clock_scope" ("root", "scope"), "slice_den"."clock_sitting_input" ("root", "scope"), "slice_den"."clock_skipped" ("root", "scope"), "slice_den"."clock_step" ("root", "step"), "slice"."concluded" ("learner"), "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."delivered" ("attempt"), "slice_den"."fan_admitted" ("root", "scope"), "slice_den"."fan_batch_finish_output" ("root", "step"), "slice_den"."fan_batch_input" ("root", "scope"), "slice_den"."fan_claim" ("root", "step", "attempt"), "slice_den"."fan_dust_input" ("root", "step"), "slice_den"."fan_ended" ("root", "step", "attempt"), "slice_den"."fan_exclusive" ("kind", "key", "turn"), "slice_den"."fan_exclusive_key" ("root", "scope"), "slice_den"."fan_fan_run_input" ("root", "scope"), "slice_den"."fan_fenced" ("root", "step", "attempt"), "slice_den"."fan_finish" ("root", "scope"), "slice_den"."fan_held" ("root", "step"), "slice_den"."fan_hold" ("resource", "root", "step", "attempt"), "slice_den"."fan_mop_input" ("root", "step"), "slice_den"."fan_paused" ("target", "turn"), "slice_den"."fan_released" ("kind", "key", "turn"), "slice_den"."fan_result" ("root", "step"), "slice_den"."fan_resumed" ("target", "turn"), "slice_den"."fan_retry" ("root", "step", "attempt"), "slice_den"."fan_root" ("root"), "slice_den"."fan_scope" ("root", "scope"), "slice_den"."fan_skipped" ("root", "scope"), "slice_den"."fan_square_input" ("root", "step"), "slice_den"."fan_square_output" ("root", "step"), "slice_den"."fan_start_scope" ("root", "scope", "ordinal"), "slice_den"."fan_start_step" ("root", "scope", "ordinal"), "slice_den"."fan_step" ("root", "step"), "slice_den"."fan_sweep_input" ("root", "scope"), "slice_den"."fan_wanted_input" ("root", "scope"), "slice_den"."fan_wanted_key" ("root"), "slice_den"."fan_within" ("root", "scope"), "slice"."heard" ("key"), "slice"."item" ("feed", "seq", "n"), "slice"."order" ("order"), "slice"."passage", "slice_den"."retry_admitted" ("root", "scope"), "slice_den"."retry_brittle_input" ("root", "step"), "slice_den"."retry_brittle_output" ("root", "step"), "slice_den"."retry_claim" ("root", "step", "attempt"), "slice_den"."retry_exhausted" ("root", "step"), "slice_den"."retry_fenced" ("root", "step", "attempt"), "slice_den"."retry_finish" ("root", "scope"), "slice_den"."retry_held" ("root", "step"), "slice_den"."retry_ladders_input" ("root", "scope"), "slice_den"."retry_patient_input" ("root", "step"), "slice_den"."retry_patient_output" ("root", "step"), "slice_den"."retry_paused" ("target", "turn"), "slice_den"."retry_polite_input" ("root", "step"), "slice_den"."retry_polite_output" ("root", "step"), "slice_den"."retry_result" ("root", "step"), "slice_den"."retry_resumed" ("target", "turn"), "slice_den"."retry_retry" ("root", "step", "attempt"), "slice_den"."retry_root" ("root"), "slice_den"."retry_scope" ("root", "scope"), "slice_den"."retry_skipped" ("root", "scope"), "slice_den"."retry_steadfast_input" ("root", "step"), "slice_den"."retry_steadfast_output" ("root", "step"), "slice_den"."retry_step" ("root", "step"), "slice_den"."retry_throttled_input" ("root", "scope"), "slice_den"."retry_unhurried_input" ("root", "scope"), "slice_den"."review_admitted" ("root", "scope"), "slice_den"."review_analyze_input" ("root", "step"), "slice_den"."review_analyze_output" ("root", "step"), "slice_den"."review_claim" ("root", "step", "attempt"), "slice_den"."review_ended" ("root", "step", "attempt"), "slice_den"."review_fenced" ("root", "step", "attempt"), "slice_den"."review_finish" ("root", "scope"), "slice_den"."review_gather_input" ("root", "step"), "slice_den"."review_gather_input_sizes" ("root", "step", "ordinal"), "slice_den"."review_held" ("root", "step"), "slice_den"."review_hold" ("resource", "root", "step", "attempt"), "slice_den"."review_paused" ("target", "turn"), "slice_den"."review_questions_finish_output" ("root", "step"), "slice_den"."review_questions_input" ("root", "scope"), "slice_den"."review_result" ("root", "step"), "slice_den"."review_resumed" ("target", "turn"), "slice_den"."review_retry" ("root", "step", "attempt"), "slice_den"."review_review_run_input" ("root", "scope"), "slice_den"."review_review_run_input_sizes" ("root", "scope", "ordinal"), "slice_den"."review_root" ("root"), "slice_den"."review_save_input" ("root", "step"), "slice_den"."review_save_output" ("root", "step"), "slice_den"."review_scope" ("root", "scope"), "slice_den"."review_skipped" ("root", "scope"), "slice_den"."review_step" ("root", "step"), "slice_den"."review_within" ("root", "scope"), "slice"."reviewed" ("review", "group"), "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."summary" ("review"), "slice_den"."sync_admitted" ("root", "scope"), "slice_den"."sync_build_input" ("root", "step"), "slice_den"."sync_claim" ("root", "step", "attempt"), "slice_den"."sync_copy_input" ("root", "step"), "slice_den"."sync_exclusive" ("kind", "key", "turn"), "slice_den"."sync_exclusive_key" ("root", "scope"), "slice_den"."sync_fenced" ("root", "step", "attempt"), "slice_den"."sync_finish" ("root", "scope"), "slice_den"."sync_gold_input" ("root", "scope"), "slice_den"."sync_held" ("root", "step"), "slice_den"."sync_paused" ("target", "turn"), "slice_den"."sync_released" ("kind", "key", "turn"), "slice_den"."sync_result" ("root", "step"), "slice_den"."sync_resumed" ("target", "turn"), "slice_den"."sync_retry" ("root", "step", "attempt"), "slice_den"."sync_root" ("root"), "slice_den"."sync_scope" ("root", "scope"), "slice_den"."sync_skipped" ("root", "scope"), "slice_den"."sync_step" ("root", "step"), "slice_den"."sync_sync_run_input" ("root", "scope"), "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice_den"."writeback_admitted" ("root", "scope"), "slice_den"."writeback_claim" ("root", "step", "attempt"), "slice_den"."writeback_deliver_input" ("root", "step"), "slice_den"."writeback_fenced" ("root", "step", "attempt"), "slice_den"."writeback_finish" ("root", "scope"), "slice_den"."writeback_held" ("root", "step"), "slice_den"."writeback_paused" ("target", "turn"), "slice_den"."writeback_result" ("root", "step"), "slice_den"."writeback_resumed" ("target", "turn"), "slice_den"."writeback_retry" ("root", "step", "attempt"), "slice_den"."writeback_root" ("root"), "slice_den"."writeback_scope" ("root", "scope"), "slice_den"."writeback_skipped" ("root", "scope"), "slice_den"."writeback_step" ("root", "step"), "slice_den"."writeback_writeback_input" ("root", "scope"), "slice"."__ledger"
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

CREATE SCHEMA "__slice";

CREATE SCHEMA "__slice_den";

CREATE SCHEMA "slice_seats__fan_coordinator";

CREATE SCHEMA "slice_seats__fan_den";

CREATE SCHEMA "slice_seats__review_coordinator";

CREATE SCHEMA "slice_seats__review_den";

CREATE VIEW "__slice"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

CREATE VIEW "__slice"."built" ("build") AS
SELECT "r1"."build"
FROM "slice"."built" AS "r1";

CREATE VIEW "__slice"."chimed" ("hour", "bell") AS
SELECT "r1"."hour", "r1"."bell"
FROM "slice"."chimed" AS "r1";

CREATE VIEW "__slice"."concluded" ("learner", "served", "weighed") AS
SELECT "r1"."learner", "r1"."served", "r1"."weighed"
FROM "slice"."concluded" AS "r1";

CREATE VIEW "__slice"."copied" ("relation", "run") AS
SELECT "r1"."relation", "r1"."run"
FROM "slice"."copied" AS "r1";

CREATE VIEW "__slice"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "__slice"."delivered" ("attempt") AS
SELECT "r1"."attempt"
FROM "slice"."delivered" AS "r1";

CREATE VIEW "__slice"."heard" ("key", "answered") AS
SELECT "r1"."key", "r1"."answered"
FROM "slice"."heard" AS "r1";

CREATE VIEW "__slice"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "__slice"."order" ("order", "feed", "feed_name") AS
SELECT "r1"."order", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text"
FROM "slice"."order" AS "r1";

CREATE VIEW "__slice"."passage" ("passage", "topic", "embedding") AS
SELECT "r1"."passage", "r1"."topic", "r1"."embedding"
FROM "slice"."passage" AS "r1";

CREATE VIEW "__slice"."reviewed" ("review", "group", "count", "total") AS
SELECT "r1"."review", "r1"."group", "r1"."count", "r1"."total"
FROM "slice"."reviewed" AS "r1";

CREATE VIEW "__slice"."seen" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."seen" AS "r1";

CREATE VIEW "__slice"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "__slice"."summary" ("review", "groups", "total") AS
SELECT "r1"."review", "r1"."groups", "r1"."total"
FROM "slice"."summary" AS "r1";

CREATE VIEW "__slice"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "__slice"."want" ("batch", "size") AS
SELECT "r1"."batch", "r1"."size"
FROM "slice"."want" AS "r1";

CREATE VIEW "__slice"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "__slice_den"."assign_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."assign_admitted" AS "r1";

CREATE VIEW "__slice_den"."assign_asked" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."assign_asked" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_assignment_finish_output" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input" ("root", "scope", "learner", "topic", "mode", "mode_name") AS
SELECT "r1"."root", "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_assignment_input" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_exclude" ("root", "scope", "ordinal", "value") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_assignment_input_exclude" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_mode_nearest" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."assign_assignment_input_mode_nearest" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_mode_within" ("root", "scope", "radius") AS
SELECT "r1"."root", "r1"."scope", "r1"."radius"
FROM "slice_den"."assign_assignment_input_mode_within" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_near" ("root", "scope", "ordinal", "value") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_assignment_input_near" AS "r1";

CREATE VIEW "__slice_den"."assign_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."assign_claim" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input" ("root", "step", "learner", "topic", "vector", "mode", "mode_name") AS
SELECT "r1"."root", "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_decide_input" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input_exclude" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_decide_input_exclude" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input_mode_nearest" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_decide_input_mode_nearest" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input_mode_within" ("root", "step", "radius") AS
SELECT "r1"."root", "r1"."step", "r1"."radius"
FROM "slice_den"."assign_decide_input_mode_within" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output" ("root", "step", "confidence", "stage", "stage_name") AS
SELECT "r1"."root", "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())["r1"."stage" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_decide_output" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output_stage_rest" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_decide_output_stage_rest" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output_stage_serve" ("root", "step", "passage", "distance") AS
SELECT "r1"."root", "r1"."step", "r1"."passage", "r1"."distance"
FROM "slice_den"."assign_decide_output_stage_serve" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output_weighed" ("root", "step", "ordinal", "passage", "distance", "passed") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed"
FROM "slice_den"."assign_decide_output_weighed" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_read_nearest" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."assign_decide_read_nearest" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_read_nearest_row" ("digest", "passage", "topic", "distance") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice_den"."assign_decide_read_nearest_row" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_read_seen" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."assign_decide_read_seen" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_read_seen_row" ("digest", "learner", "passage") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage"
FROM "slice_den"."assign_decide_read_seen_row" AS "r1";

CREATE VIEW "__slice_den"."assign_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_done" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input" ("root", "step", "learner", "topic", "mode", "mode_name") AS
SELECT "r1"."root", "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_embed_input" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_exclude" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_embed_input_exclude" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_mode_nearest" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_embed_input_mode_nearest" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_mode_within" ("root", "step", "radius") AS
SELECT "r1"."root", "r1"."step", "r1"."radius"
FROM "slice_den"."assign_embed_input_mode_within" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_near" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_embed_input_near" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_output" ("root", "step", "vector") AS
SELECT "r1"."root", "r1"."step", "r1"."vector"
FROM "slice_den"."assign_embed_output" AS "r1";

CREATE VIEW "__slice_den"."assign_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."assign_ended" AS "r1";

CREATE VIEW "__slice_den"."assign_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_exhausted" AS "r1";

CREATE VIEW "__slice_den"."assign_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_failed" AS "r1";

CREATE VIEW "__slice_den"."assign_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."assign_fenced" AS "r1";

CREATE VIEW "__slice_den"."assign_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."assign_finish" AS "r1";

CREATE VIEW "__slice_den"."assign_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."assign_held" AS "r1";

CREATE VIEW "__slice_den"."assign_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."assign_paused" AS "r1";

CREATE VIEW "__slice_den"."assign_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."assign_refusal" AS "r1";

CREATE VIEW "__slice_den"."assign_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."assign_requested_with" AS "r1";

CREATE VIEW "__slice_den"."assign_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_result" AS "r1";

CREATE VIEW "__slice_den"."assign_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."assign_resumed" AS "r1";

CREATE VIEW "__slice_den"."assign_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_retry" AS "r1";

CREATE VIEW "__slice_den"."assign_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."assign_root" AS "r1";

CREATE VIEW "__slice_den"."assign_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."assign_scope" AS "r1";

CREATE VIEW "__slice_den"."assign_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."assign_served" AS "r1";

CREATE VIEW "__slice_den"."assign_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."assign_skipped" AS "r1";

CREATE VIEW "__slice_den"."assign_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."assign_start_step" AS "r1";

CREATE VIEW "__slice_den"."assign_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."assign_step" AS "r1";

CREATE VIEW "__slice_den"."audit" ("step", "root", "note") AS
SELECT "r1"."step", "r1"."root", "r1"."note"
FROM "slice_den"."audit" AS "r1";

CREATE VIEW "__slice_den"."chain_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."chain_admitted" AS "r1";

CREATE VIEW "__slice_den"."chain_chain_run_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_chain_run_finish_output" AS "r1";

CREATE VIEW "__slice_den"."chain_chain_run_input" ("root", "scope", "feed", "feed_name", "pages") AS
SELECT "r1"."root", "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice_den"."chain_chain_run_input" AS "r1";

CREATE VIEW "__slice_den"."chain_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."chain_claim" AS "r1";

CREATE VIEW "__slice_den"."chain_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_done" AS "r1";

CREATE VIEW "__slice_den"."chain_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."chain_ended" AS "r1";

CREATE VIEW "__slice_den"."chain_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_exhausted" AS "r1";

CREATE VIEW "__slice_den"."chain_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_failed" AS "r1";

CREATE VIEW "__slice_den"."chain_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."chain_fenced" AS "r1";

CREATE VIEW "__slice_den"."chain_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."chain_finish" AS "r1";

CREATE VIEW "__slice_den"."chain_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."chain_held" AS "r1";

CREATE VIEW "__slice_den"."chain_next" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."chain_next" AS "r1";

CREATE VIEW "__slice_den"."chain_ordered_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_ordered_finish_output" AS "r1";

CREATE VIEW "__slice_den"."chain_ordered_input" ("root", "scope", "feed", "feed_name", "pages") AS
SELECT "r1"."root", "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice_den"."chain_ordered_input" AS "r1";

CREATE VIEW "__slice_den"."chain_page_input" ("root", "step", "feed", "feed_name", "seq", "pages") AS
SELECT "r1"."root", "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages"
FROM "slice_den"."chain_page_input" AS "r1";

CREATE VIEW "__slice_den"."chain_page_input_after" ("root", "step", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."value"
FROM "slice_den"."chain_page_input_after" AS "r1";

CREATE VIEW "__slice_den"."chain_page_output" ("root", "step", "seq", "items", "earlier") AS
SELECT "r1"."root", "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier"
FROM "slice_den"."chain_page_output" AS "r1";

CREATE VIEW "__slice_den"."chain_page_output_next" ("root", "step", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."value"
FROM "slice_den"."chain_page_output_next" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_earlier" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."chain_page_read_earlier" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_earlier_row" ("digest", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_earlier_row" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_tree" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."chain_page_read_tree" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_tree_items" ("digest", "at", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."at", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_tree_items" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_tree_row" ("digest", "feed", "feed_name", "factor", "items") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."items"
FROM "slice_den"."chain_page_read_tree_row" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_weights" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."chain_page_read_weights" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_weights_row" ("digest", "feed", "feed_name", "factor") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice_den"."chain_page_read_weights_row" AS "r1";

CREATE VIEW "__slice_den"."chain_page_tree_first" ("digest", "at") AS
SELECT "r1"."digest", "r1"."at"
FROM "slice_den"."chain_page_tree_first" AS "r1";

CREATE VIEW "__slice_den"."chain_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_paused" AS "r1";

CREATE VIEW "__slice_den"."chain_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."chain_refusal" AS "r1";

CREATE VIEW "__slice_den"."chain_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."chain_requested_with" AS "r1";

CREATE VIEW "__slice_den"."chain_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."chain_result" AS "r1";

CREATE VIEW "__slice_den"."chain_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_resumed" AS "r1";

CREATE VIEW "__slice_den"."chain_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."chain_retry" AS "r1";

CREATE VIEW "__slice_den"."chain_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."chain_root" AS "r1";

CREATE VIEW "__slice_den"."chain_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."chain_scope" AS "r1";

CREATE VIEW "__slice_den"."chain_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."chain_served" AS "r1";

CREATE VIEW "__slice_den"."chain_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."chain_skipped" AS "r1";

CREATE VIEW "__slice_den"."chain_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."chain_start_step" AS "r1";

CREATE VIEW "__slice_den"."chain_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."chain_step" AS "r1";

CREATE VIEW "__slice_den"."clock_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."clock_admitted" AS "r1";

CREATE VIEW "__slice_den"."clock_chime_input" ("root", "step", "hour", "bell") AS
SELECT "r1"."root", "r1"."step", "r1"."hour", "r1"."bell"
FROM "slice_den"."clock_chime_input" AS "r1";

CREATE VIEW "__slice_den"."clock_chime_output" ("root", "step", "hour", "bell") AS
SELECT "r1"."root", "r1"."step", "r1"."hour", "r1"."bell"
FROM "slice_den"."clock_chime_output" AS "r1";

CREATE VIEW "__slice_den"."clock_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."clock_claim" AS "r1";

CREATE VIEW "__slice_den"."clock_close_input" ("root", "step", "sitting", "deadline") AS
SELECT "r1"."root", "r1"."step", "r1"."sitting", "r1"."deadline"
FROM "slice_den"."clock_close_input" AS "r1";

CREATE VIEW "__slice_den"."clock_close_output" ("root", "step", "sitting", "deadline") AS
SELECT "r1"."root", "r1"."step", "r1"."sitting", "r1"."deadline"
FROM "slice_den"."clock_close_output" AS "r1";

CREATE VIEW "__slice_den"."clock_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_done" AS "r1";

CREATE VIEW "__slice_den"."clock_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."clock_ended" AS "r1";

CREATE VIEW "__slice_den"."clock_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_exhausted" AS "r1";

CREATE VIEW "__slice_den"."clock_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_failed" AS "r1";

CREATE VIEW "__slice_den"."clock_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."clock_fenced" AS "r1";

CREATE VIEW "__slice_den"."clock_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."clock_finish" AS "r1";

CREATE VIEW "__slice_den"."clock_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."clock_held" AS "r1";

CREATE VIEW "__slice_den"."clock_hourly_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_hourly_finish_output" AS "r1";

CREATE VIEW "__slice_den"."clock_hourly_input" ("root", "scope", "hour", "bell") AS
SELECT "r1"."root", "r1"."scope", "r1"."hour", "r1"."bell"
FROM "slice_den"."clock_hourly_input" AS "r1";

CREATE VIEW "__slice_den"."clock_hourly_key" ("root", "at", "member") AS
SELECT "r1"."root", "r1"."at", "r1"."member"
FROM "slice_den"."clock_hourly_key" AS "r1";

CREATE VIEW "__slice_den"."clock_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_paused" AS "r1";

CREATE VIEW "__slice_den"."clock_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."clock_refusal" AS "r1";

CREATE VIEW "__slice_den"."clock_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."clock_requested_with" AS "r1";

CREATE VIEW "__slice_den"."clock_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."clock_result" AS "r1";

CREATE VIEW "__slice_den"."clock_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_resumed" AS "r1";

CREATE VIEW "__slice_den"."clock_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."clock_retry" AS "r1";

CREATE VIEW "__slice_den"."clock_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."clock_root" AS "r1";

CREATE VIEW "__slice_den"."clock_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."clock_scope" AS "r1";

CREATE VIEW "__slice_den"."clock_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."clock_served" AS "r1";

CREATE VIEW "__slice_den"."clock_sitting_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_sitting_finish_output" AS "r1";

CREATE VIEW "__slice_den"."clock_sitting_input" ("root", "scope", "sitting", "deadline") AS
SELECT "r1"."root", "r1"."scope", "r1"."sitting", "r1"."deadline"
FROM "slice_den"."clock_sitting_input" AS "r1";

CREATE VIEW "__slice_den"."clock_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."clock_skipped" AS "r1";

CREATE VIEW "__slice_den"."clock_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."clock_start_step" AS "r1";

CREATE VIEW "__slice_den"."clock_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."clock_step" AS "r1";

CREATE VIEW "__slice_den"."fan_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."fan_admitted" AS "r1";

CREATE VIEW "__slice_den"."fan_batch_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_batch_finish_output" AS "r1";

CREATE VIEW "__slice_den"."fan_batch_input" ("root", "scope", "batch", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice_den"."fan_batch_input" AS "r1";

CREATE VIEW "__slice_den"."fan_claim" ("root", "step", "attempt", "until", "holds") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds"
FROM "slice_den"."fan_claim" AS "r1";

CREATE VIEW "__slice_den"."fan_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_done" AS "r1";

CREATE VIEW "__slice_den"."fan_dust_input" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_dust_input" AS "r1";

CREATE VIEW "__slice_den"."fan_dust_output" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_dust_output" AS "r1";

CREATE VIEW "__slice_den"."fan_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."fan_ended" AS "r1";

CREATE VIEW "__slice_den"."fan_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__fan_root_kind_names_jqlbcidhe6"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice_den"."fan_exclusive" AS "r1";

CREATE VIEW "__slice_den"."fan_exclusive_key" ("root", "scope", "key", "id") AS
SELECT "r1"."root", "r1"."scope", "r1"."key", "r1"."id"
FROM "slice_den"."fan_exclusive_key" AS "r1";

CREATE VIEW "__slice_den"."fan_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_exhausted" AS "r1";

CREATE VIEW "__slice_den"."fan_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_failed" AS "r1";

CREATE VIEW "__slice_den"."fan_fan_run_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_fan_run_finish_output" AS "r1";

CREATE VIEW "__slice_den"."fan_fan_run_input" ("root", "scope", "batch", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice_den"."fan_fan_run_input" AS "r1";

CREATE VIEW "__slice_den"."fan_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."fan_fenced" AS "r1";

CREATE VIEW "__slice_den"."fan_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."fan_finish" AS "r1";

CREATE VIEW "__slice_den"."fan_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."fan_held" AS "r1";

CREATE VIEW "__slice_den"."fan_hold" ("resource", "resource_name", "root", "step", "attempt", "at", "seat") AS
SELECT "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."seat"
FROM "slice_den"."fan_hold" AS "r1";

CREATE VIEW "__slice_den"."fan_mop_input" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_mop_input" AS "r1";

CREATE VIEW "__slice_den"."fan_mop_output" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_mop_output" AS "r1";

CREATE VIEW "__slice_den"."fan_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_fpk6cvxfiv"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_paused" AS "r1";

CREATE VIEW "__slice_den"."fan_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."fan_refusal" AS "r1";

CREATE VIEW "__slice_den"."fan_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__fan_root_kind_names_jqlbcidhe6"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice_den"."fan_released" AS "r1";

CREATE VIEW "__slice_den"."fan_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."fan_requested_with" AS "r1";

CREATE VIEW "__slice_den"."fan_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."fan_result" AS "r1";

CREATE VIEW "__slice_den"."fan_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_fpk6cvxfiv"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_resumed" AS "r1";

CREATE VIEW "__slice_den"."fan_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."fan_retry" AS "r1";

CREATE VIEW "__slice_den"."fan_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__fan_root_kind_names_jqlbcidhe6"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."fan_root" AS "r1";

CREATE VIEW "__slice_den"."fan_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."fan_scope" AS "r1";

CREATE VIEW "__slice_den"."fan_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."fan_served" AS "r1";

CREATE VIEW "__slice_den"."fan_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."fan_skipped" AS "r1";

CREATE VIEW "__slice_den"."fan_square_input" ("root", "step", "batch", "n") AS
SELECT "r1"."root", "r1"."step", "r1"."batch", "r1"."n"
FROM "slice_den"."fan_square_input" AS "r1";

CREATE VIEW "__slice_den"."fan_square_output" ("root", "step", "square") AS
SELECT "r1"."root", "r1"."step", "r1"."square"
FROM "slice_den"."fan_square_output" AS "r1";

CREATE VIEW "__slice_den"."fan_start_scope" ("root", "scope", "ordinal", "child") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice_den"."fan_start_scope" AS "r1";

CREATE VIEW "__slice_den"."fan_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."fan_start_step" AS "r1";

CREATE VIEW "__slice_den"."fan_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_6jgkvuzg33"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."fan_step" AS "r1";

CREATE VIEW "__slice_den"."fan_sweep_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_sweep_finish_output" AS "r1";

CREATE VIEW "__slice_den"."fan_sweep_input" ("root", "scope", "sweep") AS
SELECT "r1"."root", "r1"."scope", "r1"."sweep"
FROM "slice_den"."fan_sweep_input" AS "r1";

CREATE VIEW "__slice_den"."fan_wanted_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_wanted_finish_output" AS "r1";

CREATE VIEW "__slice_den"."fan_wanted_input" ("root", "scope", "batch", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice_den"."fan_wanted_input" AS "r1";

CREATE VIEW "__slice_den"."fan_wanted_key" ("root", "batch") AS
SELECT "r1"."root", "r1"."batch"
FROM "slice_den"."fan_wanted_key" AS "r1";

CREATE VIEW "__slice_den"."fan_within" ("root", "scope", "parent", "kind", "kind_name") AS
SELECT "r1"."root", "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice_den"."fan_within" AS "r1";

CREATE VIEW "__slice_den"."retry_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."retry_admitted" AS "r1";

CREATE VIEW "__slice_den"."retry_brittle_input" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_brittle_input" AS "r1";

CREATE VIEW "__slice_den"."retry_brittle_output" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_brittle_output" AS "r1";

CREATE VIEW "__slice_den"."retry_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."retry_claim" AS "r1";

CREATE VIEW "__slice_den"."retry_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_done" AS "r1";

CREATE VIEW "__slice_den"."retry_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."retry_ended" AS "r1";

CREATE VIEW "__slice_den"."retry_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_exhausted" AS "r1";

CREATE VIEW "__slice_den"."retry_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_failed" AS "r1";

CREATE VIEW "__slice_den"."retry_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."retry_fenced" AS "r1";

CREATE VIEW "__slice_den"."retry_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."retry_finish" AS "r1";

CREATE VIEW "__slice_den"."retry_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."retry_held" AS "r1";

CREATE VIEW "__slice_den"."retry_ladders_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_ladders_finish_output" AS "r1";

CREATE VIEW "__slice_den"."retry_ladders_input" ("root", "scope", "steadfast", "brittle") AS
SELECT "r1"."root", "r1"."scope", "r1"."steadfast", "r1"."brittle"
FROM "slice_den"."retry_ladders_input" AS "r1";

CREATE VIEW "__slice_den"."retry_patient_input" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_patient_input" AS "r1";

CREATE VIEW "__slice_den"."retry_patient_output" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_patient_output" AS "r1";

CREATE VIEW "__slice_den"."retry_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_paused" AS "r1";

CREATE VIEW "__slice_den"."retry_polite_input" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_polite_input" AS "r1";

CREATE VIEW "__slice_den"."retry_polite_output" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_polite_output" AS "r1";

CREATE VIEW "__slice_den"."retry_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."retry_refusal" AS "r1";

CREATE VIEW "__slice_den"."retry_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."retry_requested_with" AS "r1";

CREATE VIEW "__slice_den"."retry_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."retry_result" AS "r1";

CREATE VIEW "__slice_den"."retry_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_resumed" AS "r1";

CREATE VIEW "__slice_den"."retry_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."retry_retry" AS "r1";

CREATE VIEW "__slice_den"."retry_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."retry_root" AS "r1";

CREATE VIEW "__slice_den"."retry_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."retry_scope" AS "r1";

CREATE VIEW "__slice_den"."retry_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."retry_served" AS "r1";

CREATE VIEW "__slice_den"."retry_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."retry_skipped" AS "r1";

CREATE VIEW "__slice_den"."retry_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."retry_start_step" AS "r1";

CREATE VIEW "__slice_den"."retry_steadfast_input" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_steadfast_input" AS "r1";

CREATE VIEW "__slice_den"."retry_steadfast_output" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_steadfast_output" AS "r1";

CREATE VIEW "__slice_den"."retry_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."retry_step" AS "r1";

CREATE VIEW "__slice_den"."retry_throttled_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_throttled_finish_output" AS "r1";

CREATE VIEW "__slice_den"."retry_throttled_input" ("root", "scope", "key") AS
SELECT "r1"."root", "r1"."scope", "r1"."key"
FROM "slice_den"."retry_throttled_input" AS "r1";

CREATE VIEW "__slice_den"."retry_unhurried_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_unhurried_finish_output" AS "r1";

CREATE VIEW "__slice_den"."retry_unhurried_input" ("root", "scope", "key") AS
SELECT "r1"."root", "r1"."scope", "r1"."key"
FROM "slice_den"."retry_unhurried_input" AS "r1";

CREATE VIEW "__slice_den"."review_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."review_admitted" AS "r1";

CREATE VIEW "__slice_den"."review_analyze_input" ("root", "step", "review", "group", "question") AS
SELECT "r1"."root", "r1"."step", "r1"."review", "r1"."group", "r1"."question"
FROM "slice_den"."review_analyze_input" AS "r1";

CREATE VIEW "__slice_den"."review_analyze_output" ("root", "step", "score") AS
SELECT "r1"."root", "r1"."step", "r1"."score"
FROM "slice_den"."review_analyze_output" AS "r1";

CREATE VIEW "__slice_den"."review_claim" ("root", "step", "attempt", "until", "holds") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds"
FROM "slice_den"."review_claim" AS "r1";

CREATE VIEW "__slice_den"."review_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_done" AS "r1";

CREATE VIEW "__slice_den"."review_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."review_ended" AS "r1";

CREATE VIEW "__slice_den"."review_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_exhausted" AS "r1";

CREATE VIEW "__slice_den"."review_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_failed" AS "r1";

CREATE VIEW "__slice_den"."review_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."review_fenced" AS "r1";

CREATE VIEW "__slice_den"."review_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."review_finish" AS "r1";

CREATE VIEW "__slice_den"."review_gather_input" ("root", "step", "review") AS
SELECT "r1"."root", "r1"."step", "r1"."review"
FROM "slice_den"."review_gather_input" AS "r1";

CREATE VIEW "__slice_den"."review_gather_input_sizes" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."review_gather_input_sizes" AS "r1";

CREATE VIEW "__slice_den"."review_gather_output" ("root", "step", "groups") AS
SELECT "r1"."root", "r1"."step", "r1"."groups"
FROM "slice_den"."review_gather_output" AS "r1";

CREATE VIEW "__slice_den"."review_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."review_held" AS "r1";

CREATE VIEW "__slice_den"."review_hold" ("resource", "resource_name", "root", "step", "attempt", "at", "seat") AS
SELECT "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."seat"
FROM "slice_den"."review_hold" AS "r1";

CREATE VIEW "__slice_den"."review_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_paused" AS "r1";

CREATE VIEW "__slice_den"."review_questions_finish_output" ("root", "step", "count", "total") AS
SELECT "r1"."root", "r1"."step", "r1"."count", "r1"."total"
FROM "slice_den"."review_questions_finish_output" AS "r1";

CREATE VIEW "__slice_den"."review_questions_input" ("root", "scope", "review", "group", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."review", "r1"."group", "r1"."size"
FROM "slice_den"."review_questions_input" AS "r1";

CREATE VIEW "__slice_den"."review_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."review_refusal" AS "r1";

CREATE VIEW "__slice_den"."review_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."review_requested_with" AS "r1";

CREATE VIEW "__slice_den"."review_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."review_result" AS "r1";

CREATE VIEW "__slice_den"."review_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_resumed" AS "r1";

CREATE VIEW "__slice_den"."review_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."review_retry" AS "r1";

CREATE VIEW "__slice_den"."review_review_run_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_review_run_finish_output" AS "r1";

CREATE VIEW "__slice_den"."review_review_run_input" ("root", "scope", "review") AS
SELECT "r1"."root", "r1"."scope", "r1"."review"
FROM "slice_den"."review_review_run_input" AS "r1";

CREATE VIEW "__slice_den"."review_review_run_input_sizes" ("root", "scope", "ordinal", "value") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice_den"."review_review_run_input_sizes" AS "r1";

CREATE VIEW "__slice_den"."review_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."review_root" AS "r1";

CREATE VIEW "__slice_den"."review_save_input" ("root", "step", "review", "group", "count", "total") AS
SELECT "r1"."root", "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total"
FROM "slice_den"."review_save_input" AS "r1";

CREATE VIEW "__slice_den"."review_save_output" ("root", "step", "total") AS
SELECT "r1"."root", "r1"."step", "r1"."total"
FROM "slice_den"."review_save_output" AS "r1";

CREATE VIEW "__slice_den"."review_saved" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."review_saved" AS "r1";

CREATE VIEW "__slice_den"."review_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."review_scope" AS "r1";

CREATE VIEW "__slice_den"."review_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."review_served" AS "r1";

CREATE VIEW "__slice_den"."review_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."review_skipped" AS "r1";

CREATE VIEW "__slice_den"."review_split" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."review_split" AS "r1";

CREATE VIEW "__slice_den"."review_start_scope" ("root", "scope", "ordinal", "child") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice_den"."review_start_scope" AS "r1";

CREATE VIEW "__slice_den"."review_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."review_start_step" AS "r1";

CREATE VIEW "__slice_den"."review_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."review_step" AS "r1";

CREATE VIEW "__slice_den"."review_within" ("root", "scope", "parent", "kind", "kind_name") AS
SELECT "r1"."root", "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice_den"."review_within" AS "r1";

CREATE VIEW "__slice_den"."sync_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."sync_admitted" AS "r1";

CREATE VIEW "__slice_den"."sync_build_input" ("root", "step", "build") AS
SELECT "r1"."root", "r1"."step", "r1"."build"
FROM "slice_den"."sync_build_input" AS "r1";

CREATE VIEW "__slice_den"."sync_build_output" ("root", "step", "build") AS
SELECT "r1"."root", "r1"."step", "r1"."build"
FROM "slice_den"."sync_build_output" AS "r1";

CREATE VIEW "__slice_den"."sync_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."sync_claim" AS "r1";

CREATE VIEW "__slice_den"."sync_copy_input" ("root", "step", "relation", "run") AS
SELECT "r1"."root", "r1"."step", "r1"."relation", "r1"."run"
FROM "slice_den"."sync_copy_input" AS "r1";

CREATE VIEW "__slice_den"."sync_copy_output" ("root", "step", "run") AS
SELECT "r1"."root", "r1"."step", "r1"."run"
FROM "slice_den"."sync_copy_output" AS "r1";

CREATE VIEW "__slice_den"."sync_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_done" AS "r1";

CREATE VIEW "__slice_den"."sync_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."sync_ended" AS "r1";

CREATE VIEW "__slice_den"."sync_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice_den"."sync_exclusive" AS "r1";

CREATE VIEW "__slice_den"."sync_exclusive_key" ("root", "scope", "key", "id") AS
SELECT "r1"."root", "r1"."scope", "r1"."key", "r1"."id"
FROM "slice_den"."sync_exclusive_key" AS "r1";

CREATE VIEW "__slice_den"."sync_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_exhausted" AS "r1";

CREATE VIEW "__slice_den"."sync_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_failed" AS "r1";

CREATE VIEW "__slice_den"."sync_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."sync_fenced" AS "r1";

CREATE VIEW "__slice_den"."sync_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."sync_finish" AS "r1";

CREATE VIEW "__slice_den"."sync_gold_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_gold_finish_output" AS "r1";

CREATE VIEW "__slice_den"."sync_gold_input" ("root", "scope", "build") AS
SELECT "r1"."root", "r1"."scope", "r1"."build"
FROM "slice_den"."sync_gold_input" AS "r1";

CREATE VIEW "__slice_den"."sync_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."sync_held" AS "r1";

CREATE VIEW "__slice_den"."sync_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_paused" AS "r1";

CREATE VIEW "__slice_den"."sync_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."sync_refusal" AS "r1";

CREATE VIEW "__slice_den"."sync_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice_den"."sync_released" AS "r1";

CREATE VIEW "__slice_den"."sync_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."sync_requested_with" AS "r1";

CREATE VIEW "__slice_den"."sync_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."sync_result" AS "r1";

CREATE VIEW "__slice_den"."sync_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_resumed" AS "r1";

CREATE VIEW "__slice_den"."sync_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."sync_retry" AS "r1";

CREATE VIEW "__slice_den"."sync_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."sync_root" AS "r1";

CREATE VIEW "__slice_den"."sync_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."sync_scope" AS "r1";

CREATE VIEW "__slice_den"."sync_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."sync_served" AS "r1";

CREATE VIEW "__slice_den"."sync_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."sync_skipped" AS "r1";

CREATE VIEW "__slice_den"."sync_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."sync_start_step" AS "r1";

CREATE VIEW "__slice_den"."sync_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."sync_step" AS "r1";

CREATE VIEW "__slice_den"."sync_sync_run_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_sync_run_finish_output" AS "r1";

CREATE VIEW "__slice_den"."sync_sync_run_input" ("root", "scope", "relation", "run") AS
SELECT "r1"."root", "r1"."scope", "r1"."relation", "r1"."run"
FROM "slice_den"."sync_sync_run_input" AS "r1";

CREATE VIEW "__slice_den"."writeback_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."writeback_admitted" AS "r1";

CREATE VIEW "__slice_den"."writeback_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."writeback_claim" AS "r1";

CREATE VIEW "__slice_den"."writeback_deliver_input" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_deliver_input" AS "r1";

CREATE VIEW "__slice_den"."writeback_deliver_output" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_deliver_output" AS "r1";

CREATE VIEW "__slice_den"."writeback_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_done" AS "r1";

CREATE VIEW "__slice_den"."writeback_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_ended" AS "r1";

CREATE VIEW "__slice_den"."writeback_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_exhausted" AS "r1";

CREATE VIEW "__slice_den"."writeback_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_failed" AS "r1";

CREATE VIEW "__slice_den"."writeback_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_fenced" AS "r1";

CREATE VIEW "__slice_den"."writeback_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."writeback_finish" AS "r1";

CREATE VIEW "__slice_den"."writeback_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_held" AS "r1";

CREATE VIEW "__slice_den"."writeback_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_paused" AS "r1";

CREATE VIEW "__slice_den"."writeback_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."writeback_refusal" AS "r1";

CREATE VIEW "__slice_den"."writeback_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."writeback_requested_with" AS "r1";

CREATE VIEW "__slice_den"."writeback_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."writeback_result" AS "r1";

CREATE VIEW "__slice_den"."writeback_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_resumed" AS "r1";

CREATE VIEW "__slice_den"."writeback_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."writeback_retry" AS "r1";

CREATE VIEW "__slice_den"."writeback_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."writeback_root" AS "r1";

CREATE VIEW "__slice_den"."writeback_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."writeback_scope" AS "r1";

CREATE VIEW "__slice_den"."writeback_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."writeback_served" AS "r1";

CREATE VIEW "__slice_den"."writeback_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."writeback_skipped" AS "r1";

CREATE VIEW "__slice_den"."writeback_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."writeback_start_step" AS "r1";

CREATE VIEW "__slice_den"."writeback_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."writeback_step" AS "r1";

CREATE VIEW "__slice_den"."writeback_writeback_finish_output" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_writeback_finish_output" AS "r1";

CREATE VIEW "__slice_den"."writeback_writeback_input" ("root", "scope", "attempt") AS
SELECT "r1"."root", "r1"."scope", "r1"."attempt"
FROM "slice_den"."writeback_writeback_input" AS "r1";

CREATE VIEW "slice_seats__fan_coordinator"."fan_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c58", "r17"."c59", ("slice"."__fan_resource_names_tugc7yp6xo"())["r17"."c59" + 1]::"pg_catalog"."text", "r17"."c60", "r17"."c61", "r17"."c62", "r17"."c63"
FROM (SELECT "r10"."c28", "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33" FROM (SELECT "r6"."c16", "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c5", "r4"."c9" FROM (SELECT "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."fan_claim" AS "r3") AS "r4"("c6", "c7", "c8", "c9") WHERE "r2"."c1" = "r4"."c6" AND "r2"."c3" = "r4"."c7" AND "r2"."c5" = "r4"."c8") AS "r6"("c16", "c17", "c18", "c19", "c20", "c21") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."fan_ended" AS "r7") AS "r9"("c25", "c26", "c27") WHERE "r9"."c25" = "r6"."c16" AND "r9"."c26" = "r6"."c18" AND "r9"."c27" = "r6"."c20")) AS "r10"("c28", "c29", "c30", "c31", "c32", "c33") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."fan_held" AS "r11") AS "r13"("c37", "c38", "c39") WHERE "r13"."c37" = "r10"."c28" AND "r13"."c38" = "r10"."c30" AND "r13"."c39" = "r10"."c32")) AS "r17"("c58", "c59", "c60", "c61", "c62", "c63");

CREATE VIEW "slice_seats__fan_den"."fan_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c58", "r17"."c59", ("slice"."__fan_resource_names_tugc7yp6xo"())["r17"."c59" + 1]::"pg_catalog"."text", "r17"."c60", "r17"."c61", "r17"."c62", "r17"."c63"
FROM (SELECT "r10"."c28", "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33" FROM (SELECT "r6"."c16", "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c5", "r4"."c9" FROM (SELECT "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."fan_claim" AS "r3") AS "r4"("c6", "c7", "c8", "c9") WHERE "r2"."c1" = "r4"."c6" AND "r2"."c3" = "r4"."c7" AND "r2"."c5" = "r4"."c8") AS "r6"("c16", "c17", "c18", "c19", "c20", "c21") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."fan_ended" AS "r7") AS "r9"("c25", "c26", "c27") WHERE "r9"."c25" = "r6"."c16" AND "r9"."c26" = "r6"."c18" AND "r9"."c27" = "r6"."c20")) AS "r10"("c28", "c29", "c30", "c31", "c32", "c33") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."fan_held" AS "r11") AS "r13"("c37", "c38", "c39") WHERE "r13"."c37" = "r10"."c28" AND "r13"."c38" = "r10"."c30" AND "r13"."c39" = "r10"."c32")) AS "r17"("c58", "c59", "c60", "c61", "c62", "c63");

CREATE VIEW "slice_seats__review_coordinator"."review_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c58", "r17"."c59", ("slice"."__review_resource_names_ixi3gnpcnp"())["r17"."c59" + 1]::"pg_catalog"."text", "r17"."c60", "r17"."c61", "r17"."c62", "r17"."c63"
FROM (SELECT "r10"."c28", "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33" FROM (SELECT "r6"."c16", "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c5", "r4"."c9" FROM (SELECT "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."review_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."review_claim" AS "r3") AS "r4"("c6", "c7", "c8", "c9") WHERE "r2"."c1" = "r4"."c6" AND "r2"."c3" = "r4"."c7" AND "r2"."c5" = "r4"."c8") AS "r6"("c16", "c17", "c18", "c19", "c20", "c21") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."review_ended" AS "r7") AS "r9"("c25", "c26", "c27") WHERE "r9"."c25" = "r6"."c16" AND "r9"."c26" = "r6"."c18" AND "r9"."c27" = "r6"."c20")) AS "r10"("c28", "c29", "c30", "c31", "c32", "c33") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."review_held" AS "r11") AS "r13"("c37", "c38", "c39") WHERE "r13"."c37" = "r10"."c28" AND "r13"."c38" = "r10"."c30" AND "r13"."c39" = "r10"."c32")) AS "r17"("c58", "c59", "c60", "c61", "c62", "c63");

CREATE VIEW "slice_seats__review_den"."review_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r17"."c58", "r17"."c59", ("slice"."__review_resource_names_ixi3gnpcnp"())["r17"."c59" + 1]::"pg_catalog"."text", "r17"."c60", "r17"."c61", "r17"."c62", "r17"."c63"
FROM (SELECT "r10"."c28", "r10"."c29", "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33" FROM (SELECT "r6"."c16", "r6"."c17", "r6"."c18", "r6"."c19", "r6"."c20", "r6"."c21" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c5", "r4"."c9" FROM (SELECT "r1"."attempt", "r1"."resource", "r1"."root", "r1"."seat", "r1"."step" FROM "slice_den"."review_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5"), (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."review_claim" AS "r3") AS "r4"("c6", "c7", "c8", "c9") WHERE "r2"."c1" = "r4"."c6" AND "r2"."c3" = "r4"."c7" AND "r2"."c5" = "r4"."c8") AS "r6"("c16", "c17", "c18", "c19", "c20", "c21") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."review_ended" AS "r7") AS "r9"("c25", "c26", "c27") WHERE "r9"."c25" = "r6"."c16" AND "r9"."c26" = "r6"."c18" AND "r9"."c27" = "r6"."c20")) AS "r10"("c28", "c29", "c30", "c31", "c32", "c33") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r11"."attempt", "r11"."root", "r11"."step" FROM "slice_den"."review_held" AS "r11") AS "r13"("c37", "c38", "c39") WHERE "r13"."c37" = "r10"."c28" AND "r13"."c38" = "r10"."c30" AND "r13"."c39" = "r10"."c32")) AS "r17"("c58", "c59", "c60", "c61", "c62", "c63");

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
GRANT USAGE ON SCHEMA "slice" TO :"slice_seats__app";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__app";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__assign_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind" TO :"slice_seats__assign_coordinator";

GRANT SELECT ON TABLE "__slice_den"."assign_paused", "__slice_den"."assign_resumed", "__slice_den"."assign_served" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_paused" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_served" TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"() TO :"slice_seats__assign_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_den";

GRANT SELECT ON TABLE "__slice_den"."assign_admitted", "__slice_den"."assign_asked", "__slice_den"."assign_assignment_finish_output", "__slice_den"."assign_assignment_input", "__slice_den"."assign_assignment_input_exclude", "__slice_den"."assign_assignment_input_mode_nearest", "__slice_den"."assign_assignment_input_mode_within", "__slice_den"."assign_assignment_input_near", "__slice_den"."assign_claim", "__slice_den"."assign_decide_input", "__slice_den"."assign_decide_input_exclude", "__slice_den"."assign_decide_input_mode_nearest", "__slice_den"."assign_decide_input_mode_within", "__slice_den"."assign_decide_output", "__slice_den"."assign_decide_output_stage_rest", "__slice_den"."assign_decide_output_stage_serve", "__slice_den"."assign_decide_output_weighed", "__slice_den"."assign_decide_read_nearest", "__slice_den"."assign_decide_read_nearest_row", "__slice_den"."assign_decide_read_seen", "__slice_den"."assign_decide_read_seen_row", "__slice_den"."assign_done", "__slice_den"."assign_embed_input", "__slice_den"."assign_embed_input_exclude", "__slice_den"."assign_embed_input_mode_nearest", "__slice_den"."assign_embed_input_mode_within", "__slice_den"."assign_embed_input_near", "__slice_den"."assign_embed_output", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_paused", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_resumed", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_served", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step" TO :"slice_seats__assign_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_requested_with" TO :"slice_seats__assign_den";

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

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_assign_assignment_input_k2sfkqif6i"(), "slice"."__stand_assign_assignment_input_mode_nearest_lxb77ivg4j"(), "slice"."__stand_assign_assignment_input_mode_within_37wojsnl3c"(), "slice"."__stand_assign_decide_input_vrvu36pkwz"(), "slice"."__stand_assign_decide_input_mode_nearest_7kdvsnzqg6"(), "slice"."__stand_assign_decide_input_mode_within_ldx2lhq5ey"(), "slice"."__stand_assign_done_zpmhn6mrnc"(), "slice"."__stand_assign_embed_input_zvwywuktne"(), "slice"."__stand_assign_embed_input_mode_nearest_qag7rwsicw"(), "slice"."__stand_assign_embed_input_mode_within_mw2mn45ii2"(), "slice"."__stand_assign_failed_pmuglprcww"(), "slice"."__stand_assign_requested_with_3xavh4tz7a"(), "slice"."__stand_assign_result_3dwqbs6psk"(), "slice"."__stand_assign_root_ecnnffi3e3"(), "slice"."__stand_assign_step_qwjijdgx6j"() TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_retirer";

GRANT SELECT ON TABLE "__slice_den"."assign_admitted", "__slice_den"."assign_asked", "__slice_den"."assign_assignment_finish_output", "__slice_den"."assign_assignment_input", "__slice_den"."assign_assignment_input_exclude", "__slice_den"."assign_assignment_input_mode_nearest", "__slice_den"."assign_assignment_input_mode_within", "__slice_den"."assign_assignment_input_near", "__slice_den"."assign_claim", "__slice_den"."assign_decide_input", "__slice_den"."assign_decide_input_exclude", "__slice_den"."assign_decide_input_mode_nearest", "__slice_den"."assign_decide_input_mode_within", "__slice_den"."assign_decide_output", "__slice_den"."assign_decide_output_stage_rest", "__slice_den"."assign_decide_output_stage_serve", "__slice_den"."assign_decide_output_weighed", "__slice_den"."assign_decide_read_nearest", "__slice_den"."assign_decide_read_nearest_row", "__slice_den"."assign_decide_read_seen", "__slice_den"."assign_decide_read_seen_row", "__slice_den"."assign_done", "__slice_den"."assign_embed_input", "__slice_den"."assign_embed_input_exclude", "__slice_den"."assign_embed_input_mode_nearest", "__slice_den"."assign_embed_input_mode_within", "__slice_den"."assign_embed_input_near", "__slice_den"."assign_embed_output", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_admitted" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_asked" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_finish_output" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_exclude" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_mode_nearest" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_mode_within" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_near" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_claim" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input_exclude" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input_mode_nearest" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input_mode_within" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output_stage_rest" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output_stage_serve" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output_weighed" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_read_nearest" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_read_seen" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_done" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_exclude" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_mode_nearest" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_mode_within" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_near" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_output" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_ended" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_exhausted" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_failed" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_fenced" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_finish" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_held" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_refusal" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_result" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_retry" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_scope" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_skipped" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_start_step" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_step" TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"() TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_assign_assignment_input_k2sfkqif6i"(), "slice"."__stand_assign_assignment_input_mode_nearest_lxb77ivg4j"(), "slice"."__stand_assign_assignment_input_mode_within_37wojsnl3c"(), "slice"."__stand_assign_decide_input_vrvu36pkwz"(), "slice"."__stand_assign_decide_input_mode_nearest_7kdvsnzqg6"(), "slice"."__stand_assign_decide_input_mode_within_ldx2lhq5ey"(), "slice"."__stand_assign_decide_output_ir3hc6poyj"(), "slice"."__stand_assign_decide_output_stage_rest_lduodwwdlk"(), "slice"."__stand_assign_decide_output_stage_serve_z6kennoghm"(), "slice"."__stand_assign_done_zpmhn6mrnc"(), "slice"."__stand_assign_embed_input_zvwywuktne"(), "slice"."__stand_assign_embed_input_mode_nearest_qag7rwsicw"(), "slice"."__stand_assign_embed_input_mode_within_mw2mn45ii2"(), "slice"."__stand_assign_failed_pmuglprcww"(), "slice"."__stand_assign_result_3dwqbs6psk"(), "slice"."__stand_assign_step_qwjijdgx6j"() TO :"slice_seats__assign_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_assign_claim_attempt_h744pvqs3v" TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "__slice" TO :"slice_seats__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."assign_decide_output_stage", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_resource", "slice_den"."fan_root_kind", "slice"."feed", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_resource", "slice_den"."sync_outcome", "slice"."__text_t4rwovzmqj" TO :"slice_seats__auditor";

GRANT SELECT ON TABLE "__slice_den"."assign_decide_output", "__slice_den"."assign_decide_output_stage_serve", "__slice_den"."assign_decide_output_weighed", "__slice_den"."assign_decide_read_nearest", "__slice_den"."assign_decide_read_nearest_row", "__slice_den"."assign_decide_read_seen", "__slice_den"."assign_decide_read_seen_row", "__slice_den"."assign_result", "__slice_den"."assign_step", "__slice"."assigned", "__slice_den"."audit", "__slice"."built", "__slice_den"."chain_admitted", "__slice_den"."chain_chain_run_finish_output", "__slice_den"."chain_chain_run_input", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_next", "__slice_den"."chain_ordered_finish_output", "__slice_den"."chain_ordered_input", "__slice_den"."chain_page_input", "__slice_den"."chain_page_input_after", "__slice_den"."chain_page_output", "__slice_den"."chain_page_output_next", "__slice_den"."chain_page_read_earlier", "__slice_den"."chain_page_read_earlier_row", "__slice_den"."chain_page_read_tree", "__slice_den"."chain_page_read_tree_items", "__slice_den"."chain_page_read_tree_row", "__slice_den"."chain_page_read_weights", "__slice_den"."chain_page_read_weights_row", "__slice_den"."chain_page_tree_first", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice"."chimed", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice_den"."fan_admitted", "__slice_den"."fan_batch_input", "__slice_den"."fan_claim", "__slice_den"."fan_fan_run_input", "__slice_den"."fan_finish", "__slice_den"."fan_hold", "__slice_den"."fan_result", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_square_input", "__slice_den"."fan_square_output", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_wanted_input", "__slice_den"."fan_wanted_key", "__slice_den"."fan_within", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice_den"."retry_claim", "__slice_den"."retry_exhausted", "__slice_den"."retry_result", "__slice_den"."retry_step", "__slice_den"."review_finish", "__slice_den"."review_hold", "__slice_den"."review_result", "__slice_den"."review_step", "__slice_den"."review_within", "__slice"."reviewed", "__slice"."settled", "__slice"."summary", "__slice_den"."sync_admitted", "__slice_den"."sync_finish", "__slice_den"."sync_result", "__slice_den"."sync_scope", "__slice_den"."sync_skipped", "__slice"."tally", "__slice"."want", "__slice"."weight" TO :"slice_seats__auditor";

GRANT SELECT, INSERT ON TABLE "slice_den"."audit" TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_root_kind_live_zwogjm2ro3"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__sync_outcome_live_7gndrvrenw"() TO :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__chain_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind" TO :"slice_seats__chain_coordinator";

GRANT SELECT ON TABLE "__slice_den"."chain_paused", "__slice_den"."chain_resumed", "__slice_den"."chain_served" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_paused" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_resumed" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_served" TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"() TO :"slice_seats__chain_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__chain_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice"."feed" TO :"slice_seats__chain_den";

GRANT SELECT ON TABLE "__slice_den"."chain_admitted", "__slice_den"."chain_chain_run_finish_output", "__slice_den"."chain_chain_run_input", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_next", "__slice_den"."chain_ordered_finish_output", "__slice_den"."chain_ordered_input", "__slice_den"."chain_page_input", "__slice_den"."chain_page_input_after", "__slice_den"."chain_page_output", "__slice_den"."chain_page_output_next", "__slice_den"."chain_page_read_earlier", "__slice_den"."chain_page_read_earlier_row", "__slice_den"."chain_page_read_tree", "__slice_den"."chain_page_read_tree_items", "__slice_den"."chain_page_read_tree_row", "__slice_den"."chain_page_read_weights", "__slice_den"."chain_page_read_weights_row", "__slice_den"."chain_page_tree_first", "__slice_den"."chain_paused", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_resumed", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_served", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step" TO :"slice_seats__chain_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_requested_with" TO :"slice_seats__chain_den";

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

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_chain_done_fhcl4vvjiw"(), "slice"."__stand_chain_failed_nocd74knki"(), "slice"."__stand_chain_page_input_akkjfmkwih"(), "slice"."__stand_chain_requested_with_fq22h3tdwv"(), "slice"."__stand_chain_result_2qc7m4brl3"(), "slice"."__stand_chain_root_mmsdkigltc"(), "slice"."__stand_chain_step_3hsz3lyxy2"() TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__chain_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice"."feed" TO :"slice_seats__chain_retirer";

GRANT SELECT ON TABLE "__slice_den"."chain_admitted", "__slice_den"."chain_chain_run_finish_output", "__slice_den"."chain_chain_run_input", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_next", "__slice_den"."chain_ordered_finish_output", "__slice_den"."chain_ordered_input", "__slice_den"."chain_page_input", "__slice_den"."chain_page_input_after", "__slice_den"."chain_page_output", "__slice_den"."chain_page_output_next", "__slice_den"."chain_page_read_earlier", "__slice_den"."chain_page_read_earlier_row", "__slice_den"."chain_page_read_tree", "__slice_den"."chain_page_read_tree_items", "__slice_den"."chain_page_read_tree_row", "__slice_den"."chain_page_read_weights", "__slice_den"."chain_page_read_weights_row", "__slice_den"."chain_page_tree_first", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_admitted" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_chain_run_finish_output" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_chain_run_input" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_claim" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_done" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_ended" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_exhausted" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_failed" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_fenced" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_finish" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_held" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_next" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_ordered_finish_output" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_ordered_input" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_input" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_input_after" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_output" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_output_next" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_read_earlier" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_read_tree" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_read_weights" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_refusal" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_result" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_retry" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_scope" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_skipped" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_start_step" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_step" TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__feed_live_pfwkvulieq"() TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_chain_done_fhcl4vvjiw"(), "slice"."__stand_chain_failed_nocd74knki"(), "slice"."__stand_chain_page_input_akkjfmkwih"(), "slice"."__stand_chain_result_2qc7m4brl3"(), "slice"."__stand_chain_step_3hsz3lyxy2"() TO :"slice_seats__chain_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" TO :"slice_seats__chain_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__clock_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind" TO :"slice_seats__clock_coordinator";

GRANT SELECT ON TABLE "__slice_den"."clock_paused", "__slice_den"."clock_resumed", "__slice_den"."clock_served" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_paused" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_resumed" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_served" TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"() TO :"slice_seats__clock_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice", "__slice_den" TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__clock_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind", "slice"."feed", "slice"."__text_t4rwovzmqj" TO :"slice_seats__clock_den";

GRANT SELECT ON TABLE "__slice"."assigned", "__slice"."built", "__slice"."chimed", "__slice_den"."clock_admitted", "__slice_den"."clock_chime_input", "__slice_den"."clock_chime_output", "__slice_den"."clock_claim", "__slice_den"."clock_close_input", "__slice_den"."clock_close_output", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_hourly_finish_output", "__slice_den"."clock_hourly_input", "__slice_den"."clock_hourly_key", "__slice_den"."clock_paused", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_resumed", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_served", "__slice_den"."clock_sitting_finish_output", "__slice_den"."clock_sitting_input", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice"."delivered", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice"."passage", "__slice"."reviewed", "__slice"."seen", "__slice"."settled", "__slice"."summary", "__slice"."tally", "__slice"."want", "__slice"."weight" TO :"slice_seats__clock_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_key" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_refusal" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_requested_with" TO :"slice_seats__clock_den";

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

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"(), "slice"."__feed_live_pfwkvulieq"() TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_clock_chime_input_w4tkdsqfah"(), "slice"."__stand_clock_close_input_nbsmlpykk5"(), "slice"."__stand_clock_done_dja4biaxge"(), "slice"."__stand_clock_failed_zsyt2n5qx3"(), "slice"."__stand_clock_hourly_key_im7mo3bxkf"(), "slice"."__stand_clock_requested_with_st4ea4apoz"(), "slice"."__stand_clock_result_dk5lfugcd5"(), "slice"."__stand_clock_root_bfxjnnlbbr"(), "slice"."__stand_clock_step_cbbapr6dla"() TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__clock_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind" TO :"slice_seats__clock_retirer";

GRANT SELECT ON TABLE "__slice_den"."clock_admitted", "__slice_den"."clock_chime_input", "__slice_den"."clock_chime_output", "__slice_den"."clock_claim", "__slice_den"."clock_close_input", "__slice_den"."clock_close_output", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_hourly_finish_output", "__slice_den"."clock_hourly_input", "__slice_den"."clock_hourly_key", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_sitting_finish_output", "__slice_den"."clock_sitting_input", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_admitted" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_chime_input" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_chime_output" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_claim" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_close_input" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_close_output" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_done" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_ended" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_exhausted" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_failed" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_fenced" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_finish" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_held" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_hourly_finish_output" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_hourly_input" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_refusal" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_result" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_retry" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_scope" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_sitting_finish_output" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_sitting_input" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_skipped" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_start_step" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_step" TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"() TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_clock_chime_input_w4tkdsqfah"(), "slice"."__stand_clock_close_input_nbsmlpykk5"(), "slice"."__stand_clock_done_dja4biaxge"(), "slice"."__stand_clock_failed_zsyt2n5qx3"(), "slice"."__stand_clock_result_dk5lfugcd5"(), "slice"."__stand_clock_step_cbbapr6dla"() TO :"slice_seats__clock_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" TO :"slice_seats__clock_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice" TO :"slice_seats__editor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__editor";

GRANT USAGE ON DOMAIN "slice"."__text_t4rwovzmqj" TO :"slice_seats__editor";

GRANT SELECT ON TABLE "__slice"."passage", "__slice"."seen" TO :"slice_seats__editor";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice"."passage" TO :"slice_seats__editor";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice"."seen" TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"() TO :"slice_seats__editor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "slice_seats__fan_coordinator" TO :"slice_seats__fan_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind" TO :"slice_seats__fan_coordinator";

GRANT SELECT ON TABLE "__slice_den"."fan_exclusive", "__slice_den"."fan_paused", "__slice_den"."fan_released", "__slice_den"."fan_resumed", "__slice_den"."fan_served", "slice_seats__fan_coordinator"."fan_live" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exclusive" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_paused" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_released" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_resumed" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_served" TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_pausable_names_fpk6cvxfiv"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"() TO :"slice_seats__fan_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "slice_seats__fan_den" TO :"slice_seats__fan_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind" TO :"slice_seats__fan_den";

GRANT SELECT ON TABLE "__slice_den"."fan_admitted", "__slice_den"."fan_batch_finish_output", "__slice_den"."fan_batch_input", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_dust_input", "__slice_den"."fan_dust_output", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fan_run_finish_output", "__slice_den"."fan_fan_run_input", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_mop_input", "__slice_den"."fan_mop_output", "__slice_den"."fan_paused", "__slice_den"."fan_refusal", "__slice_den"."fan_released", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_resumed", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_served", "__slice_den"."fan_skipped", "__slice_den"."fan_square_input", "__slice_den"."fan_square_output", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_sweep_finish_output", "__slice_den"."fan_sweep_input", "__slice_den"."fan_wanted_finish_output", "__slice_den"."fan_wanted_input", "__slice_den"."fan_wanted_key", "__slice_den"."fan_within", "slice_seats__fan_den"."fan_live" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_admitted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_claim" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_done" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_dust_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_ended" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exclusive_key" TO :"slice_seats__fan_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_requested_with" TO :"slice_seats__fan_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_finish_output" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_input" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_key" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_within" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_fpk6cvxfiv"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"() TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_fan_batch_input_fkd6u4c3i3"(), "slice"."__stand_fan_claim_chk6cawes6"(), "slice"."__stand_fan_done_e4qldz2xtt"(), "slice"."__stand_fan_dust_input_rigexdymgk"(), "slice"."__stand_fan_ended_l35bnatdrx"(), "slice"."__stand_fan_failed_ok5ebljdmh"(), "slice"."__stand_fan_held_jx6ijuwgvx"(), "slice"."__stand_fan_hold_lndmiy4fqw"(), "slice"."__stand_fan_mop_input_i5g5pk2lsj"(), "slice"."__stand_fan_requested_with_cfdhaf2vfh"(), "slice"."__stand_fan_result_4bsplumotk"(), "slice"."__stand_fan_root_evnc53opne"(), "slice"."__stand_fan_square_input_ag5nlkdpuv"(), "slice"."__stand_fan_step_cwlbx3l7hf"(), "slice"."__stand_fan_wanted_key_n6zslzhip6"(), "slice"."__stand_fan_within_oo5pwmjabl"() TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__fan_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind" TO :"slice_seats__fan_retirer";

GRANT SELECT ON TABLE "__slice_den"."fan_admitted", "__slice_den"."fan_batch_finish_output", "__slice_den"."fan_batch_input", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_dust_input", "__slice_den"."fan_dust_output", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fan_run_finish_output", "__slice_den"."fan_fan_run_input", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_mop_input", "__slice_den"."fan_mop_output", "__slice_den"."fan_refusal", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_skipped", "__slice_den"."fan_square_input", "__slice_den"."fan_square_output", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_sweep_finish_output", "__slice_den"."fan_sweep_input", "__slice_den"."fan_wanted_finish_output", "__slice_den"."fan_wanted_input", "__slice_den"."fan_wanted_key", "__slice_den"."fan_within" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_admitted" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_batch_finish_output" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_batch_input" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_claim" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_done" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_dust_input" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_dust_output" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_ended" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_exclusive_key" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_exhausted" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_failed" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_fan_run_finish_output" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_fan_run_input" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_fenced" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_finish" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_held" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_hold" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_mop_input" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_mop_output" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_refusal" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_result" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_retry" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_scope" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_skipped" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_square_input" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_square_output" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_start_scope" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_start_step" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_step" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_sweep_finish_output" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_sweep_input" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_wanted_finish_output" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_wanted_input" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_within" TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"() TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_fan_batch_input_fkd6u4c3i3"(), "slice"."__stand_fan_claim_chk6cawes6"(), "slice"."__stand_fan_done_e4qldz2xtt"(), "slice"."__stand_fan_dust_input_rigexdymgk"(), "slice"."__stand_fan_ended_l35bnatdrx"(), "slice"."__stand_fan_failed_ok5ebljdmh"(), "slice"."__stand_fan_held_jx6ijuwgvx"(), "slice"."__stand_fan_hold_lndmiy4fqw"(), "slice"."__stand_fan_mop_input_i5g5pk2lsj"(), "slice"."__stand_fan_result_4bsplumotk"(), "slice"."__stand_fan_square_input_ag5nlkdpuv"(), "slice"."__stand_fan_step_cwlbx3l7hf"(), "slice"."__stand_fan_within_oo5pwmjabl"() TO :"slice_seats__fan_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_fan_claim_attempt_u34lm72lgr" TO :"slice_seats__fan_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "__slice" TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__loader";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind", "slice"."feed", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__loader";

GRANT SELECT ON TABLE "__slice_den"."assign_admitted", "__slice_den"."assign_asked", "__slice_den"."assign_assignment_finish_output", "__slice_den"."assign_assignment_input", "__slice_den"."assign_assignment_input_exclude", "__slice_den"."assign_assignment_input_mode_nearest", "__slice_den"."assign_assignment_input_mode_within", "__slice_den"."assign_assignment_input_near", "__slice_den"."assign_claim", "__slice_den"."assign_decide_input", "__slice_den"."assign_decide_input_exclude", "__slice_den"."assign_decide_input_mode_nearest", "__slice_den"."assign_decide_input_mode_within", "__slice_den"."assign_decide_output", "__slice_den"."assign_decide_output_stage_rest", "__slice_den"."assign_decide_output_stage_serve", "__slice_den"."assign_decide_output_weighed", "__slice_den"."assign_decide_read_nearest", "__slice_den"."assign_decide_read_nearest_row", "__slice_den"."assign_decide_read_seen", "__slice_den"."assign_decide_read_seen_row", "__slice_den"."assign_done", "__slice_den"."assign_embed_input", "__slice_den"."assign_embed_input_exclude", "__slice_den"."assign_embed_input_mode_nearest", "__slice_den"."assign_embed_input_mode_within", "__slice_den"."assign_embed_input_near", "__slice_den"."assign_embed_output", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step", "__slice"."assigned", "__slice"."built", "__slice_den"."chain_admitted", "__slice_den"."chain_chain_run_finish_output", "__slice_den"."chain_chain_run_input", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_next", "__slice_den"."chain_ordered_finish_output", "__slice_den"."chain_ordered_input", "__slice_den"."chain_page_input", "__slice_den"."chain_page_input_after", "__slice_den"."chain_page_output", "__slice_den"."chain_page_output_next", "__slice_den"."chain_page_read_earlier", "__slice_den"."chain_page_read_earlier_row", "__slice_den"."chain_page_read_tree", "__slice_den"."chain_page_read_tree_items", "__slice_den"."chain_page_read_tree_row", "__slice_den"."chain_page_read_weights", "__slice_den"."chain_page_read_weights_row", "__slice_den"."chain_page_tree_first", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice"."chimed", "__slice_den"."clock_admitted", "__slice_den"."clock_chime_input", "__slice_den"."clock_chime_output", "__slice_den"."clock_claim", "__slice_den"."clock_close_input", "__slice_den"."clock_close_output", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_hourly_finish_output", "__slice_den"."clock_hourly_input", "__slice_den"."clock_hourly_key", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_sitting_finish_output", "__slice_den"."clock_sitting_input", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice"."delivered", "__slice_den"."fan_admitted", "__slice_den"."fan_batch_finish_output", "__slice_den"."fan_batch_input", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_dust_input", "__slice_den"."fan_dust_output", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fan_run_finish_output", "__slice_den"."fan_fan_run_input", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_mop_input", "__slice_den"."fan_mop_output", "__slice_den"."fan_refusal", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_skipped", "__slice_den"."fan_square_input", "__slice_den"."fan_square_output", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_sweep_finish_output", "__slice_den"."fan_sweep_input", "__slice_den"."fan_wanted_finish_output", "__slice_den"."fan_wanted_input", "__slice_den"."fan_wanted_key", "__slice_den"."fan_within", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice"."passage", "__slice_den"."retry_admitted", "__slice_den"."retry_brittle_input", "__slice_den"."retry_brittle_output", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_ladders_finish_output", "__slice_den"."retry_ladders_input", "__slice_den"."retry_patient_input", "__slice_den"."retry_patient_output", "__slice_den"."retry_polite_input", "__slice_den"."retry_polite_output", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_steadfast_input", "__slice_den"."retry_steadfast_output", "__slice_den"."retry_step", "__slice_den"."retry_throttled_finish_output", "__slice_den"."retry_throttled_input", "__slice_den"."retry_unhurried_finish_output", "__slice_den"."retry_unhurried_input", "__slice_den"."review_admitted", "__slice_den"."review_analyze_input", "__slice_den"."review_analyze_output", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_gather_input", "__slice_den"."review_gather_input_sizes", "__slice_den"."review_gather_output", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_questions_finish_output", "__slice_den"."review_questions_input", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_retry", "__slice_den"."review_review_run_finish_output", "__slice_den"."review_review_run_input", "__slice_den"."review_review_run_input_sizes", "__slice_den"."review_root", "__slice_den"."review_save_input", "__slice_den"."review_save_output", "__slice_den"."review_saved", "__slice_den"."review_scope", "__slice_den"."review_skipped", "__slice_den"."review_split", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within", "__slice"."reviewed", "__slice"."seen", "__slice"."settled", "__slice"."summary", "__slice_den"."sync_admitted", "__slice_den"."sync_build_input", "__slice_den"."sync_build_output", "__slice_den"."sync_claim", "__slice_den"."sync_copy_input", "__slice_den"."sync_copy_output", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_gold_finish_output", "__slice_den"."sync_gold_input", "__slice_den"."sync_held", "__slice_den"."sync_refusal", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice_den"."sync_sync_run_finish_output", "__slice_den"."sync_sync_run_input", "__slice"."tally", "__slice"."want", "__slice"."weight", "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_deliver_input", "__slice_den"."writeback_deliver_output", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."writeback_writeback_finish_output", "__slice_den"."writeback_writeback_input" TO :"slice_seats__loader";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_requested_with" TO :"slice_seats__loader";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exclusive_key" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fan_run_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_mop_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_root" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_square_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_sweep_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_finish_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_input" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_key" TO :"slice_seats__loader";

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

GRANT SELECT, INSERT ON TABLE "slice"."want" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."weight" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_deliver_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_writeback_finish_output" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_ehhgk5bunv"(), "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"(), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), "slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), "slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"(), "slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_page_input_feed_live_zxgp5dub6j"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT TEMPORARY ON DATABASE :"DBNAME" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__stand_assign_decide_input_vrvu36pkwz"(), "slice"."__stand_assign_decide_input_mode_nearest_7kdvsnzqg6"(), "slice"."__stand_assign_decide_input_mode_within_ldx2lhq5ey"(), "slice"."__stand_assign_decide_output_ir3hc6poyj"(), "slice"."__stand_assign_decide_output_stage_rest_lduodwwdlk"(), "slice"."__stand_assign_decide_output_stage_serve_z6kennoghm"(), "slice"."__stand_assign_done_zpmhn6mrnc"(), "slice"."__stand_assign_embed_input_zvwywuktne"(), "slice"."__stand_assign_embed_input_mode_nearest_qag7rwsicw"(), "slice"."__stand_assign_embed_input_mode_within_mw2mn45ii2"(), "slice"."__stand_assign_result_3dwqbs6psk"(), "slice"."__stand_assign_step_qwjijdgx6j"(), "slice"."__stand_chain_done_fhcl4vvjiw"(), "slice"."__stand_chain_page_input_akkjfmkwih"(), "slice"."__stand_chain_requested_with_fq22h3tdwv"(), "slice"."__stand_chain_result_2qc7m4brl3"(), "slice"."__stand_chain_root_mmsdkigltc"(), "slice"."__stand_chain_step_3hsz3lyxy2"(), "slice"."__stand_clock_done_dja4biaxge"(), "slice"."__stand_clock_result_dk5lfugcd5"(), "slice"."__stand_fan_done_e4qldz2xtt"(), "slice"."__stand_fan_held_jx6ijuwgvx"(), "slice"."__stand_fan_result_4bsplumotk"(), "slice"."__stand_fan_root_evnc53opne"(), "slice"."__stand_fan_wanted_key_n6zslzhip6"(), "slice"."__stand_retry_done_ll42rjotis"(), "slice"."__stand_retry_result_mpvrsnerne"(), "slice"."__stand_review_analyze_input_pspszgkzox"(), "slice"."__stand_review_done_ujerlpx2vl"(), "slice"."__stand_review_gather_input_jx633zhg4g"(), "slice"."__stand_review_held_kz6nzl3mw3"(), "slice"."__stand_review_questions_input_c55nnxszay"(), "slice"."__stand_review_result_7berxkzbzb"(), "slice"."__stand_review_save_input_nwulronicu"(), "slice"."__stand_review_step_aidfiao2mn"(), "slice"."__stand_review_within_bqv44gzoli"(), "slice"."__stand_sync_done_4ihvwniwqp"(), "slice"."__stand_sync_result_fkuahqxxbc"(), "slice"."__stand_writeback_done_ra7zoinlni"(), "slice"."__stand_writeback_result_owlolckns5"() TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__retry_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind" TO :"slice_seats__retry_coordinator";

GRANT SELECT ON TABLE "__slice_den"."retry_paused", "__slice_den"."retry_resumed", "__slice_den"."retry_served" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_paused" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_resumed" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_served" TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__retry_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind" TO :"slice_seats__retry_den";

GRANT SELECT ON TABLE "__slice_den"."retry_admitted", "__slice_den"."retry_brittle_input", "__slice_den"."retry_brittle_output", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_ladders_finish_output", "__slice_den"."retry_ladders_input", "__slice_den"."retry_patient_input", "__slice_den"."retry_patient_output", "__slice_den"."retry_paused", "__slice_den"."retry_polite_input", "__slice_den"."retry_polite_output", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_resumed", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_served", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_steadfast_input", "__slice_den"."retry_steadfast_output", "__slice_den"."retry_step", "__slice_den"."retry_throttled_finish_output", "__slice_den"."retry_throttled_input", "__slice_den"."retry_unhurried_finish_output", "__slice_den"."retry_unhurried_input" TO :"slice_seats__retry_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_requested_with" TO :"slice_seats__retry_den";

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

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_retry_brittle_input_3pbycrawjg"(), "slice"."__stand_retry_done_ll42rjotis"(), "slice"."__stand_retry_failed_wyonvn6i5o"(), "slice"."__stand_retry_patient_input_jxb7jnsja6"(), "slice"."__stand_retry_polite_input_uiwzzm343r"(), "slice"."__stand_retry_requested_with_ilqrjj3m5y"(), "slice"."__stand_retry_result_mpvrsnerne"(), "slice"."__stand_retry_root_rvzhlkfxal"(), "slice"."__stand_retry_steadfast_input_chyldmp7fv"(), "slice"."__stand_retry_step_7csxwmutn2"() TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__retry_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind" TO :"slice_seats__retry_retirer";

GRANT SELECT ON TABLE "__slice_den"."retry_admitted", "__slice_den"."retry_brittle_input", "__slice_den"."retry_brittle_output", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_ladders_finish_output", "__slice_den"."retry_ladders_input", "__slice_den"."retry_patient_input", "__slice_den"."retry_patient_output", "__slice_den"."retry_polite_input", "__slice_den"."retry_polite_output", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_steadfast_input", "__slice_den"."retry_steadfast_output", "__slice_den"."retry_step", "__slice_den"."retry_throttled_finish_output", "__slice_den"."retry_throttled_input", "__slice_den"."retry_unhurried_finish_output", "__slice_den"."retry_unhurried_input" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_admitted" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_brittle_input" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_brittle_output" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_claim" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_done" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_ended" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_exhausted" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_failed" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_fenced" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_finish" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_held" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_ladders_finish_output" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_ladders_input" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_patient_input" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_patient_output" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_polite_input" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_polite_output" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_refusal" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_result" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_retry" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_scope" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_skipped" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_start_step" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_steadfast_input" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_steadfast_output" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_step" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_throttled_finish_output" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_throttled_input" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_unhurried_finish_output" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_unhurried_input" TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_retry_brittle_input_3pbycrawjg"(), "slice"."__stand_retry_done_ll42rjotis"(), "slice"."__stand_retry_failed_wyonvn6i5o"(), "slice"."__stand_retry_patient_input_jxb7jnsja6"(), "slice"."__stand_retry_polite_input_uiwzzm343r"(), "slice"."__stand_retry_result_mpvrsnerne"(), "slice"."__stand_retry_steadfast_input_chyldmp7fv"(), "slice"."__stand_retry_step_7csxwmutn2"() TO :"slice_seats__retry_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_retry_claim_attempt_exbl6vgycp" TO :"slice_seats__retry_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "slice_seats__review_coordinator" TO :"slice_seats__review_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind" TO :"slice_seats__review_coordinator";

GRANT SELECT ON TABLE "__slice_den"."review_paused", "__slice_den"."review_resumed", "__slice_den"."review_served", "slice_seats__review_coordinator"."review_live" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_paused" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_resumed" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_served" TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice", "__slice_den", "slice_seats__review_den" TO :"slice_seats__review_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__review_den";

GRANT SELECT ON TABLE "__slice"."delivered", "__slice_den"."review_admitted", "__slice_den"."review_analyze_input", "__slice_den"."review_analyze_output", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_gather_input", "__slice_den"."review_gather_input_sizes", "__slice_den"."review_gather_output", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_paused", "__slice_den"."review_questions_finish_output", "__slice_den"."review_questions_input", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_resumed", "__slice_den"."review_retry", "__slice_den"."review_review_run_finish_output", "__slice_den"."review_review_run_input", "__slice_den"."review_review_run_input_sizes", "__slice_den"."review_root", "__slice_den"."review_save_input", "__slice_den"."review_save_output", "__slice_den"."review_saved", "__slice_den"."review_scope", "__slice_den"."review_served", "__slice_den"."review_skipped", "__slice_den"."review_split", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within", "slice_seats__review_den"."review_live" TO :"slice_seats__review_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."review_requested_with" TO :"slice_seats__review_den";

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

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_review_analyze_input_pspszgkzox"(), "slice"."__stand_review_claim_hkt7qw7mpi"(), "slice"."__stand_review_done_ujerlpx2vl"(), "slice"."__stand_review_ended_h3z5bew2vq"(), "slice"."__stand_review_failed_a5vyjorx3e"(), "slice"."__stand_review_gather_input_jx633zhg4g"(), "slice"."__stand_review_held_kz6nzl3mw3"(), "slice"."__stand_review_hold_nhd6ml2ptp"(), "slice"."__stand_review_questions_input_c55nnxszay"(), "slice"."__stand_review_requested_with_o2plzxclt7"(), "slice"."__stand_review_result_7berxkzbzb"(), "slice"."__stand_review_root_ejfkrp7dtz"(), "slice"."__stand_review_save_input_nwulronicu"(), "slice"."__stand_review_step_aidfiao2mn"(), "slice"."__stand_review_within_bqv44gzoli"() TO :"slice_seats__review_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__review_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice"."__text_t4rwovzmqj" TO :"slice_seats__review_retirer";

GRANT SELECT ON TABLE "__slice_den"."review_admitted", "__slice_den"."review_analyze_input", "__slice_den"."review_analyze_output", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_gather_input", "__slice_den"."review_gather_input_sizes", "__slice_den"."review_gather_output", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_questions_finish_output", "__slice_den"."review_questions_input", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_retry", "__slice_den"."review_review_run_finish_output", "__slice_den"."review_review_run_input", "__slice_den"."review_review_run_input_sizes", "__slice_den"."review_root", "__slice_den"."review_save_input", "__slice_den"."review_save_output", "__slice_den"."review_saved", "__slice_den"."review_scope", "__slice_den"."review_skipped", "__slice_den"."review_split", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_admitted" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_analyze_input" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_analyze_output" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_claim" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_done" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_ended" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_exhausted" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_failed" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_fenced" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_finish" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_gather_input" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_gather_input_sizes" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_gather_output" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_held" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_hold" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_questions_finish_output" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_questions_input" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_refusal" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_result" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_retry" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_review_run_finish_output" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_review_run_input" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_review_run_input_sizes" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_save_input" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_save_output" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_saved" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_scope" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_skipped" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_split" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_start_scope" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_start_step" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_step" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_within" TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_review_analyze_input_pspszgkzox"(), "slice"."__stand_review_claim_hkt7qw7mpi"(), "slice"."__stand_review_done_ujerlpx2vl"(), "slice"."__stand_review_ended_h3z5bew2vq"(), "slice"."__stand_review_failed_a5vyjorx3e"(), "slice"."__stand_review_gather_input_jx633zhg4g"(), "slice"."__stand_review_held_kz6nzl3mw3"(), "slice"."__stand_review_hold_nhd6ml2ptp"(), "slice"."__stand_review_questions_input_c55nnxszay"(), "slice"."__stand_review_result_7berxkzbzb"(), "slice"."__stand_review_save_input_nwulronicu"(), "slice"."__stand_review_step_aidfiao2mn"(), "slice"."__stand_review_within_bqv44gzoli"() TO :"slice_seats__review_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" TO :"slice_seats__review_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__sync_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind" TO :"slice_seats__sync_coordinator";

GRANT SELECT ON TABLE "__slice_den"."sync_exclusive", "__slice_den"."sync_paused", "__slice_den"."sync_released", "__slice_den"."sync_resumed", "__slice_den"."sync_served" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_exclusive" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_paused" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_released" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_resumed" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_served" TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__sync_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."chain_kind", "slice_den"."chain_outcome", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind" TO :"slice_seats__sync_den";

GRANT SELECT ON TABLE "__slice_den"."chain_result", "__slice_den"."chain_step", "__slice_den"."sync_admitted", "__slice_den"."sync_build_input", "__slice_den"."sync_build_output", "__slice_den"."sync_claim", "__slice_den"."sync_copy_input", "__slice_den"."sync_copy_output", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_gold_finish_output", "__slice_den"."sync_gold_input", "__slice_den"."sync_held", "__slice_den"."sync_paused", "__slice_den"."sync_refusal", "__slice_den"."sync_released", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_resumed", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_served", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice_den"."sync_sync_run_finish_output", "__slice_den"."sync_sync_run_input" TO :"slice_seats__sync_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_requested_with" TO :"slice_seats__sync_den";

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

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_sync_build_input_le3amndvci"(), "slice"."__stand_sync_copy_input_wr7g5cohy6"(), "slice"."__stand_sync_done_4ihvwniwqp"(), "slice"."__stand_sync_failed_uzrsh7vxay"(), "slice"."__stand_sync_requested_with_4lul7oihcy"(), "slice"."__stand_sync_result_fkuahqxxbc"(), "slice"."__stand_sync_root_otymwhik42"(), "slice"."__stand_sync_step_mljbwcbsm5"() TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__sync_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind" TO :"slice_seats__sync_retirer";

GRANT SELECT ON TABLE "__slice_den"."sync_admitted", "__slice_den"."sync_build_input", "__slice_den"."sync_build_output", "__slice_den"."sync_claim", "__slice_den"."sync_copy_input", "__slice_den"."sync_copy_output", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_gold_finish_output", "__slice_den"."sync_gold_input", "__slice_den"."sync_held", "__slice_den"."sync_refusal", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice_den"."sync_sync_run_finish_output", "__slice_den"."sync_sync_run_input" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_admitted" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_build_input" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_build_output" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_claim" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_copy_input" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_copy_output" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_done" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_ended" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_exclusive_key" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_exhausted" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_failed" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_fenced" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_finish" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_gold_finish_output" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_gold_input" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_held" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_refusal" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_result" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_retry" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_scope" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_skipped" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_start_step" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_step" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_sync_run_finish_output" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_sync_run_input" TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_sync_build_input_le3amndvci"(), "slice"."__stand_sync_copy_input_wr7g5cohy6"(), "slice"."__stand_sync_done_4ihvwniwqp"(), "slice"."__stand_sync_failed_uzrsh7vxay"(), "slice"."__stand_sync_result_fkuahqxxbc"(), "slice"."__stand_sync_step_mljbwcbsm5"() TO :"slice_seats__sync_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" TO :"slice_seats__sync_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice" TO :"slice_seats__worker";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__worker";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__writeback_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind" TO :"slice_seats__writeback_coordinator";

GRANT SELECT ON TABLE "__slice_den"."writeback_paused", "__slice_den"."writeback_resumed", "__slice_den"."writeback_served" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_paused" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_resumed" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_served" TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__writeback_den";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__sha256", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind" TO :"slice_seats__writeback_den";

GRANT SELECT ON TABLE "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_deliver_input", "__slice_den"."writeback_deliver_output", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_paused", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_resumed", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_served", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."writeback_writeback_finish_output", "__slice_den"."writeback_writeback_input" TO :"slice_seats__writeback_den";

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

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_requested_with" TO :"slice_seats__writeback_den";

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

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_writeback_deliver_input_qibs4x7ys4"(), "slice"."__stand_writeback_done_ra7zoinlni"(), "slice"."__stand_writeback_failed_tv4kbeol35"(), "slice"."__stand_writeback_requested_with_xfqdgwx6jv"(), "slice"."__stand_writeback_result_owlolckns5"(), "slice"."__stand_writeback_root_m53pgt6gxz"(), "slice"."__stand_writeback_step_dhhgvpedc7"() TO :"slice_seats__writeback_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__writeback_retirer";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."__sha256", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind" TO :"slice_seats__writeback_retirer";

GRANT SELECT ON TABLE "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_deliver_input", "__slice_den"."writeback_deliver_output", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."writeback_writeback_finish_output", "__slice_den"."writeback_writeback_input" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_admitted" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_claim" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_deliver_input" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_deliver_output" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_done" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_ended" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_exhausted" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_failed" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_fenced" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_finish" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_held" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_refusal" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_result" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_retry" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_scope" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_skipped" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_start_step" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_step" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_writeback_finish_output" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_writeback_input" TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_writeback_deliver_input_qibs4x7ys4"(), "slice"."__stand_writeback_done_ra7zoinlni"(), "slice"."__stand_writeback_failed_tv4kbeol35"(), "slice"."__stand_writeback_result_owlolckns5"(), "slice"."__stand_writeback_step_dhhgvpedc7"() TO :"slice_seats__writeback_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_writeback_claim_attempt_pk673p2jar" TO :"slice_seats__writeback_retirer";

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
REVOKE ALL ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "__slice", "slice_seats__fan_coordinator", "slice_seats__fan_den", "slice_seats__review_coordinator", "slice_seats__review_den" FROM PUBLIC;

REVOKE ALL ON TABLE "slice_den"."assign_admitted", "slice_den"."assign_asked", "slice_den"."assign_assignment_finish_output", "slice_den"."assign_assignment_input", "slice_den"."assign_assignment_input_exclude", "slice_den"."assign_assignment_input_mode_nearest", "slice_den"."assign_assignment_input_mode_within", "slice_den"."assign_assignment_input_near", "slice_den"."assign_claim", "slice_den"."assign_decide_input", "slice_den"."assign_decide_input_exclude", "slice_den"."assign_decide_input_mode_nearest", "slice_den"."assign_decide_input_mode_within", "slice_den"."assign_decide_output", "slice_den"."assign_decide_output_stage_rest", "slice_den"."assign_decide_output_stage_serve", "slice_den"."assign_decide_output_weighed", "slice_den"."assign_decide_read_nearest", "slice_den"."assign_decide_read_nearest_row", "slice_den"."assign_decide_read_seen", "slice_den"."assign_decide_read_seen_row", "slice_den"."assign_done", "slice_den"."assign_embed_input", "slice_den"."assign_embed_input_exclude", "slice_den"."assign_embed_input_mode_nearest", "slice_den"."assign_embed_input_mode_within", "slice_den"."assign_embed_input_near", "slice_den"."assign_embed_output", "slice_den"."assign_ended", "slice_den"."assign_exhausted", "slice_den"."assign_failed", "slice_den"."assign_fenced", "slice_den"."assign_finish", "slice_den"."assign_held", "slice_den"."assign_paused", "slice_den"."assign_refusal", "slice_den"."assign_requested_with", "slice_den"."assign_result", "slice_den"."assign_resumed", "slice_den"."assign_retry", "slice_den"."assign_root", "slice_den"."assign_scope", "slice_den"."assign_served", "slice_den"."assign_skipped", "slice_den"."assign_start_step", "slice_den"."assign_step", "slice"."assigned", "slice_den"."audit", "slice"."built", "slice_den"."chain_admitted", "slice_den"."chain_chain_run_finish_output", "slice_den"."chain_chain_run_input", "slice_den"."chain_claim", "slice_den"."chain_done", "slice_den"."chain_ended", "slice_den"."chain_exhausted", "slice_den"."chain_failed", "slice_den"."chain_fenced", "slice_den"."chain_finish", "slice_den"."chain_held", "slice_den"."chain_next", "slice_den"."chain_ordered_finish_output", "slice_den"."chain_ordered_input", "slice_den"."chain_page_input", "slice_den"."chain_page_input_after", "slice_den"."chain_page_output", "slice_den"."chain_page_output_next", "slice_den"."chain_page_read_earlier", "slice_den"."chain_page_read_earlier_row", "slice_den"."chain_page_read_tree", "slice_den"."chain_page_read_tree_items", "slice_den"."chain_page_read_tree_row", "slice_den"."chain_page_read_weights", "slice_den"."chain_page_read_weights_row", "slice_den"."chain_page_tree_first", "slice_den"."chain_paused", "slice_den"."chain_refusal", "slice_den"."chain_requested_with", "slice_den"."chain_result", "slice_den"."chain_resumed", "slice_den"."chain_retry", "slice_den"."chain_root", "slice_den"."chain_scope", "slice_den"."chain_served", "slice_den"."chain_skipped", "slice_den"."chain_start_step", "slice_den"."chain_step", "slice"."chimed", "slice_den"."clock_admitted", "slice_den"."clock_chime_input", "slice_den"."clock_chime_output", "slice_den"."clock_claim", "slice_den"."clock_close_input", "slice_den"."clock_close_output", "slice_den"."clock_done", "slice_den"."clock_ended", "slice_den"."clock_exhausted", "slice_den"."clock_failed", "slice_den"."clock_fenced", "slice_den"."clock_finish", "slice_den"."clock_held", "slice_den"."clock_hourly_finish_output", "slice_den"."clock_hourly_input", "slice_den"."clock_hourly_key", "slice_den"."clock_paused", "slice_den"."clock_refusal", "slice_den"."clock_requested_with", "slice_den"."clock_result", "slice_den"."clock_resumed", "slice_den"."clock_retry", "slice_den"."clock_root", "slice_den"."clock_scope", "slice_den"."clock_served", "slice_den"."clock_sitting_finish_output", "slice_den"."clock_sitting_input", "slice_den"."clock_skipped", "slice_den"."clock_start_step", "slice_den"."clock_step", "slice"."concluded", "slice"."copied", "slice"."cursor", "slice"."delivered", "slice_den"."fan_admitted", "slice_den"."fan_batch_finish_output", "slice_den"."fan_batch_input", "slice_den"."fan_claim", "slice_den"."fan_done", "slice_den"."fan_dust_input", "slice_den"."fan_dust_output", "slice_den"."fan_ended", "slice_den"."fan_exclusive", "slice_den"."fan_exclusive_key", "slice_den"."fan_exhausted", "slice_den"."fan_failed", "slice_den"."fan_fan_run_finish_output", "slice_den"."fan_fan_run_input", "slice_den"."fan_fenced", "slice_den"."fan_finish", "slice_den"."fan_held", "slice_den"."fan_hold", "slice_den"."fan_mop_input", "slice_den"."fan_mop_output", "slice_den"."fan_paused", "slice_den"."fan_refusal", "slice_den"."fan_released", "slice_den"."fan_requested_with", "slice_den"."fan_result", "slice_den"."fan_resumed", "slice_den"."fan_retry", "slice_den"."fan_root", "slice_den"."fan_scope", "slice_den"."fan_served", "slice_den"."fan_skipped", "slice_den"."fan_square_input", "slice_den"."fan_square_output", "slice_den"."fan_start_scope", "slice_den"."fan_start_step", "slice_den"."fan_step", "slice_den"."fan_sweep_finish_output", "slice_den"."fan_sweep_input", "slice_den"."fan_wanted_finish_output", "slice_den"."fan_wanted_input", "slice_den"."fan_wanted_key", "slice_den"."fan_within", "slice"."heard", "slice"."item", "slice"."order", "slice"."passage", "slice_den"."retry_admitted", "slice_den"."retry_brittle_input", "slice_den"."retry_brittle_output", "slice_den"."retry_claim", "slice_den"."retry_done", "slice_den"."retry_ended", "slice_den"."retry_exhausted", "slice_den"."retry_failed", "slice_den"."retry_fenced", "slice_den"."retry_finish", "slice_den"."retry_held", "slice_den"."retry_ladders_finish_output", "slice_den"."retry_ladders_input", "slice_den"."retry_patient_input", "slice_den"."retry_patient_output", "slice_den"."retry_paused", "slice_den"."retry_polite_input", "slice_den"."retry_polite_output", "slice_den"."retry_refusal", "slice_den"."retry_requested_with", "slice_den"."retry_result", "slice_den"."retry_resumed", "slice_den"."retry_retry", "slice_den"."retry_root", "slice_den"."retry_scope", "slice_den"."retry_served", "slice_den"."retry_skipped", "slice_den"."retry_start_step", "slice_den"."retry_steadfast_input", "slice_den"."retry_steadfast_output", "slice_den"."retry_step", "slice_den"."retry_throttled_finish_output", "slice_den"."retry_throttled_input", "slice_den"."retry_unhurried_finish_output", "slice_den"."retry_unhurried_input", "slice_den"."review_admitted", "slice_den"."review_analyze_input", "slice_den"."review_analyze_output", "slice_den"."review_claim", "slice_den"."review_done", "slice_den"."review_ended", "slice_den"."review_exhausted", "slice_den"."review_failed", "slice_den"."review_fenced", "slice_den"."review_finish", "slice_den"."review_gather_input", "slice_den"."review_gather_input_sizes", "slice_den"."review_gather_output", "slice_den"."review_held", "slice_den"."review_hold", "slice_den"."review_paused", "slice_den"."review_questions_finish_output", "slice_den"."review_questions_input", "slice_den"."review_refusal", "slice_den"."review_requested_with", "slice_den"."review_result", "slice_den"."review_resumed", "slice_den"."review_retry", "slice_den"."review_review_run_finish_output", "slice_den"."review_review_run_input", "slice_den"."review_review_run_input_sizes", "slice_den"."review_root", "slice_den"."review_save_input", "slice_den"."review_save_output", "slice_den"."review_saved", "slice_den"."review_scope", "slice_den"."review_served", "slice_den"."review_skipped", "slice_den"."review_split", "slice_den"."review_start_scope", "slice_den"."review_start_step", "slice_den"."review_step", "slice_den"."review_within", "slice"."reviewed", "slice"."seen", "slice"."settled", "slice"."summary", "slice_den"."sync_admitted", "slice_den"."sync_build_input", "slice_den"."sync_build_output", "slice_den"."sync_claim", "slice_den"."sync_copy_input", "slice_den"."sync_copy_output", "slice_den"."sync_done", "slice_den"."sync_ended", "slice_den"."sync_exclusive", "slice_den"."sync_exclusive_key", "slice_den"."sync_exhausted", "slice_den"."sync_failed", "slice_den"."sync_fenced", "slice_den"."sync_finish", "slice_den"."sync_gold_finish_output", "slice_den"."sync_gold_input", "slice_den"."sync_held", "slice_den"."sync_paused", "slice_den"."sync_refusal", "slice_den"."sync_released", "slice_den"."sync_requested_with", "slice_den"."sync_result", "slice_den"."sync_resumed", "slice_den"."sync_retry", "slice_den"."sync_root", "slice_den"."sync_scope", "slice_den"."sync_served", "slice_den"."sync_skipped", "slice_den"."sync_start_step", "slice_den"."sync_step", "slice_den"."sync_sync_run_finish_output", "slice_den"."sync_sync_run_input", "slice"."tally", "slice"."want", "slice"."weight", "slice_den"."writeback_admitted", "slice_den"."writeback_claim", "slice_den"."writeback_deliver_input", "slice_den"."writeback_deliver_output", "slice_den"."writeback_done", "slice_den"."writeback_ended", "slice_den"."writeback_exhausted", "slice_den"."writeback_failed", "slice_den"."writeback_fenced", "slice_den"."writeback_finish", "slice_den"."writeback_held", "slice_den"."writeback_paused", "slice_den"."writeback_refusal", "slice_den"."writeback_requested_with", "slice_den"."writeback_result", "slice_den"."writeback_resumed", "slice_den"."writeback_retry", "slice_den"."writeback_root", "slice_den"."writeback_scope", "slice_den"."writeback_served", "slice_den"."writeback_skipped", "slice_den"."writeback_start_step", "slice_den"."writeback_step", "slice_den"."writeback_writeback_finish_output", "slice_den"."writeback_writeback_input", "__slice_den"."assign_admitted", "__slice_den"."assign_asked", "__slice_den"."assign_assignment_finish_output", "__slice_den"."assign_assignment_input", "__slice_den"."assign_assignment_input_exclude", "__slice_den"."assign_assignment_input_mode_nearest", "__slice_den"."assign_assignment_input_mode_within", "__slice_den"."assign_assignment_input_near", "__slice_den"."assign_claim", "__slice_den"."assign_decide_input", "__slice_den"."assign_decide_input_exclude", "__slice_den"."assign_decide_input_mode_nearest", "__slice_den"."assign_decide_input_mode_within", "__slice_den"."assign_decide_output", "__slice_den"."assign_decide_output_stage_rest", "__slice_den"."assign_decide_output_stage_serve", "__slice_den"."assign_decide_output_weighed", "__slice_den"."assign_decide_read_nearest", "__slice_den"."assign_decide_read_nearest_row", "__slice_den"."assign_decide_read_seen", "__slice_den"."assign_decide_read_seen_row", "__slice_den"."assign_done", "__slice_den"."assign_embed_input", "__slice_den"."assign_embed_input_exclude", "__slice_den"."assign_embed_input_mode_nearest", "__slice_den"."assign_embed_input_mode_within", "__slice_den"."assign_embed_input_near", "__slice_den"."assign_embed_output", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_paused", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_resumed", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_served", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step", "__slice"."assigned", "__slice_den"."audit", "__slice"."built", "__slice_den"."chain_admitted", "__slice_den"."chain_chain_run_finish_output", "__slice_den"."chain_chain_run_input", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_next", "__slice_den"."chain_ordered_finish_output", "__slice_den"."chain_ordered_input", "__slice_den"."chain_page_input", "__slice_den"."chain_page_input_after", "__slice_den"."chain_page_output", "__slice_den"."chain_page_output_next", "__slice_den"."chain_page_read_earlier", "__slice_den"."chain_page_read_earlier_row", "__slice_den"."chain_page_read_tree", "__slice_den"."chain_page_read_tree_items", "__slice_den"."chain_page_read_tree_row", "__slice_den"."chain_page_read_weights", "__slice_den"."chain_page_read_weights_row", "__slice_den"."chain_page_tree_first", "__slice_den"."chain_paused", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_resumed", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_served", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice"."chimed", "__slice_den"."clock_admitted", "__slice_den"."clock_chime_input", "__slice_den"."clock_chime_output", "__slice_den"."clock_claim", "__slice_den"."clock_close_input", "__slice_den"."clock_close_output", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_hourly_finish_output", "__slice_den"."clock_hourly_input", "__slice_den"."clock_hourly_key", "__slice_den"."clock_paused", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_resumed", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_served", "__slice_den"."clock_sitting_finish_output", "__slice_den"."clock_sitting_input", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice"."delivered", "__slice_den"."fan_admitted", "__slice_den"."fan_batch_finish_output", "__slice_den"."fan_batch_input", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_dust_input", "__slice_den"."fan_dust_output", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fan_run_finish_output", "__slice_den"."fan_fan_run_input", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_mop_input", "__slice_den"."fan_mop_output", "__slice_den"."fan_paused", "__slice_den"."fan_refusal", "__slice_den"."fan_released", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_resumed", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_served", "__slice_den"."fan_skipped", "__slice_den"."fan_square_input", "__slice_den"."fan_square_output", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_sweep_finish_output", "__slice_den"."fan_sweep_input", "__slice_den"."fan_wanted_finish_output", "__slice_den"."fan_wanted_input", "__slice_den"."fan_wanted_key", "__slice_den"."fan_within", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice"."passage", "__slice_den"."retry_admitted", "__slice_den"."retry_brittle_input", "__slice_den"."retry_brittle_output", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_ladders_finish_output", "__slice_den"."retry_ladders_input", "__slice_den"."retry_patient_input", "__slice_den"."retry_patient_output", "__slice_den"."retry_paused", "__slice_den"."retry_polite_input", "__slice_den"."retry_polite_output", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_resumed", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_served", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_steadfast_input", "__slice_den"."retry_steadfast_output", "__slice_den"."retry_step", "__slice_den"."retry_throttled_finish_output", "__slice_den"."retry_throttled_input", "__slice_den"."retry_unhurried_finish_output", "__slice_den"."retry_unhurried_input", "__slice_den"."review_admitted", "__slice_den"."review_analyze_input", "__slice_den"."review_analyze_output", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_gather_input", "__slice_den"."review_gather_input_sizes", "__slice_den"."review_gather_output", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_paused", "__slice_den"."review_questions_finish_output", "__slice_den"."review_questions_input", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_resumed", "__slice_den"."review_retry", "__slice_den"."review_review_run_finish_output", "__slice_den"."review_review_run_input", "__slice_den"."review_review_run_input_sizes", "__slice_den"."review_root", "__slice_den"."review_save_input", "__slice_den"."review_save_output", "__slice_den"."review_saved", "__slice_den"."review_scope", "__slice_den"."review_served", "__slice_den"."review_skipped", "__slice_den"."review_split", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within", "__slice"."reviewed", "__slice"."seen", "__slice"."settled", "__slice"."summary", "__slice_den"."sync_admitted", "__slice_den"."sync_build_input", "__slice_den"."sync_build_output", "__slice_den"."sync_claim", "__slice_den"."sync_copy_input", "__slice_den"."sync_copy_output", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_gold_finish_output", "__slice_den"."sync_gold_input", "__slice_den"."sync_held", "__slice_den"."sync_paused", "__slice_den"."sync_refusal", "__slice_den"."sync_released", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_resumed", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_served", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice_den"."sync_sync_run_finish_output", "__slice_den"."sync_sync_run_input", "__slice"."tally", "__slice"."want", "__slice"."weight", "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_deliver_input", "__slice_den"."writeback_deliver_output", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_paused", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_resumed", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_served", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."writeback_writeback_finish_output", "__slice_den"."writeback_writeback_input", "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_den"."fan_live", "slice_seats__review_coordinator"."review_live", "slice_seats__review_den"."review_live" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."__sha256", "slice_den"."assign_assignment_input_mode", "slice_den"."assign_decide_input_mode", "slice_den"."assign_decide_output_stage", "slice_den"."assign_embed_input_mode", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice_den"."chain_chain_run_input_feed", "slice_den"."chain_kind", "slice_den"."chain_ordered_input_feed", "slice_den"."chain_outcome", "slice_den"."chain_page_input_feed", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind", "slice"."feed", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind", "slice"."__text_t4rwovzmqj", "slice"."__domain_e5fpjchj5r", "slice"."__domain_mxhao3k6ss", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph", "slice"."__domain_p7dj7oebtz", "slice"."__param_nearest_topic_4eruqlfauv", "slice"."__param_seen_learner_exdgowkpja" FROM PUBLIC;

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

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() IS 'names of roster ChainChainRunInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_kind_names_oubqrwjyau"() IS 'names of roster ChainKind (e7bcf98ec63bf066e30e455f58e78f32232c8dc01b1a10cba9914a6fa99d1e74)';

COMMENT ON FUNCTION "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"() IS 'names of roster ChainOrderedInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() IS 'names of roster ChainOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() IS 'names of roster ChainPageInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_pausable_names_vjdoymenyq"() IS 'names of roster ChainPausable (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__chain_retry_why_names_zmog33hzfy"() IS 'names of roster ChainRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__chain_root_kind_names_ndmuh43zki"() IS 'names of roster ChainRootKind (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__clock_kind_names_7yqk67pwg5"() IS 'names of roster ClockKind (470d74a7a6f92cf958567d6d47a51d8c96bb4a79460d3dcd271053aca971f13c)';

COMMENT ON FUNCTION "slice"."__clock_outcome_names_rqtqczot4q"() IS 'names of roster ClockOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__clock_pausable_names_phjbr2fipl"() IS 'names of roster ClockPausable (62edc48c84e06e981b949cb51c8337c58291d320e97ddaa90c0ffa0d47a1438c)';

COMMENT ON FUNCTION "slice"."__clock_retry_why_names_pjdgx4s6a4"() IS 'names of roster ClockRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__clock_root_kind_names_3kro23qfv4"() IS 'names of roster ClockRootKind (62edc48c84e06e981b949cb51c8337c58291d320e97ddaa90c0ffa0d47a1438c)';

COMMENT ON FUNCTION "slice"."__fan_child_kind_names_i6k53d3e2e"() IS 'names of roster FanChildKind (8ded20e9870697347aad8af4862ccc68f6964e6f66ab9fd021269b219a0d455a)';

COMMENT ON FUNCTION "slice"."__fan_kind_names_6jgkvuzg33"() IS 'names of roster FanKind (f0b7414eff40e4de2ddd8656d69b20e0a311df5847900584e11891d869c9169c)';

COMMENT ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() IS 'names of roster FanOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__fan_pausable_names_fpk6cvxfiv"() IS 'names of roster FanPausable (cb358d730ebdebd3a9c3a57e1163016923372f8895e0dde2377cbc07aa22f3b4)';

COMMENT ON FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() IS 'names of roster FanResource (5bea949a8ab6e8182609b54fd43410c2c13a5abe4a43bb2905848fd3ad333c76)';

COMMENT ON FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() IS 'names of roster FanRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__fan_root_kind_names_jqlbcidhe6"() IS 'names of roster FanRootKind (e3fe543965aa8ef0f48182f18100dd7512f09c57343e7fde5cda628087d096ed)';

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

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_live_iopwed3csj"() IS 'live codes of roster ChainChainRunInputFeed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_kind_live_4t2tj7pchx"() IS 'live codes of roster ChainKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"() IS 'live codes of roster ChainOrderedInputFeed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_outcome_live_azc7nb42gy"() IS 'live codes of roster ChainOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_live_zxgp5dub6j"() IS 'live codes of roster ChainPageInputFeed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_pausable_live_ozpbw3gnsu"() IS 'live codes of roster ChainPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_retry_why_live_m5qnitynhz"() IS 'live codes of roster ChainRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__chain_root_kind_live_mnlnztwbz2"() IS 'live codes of roster ChainRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_kind_live_kem5uxahz7"() IS 'live codes of roster ClockKind (b74579d3b64ecff081cab2731adb2464f839e99b2eed45d65b3c1547c74f2de1)';

COMMENT ON FUNCTION "slice"."__clock_outcome_live_q7vjmi72sr"() IS 'live codes of roster ClockOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_pausable_live_waldzggn7s"() IS 'live codes of roster ClockPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_retry_why_live_auqnukeed5"() IS 'live codes of roster ClockRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__clock_root_kind_live_dkya2k5nqw"() IS 'live codes of roster ClockRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__fan_child_kind_live_lzght2aqpn"() IS 'live codes of roster FanChildKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__fan_kind_live_wcuqzqhqwl"() IS 'live codes of roster FanKind (81c5f5fc8ba40698944d57540929dee29893d3bf66a84aacfe8dc2be09d996e3)';

COMMENT ON FUNCTION "slice"."__fan_outcome_live_nos3iqln54"() IS 'live codes of roster FanOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__fan_pausable_live_m2rf37xwjt"() IS 'live codes of roster FanPausable (591ae590686ec68aa03e699030fe62fdeae06b893d263428aab7d66397d0f1fe)';

COMMENT ON FUNCTION "slice"."__fan_resource_live_yqyw4ee5fp"() IS 'live codes of roster FanResource (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__fan_retry_why_live_yom5egfb4x"() IS 'live codes of roster FanRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__fan_root_kind_live_zwogjm2ro3"() IS 'live codes of roster FanRootKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

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

COMMENT ON TYPE "slice"."__row_olds_assign_requested_with_du6qh7hi2e" IS 'the row type of the delta of olds of AssignRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_assign_result_y6xdg27a27" IS 'the row type of the delta of olds of AssignResult';

COMMENT ON TYPE "slice"."__row_news_assign_root_mlgojh5hbk" IS 'the row type of the delta of news of AssignRoot';

COMMENT ON TYPE "slice"."__row_olds_assign_step_zrm5kjcsbb" IS 'the row type of the delta of olds of AssignStep';

COMMENT ON TYPE "slice"."__row_news_chain_done_ipbxekr3jk" IS 'the row type of the delta of news of ChainDone';

COMMENT ON TYPE "slice"."__row_news_chain_failed_4o3dxe5oq4" IS 'the row type of the delta of news of ChainFailed';

COMMENT ON TYPE "slice"."__row_news_chain_page_input_5vfsi4iuxb" IS 'the row type of the delta of news of ChainPageInput';

COMMENT ON TYPE "slice"."__row_olds_chain_requested_with_chzxikdtnl" IS 'the row type of the delta of olds of ChainRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_chain_result_zhxr3n3y5v" IS 'the row type of the delta of olds of ChainResult';

COMMENT ON TYPE "slice"."__row_news_chain_root_3rdxqpnika" IS 'the row type of the delta of news of ChainRoot';

COMMENT ON TYPE "slice"."__row_olds_chain_step_a4auuc4j32" IS 'the row type of the delta of olds of ChainStep';

COMMENT ON TYPE "slice"."__row_news_clock_chime_input_67ym67psij" IS 'the row type of the delta of news of ClockChimeInput';

COMMENT ON TYPE "slice"."__row_news_clock_close_input_f7grz5pq5d" IS 'the row type of the delta of news of ClockCloseInput';

COMMENT ON TYPE "slice"."__row_news_clock_done_f4gq5vnwiu" IS 'the row type of the delta of news of ClockDone';

COMMENT ON TYPE "slice"."__row_news_clock_failed_banad75ik7" IS 'the row type of the delta of news of ClockFailed';

COMMENT ON TYPE "slice"."__row_news_clock_hourly_key_i76xjn5tfb" IS 'the row type of the delta of news of ClockHourlyKey';

COMMENT ON TYPE "slice"."__row_olds_clock_hourly_key_oaljgydoez" IS 'the row type of the delta of olds of ClockHourlyKey';

COMMENT ON TYPE "slice"."__row_olds_clock_requested_with_3fdps2cdvj" IS 'the row type of the delta of olds of ClockRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_clock_result_xmvy6bruki" IS 'the row type of the delta of olds of ClockResult';

COMMENT ON TYPE "slice"."__row_news_clock_root_77gtrqv5vx" IS 'the row type of the delta of news of ClockRoot';

COMMENT ON TYPE "slice"."__row_olds_clock_root_ady73n5pk3" IS 'the row type of the delta of olds of ClockRoot';

COMMENT ON TYPE "slice"."__row_olds_clock_step_ro3hcnnd7q" IS 'the row type of the delta of olds of ClockStep';

COMMENT ON TYPE "slice"."__row_news_fan_batch_input_zpegwpv2iw" IS 'the row type of the delta of news of FanBatchInput';

COMMENT ON TYPE "slice"."__row_news_fan_claim_7nx4hyfgum" IS 'the row type of the delta of news of FanClaim';

COMMENT ON TYPE "slice"."__row_news_fan_done_bm2pdkfeew" IS 'the row type of the delta of news of FanDone';

COMMENT ON TYPE "slice"."__row_news_fan_dust_input_eirsjaffsy" IS 'the row type of the delta of news of FanDustInput';

COMMENT ON TYPE "slice"."__row_olds_fan_ended_fjp3muqjpi" IS 'the row type of the delta of olds of FanEnded';

COMMENT ON TYPE "slice"."__row_news_fan_failed_wcom3bevi4" IS 'the row type of the delta of news of FanFailed';

COMMENT ON TYPE "slice"."__row_olds_fan_held_6pxeeuxzx5" IS 'the row type of the delta of olds of FanHeld';

COMMENT ON TYPE "slice"."__row_news_fan_hold_fiz7xnswto" IS 'the row type of the delta of news of FanHold';

COMMENT ON TYPE "slice"."__row_news_fan_mop_input_vkauufcv3s" IS 'the row type of the delta of news of FanMopInput';

COMMENT ON TYPE "slice"."__row_olds_fan_requested_with_vvlswsw6at" IS 'the row type of the delta of olds of FanRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_fan_result_cfwjurochh" IS 'the row type of the delta of olds of FanResult';

COMMENT ON TYPE "slice"."__row_news_fan_root_pek322ray3" IS 'the row type of the delta of news of FanRoot';

COMMENT ON TYPE "slice"."__row_olds_fan_root_tqdoaxqfia" IS 'the row type of the delta of olds of FanRoot';

COMMENT ON TYPE "slice"."__row_news_fan_square_input_oooc5jrvqp" IS 'the row type of the delta of news of FanSquareInput';

COMMENT ON TYPE "slice"."__row_olds_fan_step_e5cdd74oi6" IS 'the row type of the delta of olds of FanStep';

COMMENT ON TYPE "slice"."__row_news_fan_wanted_key_msnlbwd4zc" IS 'the row type of the delta of news of FanWantedKey';

COMMENT ON TYPE "slice"."__row_olds_fan_wanted_key_flihgepgsp" IS 'the row type of the delta of olds of FanWantedKey';

COMMENT ON TYPE "slice"."__row_olds_fan_within_igrko3tlla" IS 'the row type of the delta of olds of FanWithin';

COMMENT ON TYPE "slice"."__row_news_retry_brittle_input_gi4pw323hl" IS 'the row type of the delta of news of RetryBrittleInput';

COMMENT ON TYPE "slice"."__row_news_retry_done_3xnhmplocl" IS 'the row type of the delta of news of RetryDone';

COMMENT ON TYPE "slice"."__row_news_retry_failed_ht6i2dxi6i" IS 'the row type of the delta of news of RetryFailed';

COMMENT ON TYPE "slice"."__row_news_retry_patient_input_ujn3j6okjm" IS 'the row type of the delta of news of RetryPatientInput';

COMMENT ON TYPE "slice"."__row_news_retry_polite_input_6z54vs4crc" IS 'the row type of the delta of news of RetryPoliteInput';

COMMENT ON TYPE "slice"."__row_olds_retry_requested_with_pwesmz6aqt" IS 'the row type of the delta of olds of RetryRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_retry_result_sawexe6rws" IS 'the row type of the delta of olds of RetryResult';

COMMENT ON TYPE "slice"."__row_news_retry_root_bpmsp2lmj3" IS 'the row type of the delta of news of RetryRoot';

COMMENT ON TYPE "slice"."__row_news_retry_steadfast_input_6gk4r2it4l" IS 'the row type of the delta of news of RetrySteadfastInput';

COMMENT ON TYPE "slice"."__row_olds_retry_step_7e2dops6yg" IS 'the row type of the delta of olds of RetryStep';

COMMENT ON TYPE "slice"."__row_news_review_analyze_input_ahzjb4juuh" IS 'the row type of the delta of news of ReviewAnalyzeInput';

COMMENT ON TYPE "slice"."__row_news_review_claim_ku2calk2a4" IS 'the row type of the delta of news of ReviewClaim';

COMMENT ON TYPE "slice"."__row_news_review_done_i5yrctmmrt" IS 'the row type of the delta of news of ReviewDone';

COMMENT ON TYPE "slice"."__row_olds_review_ended_3vbje7ziry" IS 'the row type of the delta of olds of ReviewEnded';

COMMENT ON TYPE "slice"."__row_news_review_failed_o2i2xvx3ox" IS 'the row type of the delta of news of ReviewFailed';

COMMENT ON TYPE "slice"."__row_news_review_gather_input_3xhqgy4d4y" IS 'the row type of the delta of news of ReviewGatherInput';

COMMENT ON TYPE "slice"."__row_olds_review_held_aio2rgomle" IS 'the row type of the delta of olds of ReviewHeld';

COMMENT ON TYPE "slice"."__row_news_review_hold_s3lo4pqs6u" IS 'the row type of the delta of news of ReviewHold';

COMMENT ON TYPE "slice"."__row_news_review_questions_input_xqapos33bv" IS 'the row type of the delta of news of ReviewQuestionsInput';

COMMENT ON TYPE "slice"."__row_olds_review_requested_with_d4ep53ociv" IS 'the row type of the delta of olds of ReviewRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_review_result_4edqg37cfx" IS 'the row type of the delta of olds of ReviewResult';

COMMENT ON TYPE "slice"."__row_news_review_root_eshmunzwn4" IS 'the row type of the delta of news of ReviewRoot';

COMMENT ON TYPE "slice"."__row_news_review_save_input_g4felfy764" IS 'the row type of the delta of news of ReviewSaveInput';

COMMENT ON TYPE "slice"."__row_olds_review_step_5ly7sn3crk" IS 'the row type of the delta of olds of ReviewStep';

COMMENT ON TYPE "slice"."__row_olds_review_within_7w5djnlfoo" IS 'the row type of the delta of olds of ReviewWithin';

COMMENT ON TYPE "slice"."__row_news_sync_build_input_7gtarvuzgd" IS 'the row type of the delta of news of SyncBuildInput';

COMMENT ON TYPE "slice"."__row_news_sync_copy_input_cmgovnrtbu" IS 'the row type of the delta of news of SyncCopyInput';

COMMENT ON TYPE "slice"."__row_news_sync_done_srwysx2oys" IS 'the row type of the delta of news of SyncDone';

COMMENT ON TYPE "slice"."__row_news_sync_failed_uo7agxnsp7" IS 'the row type of the delta of news of SyncFailed';

COMMENT ON TYPE "slice"."__row_olds_sync_requested_with_7xi5vgtjja" IS 'the row type of the delta of olds of SyncRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_sync_result_5yd36qoig4" IS 'the row type of the delta of olds of SyncResult';

COMMENT ON TYPE "slice"."__row_news_sync_root_zdr2x363tg" IS 'the row type of the delta of news of SyncRoot';

COMMENT ON TYPE "slice"."__row_olds_sync_step_24id3jri34" IS 'the row type of the delta of olds of SyncStep';

COMMENT ON TYPE "slice"."__row_news_writeback_deliver_input_fl5m4s5p77" IS 'the row type of the delta of news of WritebackDeliverInput';

COMMENT ON TYPE "slice"."__row_news_writeback_done_l54jw73tg7" IS 'the row type of the delta of news of WritebackDone';

COMMENT ON TYPE "slice"."__row_news_writeback_failed_o2vuzrgz2y" IS 'the row type of the delta of news of WritebackFailed';

COMMENT ON TYPE "slice"."__row_olds_writeback_requested_with_bmpjgxjpa7" IS 'the row type of the delta of olds of WritebackRequestedWith';

COMMENT ON TYPE "slice"."__row_olds_writeback_result_ctqblben4u" IS 'the row type of the delta of olds of WritebackResult';

COMMENT ON TYPE "slice"."__row_news_writeback_root_gtduy6k6pr" IS 'the row type of the delta of news of WritebackRoot';

COMMENT ON TYPE "slice"."__row_olds_writeback_step_rvrwqy67gp" IS 'the row type of the delta of olds of WritebackStep';

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

COMMENT ON CONSTRAINT "__want_pk_exjpgudfoz" ON "slice"."want" IS 'primary key of Want';

COMMENT ON CONSTRAINT "__weight_pk_p77rl634io" ON "slice"."weight" IS 'primary key of Weight';

COMMENT ON CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" ON "slice_den"."assign_admitted" IS 'primary key of AssignAdmitted';

COMMENT ON CONSTRAINT "__assign_asked_pk_5hpdamg2sv" ON "slice_den"."assign_asked" IS 'primary key of AssignAsked';

COMMENT ON CONSTRAINT "__assign_asked_key_root_to_nusrq43or3" ON "slice_den"."assign_asked" IS 'key AssignAsked(root, to)';

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

COMMENT ON CONSTRAINT "__assign_finish_key_root_step_eqtmpheihj" ON "slice_den"."assign_finish" IS 'key AssignFinish(root, step)';

COMMENT ON CONSTRAINT "__assign_held_pk_by245z7t45" ON "slice_den"."assign_held" IS 'primary key of AssignHeld';

COMMENT ON CONSTRAINT "__assign_paused_pk_ulo4grv4e2" ON "slice_den"."assign_paused" IS 'primary key of AssignPaused';

COMMENT ON CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" ON "slice_den"."assign_refusal" IS 'primary key of AssignRefusal';

COMMENT ON CONSTRAINT "__assign_requested_with_pk_on2y3g7zqy" ON "slice_den"."assign_requested_with" IS 'primary key of AssignRequestedWith';

COMMENT ON CONSTRAINT "__assign_result_pk_i2yxmpkyzr" ON "slice_den"."assign_result" IS 'primary key of AssignResult';

COMMENT ON CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" ON "slice_den"."assign_resumed" IS 'primary key of AssignResumed';

COMMENT ON CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" ON "slice_den"."assign_retry" IS 'primary key of AssignRetry';

COMMENT ON CONSTRAINT "__assign_root_pk_b23qqyryx4" ON "slice_den"."assign_root" IS 'primary key of AssignRoot';

COMMENT ON CONSTRAINT "__assign_root_key_root_kind_albudrr2vv" ON "slice_den"."assign_root" IS 'key AssignRoot(root, kind)';

COMMENT ON CONSTRAINT "__assign_scope_pk_xytntbncid" ON "slice_den"."assign_scope" IS 'primary key of AssignScope';

COMMENT ON CONSTRAINT "__assign_scope_key_scope_6ayivwnr6w" ON "slice_den"."assign_scope" IS 'key AssignScope(scope)';

COMMENT ON CONSTRAINT "__assign_served_pk_gahaxyiegw" ON "slice_den"."assign_served" IS 'primary key of AssignServed';

COMMENT ON CONSTRAINT "__assign_skipped_pk_5qhgbueof7" ON "slice_den"."assign_skipped" IS 'primary key of AssignSkipped';

COMMENT ON CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" ON "slice_den"."assign_start_step" IS 'primary key of AssignStartStep';

COMMENT ON CONSTRAINT "__assign_start_step_key_root_step_n7nc3rlewh" ON "slice_den"."assign_start_step" IS 'key AssignStartStep(root, step)';

COMMENT ON CONSTRAINT "__assign_step_pk_2oc4ehvfzd" ON "slice_den"."assign_step" IS 'primary key of AssignStep';

COMMENT ON CONSTRAINT "__assign_step_key_step_onrbsu6v67" ON "slice_den"."assign_step" IS 'key AssignStep(step)';

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

COMMENT ON CONSTRAINT "__chain_finish_key_root_step_jhhtviztjs" ON "slice_den"."chain_finish" IS 'key ChainFinish(root, step)';

COMMENT ON CONSTRAINT "__chain_held_pk_73idl7oo5c" ON "slice_den"."chain_held" IS 'primary key of ChainHeld';

COMMENT ON CONSTRAINT "__chain_next_pk_qeumlilvtk" ON "slice_den"."chain_next" IS 'primary key of ChainNext';

COMMENT ON CONSTRAINT "__chain_next_key_root_to_jwrkpakwhb" ON "slice_den"."chain_next" IS 'key ChainNext(root, to)';

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

COMMENT ON CONSTRAINT "__chain_requested_with_pk_lkg4jmp76c" ON "slice_den"."chain_requested_with" IS 'primary key of ChainRequestedWith';

COMMENT ON CONSTRAINT "__chain_result_pk_btw3jzlkgl" ON "slice_den"."chain_result" IS 'primary key of ChainResult';

COMMENT ON CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" ON "slice_den"."chain_resumed" IS 'primary key of ChainResumed';

COMMENT ON CONSTRAINT "__chain_retry_pk_522nodru3s" ON "slice_den"."chain_retry" IS 'primary key of ChainRetry';

COMMENT ON CONSTRAINT "__chain_root_pk_wqfycdg3x5" ON "slice_den"."chain_root" IS 'primary key of ChainRoot';

COMMENT ON CONSTRAINT "__chain_root_key_root_kind_nrgbg46psl" ON "slice_den"."chain_root" IS 'key ChainRoot(root, kind)';

COMMENT ON CONSTRAINT "__chain_scope_pk_fxzt444lf6" ON "slice_den"."chain_scope" IS 'primary key of ChainScope';

COMMENT ON CONSTRAINT "__chain_scope_key_scope_w373uqpwyq" ON "slice_den"."chain_scope" IS 'key ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_served_pk_wzbdafznld" ON "slice_den"."chain_served" IS 'primary key of ChainServed';

COMMENT ON CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" ON "slice_den"."chain_skipped" IS 'primary key of ChainSkipped';

COMMENT ON CONSTRAINT "__chain_start_step_pk_dgda7shxb4" ON "slice_den"."chain_start_step" IS 'primary key of ChainStartStep';

COMMENT ON CONSTRAINT "__chain_start_step_key_root_step_ncsd5g5nar" ON "slice_den"."chain_start_step" IS 'key ChainStartStep(root, step)';

COMMENT ON CONSTRAINT "__chain_step_pk_u6x5wnvfbv" ON "slice_den"."chain_step" IS 'primary key of ChainStep';

COMMENT ON CONSTRAINT "__chain_step_key_step_32tfhd2p5e" ON "slice_den"."chain_step" IS 'key ChainStep(step)';

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

COMMENT ON CONSTRAINT "__clock_finish_key_root_step_gg4t25lynz" ON "slice_den"."clock_finish" IS 'key ClockFinish(root, step)';

COMMENT ON CONSTRAINT "__clock_held_pk_qqxrvee2gy" ON "slice_den"."clock_held" IS 'primary key of ClockHeld';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_pk_6bcdc5q3dt" ON "slice_den"."clock_hourly_finish_output" IS 'primary key of ClockHourlyFinishOutput';

COMMENT ON CONSTRAINT "__clock_hourly_input_pk_s536mhvux3" ON "slice_den"."clock_hourly_input" IS 'primary key of ClockHourlyInput';

COMMENT ON CONSTRAINT "__clock_hourly_key_pk_iqlcy244pv" ON "slice_den"."clock_hourly_key" IS 'primary key of ClockHourlyKey';

COMMENT ON CONSTRAINT "__clock_paused_pk_fsld2lekav" ON "slice_den"."clock_paused" IS 'primary key of ClockPaused';

COMMENT ON CONSTRAINT "__clock_refusal_pk_dslb6cgxa3" ON "slice_den"."clock_refusal" IS 'primary key of ClockRefusal';

COMMENT ON CONSTRAINT "__clock_requested_with_pk_4p3mwvs5e3" ON "slice_den"."clock_requested_with" IS 'primary key of ClockRequestedWith';

COMMENT ON CONSTRAINT "__clock_result_pk_yptcdjm6pu" ON "slice_den"."clock_result" IS 'primary key of ClockResult';

COMMENT ON CONSTRAINT "__clock_resumed_pk_iqjwv5tioc" ON "slice_den"."clock_resumed" IS 'primary key of ClockResumed';

COMMENT ON CONSTRAINT "__clock_retry_pk_4kyiqeoeqd" ON "slice_den"."clock_retry" IS 'primary key of ClockRetry';

COMMENT ON CONSTRAINT "__clock_root_pk_rnmiw3efr2" ON "slice_den"."clock_root" IS 'primary key of ClockRoot';

COMMENT ON CONSTRAINT "__clock_root_key_root_kind_e4vt5g6ggk" ON "slice_den"."clock_root" IS 'key ClockRoot(root, kind)';

COMMENT ON CONSTRAINT "__clock_scope_pk_dux445xz6c" ON "slice_den"."clock_scope" IS 'primary key of ClockScope';

COMMENT ON CONSTRAINT "__clock_scope_key_scope_ikor7cy7lf" ON "slice_den"."clock_scope" IS 'key ClockScope(scope)';

COMMENT ON CONSTRAINT "__clock_served_pk_t5lm3cvd5b" ON "slice_den"."clock_served" IS 'primary key of ClockServed';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_pk_pejmuwtji5" ON "slice_den"."clock_sitting_finish_output" IS 'primary key of ClockSittingFinishOutput';

COMMENT ON CONSTRAINT "__clock_sitting_input_pk_le4qxvpabo" ON "slice_den"."clock_sitting_input" IS 'primary key of ClockSittingInput';

COMMENT ON CONSTRAINT "__clock_skipped_pk_2whj2jo6zo" ON "slice_den"."clock_skipped" IS 'primary key of ClockSkipped';

COMMENT ON CONSTRAINT "__clock_start_step_pk_qgw6bnuo54" ON "slice_den"."clock_start_step" IS 'primary key of ClockStartStep';

COMMENT ON CONSTRAINT "__clock_start_step_key_root_step_pknqcsg3yv" ON "slice_den"."clock_start_step" IS 'key ClockStartStep(root, step)';

COMMENT ON CONSTRAINT "__clock_step_pk_jjmk3diqpl" ON "slice_den"."clock_step" IS 'primary key of ClockStep';

COMMENT ON CONSTRAINT "__clock_step_key_step_hgcnovy6vv" ON "slice_den"."clock_step" IS 'key ClockStep(step)';

COMMENT ON CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" ON "slice_den"."fan_admitted" IS 'primary key of FanAdmitted';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_pk_mq5omzswqd" ON "slice_den"."fan_batch_finish_output" IS 'primary key of FanBatchFinishOutput';

COMMENT ON CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" ON "slice_den"."fan_batch_input" IS 'primary key of FanBatchInput';

COMMENT ON CONSTRAINT "__fan_claim_pk_e7zimqppco" ON "slice_den"."fan_claim" IS 'primary key of FanClaim';

COMMENT ON CONSTRAINT "__fan_claim_key_root_step_attempt_holds_zpvvoill72" ON "slice_den"."fan_claim" IS 'key FanClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_done_pk_5u65252q52" ON "slice_den"."fan_done" IS 'primary key of FanDone';

COMMENT ON CONSTRAINT "__fan_dust_input_pk_xyleoykgmc" ON "slice_den"."fan_dust_input" IS 'primary key of FanDustInput';

COMMENT ON CONSTRAINT "__fan_dust_output_pk_3ve4gi5x6b" ON "slice_den"."fan_dust_output" IS 'primary key of FanDustOutput';

COMMENT ON CONSTRAINT "__fan_ended_pk_23aeteyyv7" ON "slice_den"."fan_ended" IS 'primary key of FanEnded';

COMMENT ON CONSTRAINT "__fan_exclusive_pk_m6sgdzlvmh" ON "slice_den"."fan_exclusive" IS 'primary key of FanExclusive';

COMMENT ON CONSTRAINT "__fan_exclusive_key_pk_dqq46aar7y" ON "slice_den"."fan_exclusive_key" IS 'primary key of FanExclusiveKey';

COMMENT ON CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" ON "slice_den"."fan_exhausted" IS 'primary key of FanExhausted';

COMMENT ON CONSTRAINT "__fan_failed_pk_z4etp5dmax" ON "slice_den"."fan_failed" IS 'primary key of FanFailed';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_pk_rhhjregxru" ON "slice_den"."fan_fan_run_finish_output" IS 'primary key of FanFanRunFinishOutput';

COMMENT ON CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" ON "slice_den"."fan_fan_run_input" IS 'primary key of FanFanRunInput';

COMMENT ON CONSTRAINT "__fan_fenced_pk_6tkvirerez" ON "slice_den"."fan_fenced" IS 'primary key of FanFenced';

COMMENT ON CONSTRAINT "__fan_finish_pk_6mb33urjra" ON "slice_den"."fan_finish" IS 'primary key of FanFinish';

COMMENT ON CONSTRAINT "__fan_finish_key_root_step_4hpunaiysi" ON "slice_den"."fan_finish" IS 'key FanFinish(root, step)';

COMMENT ON CONSTRAINT "__fan_held_pk_4ic6tjvac4" ON "slice_den"."fan_held" IS 'primary key of FanHeld';

COMMENT ON CONSTRAINT "__fan_hold_pk_avuqdkljvb" ON "slice_den"."fan_hold" IS 'primary key of FanHold';

COMMENT ON CONSTRAINT "__fan_hold_key_root_step_attempt_at_vy3k4db54f" ON "slice_den"."fan_hold" IS 'key FanHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__fan_mop_input_pk_jwnqekad76" ON "slice_den"."fan_mop_input" IS 'primary key of FanMopInput';

COMMENT ON CONSTRAINT "__fan_mop_output_pk_rcebyoc32v" ON "slice_den"."fan_mop_output" IS 'primary key of FanMopOutput';

COMMENT ON CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" ON "slice_den"."fan_paused" IS 'primary key of FanPaused';

COMMENT ON CONSTRAINT "__fan_refusal_pk_7va55wo2wj" ON "slice_den"."fan_refusal" IS 'primary key of FanRefusal';

COMMENT ON CONSTRAINT "__fan_released_pk_kzdup6rx4m" ON "slice_den"."fan_released" IS 'primary key of FanReleased';

COMMENT ON CONSTRAINT "__fan_requested_with_pk_vaj2obx6si" ON "slice_den"."fan_requested_with" IS 'primary key of FanRequestedWith';

COMMENT ON CONSTRAINT "__fan_result_pk_yeear352sx" ON "slice_den"."fan_result" IS 'primary key of FanResult';

COMMENT ON CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" ON "slice_den"."fan_resumed" IS 'primary key of FanResumed';

COMMENT ON CONSTRAINT "__fan_retry_pk_7xubce4v66" ON "slice_den"."fan_retry" IS 'primary key of FanRetry';

COMMENT ON CONSTRAINT "__fan_root_pk_jesu7xtefn" ON "slice_den"."fan_root" IS 'primary key of FanRoot';

COMMENT ON CONSTRAINT "__fan_root_key_root_kind_fhgsejgmzx" ON "slice_den"."fan_root" IS 'key FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_scope_pk_7bvjfihnef" ON "slice_den"."fan_scope" IS 'primary key of FanScope';

COMMENT ON CONSTRAINT "__fan_scope_key_scope_ehh72plhww" ON "slice_den"."fan_scope" IS 'key FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_served_pk_hcfoxxhdsr" ON "slice_den"."fan_served" IS 'primary key of FanServed';

COMMENT ON CONSTRAINT "__fan_skipped_pk_22erbmfzer" ON "slice_den"."fan_skipped" IS 'primary key of FanSkipped';

COMMENT ON CONSTRAINT "__fan_square_input_pk_uzumoizv53" ON "slice_den"."fan_square_input" IS 'primary key of FanSquareInput';

COMMENT ON CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" ON "slice_den"."fan_square_output" IS 'primary key of FanSquareOutput';

COMMENT ON CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" ON "slice_den"."fan_start_scope" IS 'primary key of FanStartScope';

COMMENT ON CONSTRAINT "__fan_start_scope_key_root_child_7zmuuriysl" ON "slice_den"."fan_start_scope" IS 'key FanStartScope(root, child)';

COMMENT ON CONSTRAINT "__fan_start_step_pk_7e247xk4mz" ON "slice_den"."fan_start_step" IS 'primary key of FanStartStep';

COMMENT ON CONSTRAINT "__fan_start_step_key_root_step_edhkhzfqxw" ON "slice_den"."fan_start_step" IS 'key FanStartStep(root, step)';

COMMENT ON CONSTRAINT "__fan_step_pk_2f4tcxnofk" ON "slice_den"."fan_step" IS 'primary key of FanStep';

COMMENT ON CONSTRAINT "__fan_step_key_step_zhkwete5vm" ON "slice_den"."fan_step" IS 'key FanStep(step)';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_pk_7dvx2ngckn" ON "slice_den"."fan_sweep_finish_output" IS 'primary key of FanSweepFinishOutput';

COMMENT ON CONSTRAINT "__fan_sweep_input_pk_zzlgjjqr6f" ON "slice_den"."fan_sweep_input" IS 'primary key of FanSweepInput';

COMMENT ON CONSTRAINT "__fan_wanted_finish_output_pk_yzfwxx7lln" ON "slice_den"."fan_wanted_finish_output" IS 'primary key of FanWantedFinishOutput';

COMMENT ON CONSTRAINT "__fan_wanted_input_pk_dnq2nzzzkx" ON "slice_den"."fan_wanted_input" IS 'primary key of FanWantedInput';

COMMENT ON CONSTRAINT "__fan_wanted_key_pk_uqg7pqcckj" ON "slice_den"."fan_wanted_key" IS 'primary key of FanWantedKey';

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

COMMENT ON CONSTRAINT "__retry_finish_key_root_step_lrmuwwupuk" ON "slice_den"."retry_finish" IS 'key RetryFinish(root, step)';

COMMENT ON CONSTRAINT "__retry_held_pk_nvgeylmjp2" ON "slice_den"."retry_held" IS 'primary key of RetryHeld';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_pk_5352zkn7xu" ON "slice_den"."retry_ladders_finish_output" IS 'primary key of RetryLaddersFinishOutput';

COMMENT ON CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" ON "slice_den"."retry_ladders_input" IS 'primary key of RetryLaddersInput';

COMMENT ON CONSTRAINT "__retry_patient_input_pk_74247zb7wo" ON "slice_den"."retry_patient_input" IS 'primary key of RetryPatientInput';

COMMENT ON CONSTRAINT "__retry_patient_output_pk_whtgus732k" ON "slice_den"."retry_patient_output" IS 'primary key of RetryPatientOutput';

COMMENT ON CONSTRAINT "__retry_paused_pk_umm2nscqny" ON "slice_den"."retry_paused" IS 'primary key of RetryPaused';

COMMENT ON CONSTRAINT "__retry_polite_input_pk_ptzd72dxff" ON "slice_den"."retry_polite_input" IS 'primary key of RetryPoliteInput';

COMMENT ON CONSTRAINT "__retry_polite_output_pk_2kuwfluplv" ON "slice_den"."retry_polite_output" IS 'primary key of RetryPoliteOutput';

COMMENT ON CONSTRAINT "__retry_refusal_pk_nifndsd6pp" ON "slice_den"."retry_refusal" IS 'primary key of RetryRefusal';

COMMENT ON CONSTRAINT "__retry_requested_with_pk_hud2g5nhzq" ON "slice_den"."retry_requested_with" IS 'primary key of RetryRequestedWith';

COMMENT ON CONSTRAINT "__retry_result_pk_5fegihvmml" ON "slice_den"."retry_result" IS 'primary key of RetryResult';

COMMENT ON CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" ON "slice_den"."retry_resumed" IS 'primary key of RetryResumed';

COMMENT ON CONSTRAINT "__retry_retry_pk_slrwn4rt5d" ON "slice_den"."retry_retry" IS 'primary key of RetryRetry';

COMMENT ON CONSTRAINT "__retry_root_pk_qi2iw36jky" ON "slice_den"."retry_root" IS 'primary key of RetryRoot';

COMMENT ON CONSTRAINT "__retry_root_key_root_kind_fljwbhyeaq" ON "slice_den"."retry_root" IS 'key RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__retry_scope_pk_fgji2phvxy" ON "slice_den"."retry_scope" IS 'primary key of RetryScope';

COMMENT ON CONSTRAINT "__retry_scope_key_scope_cxzylhyf64" ON "slice_den"."retry_scope" IS 'key RetryScope(scope)';

COMMENT ON CONSTRAINT "__retry_served_pk_wgxtug7z34" ON "slice_den"."retry_served" IS 'primary key of RetryServed';

COMMENT ON CONSTRAINT "__retry_skipped_pk_au5z33ql7a" ON "slice_den"."retry_skipped" IS 'primary key of RetrySkipped';

COMMENT ON CONSTRAINT "__retry_start_step_pk_mp77csmi26" ON "slice_den"."retry_start_step" IS 'primary key of RetryStartStep';

COMMENT ON CONSTRAINT "__retry_start_step_key_root_step_zrielh73lq" ON "slice_den"."retry_start_step" IS 'key RetryStartStep(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" ON "slice_den"."retry_steadfast_input" IS 'primary key of RetrySteadfastInput';

COMMENT ON CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" ON "slice_den"."retry_steadfast_output" IS 'primary key of RetrySteadfastOutput';

COMMENT ON CONSTRAINT "__retry_step_pk_opjqidwhzg" ON "slice_den"."retry_step" IS 'primary key of RetryStep';

COMMENT ON CONSTRAINT "__retry_step_key_step_nrthvwlxer" ON "slice_den"."retry_step" IS 'key RetryStep(step)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_pk_o6epepnuox" ON "slice_den"."retry_throttled_finish_output" IS 'primary key of RetryThrottledFinishOutput';

COMMENT ON CONSTRAINT "__retry_throttled_input_pk_zv264azw4s" ON "slice_den"."retry_throttled_input" IS 'primary key of RetryThrottledInput';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_pk_d5mmuqfkuq" ON "slice_den"."retry_unhurried_finish_output" IS 'primary key of RetryUnhurriedFinishOutput';

COMMENT ON CONSTRAINT "__retry_unhurried_input_pk_g5dkiedexm" ON "slice_den"."retry_unhurried_input" IS 'primary key of RetryUnhurriedInput';

COMMENT ON CONSTRAINT "__review_admitted_pk_woy7ee4y4p" ON "slice_den"."review_admitted" IS 'primary key of ReviewAdmitted';

COMMENT ON CONSTRAINT "__review_analyze_input_pk_jr7qmhqwgi" ON "slice_den"."review_analyze_input" IS 'primary key of ReviewAnalyzeInput';

COMMENT ON CONSTRAINT "__review_analyze_output_pk_35aclxnkmb" ON "slice_den"."review_analyze_output" IS 'primary key of ReviewAnalyzeOutput';

COMMENT ON CONSTRAINT "__review_claim_pk_twa72qaol7" ON "slice_den"."review_claim" IS 'primary key of ReviewClaim';

COMMENT ON CONSTRAINT "__review_claim_key_root_step_attempt_holds_djm3xecw7o" ON "slice_den"."review_claim" IS 'key ReviewClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__review_done_pk_ve6inioidy" ON "slice_den"."review_done" IS 'primary key of ReviewDone';

COMMENT ON CONSTRAINT "__review_ended_pk_2hihcuxln2" ON "slice_den"."review_ended" IS 'primary key of ReviewEnded';

COMMENT ON CONSTRAINT "__review_exhausted_pk_5bmktauwd3" ON "slice_den"."review_exhausted" IS 'primary key of ReviewExhausted';

COMMENT ON CONSTRAINT "__review_failed_pk_7iszsjaybr" ON "slice_den"."review_failed" IS 'primary key of ReviewFailed';

COMMENT ON CONSTRAINT "__review_fenced_pk_chaexdbnzu" ON "slice_den"."review_fenced" IS 'primary key of ReviewFenced';

COMMENT ON CONSTRAINT "__review_finish_pk_ovczbakxjz" ON "slice_den"."review_finish" IS 'primary key of ReviewFinish';

COMMENT ON CONSTRAINT "__review_finish_key_root_step_cq4yeqzi25" ON "slice_den"."review_finish" IS 'key ReviewFinish(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_pk_rllaxtocmq" ON "slice_den"."review_gather_input" IS 'primary key of ReviewGatherInput';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_pk_w5cgw65wpx" ON "slice_den"."review_gather_input_sizes" IS 'primary key of ReviewGatherInputSizes';

COMMENT ON CONSTRAINT "__review_gather_output_pk_fecesmjazj" ON "slice_den"."review_gather_output" IS 'primary key of ReviewGatherOutput';

COMMENT ON CONSTRAINT "__review_held_pk_cwyo7jovuu" ON "slice_den"."review_held" IS 'primary key of ReviewHeld';

COMMENT ON CONSTRAINT "__review_hold_pk_uhb6w3fp5v" ON "slice_den"."review_hold" IS 'primary key of ReviewHold';

COMMENT ON CONSTRAINT "__review_hold_key_root_step_attempt_at_6p3v4lr6zi" ON "slice_den"."review_hold" IS 'key ReviewHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__review_paused_pk_eamccblv6g" ON "slice_den"."review_paused" IS 'primary key of ReviewPaused';

COMMENT ON CONSTRAINT "__review_questions_finish_output_pk_36plo53gmb" ON "slice_den"."review_questions_finish_output" IS 'primary key of ReviewQuestionsFinishOutput';

COMMENT ON CONSTRAINT "__review_questions_input_pk_4d27veaz4g" ON "slice_den"."review_questions_input" IS 'primary key of ReviewQuestionsInput';

COMMENT ON CONSTRAINT "__review_refusal_pk_ajyglinn6r" ON "slice_den"."review_refusal" IS 'primary key of ReviewRefusal';

COMMENT ON CONSTRAINT "__review_requested_with_pk_eauvdhg7kh" ON "slice_den"."review_requested_with" IS 'primary key of ReviewRequestedWith';

COMMENT ON CONSTRAINT "__review_result_pk_o5x5griurk" ON "slice_den"."review_result" IS 'primary key of ReviewResult';

COMMENT ON CONSTRAINT "__review_resumed_pk_jqgqbkvl65" ON "slice_den"."review_resumed" IS 'primary key of ReviewResumed';

COMMENT ON CONSTRAINT "__review_retry_pk_is3m5sa5tx" ON "slice_den"."review_retry" IS 'primary key of ReviewRetry';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_pk_qwfb4ycp7r" ON "slice_den"."review_review_run_finish_output" IS 'primary key of ReviewReviewRunFinishOutput';

COMMENT ON CONSTRAINT "__review_review_run_input_pk_7ommryhd6b" ON "slice_den"."review_review_run_input" IS 'primary key of ReviewReviewRunInput';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_pk_bguaae726h" ON "slice_den"."review_review_run_input_sizes" IS 'primary key of ReviewReviewRunInputSizes';

COMMENT ON CONSTRAINT "__review_root_pk_btvrw2kxvs" ON "slice_den"."review_root" IS 'primary key of ReviewRoot';

COMMENT ON CONSTRAINT "__review_root_key_root_kind_g7dcwn7ekf" ON "slice_den"."review_root" IS 'key ReviewRoot(root, kind)';

COMMENT ON CONSTRAINT "__review_save_input_pk_iaqr5cg2c2" ON "slice_den"."review_save_input" IS 'primary key of ReviewSaveInput';

COMMENT ON CONSTRAINT "__review_save_output_pk_usbddkytv7" ON "slice_den"."review_save_output" IS 'primary key of ReviewSaveOutput';

COMMENT ON CONSTRAINT "__review_saved_pk_mrkz2ovxcx" ON "slice_den"."review_saved" IS 'primary key of ReviewSaved';

COMMENT ON CONSTRAINT "__review_saved_key_root_to_hfwtbsvtvv" ON "slice_den"."review_saved" IS 'key ReviewSaved(root, to)';

COMMENT ON CONSTRAINT "__review_scope_pk_grsivyyp7b" ON "slice_den"."review_scope" IS 'primary key of ReviewScope';

COMMENT ON CONSTRAINT "__review_scope_key_scope_zikoayu732" ON "slice_den"."review_scope" IS 'key ReviewScope(scope)';

COMMENT ON CONSTRAINT "__review_served_pk_bkbrtbk3k7" ON "slice_den"."review_served" IS 'primary key of ReviewServed';

COMMENT ON CONSTRAINT "__review_skipped_pk_ymsn25w74u" ON "slice_den"."review_skipped" IS 'primary key of ReviewSkipped';

COMMENT ON CONSTRAINT "__review_split_pk_im65kbvnho" ON "slice_den"."review_split" IS 'primary key of ReviewSplit';

COMMENT ON CONSTRAINT "__review_split_key_root_to_3bsdaxl7fd" ON "slice_den"."review_split" IS 'key ReviewSplit(root, to)';

COMMENT ON CONSTRAINT "__review_start_scope_pk_qlm2r5uhqp" ON "slice_den"."review_start_scope" IS 'primary key of ReviewStartScope';

COMMENT ON CONSTRAINT "__review_start_scope_key_root_child_cz7ajv7kqf" ON "slice_den"."review_start_scope" IS 'key ReviewStartScope(root, child)';

COMMENT ON CONSTRAINT "__review_start_step_pk_w5suwqqg4p" ON "slice_den"."review_start_step" IS 'primary key of ReviewStartStep';

COMMENT ON CONSTRAINT "__review_start_step_key_root_step_sgv2fu4bpg" ON "slice_den"."review_start_step" IS 'key ReviewStartStep(root, step)';

COMMENT ON CONSTRAINT "__review_step_pk_gfbmnzqbc3" ON "slice_den"."review_step" IS 'primary key of ReviewStep';

COMMENT ON CONSTRAINT "__review_step_key_step_6zswnepqkd" ON "slice_den"."review_step" IS 'key ReviewStep(step)';

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

COMMENT ON CONSTRAINT "__sync_finish_key_root_step_mccyu3467o" ON "slice_den"."sync_finish" IS 'key SyncFinish(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_pk_3z5gemduto" ON "slice_den"."sync_gold_finish_output" IS 'primary key of SyncGoldFinishOutput';

COMMENT ON CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" ON "slice_den"."sync_gold_input" IS 'primary key of SyncGoldInput';

COMMENT ON CONSTRAINT "__sync_held_pk_wsme4moka4" ON "slice_den"."sync_held" IS 'primary key of SyncHeld';

COMMENT ON CONSTRAINT "__sync_paused_pk_tstk2okngj" ON "slice_den"."sync_paused" IS 'primary key of SyncPaused';

COMMENT ON CONSTRAINT "__sync_refusal_pk_mbmfornc5c" ON "slice_den"."sync_refusal" IS 'primary key of SyncRefusal';

COMMENT ON CONSTRAINT "__sync_released_pk_k7qaw2iram" ON "slice_den"."sync_released" IS 'primary key of SyncReleased';

COMMENT ON CONSTRAINT "__sync_requested_with_pk_dz754jk7j3" ON "slice_den"."sync_requested_with" IS 'primary key of SyncRequestedWith';

COMMENT ON CONSTRAINT "__sync_result_pk_jmwy2p3mqf" ON "slice_den"."sync_result" IS 'primary key of SyncResult';

COMMENT ON CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" ON "slice_den"."sync_resumed" IS 'primary key of SyncResumed';

COMMENT ON CONSTRAINT "__sync_retry_pk_6q52red7iw" ON "slice_den"."sync_retry" IS 'primary key of SyncRetry';

COMMENT ON CONSTRAINT "__sync_root_pk_daktpubfe2" ON "slice_den"."sync_root" IS 'primary key of SyncRoot';

COMMENT ON CONSTRAINT "__sync_root_key_root_kind_eiyeq632ma" ON "slice_den"."sync_root" IS 'key SyncRoot(root, kind)';

COMMENT ON CONSTRAINT "__sync_scope_pk_bg72sm6p4z" ON "slice_den"."sync_scope" IS 'primary key of SyncScope';

COMMENT ON CONSTRAINT "__sync_scope_key_scope_wd7ijpypy3" ON "slice_den"."sync_scope" IS 'key SyncScope(scope)';

COMMENT ON CONSTRAINT "__sync_served_pk_ed5gkrpyzv" ON "slice_den"."sync_served" IS 'primary key of SyncServed';

COMMENT ON CONSTRAINT "__sync_skipped_pk_yutjqacvws" ON "slice_den"."sync_skipped" IS 'primary key of SyncSkipped';

COMMENT ON CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" ON "slice_den"."sync_start_step" IS 'primary key of SyncStartStep';

COMMENT ON CONSTRAINT "__sync_start_step_key_root_step_otrdmdbrol" ON "slice_den"."sync_start_step" IS 'key SyncStartStep(root, step)';

COMMENT ON CONSTRAINT "__sync_step_pk_wfgcxdvbwo" ON "slice_den"."sync_step" IS 'primary key of SyncStep';

COMMENT ON CONSTRAINT "__sync_step_key_step_d7ugjkasz4" ON "slice_den"."sync_step" IS 'key SyncStep(step)';

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

COMMENT ON CONSTRAINT "__writeback_finish_key_root_step_mwy36ww7ko" ON "slice_den"."writeback_finish" IS 'key WritebackFinish(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_pk_5tktjcet5w" ON "slice_den"."writeback_held" IS 'primary key of WritebackHeld';

COMMENT ON CONSTRAINT "__writeback_paused_pk_ncs2aff76t" ON "slice_den"."writeback_paused" IS 'primary key of WritebackPaused';

COMMENT ON CONSTRAINT "__writeback_refusal_pk_lqictdn67w" ON "slice_den"."writeback_refusal" IS 'primary key of WritebackRefusal';

COMMENT ON CONSTRAINT "__writeback_requested_with_pk_yiae7pktd3" ON "slice_den"."writeback_requested_with" IS 'primary key of WritebackRequestedWith';

COMMENT ON CONSTRAINT "__writeback_result_pk_lygppaax77" ON "slice_den"."writeback_result" IS 'primary key of WritebackResult';

COMMENT ON CONSTRAINT "__writeback_resumed_pk_qrrua45xou" ON "slice_den"."writeback_resumed" IS 'primary key of WritebackResumed';

COMMENT ON CONSTRAINT "__writeback_retry_pk_j2ien3obty" ON "slice_den"."writeback_retry" IS 'primary key of WritebackRetry';

COMMENT ON CONSTRAINT "__writeback_root_pk_a5puwyrem6" ON "slice_den"."writeback_root" IS 'primary key of WritebackRoot';

COMMENT ON CONSTRAINT "__writeback_root_key_root_kind_xcyyolrc7c" ON "slice_den"."writeback_root" IS 'key WritebackRoot(root, kind)';

COMMENT ON CONSTRAINT "__writeback_scope_pk_aywjorzcsy" ON "slice_den"."writeback_scope" IS 'primary key of WritebackScope';

COMMENT ON CONSTRAINT "__writeback_scope_key_scope_lessf5blgh" ON "slice_den"."writeback_scope" IS 'key WritebackScope(scope)';

COMMENT ON CONSTRAINT "__writeback_served_pk_pw2fwekjjm" ON "slice_den"."writeback_served" IS 'primary key of WritebackServed';

COMMENT ON CONSTRAINT "__writeback_skipped_pk_3pijvusl26" ON "slice_den"."writeback_skipped" IS 'primary key of WritebackSkipped';

COMMENT ON CONSTRAINT "__writeback_start_step_pk_sp7hkcjz7m" ON "slice_den"."writeback_start_step" IS 'primary key of WritebackStartStep';

COMMENT ON CONSTRAINT "__writeback_start_step_key_root_step_td6hftw5pk" ON "slice_den"."writeback_start_step" IS 'key WritebackStartStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_step_pk_xsrl5j4mlf" ON "slice_den"."writeback_step" IS 'primary key of WritebackStep';

COMMENT ON CONSTRAINT "__writeback_step_key_step_js3rfiokua" ON "slice_den"."writeback_step" IS 'key WritebackStep(step)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_pk_payvcqalt7" ON "slice_den"."writeback_writeback_finish_output" IS 'primary key of WritebackWritebackFinishOutput';

COMMENT ON CONSTRAINT "__writeback_writeback_input_pk_ejs235aju2" ON "slice_den"."writeback_writeback_input" IS 'primary key of WritebackWritebackInput';

COMMENT ON COLUMN "slice_den"."assign_assignment_input"."__tag_kind_assignment_q5nqvzv6jc" IS 'tag AssignRoot.kind = Assignment';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_exclude"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_near"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_near"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."assign_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."assign_decide_input_exclude"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_decide_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_decide_output_weighed"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_decide_output_weighed"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_exclude"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_exclude"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_near"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_near"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."chain_chain_run_input"."__tag_kind_chain_run_ccthhdybqw" IS 'tag ChainRoot.kind = ChainRun';

COMMENT ON COLUMN "slice_den"."chain_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."chain_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."chain_ordered_input"."__tag_kind_ordered_ms3hwzrkhl" IS 'tag ChainRoot.kind = Ordered';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_items"."__copy_items_jii5wy7azg" IS 'the owner''s count of the family ChainPageReadTreeRow.items';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_items"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_row"."__pred_items_3qltx5cx27" IS 'pred(items)';

COMMENT ON COLUMN "slice_den"."chain_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."clock_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."clock_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."clock_hourly_input"."__tag_kind_hourly_axvj7zlyzy" IS 'tag ClockRoot.kind = Hourly';

COMMENT ON COLUMN "slice_den"."clock_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."clock_sitting_input"."__tag_kind_sitting_zbhu3onph5" IS 'tag ClockRoot.kind = Sitting';

COMMENT ON COLUMN "slice_den"."fan_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."fan_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."fan_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice_den"."fan_exclusive"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."fan_fan_run_input"."__tag_kind_fan_run_2liqlumqkj" IS 'tag FanRoot.kind = FanRun';

COMMENT ON COLUMN "slice_den"."fan_hold"."__copy_holds_hfzvk7t2xc" IS 'the owner''s count of the family FanClaim.holds';

COMMENT ON COLUMN "slice_den"."fan_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."fan_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."fan_sweep_input"."__tag_kind_sweep_4lmrlblufr" IS 'tag FanRoot.kind = Sweep';

COMMENT ON COLUMN "slice_den"."fan_wanted_input"."__tag_kind_wanted_lpgalpid4g" IS 'tag FanRoot.kind = Wanted';

COMMENT ON COLUMN "slice_den"."retry_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."retry_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."retry_ladders_input"."__tag_kind_ladders_amjml3bobr" IS 'tag RetryRoot.kind = Ladders';

COMMENT ON COLUMN "slice_den"."retry_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."retry_throttled_input"."__tag_kind_throttled_uy63hl6qg7" IS 'tag RetryRoot.kind = Throttled';

COMMENT ON COLUMN "slice_den"."retry_unhurried_input"."__tag_kind_unhurried_yf3vrtngno" IS 'tag RetryRoot.kind = Unhurried';

COMMENT ON COLUMN "slice_den"."review_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."review_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."review_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice_den"."review_gather_input_sizes"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."review_gather_input_sizes"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."review_hold"."__copy_holds_a7bsyj5c52" IS 'the owner''s count of the family ReviewClaim.holds';

COMMENT ON COLUMN "slice_den"."review_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."review_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."review_review_run_input"."__tag_kind_review_run_npquoqpyk4" IS 'tag ReviewRoot.kind = ReviewRun';

COMMENT ON COLUMN "slice_den"."review_review_run_input_sizes"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."review_review_run_input_sizes"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."sync_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."sync_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."sync_exclusive"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."sync_gold_input"."__tag_kind_gold_phmoz6zyym" IS 'tag SyncRoot.kind = Gold';

COMMENT ON COLUMN "slice_den"."sync_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."sync_sync_run_input"."__tag_kind_sync_run_wmr74dvsia" IS 'tag SyncRoot.kind = SyncRun';

COMMENT ON COLUMN "slice_den"."writeback_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."writeback_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."writeback_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."writeback_writeback_input"."__tag_kind_writeback_7zc6o24iqm" IS 'tag WritebackRoot.kind = Writeback';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_key_digest_pred_at_ipnjzk4wne" ON "slice_den"."chain_page_read_tree_items" IS 'key ChainPageReadTreeItems(digest, pred(at))';

COMMENT ON CONSTRAINT "__fan_hold_key_root_step_attempt_pred_at_pr3hqe44bn" ON "slice_den"."fan_hold" IS 'key FanHold(root, step, attempt, pred(at))';

COMMENT ON CONSTRAINT "__review_hold_key_root_step_attempt_pred_at_adiit7mrkk" ON "slice_den"."review_hold" IS 'key ReviewHold(root, step, attempt, pred(at))';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_check_chain_page_read_yoect27eee" ON "slice_den"."chain_page_read_tree_items" IS 'check of ChainPageReadTreeItems for law ordered ChainPageReadTreeItems(digest, at) in fin(ChainPageReadTreeRow, items)';

COMMENT ON CONSTRAINT "__fan_hold_check_fan_hold_ordered_fan_claim_holds_zint2b2ifk" ON "slice_den"."fan_hold" IS 'check of FanHold for law ordered FanHold(root, step, attempt, at) in fin(FanClaim, holds)';

COMMENT ON CONSTRAINT "__review_hold_check_review_hold_ordered_review_claim_icnqunpnlb" ON "slice_den"."review_hold" IS 'check of ReviewHold for law ordered ReviewHold(root, step, attempt, at) in fin(ReviewClaim, holds)';

COMMENT ON CONSTRAINT "__assign_admitted_fk_root_scope_unmbbqjvuz" ON "slice_den"."assign_admitted" IS 'foreign key AssignAdmitted(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_asked_fk_root_from_egcl4ohqo5" ON "slice_den"."assign_asked" IS 'foreign key AssignAsked(root, from) to AssignEmbedOutput(root, step)';

COMMENT ON CONSTRAINT "__assign_asked_fk_root_from_6wrf2w24uc" ON "slice_den"."assign_asked" IS 'foreign key AssignAsked(root, from) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_asked_fk_root_to_nau6tqpt7j" ON "slice_den"."assign_asked" IS 'foreign key AssignAsked(root, to) to AssignDecideInput(root, step)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_fk_root_step_xd4lcqxnwu" ON "slice_den"."assign_assignment_finish_output" IS 'foreign key AssignAssignmentFinishOutput(root, step) to AssignDone(root, step)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_fk_root_step_gzyabr2afl" ON "slice_den"."assign_assignment_finish_output" IS 'foreign key AssignAssignmentFinishOutput(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_root_scope_lcgcyjnkog" ON "slice_den"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_tag_kind_646lzaw56q" ON "slice_den"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope, tag AssignRoot.kind = Assignment) to AssignRoot(root, kind)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_root_scope_qsm54cc645" ON "slice_den"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(root, scope) to AssignAssignmentInput(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_root_scope_irhbpzgmtx" ON "slice_den"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_root_scope_pred_xyfmadmy2x" ON "slice_den"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(root where Logic.ge(ordinal, 1n), scope, pred(ordinal)) to AssignAssignmentInputExclude(root, scope, ordinal)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_scope_6i4bqzwxmy" ON "slice_den"."assign_assignment_input_mode_nearest" IS 'foreign key AssignAssignmentInputModeNearest(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_fk_root_scope_ubokbtb6tu" ON "slice_den"."assign_assignment_input_mode_within" IS 'foreign key AssignAssignmentInputModeWithin(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_root_scope_zlksrjaoob" ON "slice_den"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(root, scope) to AssignAssignmentInput(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_root_scope_gyktnyg3n7" ON "slice_den"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_fk_root_scope_pred_irjyvyphrh" ON "slice_den"."assign_assignment_input_near" IS 'foreign key AssignAssignmentInputNear(root where Logic.ge(ordinal, 1n), scope, pred(ordinal)) to AssignAssignmentInputNear(root, scope, ordinal)';

COMMENT ON CONSTRAINT "__assign_claim_fk_root_step_z35ulxscvt" ON "slice_den"."assign_claim" IS 'foreign key AssignClaim(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_claim_fk_root_step_pred_attempt_bt5m6xhi43" ON "slice_den"."assign_claim" IS 'foreign key AssignClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to AssignEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_root_step_igdcrjssd3" ON "slice_den"."assign_decide_input" IS 'foreign key AssignDecideInput(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_root_step_62s7y3zxzv" ON "slice_den"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(root, step) to AssignDecideInput(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_root_step_iddq5dh4ap" ON "slice_den"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_root_step_pred_vc4il3cgp6" ON "slice_den"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to AssignDecideInputExclude(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_step_5peaxfkhff" ON "slice_den"."assign_decide_input_mode_nearest" IS 'foreign key AssignDecideInputModeNearest(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fk_root_step_2rdpk7bkmk" ON "slice_den"."assign_decide_input_mode_within" IS 'foreign key AssignDecideInputModeWithin(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_root_step_pwsuruf3ul" ON "slice_den"."assign_decide_output" IS 'foreign key AssignDecideOutput(root, step) to AssignDecideInput(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_root_step_reczzzxtv7" ON "slice_den"."assign_decide_output" IS 'foreign key AssignDecideOutput(root, step) to AssignDone(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_root_step_jjxfv3qn3e" ON "slice_den"."assign_decide_output" IS 'foreign key AssignDecideOutput(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_fk_root_step_n5oh4qicf6" ON "slice_den"."assign_decide_output_stage_rest" IS 'foreign key AssignDecideOutputStageRest(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_fk_root_step_oonulae66c" ON "slice_den"."assign_decide_output_stage_serve" IS 'foreign key AssignDecideOutputStageServe(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_root_step_vvsbzwtvof" ON "slice_den"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(root, step) to AssignDecideOutput(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_root_step_p7abhgwln3" ON "slice_den"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_root_step_pred_ii5u7bfryh" ON "slice_den"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to AssignDecideOutputWeighed(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_fk_digest_bpdnxpzp5m" ON "slice_den"."assign_decide_read_nearest" IS 'foreign key AssignDecideReadNearest(digest) to AssignDecideReadNearestRow(digest)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_fk_root_step_anuw7c2rf4" ON "slice_den"."assign_decide_read_nearest" IS 'foreign key AssignDecideReadNearest(root, step) to AssignResult(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_fk_root_step_o6ms3vld7t" ON "slice_den"."assign_decide_read_nearest" IS 'foreign key AssignDecideReadNearest(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_fk_digest_zjwk3f7pfz" ON "slice_den"."assign_decide_read_seen" IS 'foreign key AssignDecideReadSeen(digest) to AssignDecideReadSeenRow(digest)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_fk_root_step_agvsf5drbl" ON "slice_den"."assign_decide_read_seen" IS 'foreign key AssignDecideReadSeen(root, step) to AssignResult(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_fk_root_step_mv4uqnfszq" ON "slice_den"."assign_decide_read_seen" IS 'foreign key AssignDecideReadSeen(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_done_fk_root_step_jnpyqphpod" ON "slice_den"."assign_done" IS 'foreign key AssignDone(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_fk_root_step_rnzanixu6r" ON "slice_den"."assign_embed_input" IS 'foreign key AssignEmbedInput(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_root_step_5kxjdsp4if" ON "slice_den"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(root, step) to AssignEmbedInput(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_root_step_ky3b4wudl7" ON "slice_den"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_fk_root_step_pred_pcwizkmay4" ON "slice_den"."assign_embed_input_exclude" IS 'foreign key AssignEmbedInputExclude(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to AssignEmbedInputExclude(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_nearest_fk_root_step_r4t3h6xgge" ON "slice_den"."assign_embed_input_mode_nearest" IS 'foreign key AssignEmbedInputModeNearest(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_within_fk_root_step_br4jvr5oin" ON "slice_den"."assign_embed_input_mode_within" IS 'foreign key AssignEmbedInputModeWithin(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_root_step_ejkwdhq7b6" ON "slice_den"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(root, step) to AssignEmbedInput(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_root_step_zqfv3upodb" ON "slice_den"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_fk_root_step_pred_ordinal_tmq3bjkufn" ON "slice_den"."assign_embed_input_near" IS 'foreign key AssignEmbedInputNear(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to AssignEmbedInputNear(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_root_step_t2s5kgspwa" ON "slice_den"."assign_embed_output" IS 'foreign key AssignEmbedOutput(root, step) to AssignDone(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_root_step_me4olxkaae" ON "slice_den"."assign_embed_output" IS 'foreign key AssignEmbedOutput(root, step) to AssignEmbedInput(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_output_fk_root_step_l7rws2phs3" ON "slice_den"."assign_embed_output" IS 'foreign key AssignEmbedOutput(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_ended_fk_root_step_fwsr5rmq4p" ON "slice_den"."assign_ended" IS 'foreign key AssignEnded(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_ended_fk_root_step_attempt_he35lvdstl" ON "slice_den"."assign_ended" IS 'foreign key AssignEnded(root, step, attempt) to AssignClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_root_step_cspvc4i2pv" ON "slice_den"."assign_exhausted" IS 'foreign key AssignExhausted(root, step) to AssignFailed(root, step)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_root_step_6alordqsb5" ON "slice_den"."assign_exhausted" IS 'foreign key AssignExhausted(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_failed_fk_root_step_ipzrsjzgti" ON "slice_den"."assign_failed" IS 'foreign key AssignFailed(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_fenced_fk_root_step_dnqe55jtoa" ON "slice_den"."assign_fenced" IS 'foreign key AssignFenced(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_fenced_fk_root_step_attempt_rjjyfxo25t" ON "slice_den"."assign_fenced" IS 'foreign key AssignFenced(root, step, attempt) to AssignEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_scope_az2daj5mvb" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(root, scope) to AssignAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_scope_f7uiptxzin" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_step_mkv6pbd4xq" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_step_6ut2ho42il" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(root, step) to AssignResult(root, step)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_step_4jy2ibkhlr" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_step_attempt_agnrzcmkqy" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(root, step, attempt) to AssignClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" ON "slice_den"."assign_paused" IS 'foreign key AssignPaused(target, pred(turn)) to AssignResumed(target, turn)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_root_step_hwduhrbvbd" ON "slice_den"."assign_refusal" IS 'foreign key AssignRefusal(root, step) to AssignFailed(root, step)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_root_step_af3aisimwq" ON "slice_den"."assign_refusal" IS 'foreign key AssignRefusal(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_requested_with_fk_root_zx4lvtx6x5" ON "slice_den"."assign_requested_with" IS 'foreign key AssignRequestedWith(root) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_result_fk_root_step_k4wpox452s" ON "slice_den"."assign_result" IS 'foreign key AssignResult(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" ON "slice_den"."assign_resumed" IS 'foreign key AssignResumed(target, turn) to AssignPaused(target, turn)';

COMMENT ON CONSTRAINT "__assign_retry_fk_root_step_e2etghhjnd" ON "slice_den"."assign_retry" IS 'foreign key AssignRetry(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_retry_fk_root_step_attempt_374j3xrgm3" ON "slice_den"."assign_retry" IS 'foreign key AssignRetry(root, step, attempt) to AssignEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_scope_fk_root_j4jocebgtw" ON "slice_den"."assign_scope" IS 'foreign key AssignScope(root) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_by_2bt5slbwgj" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(by) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_root_scope_jidurgue3e" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_scope_x4sryze463" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(scope) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_scope_ixmywec4qv" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(root, scope) to AssignAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_scope_t7vctbm6kw" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_step_q57whinuhh" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_step_fk_root_scope_tiqkvqahkt" ON "slice_den"."assign_step" IS 'foreign key AssignStep(root, scope) to AssignAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__assign_step_fk_root_scope_4j4ldav7gl" ON "slice_den"."assign_step" IS 'foreign key AssignStep(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" ON "slice_den"."audit" IS 'foreign key Audit(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_admitted_fk_root_scope_pyx6o74r6r" ON "slice_den"."chain_admitted" IS 'foreign key ChainAdmitted(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_fk_root_step_wxcmcz2uwn" ON "slice_den"."chain_chain_run_finish_output" IS 'foreign key ChainChainRunFinishOutput(root, step) to ChainDone(root, step)';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_fk_root_step_dqanxvykwn" ON "slice_den"."chain_chain_run_finish_output" IS 'foreign key ChainChainRunFinishOutput(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_root_scope_azcdpxczrt" ON "slice_den"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_scope_tag_kind_chain_run_5wb4haod5z" ON "slice_den"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(scope, tag ChainRoot.kind = ChainRun) to ChainRoot(root, kind)';

COMMENT ON CONSTRAINT "__chain_claim_fk_root_step_7edppg4aqs" ON "slice_den"."chain_claim" IS 'foreign key ChainClaim(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_claim_fk_root_step_pred_attempt_fmwmco64ak" ON "slice_den"."chain_claim" IS 'foreign key ChainClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to ChainEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_done_fk_root_step_7d3jwphqat" ON "slice_den"."chain_done" IS 'foreign key ChainDone(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_ended_fk_root_step_f53nmrcf4o" ON "slice_den"."chain_ended" IS 'foreign key ChainEnded(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_ended_fk_root_step_attempt_daxikklndi" ON "slice_den"."chain_ended" IS 'foreign key ChainEnded(root, step, attempt) to ChainClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_root_step_4l7lqt7ji4" ON "slice_den"."chain_exhausted" IS 'foreign key ChainExhausted(root, step) to ChainFailed(root, step)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_root_step_qen7piy3si" ON "slice_den"."chain_exhausted" IS 'foreign key ChainExhausted(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_failed_fk_root_step_wgrsezdykc" ON "slice_den"."chain_failed" IS 'foreign key ChainFailed(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_fenced_fk_root_step_zoq4smze5v" ON "slice_den"."chain_fenced" IS 'foreign key ChainFenced(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_fenced_fk_root_step_attempt_rjs5xdup6v" ON "slice_den"."chain_fenced" IS 'foreign key ChainFenced(root, step, attempt) to ChainEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_scope_id3fnylkst" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(root, scope) to ChainAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_scope_cun3ubklxj" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_step_6graxxwr3k" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_step_qp5rohxglc" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_step_pzstggr5uz" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_step_attempt_itfckrv27c" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(root, step, attempt) to ChainClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_next_fk_root_from_kgirayj3r7" ON "slice_den"."chain_next" IS 'foreign key ChainNext(root, from) to ChainPageOutput(root, step)';

COMMENT ON CONSTRAINT "__chain_next_fk_root_from_cbyt22x2kb" ON "slice_den"."chain_next" IS 'foreign key ChainNext(root, from) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_next_fk_root_to_sgtpaqtkk5" ON "slice_den"."chain_next" IS 'foreign key ChainNext(root, to) to ChainPageInput(root, step)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_fk_root_step_o7qzrnwjhn" ON "slice_den"."chain_ordered_finish_output" IS 'foreign key ChainOrderedFinishOutput(root, step) to ChainDone(root, step)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_fk_root_step_bgpcuvizzv" ON "slice_den"."chain_ordered_finish_output" IS 'foreign key ChainOrderedFinishOutput(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_ordered_input_fk_root_scope_cvyakq2mmm" ON "slice_den"."chain_ordered_input" IS 'foreign key ChainOrderedInput(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_ordered_input_fk_scope_tag_kind_ordered_3oj5bnc73t" ON "slice_den"."chain_ordered_input" IS 'foreign key ChainOrderedInput(scope, tag ChainRoot.kind = Ordered) to ChainRoot(root, kind)';

COMMENT ON CONSTRAINT "__chain_page_input_fk_root_step_4ppejtqytz" ON "slice_den"."chain_page_input" IS 'foreign key ChainPageInput(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_root_step_j23hgcqubg" ON "slice_den"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(root, step) to ChainPageInput(root, step)';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_root_step_argee2kcrw" ON "slice_den"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_root_step_vpxoed5wiw" ON "slice_den"."chain_page_output" IS 'foreign key ChainPageOutput(root, step) to ChainDone(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_root_step_crz5lf7jcp" ON "slice_den"."chain_page_output" IS 'foreign key ChainPageOutput(root, step) to ChainPageInput(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_root_step_x4sxvbjuqf" ON "slice_den"."chain_page_output" IS 'foreign key ChainPageOutput(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_root_step_zoq5plixab" ON "slice_den"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(root, step) to ChainPageOutput(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_root_step_yitewnz5it" ON "slice_den"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_fk_digest_draxd5jrld" ON "slice_den"."chain_page_read_earlier" IS 'foreign key ChainPageReadEarlier(digest) to ChainPageReadEarlierRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_fk_root_step_wuy63lvcqg" ON "slice_den"."chain_page_read_earlier" IS 'foreign key ChainPageReadEarlier(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_fk_root_step_7lgmmjpzgv" ON "slice_den"."chain_page_read_earlier" IS 'foreign key ChainPageReadEarlier(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_fk_digest_cz6fzlmtk4" ON "slice_den"."chain_page_read_tree" IS 'foreign key ChainPageReadTree(digest) to ChainPageReadTreeRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_fk_root_step_gu4nmv4usa" ON "slice_den"."chain_page_read_tree" IS 'foreign key ChainPageReadTree(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_fk_root_step_5jdwehtqbt" ON "slice_den"."chain_page_read_tree" IS 'foreign key ChainPageReadTree(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_fk_digest_copy_items_sicbcwc4zb" ON "slice_den"."chain_page_read_tree_items" IS 'foreign key ChainPageReadTreeItems(digest, the owner''s count of the family ChainPageReadTreeRow.items) to ChainPageReadTreeRow(digest, items)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_fk_digest_pred_at_r7gpc2igze" ON "slice_den"."chain_page_read_tree_items" IS 'foreign key ChainPageReadTreeItems(digest, pred(at)) to ChainPageReadTreeItems(digest, at)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_row_fk_digest_pred_items_7rh66dc67t" ON "slice_den"."chain_page_read_tree_row" IS 'foreign key ChainPageReadTreeRow(digest, pred(items)) to ChainPageReadTreeItems(digest, at)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_fk_digest_73zfvhpwus" ON "slice_den"."chain_page_read_weights" IS 'foreign key ChainPageReadWeights(digest) to ChainPageReadWeightsRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_fk_root_step_3bx3bwh3v6" ON "slice_den"."chain_page_read_weights" IS 'foreign key ChainPageReadWeights(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_fk_root_step_qxk4wctybp" ON "slice_den"."chain_page_read_weights" IS 'foreign key ChainPageReadWeights(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_tree_first_fk_digest_at_thwgbmxhwl" ON "slice_den"."chain_page_tree_first" IS 'foreign key ChainPageTreeFirst(digest, at) to ChainPageReadTreeItems(digest, at)';

COMMENT ON CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" ON "slice_den"."chain_paused" IS 'foreign key ChainPaused(target, pred(turn)) to ChainResumed(target, turn)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_root_step_ykkkqcajv4" ON "slice_den"."chain_refusal" IS 'foreign key ChainRefusal(root, step) to ChainFailed(root, step)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_root_step_nfh5xnnucb" ON "slice_den"."chain_refusal" IS 'foreign key ChainRefusal(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_requested_with_fk_root_kaou5g6ytt" ON "slice_den"."chain_requested_with" IS 'foreign key ChainRequestedWith(root) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_result_fk_root_step_ocbnaznecu" ON "slice_den"."chain_result" IS 'foreign key ChainResult(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" ON "slice_den"."chain_resumed" IS 'foreign key ChainResumed(target, turn) to ChainPaused(target, turn)';

COMMENT ON CONSTRAINT "__chain_retry_fk_root_step_ovrtf36jcq" ON "slice_den"."chain_retry" IS 'foreign key ChainRetry(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_retry_fk_root_step_attempt_t2kbhcxstx" ON "slice_den"."chain_retry" IS 'foreign key ChainRetry(root, step, attempt) to ChainEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_scope_fk_root_3oxsnvnyqm" ON "slice_den"."chain_scope" IS 'foreign key ChainScope(root) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_by_s5hrvg2lf3" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(by) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_root_scope_ghpfmtf7sw" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_scope_2p7bml3674" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(scope) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_scope_lvxzyapkkz" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(root, scope) to ChainAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_scope_csyj2bv7zv" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_step_3v26ol7z45" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_step_fk_root_scope_yfe4j5xzze" ON "slice_den"."chain_step" IS 'foreign key ChainStep(root, scope) to ChainAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__chain_step_fk_root_scope_2dsmwvsjfx" ON "slice_den"."chain_step" IS 'foreign key ChainStep(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_admitted_fk_root_scope_qiiqqqcffn" ON "slice_den"."clock_admitted" IS 'foreign key ClockAdmitted(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_chime_input_fk_root_step_b2ryltpz5c" ON "slice_den"."clock_chime_input" IS 'foreign key ClockChimeInput(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_root_step_qixdzekdul" ON "slice_den"."clock_chime_output" IS 'foreign key ClockChimeOutput(root, step) to ClockChimeInput(root, step)';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_root_step_hz7ggh3lus" ON "slice_den"."clock_chime_output" IS 'foreign key ClockChimeOutput(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_chime_output_fk_root_step_flgj3oymiz" ON "slice_den"."clock_chime_output" IS 'foreign key ClockChimeOutput(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_claim_fk_root_step_hnkgjikniq" ON "slice_den"."clock_claim" IS 'foreign key ClockClaim(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_claim_fk_root_step_pred_attempt_s6bkkwaqnz" ON "slice_den"."clock_claim" IS 'foreign key ClockClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to ClockEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_close_input_fk_root_step_sqnp6phfzc" ON "slice_den"."clock_close_input" IS 'foreign key ClockCloseInput(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_close_output_fk_root_step_f7egr5rego" ON "slice_den"."clock_close_output" IS 'foreign key ClockCloseOutput(root, step) to ClockCloseInput(root, step)';

COMMENT ON CONSTRAINT "__clock_close_output_fk_root_step_waaqexpeeq" ON "slice_den"."clock_close_output" IS 'foreign key ClockCloseOutput(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_close_output_fk_root_step_aeii5cry7w" ON "slice_den"."clock_close_output" IS 'foreign key ClockCloseOutput(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_done_fk_root_step_yq4qhavboe" ON "slice_den"."clock_done" IS 'foreign key ClockDone(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_ended_fk_root_step_gx5kdzotda" ON "slice_den"."clock_ended" IS 'foreign key ClockEnded(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_ended_fk_root_step_attempt_drvkyvybmh" ON "slice_den"."clock_ended" IS 'foreign key ClockEnded(root, step, attempt) to ClockClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_root_step_ifbdfsiptr" ON "slice_den"."clock_exhausted" IS 'foreign key ClockExhausted(root, step) to ClockFailed(root, step)';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_root_step_gaqpfdbyl3" ON "slice_den"."clock_exhausted" IS 'foreign key ClockExhausted(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_failed_fk_root_step_g4aoka6lo5" ON "slice_den"."clock_failed" IS 'foreign key ClockFailed(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_fenced_fk_root_step_cr4zsb2h6l" ON "slice_den"."clock_fenced" IS 'foreign key ClockFenced(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_fenced_fk_root_step_attempt_kyyyl7ahsl" ON "slice_den"."clock_fenced" IS 'foreign key ClockFenced(root, step, attempt) to ClockEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_scope_tzo2gy4k4n" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(root, scope) to ClockAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_scope_6z7ojozft7" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_step_3vz6t66zne" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_step_cumpf2bq5c" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(root, step) to ClockResult(root, step)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_step_4lmqwyfsx6" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_step_attempt_ob3nh2i5w6" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(root, step, attempt) to ClockClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_fk_root_step_bouynloxnt" ON "slice_den"."clock_hourly_finish_output" IS 'foreign key ClockHourlyFinishOutput(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_fk_root_step_jspbxqs2og" ON "slice_den"."clock_hourly_finish_output" IS 'foreign key ClockHourlyFinishOutput(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_hourly_input_fk_root_scope_edbqaxjsld" ON "slice_den"."clock_hourly_input" IS 'foreign key ClockHourlyInput(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_hourly_input_fk_scope_tag_kind_hourly_yqnjwt5yzr" ON "slice_den"."clock_hourly_input" IS 'foreign key ClockHourlyInput(scope, tag ClockRoot.kind = Hourly) to ClockRoot(root, kind)';

COMMENT ON CONSTRAINT "__clock_paused_fk_target_pred_turn_7tgjovpr6x" ON "slice_den"."clock_paused" IS 'foreign key ClockPaused(target, pred(turn)) to ClockResumed(target, turn)';

COMMENT ON CONSTRAINT "__clock_refusal_fk_root_step_fgakzza4gr" ON "slice_den"."clock_refusal" IS 'foreign key ClockRefusal(root, step) to ClockFailed(root, step)';

COMMENT ON CONSTRAINT "__clock_refusal_fk_root_step_aurtl3zqby" ON "slice_den"."clock_refusal" IS 'foreign key ClockRefusal(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_requested_with_fk_root_pyuj4tglmv" ON "slice_den"."clock_requested_with" IS 'foreign key ClockRequestedWith(root) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_result_fk_root_step_uh7cpzsyxr" ON "slice_den"."clock_result" IS 'foreign key ClockResult(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_resumed_fk_target_turn_45dwn4cwo5" ON "slice_den"."clock_resumed" IS 'foreign key ClockResumed(target, turn) to ClockPaused(target, turn)';

COMMENT ON CONSTRAINT "__clock_retry_fk_root_step_l5mlehgaai" ON "slice_den"."clock_retry" IS 'foreign key ClockRetry(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_retry_fk_root_step_attempt_vut5icvrra" ON "slice_den"."clock_retry" IS 'foreign key ClockRetry(root, step, attempt) to ClockEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_scope_fk_root_xasutriv42" ON "slice_den"."clock_scope" IS 'foreign key ClockScope(root) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_fk_root_step_3nv65ayicb" ON "slice_den"."clock_sitting_finish_output" IS 'foreign key ClockSittingFinishOutput(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_fk_root_step_zqtvbg4t5v" ON "slice_den"."clock_sitting_finish_output" IS 'foreign key ClockSittingFinishOutput(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_sitting_input_fk_root_scope_5hr6svgtkx" ON "slice_den"."clock_sitting_input" IS 'foreign key ClockSittingInput(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_sitting_input_fk_scope_tag_kind_sitting_v4ep6mjxje" ON "slice_den"."clock_sitting_input" IS 'foreign key ClockSittingInput(scope, tag ClockRoot.kind = Sitting) to ClockRoot(root, kind)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_by_nuxpfr6rlt" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(by) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_root_scope_umaapw5huy" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_scope_oi3a3bn4yj" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(scope) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_scope_m4fy3w5rcl" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(root, scope) to ClockAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_scope_nbmml3ni7y" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_step_ysvl2b4s4g" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_step_fk_root_scope_77guzwc2dq" ON "slice_den"."clock_step" IS 'foreign key ClockStep(root, scope) to ClockAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__clock_step_fk_root_scope_k3rk7n4jq2" ON "slice_den"."clock_step" IS 'foreign key ClockStep(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_admitted_fk_root_scope_paiega74y2" ON "slice_den"."fan_admitted" IS 'foreign key FanAdmitted(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_fk_root_step_lvbwqkrzya" ON "slice_den"."fan_batch_finish_output" IS 'foreign key FanBatchFinishOutput(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_fk_root_step_uvhwobeihn" ON "slice_den"."fan_batch_finish_output" IS 'foreign key FanBatchFinishOutput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_batch_input_fk_root_scope_sqnk42kypy" ON "slice_den"."fan_batch_input" IS 'foreign key FanBatchInput(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_step_2xkxna4wne" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_step_attempt_pred_holds_6ej2el2klx" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(root, step, attempt, pred(holds)) to FanHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_step_pred_attempt_thlj3gkwmg" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to FanEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_done_fk_root_step_snckhrcktc" ON "slice_den"."fan_done" IS 'foreign key FanDone(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_input_fk_root_step_zkgggm2l56" ON "slice_den"."fan_dust_input" IS 'foreign key FanDustInput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_root_step_22ctuvlqsa" ON "slice_den"."fan_dust_output" IS 'foreign key FanDustOutput(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_root_step_q6syhjm3id" ON "slice_den"."fan_dust_output" IS 'foreign key FanDustOutput(root, step) to FanDustInput(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_output_fk_root_step_3tchtvpkq4" ON "slice_den"."fan_dust_output" IS 'foreign key FanDustOutput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_ended_fk_root_step_g7lfuycwwy" ON "slice_den"."fan_ended" IS 'foreign key FanEnded(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_ended_fk_root_step_attempt_sludbzdnea" ON "slice_den"."fan_ended" IS 'foreign key FanEnded(root, step, attempt) to FanClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_exclusive_fk_kind_key_pred_turn_dyvewabv75" ON "slice_den"."fan_exclusive" IS 'foreign key FanExclusive(kind, key, pred(turn)) to FanReleased(kind, key, turn)';

COMMENT ON CONSTRAINT "__fan_exclusive_key_fk_root_scope_w4wlpmkbb6" ON "slice_den"."fan_exclusive_key" IS 'foreign key FanExclusiveKey(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_root_step_lfol3zhscm" ON "slice_den"."fan_exhausted" IS 'foreign key FanExhausted(root, step) to FanFailed(root, step)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_root_step_txucm4khfj" ON "slice_den"."fan_exhausted" IS 'foreign key FanExhausted(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_failed_fk_root_step_e3uoiynnze" ON "slice_den"."fan_failed" IS 'foreign key FanFailed(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_fk_root_step_eikvoft6l2" ON "slice_den"."fan_fan_run_finish_output" IS 'foreign key FanFanRunFinishOutput(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_fk_root_step_sxqsosyjco" ON "slice_den"."fan_fan_run_finish_output" IS 'foreign key FanFanRunFinishOutput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_root_scope_zfasx36h3d" ON "slice_den"."fan_fan_run_input" IS 'foreign key FanFanRunInput(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_scope_tag_kind_fan_run_nkgxbb32ui" ON "slice_den"."fan_fan_run_input" IS 'foreign key FanFanRunInput(scope, tag FanRoot.kind = FanRun) to FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_fenced_fk_root_step_xby6ndghkk" ON "slice_den"."fan_fenced" IS 'foreign key FanFenced(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_fenced_fk_root_step_attempt_kxzdzh7oiz" ON "slice_den"."fan_fenced" IS 'foreign key FanFenced(root, step, attempt) to FanEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_scope_3z53mfbjar" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_scope_4wzngp66gg" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_step_hd27i2yklh" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_step_4pr6zebh4l" ON "slice_den"."fan_held" IS 'foreign key FanHeld(root, step) to FanResult(root, step)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_step_673ozjicob" ON "slice_den"."fan_held" IS 'foreign key FanHeld(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_step_attempt_bflumufwqp" ON "slice_den"."fan_held" IS 'foreign key FanHeld(root, step, attempt) to FanClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_hold_fk_root_step_attempt_copy_holds_hnnbabpski" ON "slice_den"."fan_hold" IS 'foreign key FanHold(root, step, attempt, the owner''s count of the family FanClaim.holds) to FanClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_hold_fk_root_step_attempt_pred_at_lene3l2wo7" ON "slice_den"."fan_hold" IS 'foreign key FanHold(root, step, attempt, pred(at)) to FanHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__fan_mop_input_fk_root_step_7coslxahxn" ON "slice_den"."fan_mop_input" IS 'foreign key FanMopInput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_root_step_5d3cdcf24y" ON "slice_den"."fan_mop_output" IS 'foreign key FanMopOutput(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_root_step_gbh3w7dstn" ON "slice_den"."fan_mop_output" IS 'foreign key FanMopOutput(root, step) to FanMopInput(root, step)';

COMMENT ON CONSTRAINT "__fan_mop_output_fk_root_step_djslkqxv6t" ON "slice_den"."fan_mop_output" IS 'foreign key FanMopOutput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" ON "slice_den"."fan_paused" IS 'foreign key FanPaused(target, pred(turn)) to FanResumed(target, turn)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_root_step_qseur2r4dj" ON "slice_den"."fan_refusal" IS 'foreign key FanRefusal(root, step) to FanFailed(root, step)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_root_step_4l2iz5yiww" ON "slice_den"."fan_refusal" IS 'foreign key FanRefusal(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_released_fk_kind_key_turn_3w24p2wqa2" ON "slice_den"."fan_released" IS 'foreign key FanReleased(kind, key, turn) to FanExclusive(kind, key, turn)';

COMMENT ON CONSTRAINT "__fan_requested_with_fk_root_4p6mpdfivp" ON "slice_den"."fan_requested_with" IS 'foreign key FanRequestedWith(root) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_result_fk_root_step_mm2j7nmocm" ON "slice_den"."fan_result" IS 'foreign key FanResult(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" ON "slice_den"."fan_resumed" IS 'foreign key FanResumed(target, turn) to FanPaused(target, turn)';

COMMENT ON CONSTRAINT "__fan_retry_fk_root_step_dji2iap5lk" ON "slice_den"."fan_retry" IS 'foreign key FanRetry(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_retry_fk_root_step_attempt_qtwk5f4wb3" ON "slice_den"."fan_retry" IS 'foreign key FanRetry(root, step, attempt) to FanEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_scope_fk_root_peo7vjux2b" ON "slice_den"."fan_scope" IS 'foreign key FanScope(root) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_by_ptbn5ftpw3" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(by) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_root_scope_zoezs3f2j3" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_scope_5rsfnka2al" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(scope) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_square_input_fk_root_step_czm3ctmjss" ON "slice_den"."fan_square_input" IS 'foreign key FanSquareInput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_root_step_yvg2qx27p2" ON "slice_den"."fan_square_output" IS 'foreign key FanSquareOutput(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_root_step_7xh6wnyepk" ON "slice_den"."fan_square_output" IS 'foreign key FanSquareOutput(root, step) to FanSquareInput(root, step)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_root_step_yfsaf7ue33" ON "slice_den"."fan_square_output" IS 'foreign key FanSquareOutput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_child_p2ruy7qsg2" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(root, child) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_scope_q3eun6lixq" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_scope_ayer7ncuhn" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_scope_ocnak7go4o" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_scope_yfg5db7u23" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_step_ml4otyqd5u" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_step_fk_root_scope_mnnzqu5muv" ON "slice_den"."fan_step" IS 'foreign key FanStep(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_step_fk_root_scope_7hmxdgnve3" ON "slice_den"."fan_step" IS 'foreign key FanStep(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_fk_root_step_fywimi72uj" ON "slice_den"."fan_sweep_finish_output" IS 'foreign key FanSweepFinishOutput(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_fk_root_step_ryftvowe6x" ON "slice_den"."fan_sweep_finish_output" IS 'foreign key FanSweepFinishOutput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_sweep_input_fk_root_scope_qjyveymntd" ON "slice_den"."fan_sweep_input" IS 'foreign key FanSweepInput(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_sweep_input_fk_scope_tag_kind_sweep_m67ubjgrsc" ON "slice_den"."fan_sweep_input" IS 'foreign key FanSweepInput(scope, tag FanRoot.kind = Sweep) to FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_wanted_finish_output_fk_root_step_nowqxllejz" ON "slice_den"."fan_wanted_finish_output" IS 'foreign key FanWantedFinishOutput(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_wanted_finish_output_fk_root_step_5gnvgmuqtc" ON "slice_den"."fan_wanted_finish_output" IS 'foreign key FanWantedFinishOutput(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_wanted_input_fk_root_scope_bplbmnj6uf" ON "slice_den"."fan_wanted_input" IS 'foreign key FanWantedInput(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_wanted_input_fk_scope_tag_kind_wanted_3573mr5njd" ON "slice_den"."fan_wanted_input" IS 'foreign key FanWantedInput(scope, tag FanRoot.kind = Wanted) to FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_within_fk_root_parent_7jmxi4kbha" ON "slice_den"."fan_within" IS 'foreign key FanWithin(root, parent) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_within_fk_root_scope_s4ljjlq6zp" ON "slice_den"."fan_within" IS 'foreign key FanWithin(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_admitted_fk_root_scope_4whpx2yoko" ON "slice_den"."retry_admitted" IS 'foreign key RetryAdmitted(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_brittle_input_fk_root_step_hlztk5pli7" ON "slice_den"."retry_brittle_input" IS 'foreign key RetryBrittleInput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_root_step_jb4luuaii6" ON "slice_den"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(root, step) to RetryBrittleInput(root, step)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_root_step_u5tr5mvcej" ON "slice_den"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_root_step_4iw5oycmsm" ON "slice_den"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_claim_fk_root_step_y3nttmzxe7" ON "slice_den"."retry_claim" IS 'foreign key RetryClaim(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_claim_fk_root_step_pred_attempt_ygcziesx4q" ON "slice_den"."retry_claim" IS 'foreign key RetryClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to RetryEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_done_fk_root_step_d6c7pi2dpp" ON "slice_den"."retry_done" IS 'foreign key RetryDone(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_ended_fk_root_step_tet57bx36t" ON "slice_den"."retry_ended" IS 'foreign key RetryEnded(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_ended_fk_root_step_attempt_zmythu6lea" ON "slice_den"."retry_ended" IS 'foreign key RetryEnded(root, step, attempt) to RetryClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_root_step_ysmlpu2xyq" ON "slice_den"."retry_exhausted" IS 'foreign key RetryExhausted(root, step) to RetryFailed(root, step)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_root_step_37kf6fgbfy" ON "slice_den"."retry_exhausted" IS 'foreign key RetryExhausted(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_failed_fk_root_step_uguij74dd4" ON "slice_den"."retry_failed" IS 'foreign key RetryFailed(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_fenced_fk_root_step_ippcs3eeog" ON "slice_den"."retry_fenced" IS 'foreign key RetryFenced(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_fenced_fk_root_step_attempt_yjqggn34wn" ON "slice_den"."retry_fenced" IS 'foreign key RetryFenced(root, step, attempt) to RetryEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_scope_zjjmku4ngd" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(root, scope) to RetryAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_scope_ybtoj7rtci" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_step_uxc6mv3jae" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_step_n2vjs67jaj" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(root, step) to RetryResult(root, step)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_step_etlrrjjeex" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_step_attempt_hfwaf4utod" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(root, step, attempt) to RetryClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_fk_root_step_i7hxe26f2a" ON "slice_den"."retry_ladders_finish_output" IS 'foreign key RetryLaddersFinishOutput(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_fk_root_step_ra5qmanxwx" ON "slice_den"."retry_ladders_finish_output" IS 'foreign key RetryLaddersFinishOutput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fk_root_scope_d2fufzxzci" ON "slice_den"."retry_ladders_input" IS 'foreign key RetryLaddersInput(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fk_scope_tag_kind_ladders_erl4knm7ui" ON "slice_den"."retry_ladders_input" IS 'foreign key RetryLaddersInput(scope, tag RetryRoot.kind = Ladders) to RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__retry_patient_input_fk_root_step_f4hmhtbk3n" ON "slice_den"."retry_patient_input" IS 'foreign key RetryPatientInput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_root_step_fpgjlxisro" ON "slice_den"."retry_patient_output" IS 'foreign key RetryPatientOutput(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_root_step_cpuczlpiep" ON "slice_den"."retry_patient_output" IS 'foreign key RetryPatientOutput(root, step) to RetryPatientInput(root, step)';

COMMENT ON CONSTRAINT "__retry_patient_output_fk_root_step_pohr6muvkc" ON "slice_den"."retry_patient_output" IS 'foreign key RetryPatientOutput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" ON "slice_den"."retry_paused" IS 'foreign key RetryPaused(target, pred(turn)) to RetryResumed(target, turn)';

COMMENT ON CONSTRAINT "__retry_polite_input_fk_root_step_3jp5lj6xax" ON "slice_den"."retry_polite_input" IS 'foreign key RetryPoliteInput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_root_step_gafbdn5c5n" ON "slice_den"."retry_polite_output" IS 'foreign key RetryPoliteOutput(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_root_step_nu63thii5h" ON "slice_den"."retry_polite_output" IS 'foreign key RetryPoliteOutput(root, step) to RetryPoliteInput(root, step)';

COMMENT ON CONSTRAINT "__retry_polite_output_fk_root_step_nxdrkj3kkv" ON "slice_den"."retry_polite_output" IS 'foreign key RetryPoliteOutput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_root_step_vhxwkfyqu3" ON "slice_den"."retry_refusal" IS 'foreign key RetryRefusal(root, step) to RetryFailed(root, step)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_root_step_cxbne35gly" ON "slice_den"."retry_refusal" IS 'foreign key RetryRefusal(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_requested_with_fk_root_xpqnsapd2c" ON "slice_den"."retry_requested_with" IS 'foreign key RetryRequestedWith(root) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_result_fk_root_step_i63yrf2jjz" ON "slice_den"."retry_result" IS 'foreign key RetryResult(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" ON "slice_den"."retry_resumed" IS 'foreign key RetryResumed(target, turn) to RetryPaused(target, turn)';

COMMENT ON CONSTRAINT "__retry_retry_fk_root_step_f6jn5krklx" ON "slice_den"."retry_retry" IS 'foreign key RetryRetry(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_retry_fk_root_step_attempt_khdzeotgev" ON "slice_den"."retry_retry" IS 'foreign key RetryRetry(root, step, attempt) to RetryEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_scope_fk_root_p6ulzqc36r" ON "slice_den"."retry_scope" IS 'foreign key RetryScope(root) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_by_jf24rn5sep" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(by) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_root_scope_as5s7uohkr" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_scope_my57tu4oty" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(scope) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_scope_phyy3twhmr" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(root, scope) to RetryAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_scope_e3jd5sddhk" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_step_tjvsrtkfqg" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_fk_root_step_3q67hyqyq6" ON "slice_den"."retry_steadfast_input" IS 'foreign key RetrySteadfastInput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_root_step_4f5g2y22yg" ON "slice_den"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_root_step_tr34nnpddn" ON "slice_den"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(root, step) to RetrySteadfastInput(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_root_step_v5mp7yeltb" ON "slice_den"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_step_fk_root_scope_xe4735gsrg" ON "slice_den"."retry_step" IS 'foreign key RetryStep(root, scope) to RetryAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__retry_step_fk_root_scope_ubjxxgucjq" ON "slice_den"."retry_step" IS 'foreign key RetryStep(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_fk_root_step_aygvmljkir" ON "slice_den"."retry_throttled_finish_output" IS 'foreign key RetryThrottledFinishOutput(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_fk_root_step_ozfnseaqrp" ON "slice_den"."retry_throttled_finish_output" IS 'foreign key RetryThrottledFinishOutput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_throttled_input_fk_root_scope_yejc25rnmm" ON "slice_den"."retry_throttled_input" IS 'foreign key RetryThrottledInput(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_throttled_input_fk_scope_tag_kind_throttled_trbhgfiswb" ON "slice_den"."retry_throttled_input" IS 'foreign key RetryThrottledInput(scope, tag RetryRoot.kind = Throttled) to RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_fk_root_step_fzjhrc7zku" ON "slice_den"."retry_unhurried_finish_output" IS 'foreign key RetryUnhurriedFinishOutput(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_fk_root_step_7jes3ip3gy" ON "slice_den"."retry_unhurried_finish_output" IS 'foreign key RetryUnhurriedFinishOutput(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_unhurried_input_fk_root_scope_5vujadmlj4" ON "slice_den"."retry_unhurried_input" IS 'foreign key RetryUnhurriedInput(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_unhurried_input_fk_scope_tag_kind_unhurried_4hx7yzieur" ON "slice_den"."retry_unhurried_input" IS 'foreign key RetryUnhurriedInput(scope, tag RetryRoot.kind = Unhurried) to RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__review_admitted_fk_root_scope_wpazxz5qvc" ON "slice_den"."review_admitted" IS 'foreign key ReviewAdmitted(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_analyze_input_fk_root_step_yub2qzymcs" ON "slice_den"."review_analyze_input" IS 'foreign key ReviewAnalyzeInput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_root_step_h2ee2dnes4" ON "slice_den"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(root, step) to ReviewAnalyzeInput(root, step)';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_root_step_4na2usm64g" ON "slice_den"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_analyze_output_fk_root_step_mcuzplqybm" ON "slice_den"."review_analyze_output" IS 'foreign key ReviewAnalyzeOutput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_step_7f6aefekwa" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_step_attempt_pred_holds_4fz52sncza" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(root, step, attempt, pred(holds)) to ReviewHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_step_pred_attempt_77xjl3onsd" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to ReviewEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_done_fk_root_step_glhq6szbww" ON "slice_den"."review_done" IS 'foreign key ReviewDone(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_ended_fk_root_step_7wr4emeec6" ON "slice_den"."review_ended" IS 'foreign key ReviewEnded(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_ended_fk_root_step_attempt_5k7tdgg5nm" ON "slice_den"."review_ended" IS 'foreign key ReviewEnded(root, step, attempt) to ReviewClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_exhausted_fk_root_step_7u7yvsyo3u" ON "slice_den"."review_exhausted" IS 'foreign key ReviewExhausted(root, step) to ReviewFailed(root, step)';

COMMENT ON CONSTRAINT "__review_exhausted_fk_root_step_uadodb5yiw" ON "slice_den"."review_exhausted" IS 'foreign key ReviewExhausted(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_failed_fk_root_step_fmegqiyhwt" ON "slice_den"."review_failed" IS 'foreign key ReviewFailed(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_fenced_fk_root_step_kdzvzqe26m" ON "slice_den"."review_fenced" IS 'foreign key ReviewFenced(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_fenced_fk_root_step_attempt_kxthyqyqwb" ON "slice_den"."review_fenced" IS 'foreign key ReviewFenced(root, step, attempt) to ReviewEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_scope_gmmfvaopci" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_scope_av5o3ybt2d" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_step_ev6ctqell2" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_fk_root_step_db5vv26eez" ON "slice_den"."review_gather_input" IS 'foreign key ReviewGatherInput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_root_step_zge42z5dw4" ON "slice_den"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(root, step) to ReviewGatherInput(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_root_step_27idztmubk" ON "slice_den"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_fk_root_step_pred_oebvwidbtm" ON "slice_den"."review_gather_input_sizes" IS 'foreign key ReviewGatherInputSizes(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to ReviewGatherInputSizes(root, step, ordinal)';

COMMENT ON CONSTRAINT "__review_gather_output_fk_root_step_bt3tpfiw36" ON "slice_den"."review_gather_output" IS 'foreign key ReviewGatherOutput(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_gather_output_fk_root_step_ypsfoe6pny" ON "slice_den"."review_gather_output" IS 'foreign key ReviewGatherOutput(root, step) to ReviewGatherInput(root, step)';

COMMENT ON CONSTRAINT "__review_gather_output_fk_root_step_ni7dbzmuww" ON "slice_den"."review_gather_output" IS 'foreign key ReviewGatherOutput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_held_fk_root_step_377oxpprpb" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(root, step) to ReviewResult(root, step)';

COMMENT ON CONSTRAINT "__review_held_fk_root_step_6ucwevd65f" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_held_fk_root_step_attempt_43pd26ucr5" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(root, step, attempt) to ReviewClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_hold_fk_root_step_attempt_copy_holds_4jxl3l2dff" ON "slice_den"."review_hold" IS 'foreign key ReviewHold(root, step, attempt, the owner''s count of the family ReviewClaim.holds) to ReviewClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__review_hold_fk_root_step_attempt_pred_at_sqpugy4xri" ON "slice_den"."review_hold" IS 'foreign key ReviewHold(root, step, attempt, pred(at)) to ReviewHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__review_paused_fk_target_pred_turn_rig5fmgcvc" ON "slice_den"."review_paused" IS 'foreign key ReviewPaused(target, pred(turn)) to ReviewResumed(target, turn)';

COMMENT ON CONSTRAINT "__review_questions_finish_output_fk_root_step_flxzyo2ooj" ON "slice_den"."review_questions_finish_output" IS 'foreign key ReviewQuestionsFinishOutput(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_questions_finish_output_fk_root_step_miwyapestz" ON "slice_den"."review_questions_finish_output" IS 'foreign key ReviewQuestionsFinishOutput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_questions_input_fk_root_scope_6uvp2sj3t7" ON "slice_den"."review_questions_input" IS 'foreign key ReviewQuestionsInput(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_refusal_fk_root_step_i325iogm4w" ON "slice_den"."review_refusal" IS 'foreign key ReviewRefusal(root, step) to ReviewFailed(root, step)';

COMMENT ON CONSTRAINT "__review_refusal_fk_root_step_ksoewu53t4" ON "slice_den"."review_refusal" IS 'foreign key ReviewRefusal(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_requested_with_fk_root_qr6x7qjzy6" ON "slice_den"."review_requested_with" IS 'foreign key ReviewRequestedWith(root) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_result_fk_root_step_m7ddrhxqqw" ON "slice_den"."review_result" IS 'foreign key ReviewResult(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_resumed_fk_target_turn_nvm252hscc" ON "slice_den"."review_resumed" IS 'foreign key ReviewResumed(target, turn) to ReviewPaused(target, turn)';

COMMENT ON CONSTRAINT "__review_retry_fk_root_step_ifbhbgbjic" ON "slice_den"."review_retry" IS 'foreign key ReviewRetry(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_retry_fk_root_step_attempt_iuo24rnbik" ON "slice_den"."review_retry" IS 'foreign key ReviewRetry(root, step, attempt) to ReviewEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fk_root_step_65iqvssdi2" ON "slice_den"."review_review_run_finish_output" IS 'foreign key ReviewReviewRunFinishOutput(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fk_root_step_fl4bfx2c4c" ON "slice_den"."review_review_run_finish_output" IS 'foreign key ReviewReviewRunFinishOutput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_review_run_input_fk_root_scope_jojwgvs76k" ON "slice_den"."review_review_run_input" IS 'foreign key ReviewReviewRunInput(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_review_run_input_fk_scope_tag_kind_review_mewu5adpnd" ON "slice_den"."review_review_run_input" IS 'foreign key ReviewReviewRunInput(scope, tag ReviewRoot.kind = ReviewRun) to ReviewRoot(root, kind)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_root_scope_qoiz22wckm" ON "slice_den"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(root, scope) to ReviewReviewRunInput(root, scope)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_root_scope_6pgof5phxe" ON "slice_den"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fk_root_scope_pred_72aqqzv6rv" ON "slice_den"."review_review_run_input_sizes" IS 'foreign key ReviewReviewRunInputSizes(root where Logic.ge(ordinal, 1n), scope, pred(ordinal)) to ReviewReviewRunInputSizes(root, scope, ordinal)';

COMMENT ON CONSTRAINT "__review_save_input_fk_root_step_jwraq2sbzp" ON "slice_den"."review_save_input" IS 'foreign key ReviewSaveInput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_save_output_fk_root_step_datnfhi7up" ON "slice_den"."review_save_output" IS 'foreign key ReviewSaveOutput(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_save_output_fk_root_step_vv5non4wsq" ON "slice_den"."review_save_output" IS 'foreign key ReviewSaveOutput(root, step) to ReviewSaveInput(root, step)';

COMMENT ON CONSTRAINT "__review_save_output_fk_root_step_drcr33c5uz" ON "slice_den"."review_save_output" IS 'foreign key ReviewSaveOutput(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_saved_fk_root_from_htuh7p3c55" ON "slice_den"."review_saved" IS 'foreign key ReviewSaved(root, from) to ReviewQuestionsFinishOutput(root, step)';

COMMENT ON CONSTRAINT "__review_saved_fk_root_from_ku2omex6f7" ON "slice_den"."review_saved" IS 'foreign key ReviewSaved(root, from) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_saved_fk_root_to_o5cxc3jt3f" ON "slice_den"."review_saved" IS 'foreign key ReviewSaved(root, to) to ReviewSaveInput(root, step)';

COMMENT ON CONSTRAINT "__review_scope_fk_root_rc4vyqpoku" ON "slice_den"."review_scope" IS 'foreign key ReviewScope(root) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_skipped_fk_by_mzoxrlpp7w" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(by) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_skipped_fk_root_scope_o5jk25ddgb" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_skipped_fk_scope_zgzwa7kzos" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(scope) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_split_fk_root_from_i46qo7w3dg" ON "slice_den"."review_split" IS 'foreign key ReviewSplit(root, from) to ReviewGatherOutput(root, step)';

COMMENT ON CONSTRAINT "__review_split_fk_root_from_ubl2q2g6ns" ON "slice_den"."review_split" IS 'foreign key ReviewSplit(root, from) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_split_fk_root_to_wrpn5vlkn4" ON "slice_den"."review_split" IS 'foreign key ReviewSplit(root, to) to ReviewQuestionsInput(root, scope)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_child_u342utzlud" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(root, child) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_scope_ax6i5m4tah" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_scope_ewcgg4gkqi" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_scope_elajx6ojmn" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_scope_hm4o5wnnq3" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_step_hydxoqk6ko" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_step_fk_root_scope_a6ifj3up6d" ON "slice_den"."review_step" IS 'foreign key ReviewStep(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_step_fk_root_scope_4m7aoxywg2" ON "slice_den"."review_step" IS 'foreign key ReviewStep(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_within_fk_root_parent_xrlmd76tph" ON "slice_den"."review_within" IS 'foreign key ReviewWithin(root, parent) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_within_fk_root_scope_2kmwa6l6ye" ON "slice_den"."review_within" IS 'foreign key ReviewWithin(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_admitted_fk_root_scope_qm32lzefa4" ON "slice_den"."sync_admitted" IS 'foreign key SyncAdmitted(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_build_input_fk_root_step_y7yc5ng7jk" ON "slice_den"."sync_build_input" IS 'foreign key SyncBuildInput(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_root_step_bks325utix" ON "slice_den"."sync_build_output" IS 'foreign key SyncBuildOutput(root, step) to SyncBuildInput(root, step)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_root_step_rgsowc3ndi" ON "slice_den"."sync_build_output" IS 'foreign key SyncBuildOutput(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_root_step_guomzcrnnh" ON "slice_den"."sync_build_output" IS 'foreign key SyncBuildOutput(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_claim_fk_root_step_quvtx5ttao" ON "slice_den"."sync_claim" IS 'foreign key SyncClaim(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_claim_fk_root_step_pred_attempt_bol6pjm3eo" ON "slice_den"."sync_claim" IS 'foreign key SyncClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to SyncEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_copy_input_fk_root_step_5wme7kprty" ON "slice_den"."sync_copy_input" IS 'foreign key SyncCopyInput(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_root_step_si7qys3qgo" ON "slice_den"."sync_copy_output" IS 'foreign key SyncCopyOutput(root, step) to SyncCopyInput(root, step)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_root_step_szcmye7j7w" ON "slice_den"."sync_copy_output" IS 'foreign key SyncCopyOutput(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_root_step_xm2lbcdbsr" ON "slice_den"."sync_copy_output" IS 'foreign key SyncCopyOutput(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_done_fk_root_step_ftvlmvrpba" ON "slice_den"."sync_done" IS 'foreign key SyncDone(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_ended_fk_root_step_i2lhyuwibk" ON "slice_den"."sync_ended" IS 'foreign key SyncEnded(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_ended_fk_root_step_attempt_n3qg5glb33" ON "slice_den"."sync_ended" IS 'foreign key SyncEnded(root, step, attempt) to SyncClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" ON "slice_den"."sync_exclusive" IS 'foreign key SyncExclusive(kind, key, pred(turn)) to SyncReleased(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_root_scope_ru5tdbmjnc" ON "slice_den"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_root_step_22ldo45blt" ON "slice_den"."sync_exhausted" IS 'foreign key SyncExhausted(root, step) to SyncFailed(root, step)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_root_step_kmkjf7jent" ON "slice_den"."sync_exhausted" IS 'foreign key SyncExhausted(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_failed_fk_root_step_myvzlf5ffc" ON "slice_den"."sync_failed" IS 'foreign key SyncFailed(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_fenced_fk_root_step_rx2gydw664" ON "slice_den"."sync_fenced" IS 'foreign key SyncFenced(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_fenced_fk_root_step_attempt_hkkt227xm7" ON "slice_den"."sync_fenced" IS 'foreign key SyncFenced(root, step, attempt) to SyncEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_scope_n57v7sorjw" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(root, scope) to SyncAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_scope_nkwaqqjkro" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_step_gtaz64zwer" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_fk_root_step_mamfz2phff" ON "slice_den"."sync_gold_finish_output" IS 'foreign key SyncGoldFinishOutput(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_fk_root_step_4oqis6llqp" ON "slice_den"."sync_gold_finish_output" IS 'foreign key SyncGoldFinishOutput(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_input_fk_root_scope_mxp3g3bgni" ON "slice_den"."sync_gold_input" IS 'foreign key SyncGoldInput(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_gold_input_fk_scope_tag_kind_gold_jrvjw7qlef" ON "slice_den"."sync_gold_input" IS 'foreign key SyncGoldInput(scope, tag SyncRoot.kind = Gold) to SyncRoot(root, kind)';

COMMENT ON CONSTRAINT "__sync_held_fk_root_step_ehzwf7un2t" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(root, step) to SyncResult(root, step)';

COMMENT ON CONSTRAINT "__sync_held_fk_root_step_vuwropgke7" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_held_fk_root_step_attempt_mcpqusift2" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(root, step, attempt) to SyncClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" ON "slice_den"."sync_paused" IS 'foreign key SyncPaused(target, pred(turn)) to SyncResumed(target, turn)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_root_step_yvga4jg2h6" ON "slice_den"."sync_refusal" IS 'foreign key SyncRefusal(root, step) to SyncFailed(root, step)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_root_step_65sxus7ykl" ON "slice_den"."sync_refusal" IS 'foreign key SyncRefusal(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" ON "slice_den"."sync_released" IS 'foreign key SyncReleased(kind, key, turn) to SyncExclusive(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_requested_with_fk_root_bihshryreo" ON "slice_den"."sync_requested_with" IS 'foreign key SyncRequestedWith(root) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_result_fk_root_step_dkzpapizq3" ON "slice_den"."sync_result" IS 'foreign key SyncResult(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" ON "slice_den"."sync_resumed" IS 'foreign key SyncResumed(target, turn) to SyncPaused(target, turn)';

COMMENT ON CONSTRAINT "__sync_retry_fk_root_step_mugwrgmigc" ON "slice_den"."sync_retry" IS 'foreign key SyncRetry(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_retry_fk_root_step_attempt_cg4q7avist" ON "slice_den"."sync_retry" IS 'foreign key SyncRetry(root, step, attempt) to SyncEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_scope_fk_root_wx7v6qyztc" ON "slice_den"."sync_scope" IS 'foreign key SyncScope(root) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_by_wk5g3hkdey" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(by) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_root_scope_dct5o42l56" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_scope_hufe6pzhes" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(scope) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_scope_e4yzl2gkau" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(root, scope) to SyncAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_scope_nacgozh2kl" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_step_btl5tfw67n" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_step_fk_root_scope_uniymuuxtn" ON "slice_den"."sync_step" IS 'foreign key SyncStep(root, scope) to SyncAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__sync_step_fk_root_scope_enzxhjw2gj" ON "slice_den"."sync_step" IS 'foreign key SyncStep(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_fk_root_step_c7wzop2yks" ON "slice_den"."sync_sync_run_finish_output" IS 'foreign key SyncSyncRunFinishOutput(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_fk_root_step_wsebsn5uc2" ON "slice_den"."sync_sync_run_finish_output" IS 'foreign key SyncSyncRunFinishOutput(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_fk_root_scope_ju7hx4q2mn" ON "slice_den"."sync_sync_run_input" IS 'foreign key SyncSyncRunInput(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_fk_scope_tag_kind_sync_run_5ldve3xhyp" ON "slice_den"."sync_sync_run_input" IS 'foreign key SyncSyncRunInput(scope, tag SyncRoot.kind = SyncRun) to SyncRoot(root, kind)';

COMMENT ON CONSTRAINT "__writeback_admitted_fk_root_scope_qqqzahnyf2" ON "slice_den"."writeback_admitted" IS 'foreign key WritebackAdmitted(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_root_step_zg75zksbji" ON "slice_den"."writeback_claim" IS 'foreign key WritebackClaim(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_root_step_pred_attempt_4zvl2uw25a" ON "slice_den"."writeback_claim" IS 'foreign key WritebackClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to WritebackEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_deliver_input_fk_root_step_kv5flpjg57" ON "slice_den"."writeback_deliver_input" IS 'foreign key WritebackDeliverInput(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_root_step_oqndhmdkte" ON "slice_den"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(root, step) to WritebackDeliverInput(root, step)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_root_step_fcccly2svu" ON "slice_den"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(root, step) to WritebackDone(root, step)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_fk_root_step_uwlwbh6tz7" ON "slice_den"."writeback_deliver_output" IS 'foreign key WritebackDeliverOutput(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_done_fk_root_step_bzwxzhndka" ON "slice_den"."writeback_done" IS 'foreign key WritebackDone(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_ended_fk_root_step_am67uqomrg" ON "slice_den"."writeback_ended" IS 'foreign key WritebackEnded(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_ended_fk_root_step_attempt_qh4jnsspop" ON "slice_den"."writeback_ended" IS 'foreign key WritebackEnded(root, step, attempt) to WritebackClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_root_step_gfmcwvfpwb" ON "slice_den"."writeback_exhausted" IS 'foreign key WritebackExhausted(root, step) to WritebackFailed(root, step)';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_root_step_xwgnlixkqu" ON "slice_den"."writeback_exhausted" IS 'foreign key WritebackExhausted(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_failed_fk_root_step_ep5ube2q2t" ON "slice_den"."writeback_failed" IS 'foreign key WritebackFailed(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_root_step_jryffdx4b3" ON "slice_den"."writeback_fenced" IS 'foreign key WritebackFenced(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_root_step_attempt_scgwb3deqz" ON "slice_den"."writeback_fenced" IS 'foreign key WritebackFenced(root, step, attempt) to WritebackEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_scope_wktu6oamh6" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(root, scope) to WritebackAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_scope_2ufa2arlo5" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_step_x7bocjavzm" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_step_5jfudzwxhs" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(root, step) to WritebackResult(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_step_ujyn46mfgy" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_step_attempt_7rv7r23ugx" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(root, step, attempt) to WritebackClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_paused_fk_target_pred_turn_rvsgo6wgpe" ON "slice_den"."writeback_paused" IS 'foreign key WritebackPaused(target, pred(turn)) to WritebackResumed(target, turn)';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_root_step_xpfkdcxaxw" ON "slice_den"."writeback_refusal" IS 'foreign key WritebackRefusal(root, step) to WritebackFailed(root, step)';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_root_step_sjojme5rf4" ON "slice_den"."writeback_refusal" IS 'foreign key WritebackRefusal(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_requested_with_fk_root_72fgh2eqe3" ON "slice_den"."writeback_requested_with" IS 'foreign key WritebackRequestedWith(root) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_result_fk_root_step_hpxhblq2jh" ON "slice_den"."writeback_result" IS 'foreign key WritebackResult(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_resumed_fk_target_turn_vfx6l6vk75" ON "slice_den"."writeback_resumed" IS 'foreign key WritebackResumed(target, turn) to WritebackPaused(target, turn)';

COMMENT ON CONSTRAINT "__writeback_retry_fk_root_step_mqrj7w6oik" ON "slice_den"."writeback_retry" IS 'foreign key WritebackRetry(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_retry_fk_root_step_attempt_w6r4myovu5" ON "slice_den"."writeback_retry" IS 'foreign key WritebackRetry(root, step, attempt) to WritebackEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_scope_fk_root_ewz6khigbz" ON "slice_den"."writeback_scope" IS 'foreign key WritebackScope(root) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_by_3dxz35zl4d" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(by) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_root_scope_oiafhni4pk" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_scope_4nuhyyemgw" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(scope) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_scope_rlujmxpldi" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(root, scope) to WritebackAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_scope_hro4duvhvg" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_step_6rk46kjksz" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_step_fk_root_scope_4chp4gjey5" ON "slice_den"."writeback_step" IS 'foreign key WritebackStep(root, scope) to WritebackAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__writeback_step_fk_root_scope_2ldlcdao3z" ON "slice_den"."writeback_step" IS 'foreign key WritebackStep(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_fk_root_step_mv27ofwfme" ON "slice_den"."writeback_writeback_finish_output" IS 'foreign key WritebackWritebackFinishOutput(root, step) to WritebackDone(root, step)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_fk_root_step_holznxpvrn" ON "slice_den"."writeback_writeback_finish_output" IS 'foreign key WritebackWritebackFinishOutput(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_writeback_input_fk_root_scope_kx6ojnouad" ON "slice_den"."writeback_writeback_input" IS 'foreign key WritebackWritebackInput(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_writeback_input_fk_scope_tag_kind_wy35jinrsh" ON "slice_den"."writeback_writeback_input" IS 'foreign key WritebackWritebackInput(scope, tag WritebackRoot.kind = Writeback) to WritebackRoot(root, kind)';

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

COMMENT ON INDEX "slice_den"."__assign_admitted_ix_scope_sav4gw3eqi" IS 'btree index AssignAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_ix_scope_root_si4jmetdvt" IS 'btree index AssignAssignmentInput(scope, root)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_exclude_ix_scope_root_zqfaf4s3ix" IS 'btree index AssignAssignmentInputExclude(scope, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_mode_nearest_ix_scope_root_p7dpsia4cd" IS 'btree index AssignAssignmentInputModeNearest(scope, root)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_mode_within_ix_scope_root_bqasesgaf7" IS 'btree index AssignAssignmentInputModeWithin(scope, root)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_near_ix_scope_root_yjobx_7_e5r373gcrk" IS 'btree index AssignAssignmentInputNear(scope, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_claim_ix_step_root_yewsvvtcyz_pred_attempt_wh3x4tgtcq" IS 'btree index AssignClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_ix_step_root_b573uqwoo7" IS 'btree index AssignDecideInput(step, root)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_exclude_ix_step_root_yjobx_7_gsddib7qpt" IS 'btree index AssignDecideInputExclude(step, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_mode_nearest_ix_step_root_3kk3dg4j53" IS 'btree index AssignDecideInputModeNearest(step, root)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_mode_within_ix_step_root_txf3tbu422" IS 'btree index AssignDecideInputModeWithin(step, root)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_ix_step_root_xj4kp626lu" IS 'btree index AssignDecideOutput(step, root)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_stage_rest_ix_step_root_qqyxhk427n" IS 'btree index AssignDecideOutputStageRest(step, root)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_stage_serve_ix_step_root_qyudonuazu" IS 'btree index AssignDecideOutputStageServe(step, root)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_weighed_ix_step_root_yjobx_7_cs5ragvjo3" IS 'btree index AssignDecideOutputWeighed(step, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_nearest_ix_digest_tm2whkfyjf" IS 'btree index AssignDecideReadNearest(digest)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_seen_ix_digest_q7rgkxywvx" IS 'btree index AssignDecideReadSeen(digest)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_ix_step_root_bmzodxatow" IS 'btree index AssignEmbedInput(step, root)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_exclude_ix_step_root_yjobx_7_xcibpzqvn6" IS 'btree index AssignEmbedInputExclude(step, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_mode_nearest_ix_step_root_ramcyjzsmj" IS 'btree index AssignEmbedInputModeNearest(step, root)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_mode_within_ix_step_root_7b4wxziea2" IS 'btree index AssignEmbedInputModeWithin(step, root)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_near_ix_step_root_yjobx_7_uyrd_eh47bqlhw3" IS 'btree index AssignEmbedInputNear(step, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__assign_fenced_ix_step_eztmdy3mzv" IS 'btree index AssignFenced(step)';

COMMENT ON INDEX "slice_den"."__assign_finish_ix_scope_step_53o4eorqpr" IS 'btree index AssignFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__assign_held_ix_step_irvbrtgz2r" IS 'btree index AssignHeld(step)';

COMMENT ON INDEX "slice_den"."__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" IS 'btree index AssignPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__assign_result_ix_step_outcome_root_35vmqe5lxj" IS 'btree index AssignResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__assign_retry_ix_step_efjk6uhsq4" IS 'btree index AssignRetry(step)';

COMMENT ON INDEX "slice_den"."__assign_skipped_ix_by_phe5rdziqg" IS 'btree index AssignSkipped(by)';

COMMENT ON INDEX "slice_den"."__assign_skipped_ix_scope_ftup4gbap6" IS 'btree index AssignSkipped(scope)';

COMMENT ON INDEX "slice_den"."__assign_step_ix_root_scope_64vujnvoiu" IS 'btree index AssignStep(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_step_ix_scope_kind_4jyx7qz4gq" IS 'btree index AssignStep(scope, kind)';

COMMENT ON INDEX "slice_den"."__chain_admitted_ix_scope_v57a4nivm3" IS 'btree index ChainAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__chain_chain_run_input_ix_scope_iuq7js6bfa" IS 'btree index ChainChainRunInput(scope)';

COMMENT ON INDEX "slice_den"."__chain_claim_ix_step_root_yewsvvtcyz_pred_attempt_z55hhc5lhz" IS 'btree index ChainClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__chain_fenced_ix_step_h437d2nbx3" IS 'btree index ChainFenced(step)';

COMMENT ON INDEX "slice_den"."__chain_finish_ix_scope_step_om6bljb56e" IS 'btree index ChainFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__chain_finish_ix_step_gfuhyfoe3p" IS 'btree index ChainFinish(step)';

COMMENT ON INDEX "slice_den"."__chain_held_ix_step_4lrvrd3gs5" IS 'btree index ChainHeld(step)';

COMMENT ON INDEX "slice_den"."__chain_ordered_input_ix_scope_lbnwnucdyj" IS 'btree index ChainOrderedInput(scope)';

COMMENT ON INDEX "slice_den"."__chain_page_input_ix_step_root_wr66hlqeaw" IS 'btree index ChainPageInput(step, root)';

COMMENT ON INDEX "slice_den"."__chain_page_input_after_ix_step_qdsmrr4vxs" IS 'btree index ChainPageInputAfter(step)';

COMMENT ON INDEX "slice_den"."__chain_page_output_ix_step_hu6e3cftif" IS 'btree index ChainPageOutput(step)';

COMMENT ON INDEX "slice_den"."__chain_page_output_next_ix_step_r3v3ug5ybb" IS 'btree index ChainPageOutputNext(step)';

COMMENT ON INDEX "slice_den"."__chain_page_read_earlier_ix_digest_p7rrxdx4kq" IS 'btree index ChainPageReadEarlier(digest)';

COMMENT ON INDEX "slice_den"."__chain_page_read_tree_ix_digest_qz4flptsbe" IS 'btree index ChainPageReadTree(digest)';

COMMENT ON INDEX "slice_den"."__chain_page_read_weights_ix_digest_p6eekmx2x6" IS 'btree index ChainPageReadWeights(digest)';

COMMENT ON INDEX "slice_den"."__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" IS 'btree index ChainPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__chain_result_ix_step_outcome_root_ipaxj3wl7z" IS 'btree index ChainResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__chain_retry_ix_step_jpeyuc4c4h" IS 'btree index ChainRetry(step)';

COMMENT ON INDEX "slice_den"."__chain_skipped_ix_by_2c45vyfwzy" IS 'btree index ChainSkipped(by)';

COMMENT ON INDEX "slice_den"."__chain_skipped_ix_scope_jvrcbbmf2m" IS 'btree index ChainSkipped(scope)';

COMMENT ON INDEX "slice_den"."__chain_step_ix_root_scope_srrhrbyetn" IS 'btree index ChainStep(root, scope)';

COMMENT ON INDEX "slice_den"."__chain_step_ix_scope_kind_spn3gys2vi" IS 'btree index ChainStep(scope, kind)';

COMMENT ON INDEX "slice_den"."__clock_admitted_ix_scope_kljsbnk7gu" IS 'btree index ClockAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__clock_chime_input_ix_step_root_vzyzntggzq" IS 'btree index ClockChimeInput(step, root)';

COMMENT ON INDEX "slice_den"."__clock_claim_ix_step_root_yewsvvtcyz_pred_attempt_xukg6gzvx7" IS 'btree index ClockClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__clock_close_input_ix_step_root_iuvhjb65sf" IS 'btree index ClockCloseInput(step, root)';

COMMENT ON INDEX "slice_den"."__clock_fenced_ix_step_6fkdtadk6s" IS 'btree index ClockFenced(step)';

COMMENT ON INDEX "slice_den"."__clock_finish_ix_scope_step_q2cyoxfrgy" IS 'btree index ClockFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__clock_held_ix_step_254uki72j6" IS 'btree index ClockHeld(step)';

COMMENT ON INDEX "slice_den"."__clock_hourly_input_ix_scope_hjvvwnlgos" IS 'btree index ClockHourlyInput(scope)';

COMMENT ON INDEX "slice_den"."__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" IS 'btree index ClockPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__clock_result_ix_step_root_v3qa4me2e6" IS 'btree index ClockResult(step, root)';

COMMENT ON INDEX "slice_den"."__clock_retry_ix_step_evme3lajlk" IS 'btree index ClockRetry(step)';

COMMENT ON INDEX "slice_den"."__clock_sitting_input_ix_scope_k6vxbcvu2a" IS 'btree index ClockSittingInput(scope)';

COMMENT ON INDEX "slice_den"."__clock_skipped_ix_by_252vuphujb" IS 'btree index ClockSkipped(by)';

COMMENT ON INDEX "slice_den"."__clock_skipped_ix_scope_vlmkgoc4qh" IS 'btree index ClockSkipped(scope)';

COMMENT ON INDEX "slice_den"."__clock_step_ix_scope_root_dr2wopxg6r" IS 'btree index ClockStep(scope, root)';

COMMENT ON INDEX "slice_den"."__fan_admitted_ix_scope_6tfnemhvcg" IS 'btree index FanAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__fan_batch_finish_output_ix_step_ocxqquufa6" IS 'btree index FanBatchFinishOutput(step)';

COMMENT ON INDEX "slice_den"."__fan_batch_input_ix_scope_root_v4z44ipfis" IS 'btree index FanBatchInput(scope, root)';

COMMENT ON INDEX "slice_den"."__fan_claim_ix_step_root_yewsvvtcyz_pred_attempt_oey_nttbgx6ow2" IS 'btree index FanClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__fan_dust_input_ix_step_root_w75lqylbvv" IS 'btree index FanDustInput(step, root)';

COMMENT ON INDEX "slice_den"."__fan_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_vboqjsyskn" IS 'btree index FanExclusive(kind, key, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__fan_exclusive_key_ix_scope_7s5kcsf2wj" IS 'btree index FanExclusiveKey(scope)';

COMMENT ON INDEX "slice_den"."__fan_fan_run_input_ix_scope_rgmbrwdcvq" IS 'btree index FanFanRunInput(scope)';

COMMENT ON INDEX "slice_den"."__fan_fenced_ix_step_xiphniebnv" IS 'btree index FanFenced(step)';

COMMENT ON INDEX "slice_den"."__fan_finish_ix_scope_step_gv7mbzp7pp" IS 'btree index FanFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__fan_finish_ix_step_jjs336jpbb" IS 'btree index FanFinish(step)';

COMMENT ON INDEX "slice_den"."__fan_held_ix_step_rtiyqqxotz" IS 'btree index FanHeld(step)';

COMMENT ON INDEX "slice_den"."__fan_hold_ix_resource_seat_s7bnw22355" IS 'btree index FanHold(resource, seat)';

COMMENT ON INDEX "slice_den"."__fan_mop_input_ix_step_root_m3lg7oxuam" IS 'btree index FanMopInput(step, root)';

COMMENT ON INDEX "slice_den"."__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" IS 'btree index FanPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__fan_result_ix_step_outcome_root_udaij7stvj" IS 'btree index FanResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__fan_retry_ix_step_4v6a7logoe" IS 'btree index FanRetry(step)';

COMMENT ON INDEX "slice_den"."__fan_skipped_ix_by_3aejofkhor" IS 'btree index FanSkipped(by)';

COMMENT ON INDEX "slice_den"."__fan_skipped_ix_scope_h5pzdoa32a" IS 'btree index FanSkipped(scope)';

COMMENT ON INDEX "slice_den"."__fan_square_input_ix_step_root_jod5ra6yqo" IS 'btree index FanSquareInput(step, root)';

COMMENT ON INDEX "slice_den"."__fan_square_output_ix_step_teolwx3lfw" IS 'btree index FanSquareOutput(step)';

COMMENT ON INDEX "slice_den"."__fan_step_ix_root_scope_aw525h7gua" IS 'btree index FanStep(root, scope)';

COMMENT ON INDEX "slice_den"."__fan_step_ix_scope_kind_h2wuapaqs3" IS 'btree index FanStep(scope, kind)';

COMMENT ON INDEX "slice_den"."__fan_sweep_input_ix_scope_zvab3un5km" IS 'btree index FanSweepInput(scope)';

COMMENT ON INDEX "slice_den"."__fan_wanted_input_ix_scope_57fqk3rwec" IS 'btree index FanWantedInput(scope)';

COMMENT ON INDEX "slice_den"."__fan_within_ix_parent_kind_scope_5ywepfmzj2" IS 'btree index FanWithin(parent, kind, scope)';

COMMENT ON INDEX "slice_den"."__fan_within_ix_parent_root_eiovyuswcz" IS 'btree index FanWithin(parent, root)';

COMMENT ON INDEX "slice_den"."__fan_within_ix_scope_root_vht7afdsvu" IS 'btree index FanWithin(scope, root)';

COMMENT ON INDEX "slice_den"."__retry_admitted_ix_scope_yqb7r5kcts" IS 'btree index RetryAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__retry_brittle_input_ix_step_root_6ur6u2dkec" IS 'btree index RetryBrittleInput(step, root)';

COMMENT ON INDEX "slice_den"."__retry_brittle_output_ix_step_ddjioko4ap" IS 'btree index RetryBrittleOutput(step)';

COMMENT ON INDEX "slice_den"."__retry_claim_ix_step_root_yewsvvtcyz_pred_attempt_acklz4su4p" IS 'btree index RetryClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__retry_fenced_ix_step_taohzqvdeo" IS 'btree index RetryFenced(step)';

COMMENT ON INDEX "slice_den"."__retry_finish_ix_scope_step_6tswescc6v" IS 'btree index RetryFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__retry_held_ix_step_l7f7ax5pel" IS 'btree index RetryHeld(step)';

COMMENT ON INDEX "slice_den"."__retry_ladders_input_ix_scope_ktwahiu353" IS 'btree index RetryLaddersInput(scope)';

COMMENT ON INDEX "slice_den"."__retry_patient_input_ix_step_root_2ufb6ex62j" IS 'btree index RetryPatientInput(step, root)';

COMMENT ON INDEX "slice_den"."__retry_patient_output_ix_step_4nlbxubrgc" IS 'btree index RetryPatientOutput(step)';

COMMENT ON INDEX "slice_den"."__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" IS 'btree index RetryPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__retry_polite_input_ix_step_root_yequmlbu4w" IS 'btree index RetryPoliteInput(step, root)';

COMMENT ON INDEX "slice_den"."__retry_polite_output_ix_step_cagfkplnyp" IS 'btree index RetryPoliteOutput(step)';

COMMENT ON INDEX "slice_den"."__retry_result_ix_step_outcome_root_5x6caywnin" IS 'btree index RetryResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__retry_retry_ix_step_4y7ukujr4x" IS 'btree index RetryRetry(step)';

COMMENT ON INDEX "slice_den"."__retry_skipped_ix_by_s7pekf7xtg" IS 'btree index RetrySkipped(by)';

COMMENT ON INDEX "slice_den"."__retry_skipped_ix_scope_pj72ptncqt" IS 'btree index RetrySkipped(scope)';

COMMENT ON INDEX "slice_den"."__retry_steadfast_input_ix_step_root_kko5yn5mfi" IS 'btree index RetrySteadfastInput(step, root)';

COMMENT ON INDEX "slice_den"."__retry_steadfast_output_ix_step_xu5p4zs52x" IS 'btree index RetrySteadfastOutput(step)';

COMMENT ON INDEX "slice_den"."__retry_step_ix_root_scope_ogbhay3han" IS 'btree index RetryStep(root, scope)';

COMMENT ON INDEX "slice_den"."__retry_step_ix_scope_kind_gvjz7p6rcr" IS 'btree index RetryStep(scope, kind)';

COMMENT ON INDEX "slice_den"."__retry_throttled_input_ix_scope_srrsrnmwfp" IS 'btree index RetryThrottledInput(scope)';

COMMENT ON INDEX "slice_den"."__retry_unhurried_input_ix_scope_4drrri4lgl" IS 'btree index RetryUnhurriedInput(scope)';

COMMENT ON INDEX "slice_den"."__review_admitted_ix_scope_uaz2e2unre" IS 'btree index ReviewAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__review_analyze_input_ix_step_root_s5vaywecrt" IS 'btree index ReviewAnalyzeInput(step, root)';

COMMENT ON INDEX "slice_den"."__review_analyze_output_ix_step_t5p7no2i5e" IS 'btree index ReviewAnalyzeOutput(step)';

COMMENT ON INDEX "slice_den"."__review_claim_ix_step_root_yewsvvtcyz_pred_attempt_53g43drm5l" IS 'btree index ReviewClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__review_fenced_ix_step_k2afeb3irz" IS 'btree index ReviewFenced(step)';

COMMENT ON INDEX "slice_den"."__review_finish_ix_scope_step_4k6s2nqgyy" IS 'btree index ReviewFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__review_finish_ix_step_luhj6362cj" IS 'btree index ReviewFinish(step)';

COMMENT ON INDEX "slice_den"."__review_gather_input_ix_review_f2zafhsmtj" IS 'btree index ReviewGatherInput(review)';

COMMENT ON INDEX "slice_den"."__review_gather_input_ix_step_root_sq3sceot7a" IS 'btree index ReviewGatherInput(step, root)';

COMMENT ON INDEX "slice_den"."__review_gather_input_sizes_ix_step_root_yjobx_7_7uihmnh7ih" IS 'btree index ReviewGatherInputSizes(step, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__review_held_ix_step_xvtsgiwapv" IS 'btree index ReviewHeld(step)';

COMMENT ON INDEX "slice_den"."__review_hold_ix_resource_seat_3p66dnxzad" IS 'btree index ReviewHold(resource, seat)';

COMMENT ON INDEX "slice_den"."__review_hold_ix_step_daijcrisdf" IS 'btree index ReviewHold(step)';

COMMENT ON INDEX "slice_den"."__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" IS 'btree index ReviewPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__review_questions_finish_output_ix_step_snk4x6oh75" IS 'btree index ReviewQuestionsFinishOutput(step)';

COMMENT ON INDEX "slice_den"."__review_questions_input_ix_scope_root_4mssyhumwi" IS 'btree index ReviewQuestionsInput(scope, root)';

COMMENT ON INDEX "slice_den"."__review_result_ix_step_outcome_root_lbrp6nyb6i" IS 'btree index ReviewResult(step, outcome, root)';

COMMENT ON INDEX "slice_den"."__review_retry_ix_step_c7roln6cyz" IS 'btree index ReviewRetry(step)';

COMMENT ON INDEX "slice_den"."__review_review_run_input_ix_scope_pjiclt36mp" IS 'btree index ReviewReviewRunInput(scope)';

COMMENT ON INDEX "slice_den"."__review_review_run_input_sizes_ix_scope_root_yjobx_q27b4rjhuv" IS 'btree index ReviewReviewRunInputSizes(scope, __root_yjobx7uyrd, __pred_ordinal_e545zctcav)';

COMMENT ON INDEX "slice_den"."__review_save_input_ix_step_root_vn5k5ydivm" IS 'btree index ReviewSaveInput(step, root)';

COMMENT ON INDEX "slice_den"."__review_save_output_ix_step_uj4wo4gdyl" IS 'btree index ReviewSaveOutput(step)';

COMMENT ON INDEX "slice_den"."__review_skipped_ix_by_6z5g634njq" IS 'btree index ReviewSkipped(by)';

COMMENT ON INDEX "slice_den"."__review_skipped_ix_scope_ypzvqrmdce" IS 'btree index ReviewSkipped(scope)';

COMMENT ON INDEX "slice_den"."__review_step_ix_root_scope_jvmzqg2kjy" IS 'btree index ReviewStep(root, scope)';

COMMENT ON INDEX "slice_den"."__review_step_ix_scope_kind_fjqrbmtqpf" IS 'btree index ReviewStep(scope, kind)';

COMMENT ON INDEX "slice_den"."__review_within_ix_parent_kind_scope_dtilr5xomp" IS 'btree index ReviewWithin(parent, kind, scope)';

COMMENT ON INDEX "slice_den"."__review_within_ix_parent_root_ajpsgwldly" IS 'btree index ReviewWithin(parent, root)';

COMMENT ON INDEX "slice_den"."__review_within_ix_scope_root_de6bpnvbbw" IS 'btree index ReviewWithin(scope, root)';

COMMENT ON INDEX "slice_den"."__sync_admitted_ix_scope_iqmg6cfxd7" IS 'btree index SyncAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__sync_build_input_ix_step_root_n7cbt5ywes" IS 'btree index SyncBuildInput(step, root)';

COMMENT ON INDEX "slice_den"."__sync_claim_ix_step_root_yewsvvtcyz_pred_attempt_fiq4h65yco" IS 'btree index SyncClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__sync_copy_input_ix_step_root_pzhfu7yan4" IS 'btree index SyncCopyInput(step, root)';

COMMENT ON INDEX "slice_den"."__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" IS 'btree index SyncExclusive(kind, key, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__sync_exclusive_key_ix_scope_odlg62uodv" IS 'btree index SyncExclusiveKey(scope)';

COMMENT ON INDEX "slice_den"."__sync_fenced_ix_step_z7k6qcdgfq" IS 'btree index SyncFenced(step)';

COMMENT ON INDEX "slice_den"."__sync_finish_ix_scope_step_owsw7m5w74" IS 'btree index SyncFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__sync_finish_ix_step_uwcksqapnl" IS 'btree index SyncFinish(step)';

COMMENT ON INDEX "slice_den"."__sync_gold_input_ix_scope_5czwxdxbjp" IS 'btree index SyncGoldInput(scope)';

COMMENT ON INDEX "slice_den"."__sync_held_ix_step_hqbgboxgaj" IS 'btree index SyncHeld(step)';

COMMENT ON INDEX "slice_den"."__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" IS 'btree index SyncPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__sync_result_ix_step_root_mbhvrwajkq" IS 'btree index SyncResult(step, root)';

COMMENT ON INDEX "slice_den"."__sync_retry_ix_step_nqiv6tlf2k" IS 'btree index SyncRetry(step)';

COMMENT ON INDEX "slice_den"."__sync_skipped_ix_by_ttq6dm55n2" IS 'btree index SyncSkipped(by)';

COMMENT ON INDEX "slice_den"."__sync_skipped_ix_scope_d5pw2mcp56" IS 'btree index SyncSkipped(scope)';

COMMENT ON INDEX "slice_den"."__sync_step_ix_scope_root_hppxk5gi6a" IS 'btree index SyncStep(scope, root)';

COMMENT ON INDEX "slice_den"."__sync_sync_run_input_ix_scope_xmn3bafu67" IS 'btree index SyncSyncRunInput(scope)';

COMMENT ON INDEX "slice_den"."__writeback_admitted_ix_scope_54lp3ihfk7" IS 'btree index WritebackAdmitted(scope)';

COMMENT ON INDEX "slice_den"."__writeback_claim_ix_step_root_yewsvvtcyz_pred_tplitkeoq2" IS 'btree index WritebackClaim(step, __root_yewsvvtcyz, __pred_attempt_oey4tm5xyl)';

COMMENT ON INDEX "slice_den"."__writeback_deliver_input_ix_step_root_vaxq6pgpkm" IS 'btree index WritebackDeliverInput(step, root)';

COMMENT ON INDEX "slice_den"."__writeback_fenced_ix_step_iwrqegcnk6" IS 'btree index WritebackFenced(step)';

COMMENT ON INDEX "slice_den"."__writeback_finish_ix_scope_step_6ooh2ahmws" IS 'btree index WritebackFinish(scope, step)';

COMMENT ON INDEX "slice_den"."__writeback_held_ix_step_itsn6ncq5e" IS 'btree index WritebackHeld(step)';

COMMENT ON INDEX "slice_den"."__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" IS 'btree index WritebackPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice_den"."__writeback_result_ix_step_root_u43itfyxzx" IS 'btree index WritebackResult(step, root)';

COMMENT ON INDEX "slice_den"."__writeback_retry_ix_step_xokcsjqehk" IS 'btree index WritebackRetry(step)';

COMMENT ON INDEX "slice_den"."__writeback_skipped_ix_by_3ei4k4fj53" IS 'btree index WritebackSkipped(by)';

COMMENT ON INDEX "slice_den"."__writeback_skipped_ix_scope_dwesxm2rrj" IS 'btree index WritebackSkipped(scope)';

COMMENT ON INDEX "slice_den"."__writeback_step_ix_scope_root_ft5ap6qmlh" IS 'btree index WritebackStep(scope, root)';

COMMENT ON INDEX "slice_den"."__writeback_writeback_input_ix_scope_72jqfcjowv" IS 'btree index WritebackWritebackInput(scope)';

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

COMMENT ON FUNCTION "slice"."__reader_olds_assign_requested_with_443b3z4c4i"() IS 'the reader of the delta of olds of AssignRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_result_jkusfe56os"() IS 'the reader of the delta of olds of AssignResult';

COMMENT ON FUNCTION "slice"."__reader_news_assign_root_3xyzyb53nr"() IS 'the reader of the delta of news of AssignRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_step_zgkm42uz2f"() IS 'the reader of the delta of olds of AssignStep';

COMMENT ON FUNCTION "slice"."__reader_news_chain_done_spjx62oij2"() IS 'the reader of the delta of news of ChainDone';

COMMENT ON FUNCTION "slice"."__reader_news_chain_failed_slqqazjxe5"() IS 'the reader of the delta of news of ChainFailed';

COMMENT ON FUNCTION "slice"."__reader_news_chain_page_input_obmb52egoq"() IS 'the reader of the delta of news of ChainPageInput';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_requested_with_4x7wyiwiez"() IS 'the reader of the delta of olds of ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_result_nva6clqovh"() IS 'the reader of the delta of olds of ChainResult';

COMMENT ON FUNCTION "slice"."__reader_news_chain_root_mcybluxt5e"() IS 'the reader of the delta of news of ChainRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_step_yztqk3nrsj"() IS 'the reader of the delta of olds of ChainStep';

COMMENT ON FUNCTION "slice"."__reader_news_clock_chime_input_ilxoav3ofv"() IS 'the reader of the delta of news of ClockChimeInput';

COMMENT ON FUNCTION "slice"."__reader_news_clock_close_input_ew3vn6itfg"() IS 'the reader of the delta of news of ClockCloseInput';

COMMENT ON FUNCTION "slice"."__reader_news_clock_done_wdid4fihtt"() IS 'the reader of the delta of news of ClockDone';

COMMENT ON FUNCTION "slice"."__reader_news_clock_failed_valmjzds6g"() IS 'the reader of the delta of news of ClockFailed';

COMMENT ON FUNCTION "slice"."__reader_news_clock_hourly_key_rlop4iivgr"() IS 'the reader of the delta of news of ClockHourlyKey';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_hourly_key_uvlw2pe574"() IS 'the reader of the delta of olds of ClockHourlyKey';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_requested_with_arihfprtk2"() IS 'the reader of the delta of olds of ClockRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_result_j3aouqlor5"() IS 'the reader of the delta of olds of ClockResult';

COMMENT ON FUNCTION "slice"."__reader_news_clock_root_mr43vya4t5"() IS 'the reader of the delta of news of ClockRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_root_rppa5kmno5"() IS 'the reader of the delta of olds of ClockRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_step_pgxck5ertr"() IS 'the reader of the delta of olds of ClockStep';

COMMENT ON FUNCTION "slice"."__reader_news_fan_batch_input_zlj2bvajxq"() IS 'the reader of the delta of news of FanBatchInput';

COMMENT ON FUNCTION "slice"."__reader_news_fan_claim_c3x5lsopvv"() IS 'the reader of the delta of news of FanClaim';

COMMENT ON FUNCTION "slice"."__reader_news_fan_done_qikk2ro7ie"() IS 'the reader of the delta of news of FanDone';

COMMENT ON FUNCTION "slice"."__reader_news_fan_dust_input_jfwjtz36au"() IS 'the reader of the delta of news of FanDustInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_ended_gs4jd5beu6"() IS 'the reader of the delta of olds of FanEnded';

COMMENT ON FUNCTION "slice"."__reader_news_fan_failed_dhjopwnfpe"() IS 'the reader of the delta of news of FanFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_held_nqvfb5gffm"() IS 'the reader of the delta of olds of FanHeld';

COMMENT ON FUNCTION "slice"."__reader_news_fan_hold_2iorpqkqi2"() IS 'the reader of the delta of news of FanHold';

COMMENT ON FUNCTION "slice"."__reader_news_fan_mop_input_y2wt46ygp5"() IS 'the reader of the delta of news of FanMopInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_requested_with_ojtaefe2lg"() IS 'the reader of the delta of olds of FanRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_result_5zw7ij7lso"() IS 'the reader of the delta of olds of FanResult';

COMMENT ON FUNCTION "slice"."__reader_news_fan_root_6b32bydtyr"() IS 'the reader of the delta of news of FanRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_root_yqaxuh6idz"() IS 'the reader of the delta of olds of FanRoot';

COMMENT ON FUNCTION "slice"."__reader_news_fan_square_input_p7ron44s5l"() IS 'the reader of the delta of news of FanSquareInput';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_step_aw2226k2ta"() IS 'the reader of the delta of olds of FanStep';

COMMENT ON FUNCTION "slice"."__reader_news_fan_wanted_key_5jmo3vnjy6"() IS 'the reader of the delta of news of FanWantedKey';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_wanted_key_s25zsnch4p"() IS 'the reader of the delta of olds of FanWantedKey';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_within_aj2imfabum"() IS 'the reader of the delta of olds of FanWithin';

COMMENT ON FUNCTION "slice"."__reader_news_retry_brittle_input_cpjzfvx4th"() IS 'the reader of the delta of news of RetryBrittleInput';

COMMENT ON FUNCTION "slice"."__reader_news_retry_done_37ae4vspu2"() IS 'the reader of the delta of news of RetryDone';

COMMENT ON FUNCTION "slice"."__reader_news_retry_failed_axjpxxtyqh"() IS 'the reader of the delta of news of RetryFailed';

COMMENT ON FUNCTION "slice"."__reader_news_retry_patient_input_gmjeirl4oe"() IS 'the reader of the delta of news of RetryPatientInput';

COMMENT ON FUNCTION "slice"."__reader_news_retry_polite_input_ldefi4pvmz"() IS 'the reader of the delta of news of RetryPoliteInput';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_requested_with_am6b6xgnmd"() IS 'the reader of the delta of olds of RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_result_uld336hsbx"() IS 'the reader of the delta of olds of RetryResult';

COMMENT ON FUNCTION "slice"."__reader_news_retry_root_otdnullrvt"() IS 'the reader of the delta of news of RetryRoot';

COMMENT ON FUNCTION "slice"."__reader_news_retry_steadfast_input_vfnxzktspv"() IS 'the reader of the delta of news of RetrySteadfastInput';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_step_amtt4wxs2b"() IS 'the reader of the delta of olds of RetryStep';

COMMENT ON FUNCTION "slice"."__reader_news_review_analyze_input_rsdjisdchq"() IS 'the reader of the delta of news of ReviewAnalyzeInput';

COMMENT ON FUNCTION "slice"."__reader_news_review_claim_xp5d4drk2z"() IS 'the reader of the delta of news of ReviewClaim';

COMMENT ON FUNCTION "slice"."__reader_news_review_done_p46zdvulgf"() IS 'the reader of the delta of news of ReviewDone';

COMMENT ON FUNCTION "slice"."__reader_olds_review_ended_ghabg3qvka"() IS 'the reader of the delta of olds of ReviewEnded';

COMMENT ON FUNCTION "slice"."__reader_news_review_failed_7yyyyl5zn7"() IS 'the reader of the delta of news of ReviewFailed';

COMMENT ON FUNCTION "slice"."__reader_news_review_gather_input_u5td2p2bbb"() IS 'the reader of the delta of news of ReviewGatherInput';

COMMENT ON FUNCTION "slice"."__reader_olds_review_held_xy53svgi5w"() IS 'the reader of the delta of olds of ReviewHeld';

COMMENT ON FUNCTION "slice"."__reader_news_review_hold_6wykfhuqkv"() IS 'the reader of the delta of news of ReviewHold';

COMMENT ON FUNCTION "slice"."__reader_news_review_questions_input_ds6zex53wd"() IS 'the reader of the delta of news of ReviewQuestionsInput';

COMMENT ON FUNCTION "slice"."__reader_olds_review_requested_with_nykgw6gh5l"() IS 'the reader of the delta of olds of ReviewRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_review_result_kqmhnbcsva"() IS 'the reader of the delta of olds of ReviewResult';

COMMENT ON FUNCTION "slice"."__reader_news_review_root_naq7lhzan7"() IS 'the reader of the delta of news of ReviewRoot';

COMMENT ON FUNCTION "slice"."__reader_news_review_save_input_wwipjutxrs"() IS 'the reader of the delta of news of ReviewSaveInput';

COMMENT ON FUNCTION "slice"."__reader_olds_review_step_e6ycahnwqn"() IS 'the reader of the delta of olds of ReviewStep';

COMMENT ON FUNCTION "slice"."__reader_olds_review_within_pymnrslua3"() IS 'the reader of the delta of olds of ReviewWithin';

COMMENT ON FUNCTION "slice"."__reader_news_sync_build_input_eom6nwox2q"() IS 'the reader of the delta of news of SyncBuildInput';

COMMENT ON FUNCTION "slice"."__reader_news_sync_copy_input_vsrhmkgpx4"() IS 'the reader of the delta of news of SyncCopyInput';

COMMENT ON FUNCTION "slice"."__reader_news_sync_done_ug7pesikef"() IS 'the reader of the delta of news of SyncDone';

COMMENT ON FUNCTION "slice"."__reader_news_sync_failed_2ecpcuza2e"() IS 'the reader of the delta of news of SyncFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_requested_with_nxo6lpi6h7"() IS 'the reader of the delta of olds of SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_result_zh6zs3n256"() IS 'the reader of the delta of olds of SyncResult';

COMMENT ON FUNCTION "slice"."__reader_news_sync_root_5bdr4w2js5"() IS 'the reader of the delta of news of SyncRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_step_tfxcx6pquc"() IS 'the reader of the delta of olds of SyncStep';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_deliver_input_3mejicjxtj"() IS 'the reader of the delta of news of WritebackDeliverInput';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_done_np4xezy62h"() IS 'the reader of the delta of news of WritebackDone';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_failed_66tuuxudwu"() IS 'the reader of the delta of news of WritebackFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_requested_with_orryfb25pj"() IS 'the reader of the delta of olds of WritebackRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_result_pcbgqjqnz3"() IS 'the reader of the delta of olds of WritebackResult';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_root_ey46dixxka"() IS 'the reader of the delta of news of WritebackRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_step_5z6akmweto"() IS 'the reader of the delta of olds of WritebackStep';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_34tzcxl26w"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write adds to FanClaim';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_iz46wxrc4n"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write removes from FanEnded';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_xv3pzwjw6y"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write removes from FanHeld';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_fnm53ono2n"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write adds to FanHold';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_wnl6qdupjr"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write adds to ReviewClaim';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_xjodxgzn5d"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write removes from ReviewEnded';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_gitg7o7vto"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write removes from ReviewHeld';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_hog4qzzuc6"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write adds to ReviewHold';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_in_assign_vmdw2qq2sr"() IS 'the rule judge''s block of rule AssignAssignmentInput(root, scope) where Logic.eq(mode, "Nearest") in AssignAssignmentInputModeNearest(root, scope) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_in_assign_v5fqhrfufb"() IS 'the rule judge''s block of rule AssignAssignmentInput(root, scope) where Logic.eq(mode, "Within") in AssignAssignmentInputModeWithin(root, scope) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_in_wjni6t7vt7"() IS 'the rule judge''s block of rule AssignAssignmentInputModeNearest(root, scope) in AssignAssignmentInput(root, scope) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_within_in_3lxxlekl62"() IS 'the rule judge''s block of rule AssignAssignmentInputModeWithin(root, scope) in AssignAssignmentInput(root, scope) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_in_assign_step_fpdto3tkdl"() IS 'the rule judge''s block of rule AssignDecideInput(root, step) in AssignStep(root, step) where Logic.eq(kind, "Decide") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_in_assign_decide_sznlnpzhan"() IS 'the rule judge''s block of rule AssignDecideInput(root, step) where Logic.eq(mode, "Nearest") in AssignDecideInputModeNearest(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_in_assign_decide_kkziysyrxm"() IS 'the rule judge''s block of rule AssignDecideInput(root, step) where Logic.eq(mode, "Within") in AssignDecideInputModeWithin(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_in_assign_zwhgkvqdob"() IS 'the rule judge''s block of rule AssignDecideInputModeNearest(root, step) in AssignDecideInput(root, step) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_within_in_assign_6cwpn7jlpl"() IS 'the rule judge''s block of rule AssignDecideInputModeWithin(root, step) in AssignDecideInput(root, step) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_in_assign_decide_tex7oc524r"() IS 'the rule judge''s block of rule AssignDecideOutput(root, step) where Logic.eq(stage, "Rest") in AssignDecideOutputStageRest(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_in_assign_decide_i64e54b2wr"() IS 'the rule judge''s block of rule AssignDecideOutput(root, step) where Logic.eq(stage, "Serve") in AssignDecideOutputStageServe(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_in_assign_74uxccr2b7"() IS 'the rule judge''s block of rule AssignDecideOutputStageRest(root, step) in AssignDecideOutput(root, step) where Logic.eq(stage, "Rest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_serve_in_assign_kvsems7ik6"() IS 'the rule judge''s block of rule AssignDecideOutputStageServe(root, step) in AssignDecideOutput(root, step) where Logic.eq(stage, "Serve") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_done_in_assign_result_4mu6t5mltj"() IS 'the rule judge''s block of rule AssignDone(root, step) in AssignResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_in_assign_step_urhl7lo7jo"() IS 'the rule judge''s block of rule AssignEmbedInput(root, step) in AssignStep(root, step) where Logic.eq(kind, "Embed") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_in_assign_embed_c7d7lksec4"() IS 'the rule judge''s block of rule AssignEmbedInput(root, step) where Logic.eq(mode, "Nearest") in AssignEmbedInputModeNearest(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_in_assign_embed_w734q3n6sw"() IS 'the rule judge''s block of rule AssignEmbedInput(root, step) where Logic.eq(mode, "Within") in AssignEmbedInputModeWithin(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_nearest_in_assign_s4h6hbnhfw"() IS 'the rule judge''s block of rule AssignEmbedInputModeNearest(root, step) in AssignEmbedInput(root, step) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_within_in_assign_qc5qdyar66"() IS 'the rule judge''s block of rule AssignEmbedInputModeWithin(root, step) in AssignEmbedInput(root, step) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_failed_in_assign_result_rrfurnngc2"() IS 'the rule judge''s block of rule AssignFailed(root, step) in AssignResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_root_kind_in_assign_requested_with_vraaribrmt"() IS 'the rule judge''s block of rule AssignRoot(root) where Logic.eq(kind, "Assignment") in AssignRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_done_in_chain_result_675t5ij4i2"() IS 'the rule judge''s block of rule ChainDone(root, step) in ChainResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_failed_in_chain_result_dicz7rfd3b"() IS 'the rule judge''s block of rule ChainFailed(root, step) in ChainResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_page_input_in_chain_step_oothsyr55y"() IS 'the rule judge''s block of rule ChainPageInput(root, step) in ChainStep(root, step) where Logic.eq(kind, "Page") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_root_kind_in_chain_requested_with_wxwr2l5iz6"() IS 'the rule judge''s block of rule ChainRoot(root) where Logic.eq(kind, "ChainRun") in ChainRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_root_kind_in_chain_requested_with_hct6qx7fd6"() IS 'the rule judge''s block of rule ChainRoot(root) where Logic.eq(kind, "Ordered") in ChainRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_chime_input_in_clock_step_cfgh2w5ma3"() IS 'the rule judge''s block of rule ClockChimeInput(root, step) in ClockStep(root, step) where Logic.eq(kind, "Chime") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_close_input_in_clock_step_yonchgzy4f"() IS 'the rule judge''s block of rule ClockCloseInput(root, step) in ClockStep(root, step) where Logic.eq(kind, "Close") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_done_in_clock_result_xjrqrd2b2m"() IS 'the rule judge''s block of rule ClockDone(root, step) in ClockResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_failed_in_clock_result_rclmfokwzo"() IS 'the rule judge''s block of rule ClockFailed(root, step) in ClockResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_key_in_clock_root_ugqdrom4pg"() IS 'the rule judge''s block of rule ClockHourlyKey(root) in ClockRoot(root) where Logic.eq(kind, "Hourly") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_root_kind_in_clock_hourly_key_4z3psfoopw"() IS 'the rule judge''s block of rule ClockRoot(root) where Logic.eq(kind, "Hourly") in ClockHourlyKey(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_root_kind_in_clock_requested_with_6vjvudhhdz"() IS 'the rule judge''s block of rule ClockRoot(root) where Logic.eq(kind, "Sitting") in ClockRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_batch_input_in_fan_within_4gfuvufclc"() IS 'the rule judge''s block of rule FanBatchInput(root, scope) in FanWithin(root, scope) where Logic.eq(kind, "Batch") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_done_in_fan_result_igvbhkk2tv"() IS 'the rule judge''s block of rule FanDone(root, step) in FanResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_dust_input_in_fan_step_civipqaias"() IS 'the rule judge''s block of rule FanDustInput(root, step) in FanStep(root, step) where Logic.eq(kind, "Dust") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_failed_in_fan_result_r57me4fbko"() IS 'the rule judge''s block of rule FanFailed(root, step) in FanResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_mop_input_in_fan_step_y343huwkfv"() IS 'the rule judge''s block of rule FanMopInput(root, step) in FanStep(root, step) where Logic.eq(kind, "Mop") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_requested_with_ztdt4x45qy"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "FanRun") in FanRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_requested_with_wqykzajga4"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "Sweep") in FanRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_wanted_key_d3d7gk6i2u"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "Wanted") in FanWantedKey(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_square_input_in_fan_step_nxz74orxwd"() IS 'the rule judge''s block of rule FanSquareInput(root, step) in FanStep(root, step) where Logic.eq(kind, "Square") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_wanted_key_in_fan_root_ew7ps4i7n2"() IS 'the rule judge''s block of rule FanWantedKey(root) in FanRoot(root) where Logic.eq(kind, "Wanted") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_brittle_input_in_retry_step_virkohj2lo"() IS 'the rule judge''s block of rule RetryBrittleInput(root, step) in RetryStep(root, step) where Logic.eq(kind, "Brittle") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_done_in_retry_result_q344fhh2mm"() IS 'the rule judge''s block of rule RetryDone(root, step) in RetryResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_failed_in_retry_result_xaecmonhtp"() IS 'the rule judge''s block of rule RetryFailed(root, step) in RetryResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_patient_input_in_retry_step_yypoc3hj5r"() IS 'the rule judge''s block of rule RetryPatientInput(root, step) in RetryStep(root, step) where Logic.eq(kind, "Patient") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_polite_input_in_retry_step_4vl6qwfgzn"() IS 'the rule judge''s block of rule RetryPoliteInput(root, step) in RetryStep(root, step) where Logic.eq(kind, "Polite") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_uxbsfun37o"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Ladders") in RetryRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_fdec6qmbfw"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Throttled") in RetryRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_fmhoylviyc"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Unhurried") in RetryRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_steadfast_input_in_retry_step_xkylzkj4zd"() IS 'the rule judge''s block of rule RetrySteadfastInput(root, step) in RetryStep(root, step) where Logic.eq(kind, "Steadfast") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_analyze_input_in_review_step_rbx456ded3"() IS 'the rule judge''s block of rule ReviewAnalyzeInput(root, step) in ReviewStep(root, step) where Logic.eq(kind, "Analyze") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_done_in_review_result_ibz3jfbnei"() IS 'the rule judge''s block of rule ReviewDone(root, step) in ReviewResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_failed_in_review_result_whygze7zq6"() IS 'the rule judge''s block of rule ReviewFailed(root, step) in ReviewResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_gather_input_in_review_step_6dhp33xejx"() IS 'the rule judge''s block of rule ReviewGatherInput(root, step) in ReviewStep(root, step) where Logic.eq(kind, "Gather") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_questions_input_in_review_within_oq2i4d4qlh"() IS 'the rule judge''s block of rule ReviewQuestionsInput(root, scope) in ReviewWithin(root, scope) where Logic.eq(kind, "Questions") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_root_kind_in_review_requested_with_g2urmlweog"() IS 'the rule judge''s block of rule ReviewRoot(root) where Logic.eq(kind, "ReviewRun") in ReviewRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_review_save_input_in_review_step_qbidwsfxvi"() IS 'the rule judge''s block of rule ReviewSaveInput(root, step) in ReviewStep(root, step) where Logic.eq(kind, "Save") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_build_input_in_sync_step_zbeiy2eub4"() IS 'the rule judge''s block of rule SyncBuildInput(root, step) in SyncStep(root, step) where Logic.eq(kind, "Build") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_copy_input_in_sync_step_274i44k3xg"() IS 'the rule judge''s block of rule SyncCopyInput(root, step) in SyncStep(root, step) where Logic.eq(kind, "Copy") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_done_in_sync_result_yjfymgp3lh"() IS 'the rule judge''s block of rule SyncDone(root, step) in SyncResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_failed_in_sync_result_zp7mocg4uv"() IS 'the rule judge''s block of rule SyncFailed(root, step) in SyncResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_root_kind_in_sync_requested_with_r5trt2jyga"() IS 'the rule judge''s block of rule SyncRoot(root) where Logic.eq(kind, "Gold") in SyncRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_root_kind_in_sync_requested_with_gxdkhw7yb5"() IS 'the rule judge''s block of rule SyncRoot(root) where Logic.eq(kind, "SyncRun") in SyncRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_deliver_input_in_writeback_step_4x5vzcjzbi"() IS 'the rule judge''s block of rule WritebackDeliverInput(root, step) in WritebackStep(root, step) where Logic.eq(kind, "Deliver") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_done_in_writeback_result_d3jnna5bbp"() IS 'the rule judge''s block of rule WritebackDone(root, step) in WritebackResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_failed_in_writeback_result_ingi2erzkx"() IS 'the rule judge''s block of rule WritebackFailed(root, step) in WritebackResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_root_kind_in_writeback_requested_5hsqrxrofp"() IS 'the rule judge''s block of rule WritebackRoot(root) where Logic.eq(kind, "Writeback") in WritebackRequestedWith(root) over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_tml3jzipqt"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write adds to FanClaim';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_rsvzhfp6ug"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write removes from FanEnded';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_5pedmcfadq"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write removes from FanHeld';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_nru5iz6quv"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write adds to FanHold';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_546bvon4yy"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write adds to ReviewClaim';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_ogqous6mhr"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write removes from ReviewEnded';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_btbkuztx56"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write removes from ReviewHeld';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_ahhaxk5zwx"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write adds to ReviewHold';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_y4hmyg364y"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignAssignmentInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_jiz464vxuo"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignAssignmentInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_ryk4kznrmg"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_hc5ilv4sea"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_uprvea4no6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideOutput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_irdavmdqjh"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDecideOutputStageRest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_done_hjsux6cb6r"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_nearest_3xhwbfkrlv"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignEmbedInputModeNearest and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_root_bkwk5wvgwu"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_done_7blz2jjczl"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_page_input_22qgggq3id"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainPageInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_root_xtgbryzuoy"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_chime_input_6u4nkh4lnc"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockChimeInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_done_nw5m6y7otq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_key_3xs43ytzqw"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockHourlyKey and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_root_44bxwhypvr"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_batch_input_zonhzu34ui"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanBatchInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_claim_s3j4rvtcvs"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_done_2nmscmmvlu"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_dust_input_6snexwuzoz"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanDustInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_ended_6lkn5mmmar"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanEnded and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_held_dhl6funig6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanHeld and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_hold_xpwnh3rc3e"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanHold and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_root_exhfjj3pnq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_wanted_key_wgar5ucie4"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanWantedKey and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_brittle_input_ltwi3gczlm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryBrittleInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_done_us2mduacrm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_root_s7dwjbl3cr"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_analyze_input_cfqtz7uc7g"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewAnalyzeInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_claim_az6lkkq33b"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_done_xzuqwzrsjm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_ended_z2tfnoj2wi"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewEnded and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_held_wah4syhkpo"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewHeld and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_hold_mggi2ob7td"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewHold and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_questions_input_bu3kdyq5g3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewQuestionsInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_root_ooctkfl5qa"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_build_input_eaxvc2njxf"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncBuildInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_done_psjgmjlxp6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_root_qtvcdrvdqh"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_deliver_input_fun3xqfq7u"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackDeliverInput and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_done_c7valompmz"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_root_5xjtyn2i2j"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackRoot and the relations its rules join it to';

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

COMMENT ON FUNCTION "slice"."__capture_assign_requested_with_h2atfyvv4s"() IS 'rule capture of AssignRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_assign_result_3zix6jjqic"() IS 'rule capture of AssignResult';

COMMENT ON FUNCTION "slice"."__capture_assign_root_lbkcscnsqf"() IS 'rule capture of AssignRoot';

COMMENT ON FUNCTION "slice"."__capture_assign_step_bxkkty5l67"() IS 'rule capture of AssignStep';

COMMENT ON FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"() IS 'rule capture of ChainDone';

COMMENT ON FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"() IS 'rule capture of ChainFailed';

COMMENT ON FUNCTION "slice"."__capture_chain_page_input_ct4d2gjnsb"() IS 'rule capture of ChainPageInput';

COMMENT ON FUNCTION "slice"."__capture_chain_requested_with_haahw5wmk6"() IS 'rule capture of ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"() IS 'rule capture of ChainResult';

COMMENT ON FUNCTION "slice"."__capture_chain_root_3cootamwgf"() IS 'rule capture of ChainRoot';

COMMENT ON FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"() IS 'rule capture of ChainStep';

COMMENT ON FUNCTION "slice"."__capture_clock_chime_input_lqffb4ba6u"() IS 'rule capture of ClockChimeInput';

COMMENT ON FUNCTION "slice"."__capture_clock_close_input_yjeq7jdopp"() IS 'rule capture of ClockCloseInput';

COMMENT ON FUNCTION "slice"."__capture_clock_done_dfh6reh5mi"() IS 'rule capture of ClockDone';

COMMENT ON FUNCTION "slice"."__capture_clock_failed_6qny3r6u6y"() IS 'rule capture of ClockFailed';

COMMENT ON FUNCTION "slice"."__capture_clock_hourly_key_ct3wxddm4v"() IS 'rule capture of ClockHourlyKey';

COMMENT ON FUNCTION "slice"."__capture_clock_requested_with_wh65uqc7ii"() IS 'rule capture of ClockRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_clock_result_jy4vcxcejz"() IS 'rule capture of ClockResult';

COMMENT ON FUNCTION "slice"."__capture_clock_root_tuedr7b4mb"() IS 'rule capture of ClockRoot';

COMMENT ON FUNCTION "slice"."__capture_clock_step_u5p64rffid"() IS 'rule capture of ClockStep';

COMMENT ON FUNCTION "slice"."__capture_fan_batch_input_6csjqygwks"() IS 'rule capture of FanBatchInput';

COMMENT ON FUNCTION "slice"."__capture_fan_claim_ctcrhycatd"() IS 'rule capture of FanClaim';

COMMENT ON FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"() IS 'rule capture of FanDone';

COMMENT ON FUNCTION "slice"."__capture_fan_dust_input_nul3zoihk6"() IS 'rule capture of FanDustInput';

COMMENT ON FUNCTION "slice"."__capture_fan_ended_gzzovkkada"() IS 'rule capture of FanEnded';

COMMENT ON FUNCTION "slice"."__capture_fan_failed_ecscfsee25"() IS 'rule capture of FanFailed';

COMMENT ON FUNCTION "slice"."__capture_fan_held_ekrigwpm7j"() IS 'rule capture of FanHeld';

COMMENT ON FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"() IS 'rule capture of FanHold';

COMMENT ON FUNCTION "slice"."__capture_fan_mop_input_6phw2xwhnz"() IS 'rule capture of FanMopInput';

COMMENT ON FUNCTION "slice"."__capture_fan_requested_with_owmaj7huz2"() IS 'rule capture of FanRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_fan_result_tevufz2c53"() IS 'rule capture of FanResult';

COMMENT ON FUNCTION "slice"."__capture_fan_root_cjk7n6ydwg"() IS 'rule capture of FanRoot';

COMMENT ON FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"() IS 'rule capture of FanSquareInput';

COMMENT ON FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"() IS 'rule capture of FanStep';

COMMENT ON FUNCTION "slice"."__capture_fan_wanted_key_uz74r5skox"() IS 'rule capture of FanWantedKey';

COMMENT ON FUNCTION "slice"."__capture_fan_within_pwsrdikydc"() IS 'rule capture of FanWithin';

COMMENT ON FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"() IS 'rule capture of RetryBrittleInput';

COMMENT ON FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"() IS 'rule capture of RetryDone';

COMMENT ON FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"() IS 'rule capture of RetryFailed';

COMMENT ON FUNCTION "slice"."__capture_retry_patient_input_cfxejzkw67"() IS 'rule capture of RetryPatientInput';

COMMENT ON FUNCTION "slice"."__capture_retry_polite_input_4s6i2erlwp"() IS 'rule capture of RetryPoliteInput';

COMMENT ON FUNCTION "slice"."__capture_retry_requested_with_jgpz6kopmj"() IS 'rule capture of RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_retry_result_oof7kiqgid"() IS 'rule capture of RetryResult';

COMMENT ON FUNCTION "slice"."__capture_retry_root_nujht4q2jp"() IS 'rule capture of RetryRoot';

COMMENT ON FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"() IS 'rule capture of RetrySteadfastInput';

COMMENT ON FUNCTION "slice"."__capture_retry_step_gox3p6ldla"() IS 'rule capture of RetryStep';

COMMENT ON FUNCTION "slice"."__capture_review_analyze_input_fkzkzvqpo6"() IS 'rule capture of ReviewAnalyzeInput';

COMMENT ON FUNCTION "slice"."__capture_review_claim_qyslgqsqs7"() IS 'rule capture of ReviewClaim';

COMMENT ON FUNCTION "slice"."__capture_review_done_gxpax2oqid"() IS 'rule capture of ReviewDone';

COMMENT ON FUNCTION "slice"."__capture_review_ended_3o7fwr7f2y"() IS 'rule capture of ReviewEnded';

COMMENT ON FUNCTION "slice"."__capture_review_failed_3nd4cow637"() IS 'rule capture of ReviewFailed';

COMMENT ON FUNCTION "slice"."__capture_review_gather_input_kgvjnvjsxw"() IS 'rule capture of ReviewGatherInput';

COMMENT ON FUNCTION "slice"."__capture_review_held_p4ye73l7sh"() IS 'rule capture of ReviewHeld';

COMMENT ON FUNCTION "slice"."__capture_review_hold_3d64vgpezl"() IS 'rule capture of ReviewHold';

COMMENT ON FUNCTION "slice"."__capture_review_questions_input_yqxbkx73iq"() IS 'rule capture of ReviewQuestionsInput';

COMMENT ON FUNCTION "slice"."__capture_review_requested_with_lzc5wr45yq"() IS 'rule capture of ReviewRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_review_result_m25jokn327"() IS 'rule capture of ReviewResult';

COMMENT ON FUNCTION "slice"."__capture_review_root_qgu5iwjyle"() IS 'rule capture of ReviewRoot';

COMMENT ON FUNCTION "slice"."__capture_review_save_input_pdrqqmy66f"() IS 'rule capture of ReviewSaveInput';

COMMENT ON FUNCTION "slice"."__capture_review_step_3y2i7xqqpk"() IS 'rule capture of ReviewStep';

COMMENT ON FUNCTION "slice"."__capture_review_within_aqblir65lf"() IS 'rule capture of ReviewWithin';

COMMENT ON FUNCTION "slice"."__capture_sync_build_input_uauzzgsmyw"() IS 'rule capture of SyncBuildInput';

COMMENT ON FUNCTION "slice"."__capture_sync_copy_input_sm343um5xv"() IS 'rule capture of SyncCopyInput';

COMMENT ON FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"() IS 'rule capture of SyncDone';

COMMENT ON FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"() IS 'rule capture of SyncFailed';

COMMENT ON FUNCTION "slice"."__capture_sync_requested_with_xfv4yl7s46"() IS 'rule capture of SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_sync_result_led6m2o22r"() IS 'rule capture of SyncResult';

COMMENT ON FUNCTION "slice"."__capture_sync_root_s5cwtqjc6s"() IS 'rule capture of SyncRoot';

COMMENT ON FUNCTION "slice"."__capture_sync_step_35gtwztkwz"() IS 'rule capture of SyncStep';

COMMENT ON FUNCTION "slice"."__capture_writeback_deliver_input_zk6wjx47wq"() IS 'rule capture of WritebackDeliverInput';

COMMENT ON FUNCTION "slice"."__capture_writeback_done_qfh7utr7q5"() IS 'rule capture of WritebackDone';

COMMENT ON FUNCTION "slice"."__capture_writeback_failed_xewjzd2yye"() IS 'rule capture of WritebackFailed';

COMMENT ON FUNCTION "slice"."__capture_writeback_requested_with_2rygwrqbml"() IS 'rule capture of WritebackRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_writeback_result_cd63iav5l7"() IS 'rule capture of WritebackResult';

COMMENT ON FUNCTION "slice"."__capture_writeback_root_4gkeh6e4ge"() IS 'rule capture of WritebackRoot';

COMMENT ON FUNCTION "slice"."__capture_writeback_step_dklkh3hpav"() IS 'rule capture of WritebackStep';

COMMENT ON FUNCTION "slice"."__stand_assign_assignment_input_k2sfkqif6i"() IS 'the stand-up of the rule judge''s session tables a write of AssignAssignmentInput needs';

COMMENT ON FUNCTION "slice"."__stand_assign_assignment_input_mode_nearest_lxb77ivg4j"() IS 'the stand-up of the rule judge''s session tables a write of AssignAssignmentInputModeNearest needs';

COMMENT ON FUNCTION "slice"."__stand_assign_assignment_input_mode_within_37wojsnl3c"() IS 'the stand-up of the rule judge''s session tables a write of AssignAssignmentInputModeWithin needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_input_vrvu36pkwz"() IS 'the stand-up of the rule judge''s session tables a write of AssignDecideInput needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_input_mode_nearest_7kdvsnzqg6"() IS 'the stand-up of the rule judge''s session tables a write of AssignDecideInputModeNearest needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_input_mode_within_ldx2lhq5ey"() IS 'the stand-up of the rule judge''s session tables a write of AssignDecideInputModeWithin needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_output_ir3hc6poyj"() IS 'the stand-up of the rule judge''s session tables a write of AssignDecideOutput needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_output_stage_rest_lduodwwdlk"() IS 'the stand-up of the rule judge''s session tables a write of AssignDecideOutputStageRest needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_output_stage_serve_z6kennoghm"() IS 'the stand-up of the rule judge''s session tables a write of AssignDecideOutputStageServe needs';

COMMENT ON FUNCTION "slice"."__stand_assign_done_zpmhn6mrnc"() IS 'the stand-up of the rule judge''s session tables a write of AssignDone needs';

COMMENT ON FUNCTION "slice"."__stand_assign_embed_input_zvwywuktne"() IS 'the stand-up of the rule judge''s session tables a write of AssignEmbedInput needs';

COMMENT ON FUNCTION "slice"."__stand_assign_embed_input_mode_nearest_qag7rwsicw"() IS 'the stand-up of the rule judge''s session tables a write of AssignEmbedInputModeNearest needs';

COMMENT ON FUNCTION "slice"."__stand_assign_embed_input_mode_within_mw2mn45ii2"() IS 'the stand-up of the rule judge''s session tables a write of AssignEmbedInputModeWithin needs';

COMMENT ON FUNCTION "slice"."__stand_assign_failed_pmuglprcww"() IS 'the stand-up of the rule judge''s session tables a write of AssignFailed needs';

COMMENT ON FUNCTION "slice"."__stand_assign_requested_with_3xavh4tz7a"() IS 'the stand-up of the rule judge''s session tables a write of AssignRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_assign_result_3dwqbs6psk"() IS 'the stand-up of the rule judge''s session tables a write of AssignResult needs';

COMMENT ON FUNCTION "slice"."__stand_assign_root_ecnnffi3e3"() IS 'the stand-up of the rule judge''s session tables a write of AssignRoot needs';

COMMENT ON FUNCTION "slice"."__stand_assign_step_qwjijdgx6j"() IS 'the stand-up of the rule judge''s session tables a write of AssignStep needs';

COMMENT ON FUNCTION "slice"."__stand_chain_done_fhcl4vvjiw"() IS 'the stand-up of the rule judge''s session tables a write of ChainDone needs';

COMMENT ON FUNCTION "slice"."__stand_chain_failed_nocd74knki"() IS 'the stand-up of the rule judge''s session tables a write of ChainFailed needs';

COMMENT ON FUNCTION "slice"."__stand_chain_page_input_akkjfmkwih"() IS 'the stand-up of the rule judge''s session tables a write of ChainPageInput needs';

COMMENT ON FUNCTION "slice"."__stand_chain_requested_with_fq22h3tdwv"() IS 'the stand-up of the rule judge''s session tables a write of ChainRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_chain_result_2qc7m4brl3"() IS 'the stand-up of the rule judge''s session tables a write of ChainResult needs';

COMMENT ON FUNCTION "slice"."__stand_chain_root_mmsdkigltc"() IS 'the stand-up of the rule judge''s session tables a write of ChainRoot needs';

COMMENT ON FUNCTION "slice"."__stand_chain_step_3hsz3lyxy2"() IS 'the stand-up of the rule judge''s session tables a write of ChainStep needs';

COMMENT ON FUNCTION "slice"."__stand_clock_chime_input_w4tkdsqfah"() IS 'the stand-up of the rule judge''s session tables a write of ClockChimeInput needs';

COMMENT ON FUNCTION "slice"."__stand_clock_close_input_nbsmlpykk5"() IS 'the stand-up of the rule judge''s session tables a write of ClockCloseInput needs';

COMMENT ON FUNCTION "slice"."__stand_clock_done_dja4biaxge"() IS 'the stand-up of the rule judge''s session tables a write of ClockDone needs';

COMMENT ON FUNCTION "slice"."__stand_clock_failed_zsyt2n5qx3"() IS 'the stand-up of the rule judge''s session tables a write of ClockFailed needs';

COMMENT ON FUNCTION "slice"."__stand_clock_hourly_key_im7mo3bxkf"() IS 'the stand-up of the rule judge''s session tables a write of ClockHourlyKey needs';

COMMENT ON FUNCTION "slice"."__stand_clock_requested_with_st4ea4apoz"() IS 'the stand-up of the rule judge''s session tables a write of ClockRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_clock_result_dk5lfugcd5"() IS 'the stand-up of the rule judge''s session tables a write of ClockResult needs';

COMMENT ON FUNCTION "slice"."__stand_clock_root_bfxjnnlbbr"() IS 'the stand-up of the rule judge''s session tables a write of ClockRoot needs';

COMMENT ON FUNCTION "slice"."__stand_clock_step_cbbapr6dla"() IS 'the stand-up of the rule judge''s session tables a write of ClockStep needs';

COMMENT ON FUNCTION "slice"."__stand_fan_batch_input_fkd6u4c3i3"() IS 'the stand-up of the rule judge''s session tables a write of FanBatchInput needs';

COMMENT ON FUNCTION "slice"."__stand_fan_claim_chk6cawes6"() IS 'the stand-up of the rule judge''s session tables a write of FanClaim needs';

COMMENT ON FUNCTION "slice"."__stand_fan_done_e4qldz2xtt"() IS 'the stand-up of the rule judge''s session tables a write of FanDone needs';

COMMENT ON FUNCTION "slice"."__stand_fan_dust_input_rigexdymgk"() IS 'the stand-up of the rule judge''s session tables a write of FanDustInput needs';

COMMENT ON FUNCTION "slice"."__stand_fan_ended_l35bnatdrx"() IS 'the stand-up of the rule judge''s session tables a write of FanEnded needs';

COMMENT ON FUNCTION "slice"."__stand_fan_failed_ok5ebljdmh"() IS 'the stand-up of the rule judge''s session tables a write of FanFailed needs';

COMMENT ON FUNCTION "slice"."__stand_fan_held_jx6ijuwgvx"() IS 'the stand-up of the rule judge''s session tables a write of FanHeld needs';

COMMENT ON FUNCTION "slice"."__stand_fan_hold_lndmiy4fqw"() IS 'the stand-up of the rule judge''s session tables a write of FanHold needs';

COMMENT ON FUNCTION "slice"."__stand_fan_mop_input_i5g5pk2lsj"() IS 'the stand-up of the rule judge''s session tables a write of FanMopInput needs';

COMMENT ON FUNCTION "slice"."__stand_fan_requested_with_cfdhaf2vfh"() IS 'the stand-up of the rule judge''s session tables a write of FanRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_fan_result_4bsplumotk"() IS 'the stand-up of the rule judge''s session tables a write of FanResult needs';

COMMENT ON FUNCTION "slice"."__stand_fan_root_evnc53opne"() IS 'the stand-up of the rule judge''s session tables a write of FanRoot needs';

COMMENT ON FUNCTION "slice"."__stand_fan_square_input_ag5nlkdpuv"() IS 'the stand-up of the rule judge''s session tables a write of FanSquareInput needs';

COMMENT ON FUNCTION "slice"."__stand_fan_step_cwlbx3l7hf"() IS 'the stand-up of the rule judge''s session tables a write of FanStep needs';

COMMENT ON FUNCTION "slice"."__stand_fan_wanted_key_n6zslzhip6"() IS 'the stand-up of the rule judge''s session tables a write of FanWantedKey needs';

COMMENT ON FUNCTION "slice"."__stand_fan_within_oo5pwmjabl"() IS 'the stand-up of the rule judge''s session tables a write of FanWithin needs';

COMMENT ON FUNCTION "slice"."__stand_retry_brittle_input_3pbycrawjg"() IS 'the stand-up of the rule judge''s session tables a write of RetryBrittleInput needs';

COMMENT ON FUNCTION "slice"."__stand_retry_done_ll42rjotis"() IS 'the stand-up of the rule judge''s session tables a write of RetryDone needs';

COMMENT ON FUNCTION "slice"."__stand_retry_failed_wyonvn6i5o"() IS 'the stand-up of the rule judge''s session tables a write of RetryFailed needs';

COMMENT ON FUNCTION "slice"."__stand_retry_patient_input_jxb7jnsja6"() IS 'the stand-up of the rule judge''s session tables a write of RetryPatientInput needs';

COMMENT ON FUNCTION "slice"."__stand_retry_polite_input_uiwzzm343r"() IS 'the stand-up of the rule judge''s session tables a write of RetryPoliteInput needs';

COMMENT ON FUNCTION "slice"."__stand_retry_requested_with_ilqrjj3m5y"() IS 'the stand-up of the rule judge''s session tables a write of RetryRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_retry_result_mpvrsnerne"() IS 'the stand-up of the rule judge''s session tables a write of RetryResult needs';

COMMENT ON FUNCTION "slice"."__stand_retry_root_rvzhlkfxal"() IS 'the stand-up of the rule judge''s session tables a write of RetryRoot needs';

COMMENT ON FUNCTION "slice"."__stand_retry_steadfast_input_chyldmp7fv"() IS 'the stand-up of the rule judge''s session tables a write of RetrySteadfastInput needs';

COMMENT ON FUNCTION "slice"."__stand_retry_step_7csxwmutn2"() IS 'the stand-up of the rule judge''s session tables a write of RetryStep needs';

COMMENT ON FUNCTION "slice"."__stand_review_analyze_input_pspszgkzox"() IS 'the stand-up of the rule judge''s session tables a write of ReviewAnalyzeInput needs';

COMMENT ON FUNCTION "slice"."__stand_review_claim_hkt7qw7mpi"() IS 'the stand-up of the rule judge''s session tables a write of ReviewClaim needs';

COMMENT ON FUNCTION "slice"."__stand_review_done_ujerlpx2vl"() IS 'the stand-up of the rule judge''s session tables a write of ReviewDone needs';

COMMENT ON FUNCTION "slice"."__stand_review_ended_h3z5bew2vq"() IS 'the stand-up of the rule judge''s session tables a write of ReviewEnded needs';

COMMENT ON FUNCTION "slice"."__stand_review_failed_a5vyjorx3e"() IS 'the stand-up of the rule judge''s session tables a write of ReviewFailed needs';

COMMENT ON FUNCTION "slice"."__stand_review_gather_input_jx633zhg4g"() IS 'the stand-up of the rule judge''s session tables a write of ReviewGatherInput needs';

COMMENT ON FUNCTION "slice"."__stand_review_held_kz6nzl3mw3"() IS 'the stand-up of the rule judge''s session tables a write of ReviewHeld needs';

COMMENT ON FUNCTION "slice"."__stand_review_hold_nhd6ml2ptp"() IS 'the stand-up of the rule judge''s session tables a write of ReviewHold needs';

COMMENT ON FUNCTION "slice"."__stand_review_questions_input_c55nnxszay"() IS 'the stand-up of the rule judge''s session tables a write of ReviewQuestionsInput needs';

COMMENT ON FUNCTION "slice"."__stand_review_requested_with_o2plzxclt7"() IS 'the stand-up of the rule judge''s session tables a write of ReviewRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_review_result_7berxkzbzb"() IS 'the stand-up of the rule judge''s session tables a write of ReviewResult needs';

COMMENT ON FUNCTION "slice"."__stand_review_root_ejfkrp7dtz"() IS 'the stand-up of the rule judge''s session tables a write of ReviewRoot needs';

COMMENT ON FUNCTION "slice"."__stand_review_save_input_nwulronicu"() IS 'the stand-up of the rule judge''s session tables a write of ReviewSaveInput needs';

COMMENT ON FUNCTION "slice"."__stand_review_step_aidfiao2mn"() IS 'the stand-up of the rule judge''s session tables a write of ReviewStep needs';

COMMENT ON FUNCTION "slice"."__stand_review_within_bqv44gzoli"() IS 'the stand-up of the rule judge''s session tables a write of ReviewWithin needs';

COMMENT ON FUNCTION "slice"."__stand_sync_build_input_le3amndvci"() IS 'the stand-up of the rule judge''s session tables a write of SyncBuildInput needs';

COMMENT ON FUNCTION "slice"."__stand_sync_copy_input_wr7g5cohy6"() IS 'the stand-up of the rule judge''s session tables a write of SyncCopyInput needs';

COMMENT ON FUNCTION "slice"."__stand_sync_done_4ihvwniwqp"() IS 'the stand-up of the rule judge''s session tables a write of SyncDone needs';

COMMENT ON FUNCTION "slice"."__stand_sync_failed_uzrsh7vxay"() IS 'the stand-up of the rule judge''s session tables a write of SyncFailed needs';

COMMENT ON FUNCTION "slice"."__stand_sync_requested_with_4lul7oihcy"() IS 'the stand-up of the rule judge''s session tables a write of SyncRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_sync_result_fkuahqxxbc"() IS 'the stand-up of the rule judge''s session tables a write of SyncResult needs';

COMMENT ON FUNCTION "slice"."__stand_sync_root_otymwhik42"() IS 'the stand-up of the rule judge''s session tables a write of SyncRoot needs';

COMMENT ON FUNCTION "slice"."__stand_sync_step_mljbwcbsm5"() IS 'the stand-up of the rule judge''s session tables a write of SyncStep needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_deliver_input_qibs4x7ys4"() IS 'the stand-up of the rule judge''s session tables a write of WritebackDeliverInput needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_done_ra7zoinlni"() IS 'the stand-up of the rule judge''s session tables a write of WritebackDone needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_failed_tv4kbeol35"() IS 'the stand-up of the rule judge''s session tables a write of WritebackFailed needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_requested_with_xfqdgwx6jv"() IS 'the stand-up of the rule judge''s session tables a write of WritebackRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_result_owlolckns5"() IS 'the stand-up of the rule judge''s session tables a write of WritebackResult needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_root_m53pgt6gxz"() IS 'the stand-up of the rule judge''s session tables a write of WritebackRoot needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_step_dhhgvpedc7"() IS 'the stand-up of the rule judge''s session tables a write of WritebackStep needs';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_nearest_row_lab3k5wovp"() IS 'immutability guard of AssignDecideReadNearestRow';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_seen_row_fueqjd7hpy"() IS 'immutability guard of AssignDecideReadSeenRow';

COMMENT ON FUNCTION "slice"."__immutable_assign_paused_5n3oauuljz"() IS 'immutability guard of AssignPaused';

COMMENT ON FUNCTION "slice"."__immutable_assign_requested_with_jfazpuokod"() IS 'immutability guard of AssignRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_assign_resumed_wcgii3wia6"() IS 'immutability guard of AssignResumed';

COMMENT ON FUNCTION "slice"."__immutable_assign_root_z5tsxfpw75"() IS 'immutability guard of AssignRoot';

COMMENT ON FUNCTION "slice"."__immutable_assign_served_7za7irllan"() IS 'immutability guard of AssignServed';

COMMENT ON FUNCTION "slice"."__immutable_assigned_tbugyxabsc"() IS 'immutability guard of Assigned';

COMMENT ON FUNCTION "slice"."__immutable_audit_tvhiun4dxz"() IS 'immutability guard of Audit';

COMMENT ON FUNCTION "slice"."__immutable_built_2sr4obr6b3"() IS 'immutability guard of Built';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_earlier_row_fptnzqkviy"() IS 'immutability guard of ChainPageReadEarlierRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_items_qhpl2uhihv"() IS 'immutability guard of ChainPageReadTreeItems';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_row_vrfgoh54h3"() IS 'immutability guard of ChainPageReadTreeRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_weights_row_gkwz27ked3"() IS 'immutability guard of ChainPageReadWeightsRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_tree_first_dx6efgvl7m"() IS 'immutability guard of ChainPageTreeFirst';

COMMENT ON FUNCTION "slice"."__immutable_chain_paused_aoyhzggt5w"() IS 'immutability guard of ChainPaused';

COMMENT ON FUNCTION "slice"."__immutable_chain_requested_with_lphulmotb2"() IS 'immutability guard of ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_chain_resumed_pyb74if2ds"() IS 'immutability guard of ChainResumed';

COMMENT ON FUNCTION "slice"."__immutable_chain_root_kfhmbkwvfv"() IS 'immutability guard of ChainRoot';

COMMENT ON FUNCTION "slice"."__immutable_chain_served_dqa4yeivrn"() IS 'immutability guard of ChainServed';

COMMENT ON FUNCTION "slice"."__immutable_chimed_gtkcd6vluu"() IS 'immutability guard of Chimed';

COMMENT ON FUNCTION "slice"."__immutable_clock_hourly_key_lx5iifwgem"() IS 'immutability guard of ClockHourlyKey';

COMMENT ON FUNCTION "slice"."__immutable_clock_paused_3ykaw355ga"() IS 'immutability guard of ClockPaused';

COMMENT ON FUNCTION "slice"."__immutable_clock_requested_with_qdxfqqbips"() IS 'immutability guard of ClockRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_clock_resumed_yqfyfvv7pj"() IS 'immutability guard of ClockResumed';

COMMENT ON FUNCTION "slice"."__immutable_clock_root_75oloon3nz"() IS 'immutability guard of ClockRoot';

COMMENT ON FUNCTION "slice"."__immutable_clock_served_rxiknybpmu"() IS 'immutability guard of ClockServed';

COMMENT ON FUNCTION "slice"."__immutable_concluded_usqwygcl43"() IS 'immutability guard of Concluded';

COMMENT ON FUNCTION "slice"."__immutable_copied_nroyctccyr"() IS 'immutability guard of Copied';

COMMENT ON FUNCTION "slice"."__immutable_cursor_yzelwkrjiw"() IS 'immutability guard of Cursor';

COMMENT ON FUNCTION "slice"."__immutable_delivered_bv4bssb7wd"() IS 'immutability guard of Delivered';

COMMENT ON FUNCTION "slice"."__immutable_fan_exclusive_wlob4hbpim"() IS 'immutability guard of FanExclusive';

COMMENT ON FUNCTION "slice"."__immutable_fan_paused_ybdsv5d4um"() IS 'immutability guard of FanPaused';

COMMENT ON FUNCTION "slice"."__immutable_fan_released_kx4eveefrz"() IS 'immutability guard of FanReleased';

COMMENT ON FUNCTION "slice"."__immutable_fan_requested_with_jx75cuglpf"() IS 'immutability guard of FanRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_fan_resumed_euttpstg26"() IS 'immutability guard of FanResumed';

COMMENT ON FUNCTION "slice"."__immutable_fan_root_vjstxtlelj"() IS 'immutability guard of FanRoot';

COMMENT ON FUNCTION "slice"."__immutable_fan_served_xsm6rsme66"() IS 'immutability guard of FanServed';

COMMENT ON FUNCTION "slice"."__immutable_fan_wanted_key_ecrwmgz2dt"() IS 'immutability guard of FanWantedKey';

COMMENT ON FUNCTION "slice"."__immutable_heard_fdsu5343fb"() IS 'immutability guard of Heard';

COMMENT ON FUNCTION "slice"."__immutable_item_4ldnoxfrc7"() IS 'immutability guard of Item';

COMMENT ON FUNCTION "slice"."__immutable_order_ben75ltrft"() IS 'immutability guard of Order';

COMMENT ON FUNCTION "slice"."__immutable_retry_paused_ss7djxjrej"() IS 'immutability guard of RetryPaused';

COMMENT ON FUNCTION "slice"."__immutable_retry_requested_with_mw5llz3rby"() IS 'immutability guard of RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_retry_resumed_dlzqou5yma"() IS 'immutability guard of RetryResumed';

COMMENT ON FUNCTION "slice"."__immutable_retry_root_tebbmtjoyc"() IS 'immutability guard of RetryRoot';

COMMENT ON FUNCTION "slice"."__immutable_retry_served_hyzc4o4ezw"() IS 'immutability guard of RetryServed';

COMMENT ON FUNCTION "slice"."__immutable_review_paused_cmayqb3lyz"() IS 'immutability guard of ReviewPaused';

COMMENT ON FUNCTION "slice"."__immutable_review_requested_with_3oturoaqs5"() IS 'immutability guard of ReviewRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_review_resumed_yerv455d7e"() IS 'immutability guard of ReviewResumed';

COMMENT ON FUNCTION "slice"."__immutable_review_root_po3ofptpdd"() IS 'immutability guard of ReviewRoot';

COMMENT ON FUNCTION "slice"."__immutable_review_served_klodk5ysgl"() IS 'immutability guard of ReviewServed';

COMMENT ON FUNCTION "slice"."__immutable_reviewed_al7kpguevt"() IS 'immutability guard of Reviewed';

COMMENT ON FUNCTION "slice"."__immutable_settled_wamxlunuss"() IS 'immutability guard of Settled';

COMMENT ON FUNCTION "slice"."__immutable_summary_eaie3elgpy"() IS 'immutability guard of Summary';

COMMENT ON FUNCTION "slice"."__immutable_sync_exclusive_wp25ozdfpb"() IS 'immutability guard of SyncExclusive';

COMMENT ON FUNCTION "slice"."__immutable_sync_paused_2kerwzow7r"() IS 'immutability guard of SyncPaused';

COMMENT ON FUNCTION "slice"."__immutable_sync_released_vxed37ia4q"() IS 'immutability guard of SyncReleased';

COMMENT ON FUNCTION "slice"."__immutable_sync_requested_with_75aana3qd2"() IS 'immutability guard of SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_sync_resumed_tbwsh2hgo7"() IS 'immutability guard of SyncResumed';

COMMENT ON FUNCTION "slice"."__immutable_sync_root_hayadibiof"() IS 'immutability guard of SyncRoot';

COMMENT ON FUNCTION "slice"."__immutable_sync_served_a7364rtkid"() IS 'immutability guard of SyncServed';

COMMENT ON FUNCTION "slice"."__immutable_tally_6vtadbiqmv"() IS 'immutability guard of Tally';

COMMENT ON FUNCTION "slice"."__immutable_want_t63kc73bus"() IS 'immutability guard of Want';

COMMENT ON FUNCTION "slice"."__immutable_weight_sby3z3ax7g"() IS 'immutability guard of Weight';

COMMENT ON FUNCTION "slice"."__immutable_writeback_paused_wlprgt3byb"() IS 'immutability guard of WritebackPaused';

COMMENT ON FUNCTION "slice"."__immutable_writeback_requested_with_7ilwkltxjy"() IS 'immutability guard of WritebackRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_writeback_resumed_vv3hrewq67"() IS 'immutability guard of WritebackResumed';

COMMENT ON FUNCTION "slice"."__immutable_writeback_root_ysmkev76k2"() IS 'immutability guard of WritebackRoot';

COMMENT ON FUNCTION "slice"."__immutable_writeback_served_eyz5dxxige"() IS 'immutability guard of WritebackServed';

COMMENT ON ROLE :"__live_wzkq6p2yii" IS 'live source of slice';
