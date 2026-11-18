CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice"."assign_admitted" ("scope", "root"), "slice"."assign_assignment_input" ("scope", "root"), "slice"."assign_assignment_input_exclude" ("scope", "ordinal", "root"), "slice"."assign_assignment_input_mode_nearest" ("scope", "root"), "slice"."assign_assignment_input_mode_within" ("scope", "root"), "slice"."assign_claim" ("step", "attempt", "root"), "slice"."assign_decide_input" ("step", "root"), "slice"."assign_decide_input_exclude" ("step", "ordinal", "root"), "slice"."assign_decide_input_mode_nearest" ("step", "root"), "slice"."assign_decide_input_mode_within" ("step", "root"), "slice"."assign_decide_nearest_read" ("step", "ordinal", "root"), "slice"."assign_decide_output" ("step", "root"), "slice"."assign_decide_output_stage_rest" ("step", "root"), "slice"."assign_decide_output_stage_serve" ("step", "root"), "slice"."assign_decide_output_weighed" ("step", "ordinal", "root"), "slice"."assign_decide_seen_read" ("step", "ordinal", "root"), "slice"."assign_due" ("step", "root"), "slice"."assign_fenced" ("step", "attempt", "root"), "slice"."assign_finish" ("scope", "root"), "slice"."assign_held" ("step", "root"), "slice"."assign_paused" ("target", "turn"), "slice"."assign_result" ("step", "root"), "slice"."assign_resumed" ("target", "turn"), "slice"."assign_retry" ("step", "attempt", "root"), "slice"."assign_root" ("scope"), "slice"."assign_scope" ("scope", "root"), "slice"."assign_skipped" ("scope", "root"), "slice"."assign_step", "slice"."assign_within", "slice"."assigned" ("learner"), "slice"."audit" ("step"), "slice"."built" ("build"), "slice"."chain_admitted" ("scope", "root"), "slice"."chain_chain_run_input" ("scope", "root"), "slice"."chain_claim" ("step", "attempt", "root"), "slice"."chain_due" ("step", "root"), "slice"."chain_fenced" ("step", "attempt", "root"), "slice"."chain_finish" ("scope", "root"), "slice"."chain_held" ("step", "root"), "slice"."chain_next" ("from", "ordinal", "root"), "slice"."chain_ordered_input" ("scope", "root"), "slice"."chain_page_input" ("step", "root"), "slice"."chain_page_input_after" ("step", "root"), "slice"."chain_page_output" ("step", "root"), "slice"."chain_page_output_next" ("step", "root"), "slice"."chain_page_weights_read" ("step", "ordinal", "root"), "slice"."chain_paused" ("target", "turn"), "slice"."chain_result" ("step", "root"), "slice"."chain_resumed" ("target", "turn"), "slice"."chain_retry" ("step", "attempt", "root"), "slice"."chain_root" ("scope"), "slice"."chain_scope" ("scope", "root"), "slice"."chain_skipped" ("scope", "root"), "slice"."chain_start_scope" ("scope", "ordinal", "root"), "slice"."chain_start_step" ("scope", "ordinal", "root"), "slice"."chain_step", "slice"."chain_within", "slice"."concluded" ("learner"), "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."fan_admitted" ("scope", "root"), "slice"."fan_batch_input" ("scope", "root"), "slice"."fan_claim" ("step", "attempt", "root"), "slice"."fan_due" ("step", "root"), "slice"."fan_fan_run_input" ("scope", "root"), "slice"."fan_fenced" ("step", "attempt", "root"), "slice"."fan_finish" ("scope", "root"), "slice"."fan_freed" ("resource", "seat", "turn"), "slice"."fan_held" ("step", "root"), "slice"."fan_hold" ("resource", "seat", "turn"), "slice"."fan_paused" ("target", "turn"), "slice"."fan_result" ("step", "root"), "slice"."fan_resumed" ("target", "turn"), "slice"."fan_retry" ("step", "attempt", "root"), "slice"."fan_root" ("scope"), "slice"."fan_scope" ("scope", "root"), "slice"."fan_skipped" ("scope", "root"), "slice"."fan_square_input" ("step", "root"), "slice"."fan_square_output" ("step", "root"), "slice"."fan_start_scope" ("scope", "ordinal", "root"), "slice"."fan_start_step" ("scope", "ordinal", "root"), "slice"."fan_step", "slice"."fan_within", "slice"."item" ("feed", "seq", "n"), "slice"."missed" ("question"), "slice"."passage", "slice"."retry_admitted" ("scope", "root"), "slice"."retry_brittle_input" ("step", "root"), "slice"."retry_brittle_output" ("step", "root"), "slice"."retry_claim" ("step", "attempt", "root"), "slice"."retry_due" ("step", "root"), "slice"."retry_exhausted" ("step", "root"), "slice"."retry_fenced" ("step", "attempt", "root"), "slice"."retry_finish" ("scope", "root"), "slice"."retry_held" ("step", "root"), "slice"."retry_ladders_input" ("scope", "root"), "slice"."retry_paused" ("target", "turn"), "slice"."retry_result" ("step", "root"), "slice"."retry_resumed" ("target", "turn"), "slice"."retry_retry" ("step", "attempt", "root"), "slice"."retry_root" ("scope"), "slice"."retry_scope" ("scope", "root"), "slice"."retry_skipped" ("scope", "root"), "slice"."retry_steadfast_input" ("step", "root"), "slice"."retry_steadfast_output" ("step", "root"), "slice"."retry_step", "slice"."retry_within", "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."sync_admitted" ("scope", "root"), "slice"."sync_build_input" ("step", "root"), "slice"."sync_claim" ("step", "attempt", "root"), "slice"."sync_copy_input" ("step", "root"), "slice"."sync_due" ("step", "root"), "slice"."sync_exclusive" ("kind", "key", "turn"), "slice"."sync_exclusive_key" ("scope", "root"), "slice"."sync_fenced" ("step", "attempt", "root"), "slice"."sync_finish" ("scope", "root"), "slice"."sync_gold_input" ("scope", "root"), "slice"."sync_held" ("step", "root"), "slice"."sync_paused" ("target", "turn"), "slice"."sync_released" ("kind", "key", "turn"), "slice"."sync_result" ("step", "root"), "slice"."sync_resumed" ("target", "turn"), "slice"."sync_retry" ("step", "attempt", "root"), "slice"."sync_root" ("scope"), "slice"."sync_scope" ("scope", "root"), "slice"."sync_skipped" ("scope", "root"), "slice"."sync_step", "slice"."sync_sync_run_input" ("scope", "root"), "slice"."sync_within", "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice"."__ledger"
  WITH (publish_generated_columns = stored);

ALTER TABLE "slice"."assign_decide_input" DROP CONSTRAINT "__assign_decide_input_norm_near_5yrl3p3qsu";

ALTER TABLE "slice"."assign_assignment_input" DROP CONSTRAINT "__assign_assignment_input_norm_near_mrcc7bgzvm";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_den" FROM :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "vector_ext" FROM :"slice_seats__assign_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__assign_den";

REVOKE SELECT ON TABLE "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within" FROM :"slice_seats__assign_den";

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
REVOKE TEMPORARY ON DATABASE :"DBNAME" FROM :"slice_seats__assign_den";

REVOKE EXECUTE ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jotafzuj2i"[]) FROM :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_retirer" FROM :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "vector_ext" FROM :"slice_seats__assign_retirer";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__assign_retirer";

REVOKE SELECT ON TABLE "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_nearest_read", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_seen_read", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_due", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_scope", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step", "slice_seats__assign_retirer"."assign_within" FROM :"slice_seats__assign_retirer";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__assign_retirer";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() FROM :"slice_seats__assign_retirer";

REVOKE EXECUTE ON FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("slice"."__domain_jotafzuj2i"[]) FROM :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" FROM :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "vector_ext" FROM :"slice_seats__loader";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__loader";

REVOKE SELECT ON TABLE "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight" FROM :"slice_seats__loader";

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
REVOKE TEMPORARY ON DATABASE :"DBNAME" FROM :"slice_seats__loader";

REVOKE EXECUTE ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jotafzuj2i"[]), "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jotafzuj2i"[]) FROM :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_den" TO :"slice_seats__assign_den";

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

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_retirer";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_nearest_read", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_seen_read", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_due", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_scope", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step", "slice_seats__assign_retirer"."assign_within" TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("slice"."__domain_jotafzuj2i"[]) TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__loader";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" TO :"slice_seats__loader";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."missed", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight" TO :"slice_seats__loader";

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

GRANT SELECT, INSERT ON TABLE "slice"."missed" TO :"slice_seats__loader";

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

SELECT "vector_ext"."vector_dims"('[1]'::"vector_ext"."vector");

ALTER ROLE :"slice_seats__worker" RESET hnsw.iterative_scan;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE ALL ON SCHEMA "slice", "slice_seats", "slice_seats__auditor", "slice_seats__loader", "slice_seats__assign_coordinator", "slice_seats__assign_den", "slice_seats__assign_retirer", "slice_seats__chain_coordinator", "slice_seats__chain_den", "slice_seats__chain_retirer", "slice_seats__fan_coordinator", "slice_seats__fan_den", "slice_seats__fan_retirer", "slice_seats__retry_coordinator", "slice_seats__retry_den", "slice_seats__retry_retirer", "slice_seats__sync_coordinator", "slice_seats__sync_den", "slice_seats__sync_retirer" FROM PUBLIC;

REVOKE ALL ON TABLE "slice"."assign_admitted", "slice"."assign_assignment_input", "slice"."assign_assignment_input_exclude", "slice"."assign_assignment_input_mode_nearest", "slice"."assign_assignment_input_mode_within", "slice"."assign_claim", "slice"."assign_decide_input", "slice"."assign_decide_input_exclude", "slice"."assign_decide_input_mode_nearest", "slice"."assign_decide_input_mode_within", "slice"."assign_decide_nearest_read", "slice"."assign_decide_output", "slice"."assign_decide_output_stage_rest", "slice"."assign_decide_output_stage_serve", "slice"."assign_decide_output_weighed", "slice"."assign_decide_seen_read", "slice"."assign_done", "slice"."assign_due", "slice"."assign_exhausted", "slice"."assign_failed", "slice"."assign_fenced", "slice"."assign_finish", "slice"."assign_held", "slice"."assign_paused", "slice"."assign_refusal", "slice"."assign_result", "slice"."assign_resumed", "slice"."assign_retry", "slice"."assign_root", "slice"."assign_scope", "slice"."assign_skipped", "slice"."assign_start_scope", "slice"."assign_start_step", "slice"."assign_step", "slice"."assign_within", "slice"."assigned", "slice"."audit", "slice"."built", "slice"."chain_admitted", "slice"."chain_chain_run_input", "slice"."chain_claim", "slice"."chain_done", "slice"."chain_due", "slice"."chain_exhausted", "slice"."chain_failed", "slice"."chain_fenced", "slice"."chain_finish", "slice"."chain_held", "slice"."chain_next", "slice"."chain_ordered_input", "slice"."chain_page_input", "slice"."chain_page_input_after", "slice"."chain_page_output", "slice"."chain_page_output_next", "slice"."chain_page_weights_read", "slice"."chain_paused", "slice"."chain_refusal", "slice"."chain_result", "slice"."chain_resumed", "slice"."chain_retry", "slice"."chain_root", "slice"."chain_scope", "slice"."chain_skipped", "slice"."chain_start_scope", "slice"."chain_start_step", "slice"."chain_step", "slice"."chain_within", "slice"."concluded", "slice"."copied", "slice"."cursor", "slice"."fan_admitted", "slice"."fan_batch_input", "slice"."fan_claim", "slice"."fan_done", "slice"."fan_due", "slice"."fan_exhausted", "slice"."fan_failed", "slice"."fan_fan_run_input", "slice"."fan_fenced", "slice"."fan_finish", "slice"."fan_freed", "slice"."fan_held", "slice"."fan_hold", "slice"."fan_paused", "slice"."fan_refusal", "slice"."fan_result", "slice"."fan_resumed", "slice"."fan_retry", "slice"."fan_root", "slice"."fan_scope", "slice"."fan_skipped", "slice"."fan_square_input", "slice"."fan_square_output", "slice"."fan_start_scope", "slice"."fan_start_step", "slice"."fan_step", "slice"."fan_within", "slice"."item", "slice"."missed", "slice"."order", "slice"."passage", "slice"."retry_admitted", "slice"."retry_brittle_input", "slice"."retry_brittle_output", "slice"."retry_claim", "slice"."retry_done", "slice"."retry_due", "slice"."retry_exhausted", "slice"."retry_failed", "slice"."retry_fenced", "slice"."retry_finish", "slice"."retry_held", "slice"."retry_ladders_input", "slice"."retry_paused", "slice"."retry_refusal", "slice"."retry_result", "slice"."retry_resumed", "slice"."retry_retry", "slice"."retry_root", "slice"."retry_scope", "slice"."retry_skipped", "slice"."retry_start_scope", "slice"."retry_start_step", "slice"."retry_steadfast_input", "slice"."retry_steadfast_output", "slice"."retry_step", "slice"."retry_within", "slice"."seen", "slice"."settled", "slice"."sync_admitted", "slice"."sync_build_input", "slice"."sync_build_output", "slice"."sync_claim", "slice"."sync_copy_input", "slice"."sync_copy_output", "slice"."sync_done", "slice"."sync_due", "slice"."sync_exclusive", "slice"."sync_exclusive_key", "slice"."sync_exhausted", "slice"."sync_failed", "slice"."sync_fenced", "slice"."sync_finish", "slice"."sync_gold_input", "slice"."sync_held", "slice"."sync_paused", "slice"."sync_refusal", "slice"."sync_released", "slice"."sync_result", "slice"."sync_resumed", "slice"."sync_retry", "slice"."sync_root", "slice"."sync_scope", "slice"."sync_skipped", "slice"."sync_start_scope", "slice"."sync_start_step", "slice"."sync_step", "slice"."sync_sync_run_input", "slice"."sync_within", "slice"."tally", "slice"."weight", "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight", "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."missed", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed", "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within", "slice_seats__assign_retirer"."assign_admitted", "slice_seats__assign_retirer"."assign_assignment_input", "slice_seats__assign_retirer"."assign_assignment_input_exclude", "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest", "slice_seats__assign_retirer"."assign_assignment_input_mode_within", "slice_seats__assign_retirer"."assign_claim", "slice_seats__assign_retirer"."assign_decide_input", "slice_seats__assign_retirer"."assign_decide_input_exclude", "slice_seats__assign_retirer"."assign_decide_input_mode_nearest", "slice_seats__assign_retirer"."assign_decide_input_mode_within", "slice_seats__assign_retirer"."assign_decide_nearest_read", "slice_seats__assign_retirer"."assign_decide_output", "slice_seats__assign_retirer"."assign_decide_output_stage_rest", "slice_seats__assign_retirer"."assign_decide_output_stage_serve", "slice_seats__assign_retirer"."assign_decide_output_weighed", "slice_seats__assign_retirer"."assign_decide_seen_read", "slice_seats__assign_retirer"."assign_done", "slice_seats__assign_retirer"."assign_due", "slice_seats__assign_retirer"."assign_exhausted", "slice_seats__assign_retirer"."assign_failed", "slice_seats__assign_retirer"."assign_fenced", "slice_seats__assign_retirer"."assign_finish", "slice_seats__assign_retirer"."assign_held", "slice_seats__assign_retirer"."assign_refusal", "slice_seats__assign_retirer"."assign_result", "slice_seats__assign_retirer"."assign_retry", "slice_seats__assign_retirer"."assign_root", "slice_seats__assign_retirer"."assign_scope", "slice_seats__assign_retirer"."assign_skipped", "slice_seats__assign_retirer"."assign_start_scope", "slice_seats__assign_retirer"."assign_start_step", "slice_seats__assign_retirer"."assign_step", "slice_seats__assign_retirer"."assign_within", "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed", "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_due", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_weights_read", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_scope", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_den"."chain_within", "slice_seats__chain_retirer"."chain_admitted", "slice_seats__chain_retirer"."chain_chain_run_input", "slice_seats__chain_retirer"."chain_claim", "slice_seats__chain_retirer"."chain_done", "slice_seats__chain_retirer"."chain_due", "slice_seats__chain_retirer"."chain_exhausted", "slice_seats__chain_retirer"."chain_failed", "slice_seats__chain_retirer"."chain_fenced", "slice_seats__chain_retirer"."chain_finish", "slice_seats__chain_retirer"."chain_held", "slice_seats__chain_retirer"."chain_next", "slice_seats__chain_retirer"."chain_ordered_input", "slice_seats__chain_retirer"."chain_page_input", "slice_seats__chain_retirer"."chain_page_input_after", "slice_seats__chain_retirer"."chain_page_output", "slice_seats__chain_retirer"."chain_page_output_next", "slice_seats__chain_retirer"."chain_page_weights_read", "slice_seats__chain_retirer"."chain_refusal", "slice_seats__chain_retirer"."chain_result", "slice_seats__chain_retirer"."chain_retry", "slice_seats__chain_retirer"."chain_root", "slice_seats__chain_retirer"."chain_scope", "slice_seats__chain_retirer"."chain_skipped", "slice_seats__chain_retirer"."chain_start_scope", "slice_seats__chain_retirer"."chain_start_step", "slice_seats__chain_retirer"."chain_step", "slice_seats__chain_retirer"."chain_within", "slice_seats__fan_coordinator"."fan_freed", "slice_seats__fan_coordinator"."fan_hold", "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed", "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_due", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_within", "slice_seats__fan_retirer"."fan_admitted", "slice_seats__fan_retirer"."fan_batch_input", "slice_seats__fan_retirer"."fan_claim", "slice_seats__fan_retirer"."fan_done", "slice_seats__fan_retirer"."fan_due", "slice_seats__fan_retirer"."fan_exhausted", "slice_seats__fan_retirer"."fan_failed", "slice_seats__fan_retirer"."fan_fan_run_input", "slice_seats__fan_retirer"."fan_fenced", "slice_seats__fan_retirer"."fan_finish", "slice_seats__fan_retirer"."fan_held", "slice_seats__fan_retirer"."fan_refusal", "slice_seats__fan_retirer"."fan_result", "slice_seats__fan_retirer"."fan_retry", "slice_seats__fan_retirer"."fan_root", "slice_seats__fan_retirer"."fan_scope", "slice_seats__fan_retirer"."fan_skipped", "slice_seats__fan_retirer"."fan_square_input", "slice_seats__fan_retirer"."fan_square_output", "slice_seats__fan_retirer"."fan_start_scope", "slice_seats__fan_retirer"."fan_start_step", "slice_seats__fan_retirer"."fan_step", "slice_seats__fan_retirer"."fan_within", "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed", "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_due", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_scope", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_within", "slice_seats__retry_retirer"."retry_admitted", "slice_seats__retry_retirer"."retry_brittle_input", "slice_seats__retry_retirer"."retry_brittle_output", "slice_seats__retry_retirer"."retry_claim", "slice_seats__retry_retirer"."retry_done", "slice_seats__retry_retirer"."retry_due", "slice_seats__retry_retirer"."retry_exhausted", "slice_seats__retry_retirer"."retry_failed", "slice_seats__retry_retirer"."retry_fenced", "slice_seats__retry_retirer"."retry_finish", "slice_seats__retry_retirer"."retry_held", "slice_seats__retry_retirer"."retry_ladders_input", "slice_seats__retry_retirer"."retry_refusal", "slice_seats__retry_retirer"."retry_result", "slice_seats__retry_retirer"."retry_retry", "slice_seats__retry_retirer"."retry_root", "slice_seats__retry_retirer"."retry_scope", "slice_seats__retry_retirer"."retry_skipped", "slice_seats__retry_retirer"."retry_start_scope", "slice_seats__retry_retirer"."retry_start_step", "slice_seats__retry_retirer"."retry_steadfast_input", "slice_seats__retry_retirer"."retry_steadfast_output", "slice_seats__retry_retirer"."retry_step", "slice_seats__retry_retirer"."retry_within", "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed", "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_due", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_scope", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_input", "slice_seats__sync_den"."sync_within", "slice_seats__sync_retirer"."sync_admitted", "slice_seats__sync_retirer"."sync_build_input", "slice_seats__sync_retirer"."sync_build_output", "slice_seats__sync_retirer"."sync_claim", "slice_seats__sync_retirer"."sync_copy_input", "slice_seats__sync_retirer"."sync_copy_output", "slice_seats__sync_retirer"."sync_done", "slice_seats__sync_retirer"."sync_due", "slice_seats__sync_retirer"."sync_exclusive_key", "slice_seats__sync_retirer"."sync_exhausted", "slice_seats__sync_retirer"."sync_failed", "slice_seats__sync_retirer"."sync_fenced", "slice_seats__sync_retirer"."sync_finish", "slice_seats__sync_retirer"."sync_gold_input", "slice_seats__sync_retirer"."sync_held", "slice_seats__sync_retirer"."sync_refusal", "slice_seats__sync_retirer"."sync_result", "slice_seats__sync_retirer"."sync_retry", "slice_seats__sync_retirer"."sync_root", "slice_seats__sync_retirer"."sync_scope", "slice_seats__sync_retirer"."sync_skipped", "slice_seats__sync_retirer"."sync_start_scope", "slice_seats__sync_retirer"."sync_start_step", "slice_seats__sync_retirer"."sync_step", "slice_seats__sync_retirer"."sync_sync_run_input", "slice_seats__sync_retirer"."sync_within" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph", "slice"."__param_nearest_anchor_question_elxa5ygyai", "slice"."__param_nearest_topic_4eruqlfauv", "slice"."__param_seen_learner_exdgowkpja" FROM PUBLIC;

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

DROP INDEX "slice"."__passage_ix_embedding_ujugi77ft2";

ALTER TABLE "slice"."assign_decide_input" DROP COLUMN "__aside_step_5_ftuveszke_c5xuankces";

ALTER TABLE "slice"."assign_decide_input" DROP COLUMN "__aside_step_rbt_3_e_5_bpyf_ipzmead7hm";

ALTER TABLE "slice"."assign_decide_input" DROP COLUMN "__aside_root_i_3_j_5_qytpxw_wn3yoadryy";

ALTER TABLE "slice"."assign_decide_input" DROP COLUMN "__aside_root_h_2_ohpjyioe_wk3vp4r6bb";

ALTER TABLE "slice"."assign_assignment_input" DROP COLUMN "__aside_scope_3_owcvq_3_eou_nxyk7fmtmy";

ALTER TABLE "slice"."assign_assignment_input" DROP COLUMN "__aside_scope_44_i_2_s_4_kbue_nyhfuakrfc";

ALTER TABLE "slice"."assign_assignment_input" DROP COLUMN "__aside_root_i_3_j_5_qytpxw_wn3yoadryy";

ALTER TABLE "slice"."assign_assignment_input" DROP COLUMN "__aside_root_h_2_ohpjyioe_wk3vp4r6bb";

ALTER TABLE "slice"."assign_decide_input" DROP COLUMN "near";

ALTER TABLE "slice"."assign_assignment_input" DROP COLUMN "near";

DROP DOMAIN "slice"."__param_topic_q7i3hfsnkd";

DROP DOMAIN "slice"."__param_learner_um3dilfdml";

COMMENT ON DOMAIN "slice"."__param_nearest_anchor_question_elxa5ygyai" IS 'pattern domain of parameter nearest.anchor.question of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON DOMAIN "slice"."__param_nearest_topic_4eruqlfauv" IS 'pattern domain of parameter nearest.topic of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON DOMAIN "slice"."__param_seen_learner_exdgowkpja" IS 'pattern domain of parameter seen.learner of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON CONSTRAINT "__missed_pk_yzhoj6jwnt" ON "slice"."missed" IS 'primary key of Missed';

COMMENT ON CONSTRAINT "__missed_norm_embedding_q23vgxiv6r" ON "slice"."missed" IS 'cosine norm check of Missed.embedding';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__root_h2ohpjyioe" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__root_i3j5qytpxw" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__scope_44i2s4kbue" IS 'scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__scope_3owcvq3eou" IS 'scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__root_h2ohpjyioe" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__root_i3j5qytpxw" IS 'root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__step_rbt3e5bpyf" IS 'step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__step_5ftuveszke" IS 'step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON CONSTRAINT "__assign_assignment_input_key_scope_root_bchsw4ix2g" ON "slice"."assign_assignment_input" IS 'key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_key_scope_root_gibc2wxiel" ON "slice"."assign_assignment_input" IS 'key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_key_step_root_wkkmcf3pki" ON "slice"."assign_decide_input" IS 'key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_key_step_root_kr2gl2vduy" ON "slice"."assign_decide_input" IS 'key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_root_tncpy5cmvv" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}) to AssignAssignmentInputModeNearest(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_root_aoqws6tmme" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}) to AssignAssignmentInputModeWithin(scope, root)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_root_znjzoj5sqp" ON "slice"."assign_assignment_input_mode_nearest" IS 'foreign key AssignAssignmentInputModeNearest(scope, root) to AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_root_lqrytrymw7" ON "slice"."assign_assignment_input_mode_within" IS 'foreign key AssignAssignmentInputModeWithin(scope, root) to AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_root_r5raxgv3qz" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}) to AssignDecideInputModeNearest(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_root_3ri6rctgq4" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}) to AssignDecideInputModeWithin(step, root)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_root_qz3rvpvaf2" ON "slice"."assign_decide_input_mode_nearest" IS 'foreign key AssignDecideInputModeNearest(step, root) to AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fk_step_root_pzugpauw4o" ON "slice"."assign_decide_input_mode_within" IS 'foreign key AssignDecideInputModeWithin(step, root) to AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}, root where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';
