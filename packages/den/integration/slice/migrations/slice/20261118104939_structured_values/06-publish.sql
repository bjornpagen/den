CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice"."assign_admitted" ("scope"), "slice"."assign_assignment_input" ("scope"), "slice"."assign_assignment_input_exclude" ("scope", "ordinal"), "slice"."assign_assignment_input_mode_nearest" ("scope"), "slice"."assign_assignment_input_mode_within" ("scope"), "slice"."assign_claim" ("step", "attempt"), "slice"."assign_decide_input" ("step"), "slice"."assign_decide_input_exclude" ("step", "ordinal"), "slice"."assign_decide_input_mode_nearest" ("step"), "slice"."assign_decide_input_mode_within" ("step"), "slice"."assign_decide_nearest_read" ("step", "ordinal"), "slice"."assign_decide_output" ("step"), "slice"."assign_decide_output_stage_rest" ("step"), "slice"."assign_decide_output_stage_serve" ("step"), "slice"."assign_decide_output_weighed" ("step", "ordinal"), "slice"."assign_decide_seen_read" ("step", "ordinal"), "slice"."assign_due" ("step"), "slice"."assign_fenced" ("step", "attempt"), "slice"."assign_finish" ("scope"), "slice"."assign_held" ("step"), "slice"."assign_paused" ("target", "turn"), "slice"."assign_result" ("step"), "slice"."assign_resumed" ("target", "turn"), "slice"."assign_retry" ("step", "attempt"), "slice"."assign_root" ("scope"), "slice"."assign_scope" ("scope"), "slice"."assign_skipped" ("scope"), "slice"."assign_step", "slice"."assign_within", "slice"."assigned" ("learner"), "slice"."audit" ("step"), "slice"."built" ("build"), "slice"."chain_admitted" ("scope"), "slice"."chain_chain_run_input" ("scope"), "slice"."chain_claim" ("step", "attempt"), "slice"."chain_due" ("step"), "slice"."chain_fenced" ("step", "attempt"), "slice"."chain_finish" ("scope"), "slice"."chain_held" ("step"), "slice"."chain_next" ("from", "ordinal"), "slice"."chain_ordered_input" ("scope"), "slice"."chain_page_input" ("step"), "slice"."chain_page_input_after" ("step"), "slice"."chain_page_output" ("step"), "slice"."chain_page_output_next" ("step"), "slice"."chain_page_weights_read" ("step", "ordinal"), "slice"."chain_paused" ("target", "turn"), "slice"."chain_result" ("step"), "slice"."chain_resumed" ("target", "turn"), "slice"."chain_retry" ("step", "attempt"), "slice"."chain_root" ("scope"), "slice"."chain_scope" ("scope"), "slice"."chain_skipped" ("scope"), "slice"."chain_start_scope" ("scope", "ordinal"), "slice"."chain_start_step" ("scope", "ordinal"), "slice"."chain_step", "slice"."chain_within", "slice"."concluded" ("learner"), "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."fan_admitted" ("scope"), "slice"."fan_batch_input" ("scope"), "slice"."fan_claim" ("step", "attempt"), "slice"."fan_due" ("step"), "slice"."fan_fan_run_input" ("scope"), "slice"."fan_fenced" ("step", "attempt"), "slice"."fan_finish" ("scope"), "slice"."fan_freed" ("resource", "seat", "turn"), "slice"."fan_held" ("step"), "slice"."fan_hold" ("resource", "seat", "turn"), "slice"."fan_paused" ("target", "turn"), "slice"."fan_result" ("step"), "slice"."fan_resumed" ("target", "turn"), "slice"."fan_retry" ("step", "attempt"), "slice"."fan_root" ("scope"), "slice"."fan_scope" ("scope"), "slice"."fan_skipped" ("scope"), "slice"."fan_square_input" ("step"), "slice"."fan_square_output" ("step"), "slice"."fan_start_scope" ("scope", "ordinal"), "slice"."fan_start_step" ("scope", "ordinal"), "slice"."fan_step", "slice"."fan_within", "slice"."item" ("feed", "seq", "n"), "slice"."passage", "slice"."retry_admitted" ("scope"), "slice"."retry_brittle_input" ("step"), "slice"."retry_brittle_output" ("step"), "slice"."retry_claim" ("step", "attempt"), "slice"."retry_due" ("step"), "slice"."retry_exhausted" ("step"), "slice"."retry_fenced" ("step", "attempt"), "slice"."retry_finish" ("scope"), "slice"."retry_held" ("step"), "slice"."retry_ladders_input" ("scope"), "slice"."retry_paused" ("target", "turn"), "slice"."retry_result" ("step"), "slice"."retry_resumed" ("target", "turn"), "slice"."retry_retry" ("step", "attempt"), "slice"."retry_root" ("scope"), "slice"."retry_scope" ("scope"), "slice"."retry_skipped" ("scope"), "slice"."retry_steadfast_input" ("step"), "slice"."retry_steadfast_output" ("step"), "slice"."retry_step", "slice"."retry_within", "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."sync_admitted" ("scope"), "slice"."sync_build_input" ("step"), "slice"."sync_claim" ("step", "attempt"), "slice"."sync_copy_input" ("step"), "slice"."sync_due" ("step"), "slice"."sync_exclusive" ("kind", "key", "turn"), "slice"."sync_exclusive_key" ("scope"), "slice"."sync_fenced" ("step", "attempt"), "slice"."sync_finish" ("scope"), "slice"."sync_gold_input" ("scope"), "slice"."sync_held" ("step"), "slice"."sync_paused" ("target", "turn"), "slice"."sync_released" ("kind", "key", "turn"), "slice"."sync_result" ("step"), "slice"."sync_resumed" ("target", "turn"), "slice"."sync_retry" ("step", "attempt"), "slice"."sync_root" ("scope"), "slice"."sync_scope" ("scope"), "slice"."sync_skipped" ("scope"), "slice"."sync_step", "slice"."sync_sync_run_input" ("scope"), "slice"."sync_within", "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice"."__ledger"
  WITH (publish_generated_columns = stored);

ALTER TABLE "slice"."assign_decide_output_chosen" DROP CONSTRAINT "__assign_decide_output_chosen_fk_step_khpc4l7ijm";

ALTER TABLE "slice"."assign_decide_output_chosen" DROP CONSTRAINT "__assign_decide_output_chosen_pk_iwcppigpd6";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_coordinator" FROM :"slice_seats__assign_coordinator";

REVOKE USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable" FROM :"slice_seats__assign_coordinator";

REVOKE SELECT ON TABLE "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed" FROM :"slice_seats__assign_coordinator";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_paused" FROM :"slice_seats__assign_coordinator";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_resumed" FROM :"slice_seats__assign_coordinator";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__assign_coordinator";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() FROM :"slice_seats__assign_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_den" FROM :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "vector_ext" FROM :"slice_seats__assign_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__assign_den";

REVOKE SELECT ON TABLE "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_admitted" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_assignment_input" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_claim" FROM :"slice_seats__assign_den";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_input" FROM :"slice_seats__assign_den";

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

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() FROM :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__auditor" FROM :"slice_seats__auditor";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_kind", "slice"."assign_outcome", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."sync_join", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__auditor";

REVOKE SELECT ON TABLE "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" FROM :"slice_seats__auditor";

REVOKE SELECT, INSERT ON TABLE "slice"."audit" FROM :"slice_seats__auditor";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__auditor";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_outcome_names_xzb4y4xgki"() FROM :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" FROM :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "vector_ext" FROM :"slice_seats__loader";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__loader";

REVOKE SELECT ON TABLE "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."assign_decide_output_chosen" FROM :"slice_seats__loader";

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

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() FROM :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_coordinator" TO :"slice_seats__assign_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."assign_assignment_input_mode", "slice"."assign_decide_input_mode", "slice"."assign_decide_output_stage", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable" TO :"slice_seats__assign_coordinator";

GRANT SELECT ON TABLE "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."assign_paused" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"(), "slice"."__assign_decide_input_mode_names_zoydpw665o"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() TO :"slice_seats__assign_coordinator";

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
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__auditor" TO :"slice_seats__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_decide_output_stage", "slice"."assign_kind", "slice"."assign_outcome", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."sync_join", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" TO :"slice_seats__auditor";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" TO :"slice_seats__auditor";

GRANT SELECT, INSERT ON TABLE "slice"."audit" TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_outcome_names_xzb4y4xgki"() TO :"slice_seats__auditor";

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
REVOKE ALL ON SCHEMA "slice", "slice_seats", "slice_seats__auditor", "slice_seats__loader", "slice_seats__assign_coordinator", "slice_seats__assign_den", "slice_seats__chain_coordinator", "slice_seats__chain_den", "slice_seats__fan_coordinator", "slice_seats__fan_den", "slice_seats__retry_coordinator", "slice_seats__retry_den", "slice_seats__sync_coordinator", "slice_seats__sync_den" FROM PUBLIC;

REVOKE ALL ON TABLE "slice"."assign_admitted", "slice"."assign_assignment_input", "slice"."assign_assignment_input_exclude", "slice"."assign_assignment_input_mode_nearest", "slice"."assign_assignment_input_mode_within", "slice"."assign_claim", "slice"."assign_decide_input", "slice"."assign_decide_input_exclude", "slice"."assign_decide_input_mode_nearest", "slice"."assign_decide_input_mode_within", "slice"."assign_decide_nearest_read", "slice"."assign_decide_output", "slice"."assign_decide_output_stage_rest", "slice"."assign_decide_output_stage_serve", "slice"."assign_decide_output_weighed", "slice"."assign_decide_seen_read", "slice"."assign_done", "slice"."assign_due", "slice"."assign_exhausted", "slice"."assign_failed", "slice"."assign_fenced", "slice"."assign_finish", "slice"."assign_held", "slice"."assign_paused", "slice"."assign_refusal", "slice"."assign_result", "slice"."assign_resumed", "slice"."assign_retry", "slice"."assign_root", "slice"."assign_scope", "slice"."assign_skipped", "slice"."assign_start_scope", "slice"."assign_start_step", "slice"."assign_step", "slice"."assign_within", "slice"."assigned", "slice"."audit", "slice"."built", "slice"."chain_admitted", "slice"."chain_chain_run_input", "slice"."chain_claim", "slice"."chain_done", "slice"."chain_due", "slice"."chain_exhausted", "slice"."chain_failed", "slice"."chain_fenced", "slice"."chain_finish", "slice"."chain_held", "slice"."chain_next", "slice"."chain_ordered_input", "slice"."chain_page_input", "slice"."chain_page_input_after", "slice"."chain_page_output", "slice"."chain_page_output_next", "slice"."chain_page_weights_read", "slice"."chain_paused", "slice"."chain_refusal", "slice"."chain_result", "slice"."chain_resumed", "slice"."chain_retry", "slice"."chain_root", "slice"."chain_scope", "slice"."chain_skipped", "slice"."chain_start_scope", "slice"."chain_start_step", "slice"."chain_step", "slice"."chain_within", "slice"."concluded", "slice"."copied", "slice"."cursor", "slice"."fan_admitted", "slice"."fan_batch_input", "slice"."fan_claim", "slice"."fan_done", "slice"."fan_due", "slice"."fan_exhausted", "slice"."fan_failed", "slice"."fan_fan_run_input", "slice"."fan_fenced", "slice"."fan_finish", "slice"."fan_freed", "slice"."fan_held", "slice"."fan_hold", "slice"."fan_paused", "slice"."fan_refusal", "slice"."fan_result", "slice"."fan_resumed", "slice"."fan_retry", "slice"."fan_root", "slice"."fan_scope", "slice"."fan_skipped", "slice"."fan_square_input", "slice"."fan_square_output", "slice"."fan_start_scope", "slice"."fan_start_step", "slice"."fan_step", "slice"."fan_within", "slice"."item", "slice"."order", "slice"."passage", "slice"."retry_admitted", "slice"."retry_brittle_input", "slice"."retry_brittle_output", "slice"."retry_claim", "slice"."retry_done", "slice"."retry_due", "slice"."retry_exhausted", "slice"."retry_failed", "slice"."retry_fenced", "slice"."retry_finish", "slice"."retry_held", "slice"."retry_ladders_input", "slice"."retry_paused", "slice"."retry_refusal", "slice"."retry_result", "slice"."retry_resumed", "slice"."retry_retry", "slice"."retry_root", "slice"."retry_scope", "slice"."retry_skipped", "slice"."retry_start_scope", "slice"."retry_start_step", "slice"."retry_steadfast_input", "slice"."retry_steadfast_output", "slice"."retry_step", "slice"."retry_within", "slice"."seen", "slice"."settled", "slice"."sync_admitted", "slice"."sync_build_input", "slice"."sync_build_output", "slice"."sync_claim", "slice"."sync_copy_input", "slice"."sync_copy_output", "slice"."sync_done", "slice"."sync_due", "slice"."sync_exclusive", "slice"."sync_exclusive_key", "slice"."sync_exhausted", "slice"."sync_failed", "slice"."sync_fenced", "slice"."sync_finish", "slice"."sync_gold_input", "slice"."sync_held", "slice"."sync_paused", "slice"."sync_refusal", "slice"."sync_released", "slice"."sync_result", "slice"."sync_resumed", "slice"."sync_retry", "slice"."sync_root", "slice"."sync_scope", "slice"."sync_skipped", "slice"."sync_start_scope", "slice"."sync_start_step", "slice"."sync_step", "slice"."sync_sync_run_input", "slice"."sync_within", "slice"."tally", "slice"."weight", "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_output", "slice_seats__auditor"."assign_decide_output_stage_serve", "slice_seats__auditor"."assign_decide_output_weighed", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."concluded", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight", "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_assignment_input_exclude", "slice_seats__loader"."assign_assignment_input_mode_nearest", "slice_seats__loader"."assign_assignment_input_mode_within", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_input_exclude", "slice_seats__loader"."assign_decide_input_mode_nearest", "slice_seats__loader"."assign_decide_input_mode_within", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_stage_rest", "slice_seats__loader"."assign_decide_output_stage_serve", "slice_seats__loader"."assign_decide_output_weighed", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."concluded", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed", "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_assignment_input_exclude", "slice_seats__assign_den"."assign_assignment_input_mode_nearest", "slice_seats__assign_den"."assign_assignment_input_mode_within", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_input_exclude", "slice_seats__assign_den"."assign_decide_input_mode_nearest", "slice_seats__assign_den"."assign_decide_input_mode_within", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_stage_rest", "slice_seats__assign_den"."assign_decide_output_stage_serve", "slice_seats__assign_den"."assign_decide_output_weighed", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within", "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed", "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_due", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_weights_read", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_scope", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_den"."chain_within", "slice_seats__fan_coordinator"."fan_freed", "slice_seats__fan_coordinator"."fan_hold", "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed", "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_due", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_within", "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed", "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_due", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_scope", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_within", "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed", "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_due", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_scope", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_input", "slice_seats__sync_den"."sync_within" FROM PUBLIC;

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

DROP TABLE "slice"."assign_decide_output_chosen";

COMMENT ON FUNCTION "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"() IS 'names of roster AssignAssignmentInputMode (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__assign_decide_input_mode_names_zoydpw665o"() IS 'names of roster AssignDecideInputMode (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"() IS 'names of roster AssignDecideOutputStage (556f904340d737be25648339e181d14e64dd457a3e1d3764c24d2d35cb45dacf)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" ON "slice"."assign_assignment_input_exclude" IS 'primary key of AssignAssignmentInputExclude';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" ON "slice"."assign_assignment_input_mode_nearest" IS 'primary key of AssignAssignmentInputModeNearest';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" ON "slice"."assign_assignment_input_mode_within" IS 'primary key of AssignAssignmentInputModeWithin';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" ON "slice"."assign_decide_input_exclude" IS 'primary key of AssignDecideInputExclude';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" ON "slice"."assign_decide_input_mode_nearest" IS 'primary key of AssignDecideInputModeNearest';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" ON "slice"."assign_decide_input_mode_within" IS 'primary key of AssignDecideInputModeWithin';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" ON "slice"."assign_decide_output_stage_rest" IS 'primary key of AssignDecideOutputStageRest';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" ON "slice"."assign_decide_output_stage_serve" IS 'primary key of AssignDecideOutputStageServe';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" ON "slice"."assign_decide_output_weighed" IS 'primary key of AssignDecideOutputWeighed';

COMMENT ON CONSTRAINT "__concluded_pk_b44jbktrki" ON "slice"."concluded" IS 'primary key of Concluded';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__scope_44i2s4kbue" IS 'scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__scope_3owcvq3eou" IS 'scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input_exclude"."__scope_u6ypqf2r2z" IS 'scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_assignment_input_exclude"."__pred_ordinal_rdz3ttleig" IS 'pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__step_rbt3e5bpyf" IS 'step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__step_5ftuveszke" IS 'step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}';

COMMENT ON COLUMN "slice"."assign_decide_input_exclude"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_input_exclude"."__pred_ordinal_rdz3ttleig" IS 'pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_output"."__step_zqzc7m2bzh" IS 'step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}';

COMMENT ON COLUMN "slice"."assign_decide_output"."__step_7f435gey6a" IS 'step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}';

COMMENT ON COLUMN "slice"."assign_decide_output_weighed"."__step_mjpuijzth4" IS 'step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON COLUMN "slice"."assign_decide_output_weighed"."__pred_ordinal_rdz3ttleig" IS 'pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}';

COMMENT ON CONSTRAINT "__assign_assignment_input_key_scope_ww7cpygqna" ON "slice"."assign_assignment_input" IS 'key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_key_scope_xkzvuysyji" ON "slice"."assign_assignment_input" IS 'key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_key_step_2jprqspwz2" ON "slice"."assign_decide_input" IS 'key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_key_step_sjxw7625ad" ON "slice"."assign_decide_input" IS 'key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_key_step_jskz62lztu" ON "slice"."assign_decide_output" IS 'key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_key_step_cazpxzqxko" ON "slice"."assign_decide_output" IS 'key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_esvfiv3erb" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}) to AssignAssignmentInputModeNearest(scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_ephkx6dc57" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}) to AssignAssignmentInputModeWithin(scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_iphjwo2xrf" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope) to AssignAssignmentInput(scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_7ogcceo32v" ON "slice"."assign_assignment_input_exclude" IS 'foreign key AssignAssignmentInputExclude(scope where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}) to AssignAssignmentInputExclude(scope, ordinal)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_3fapehithe" ON "slice"."assign_assignment_input_mode_nearest" IS 'foreign key AssignAssignmentInputModeNearest(scope) to AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_ldeuocbixk" ON "slice"."assign_assignment_input_mode_within" IS 'foreign key AssignAssignmentInputModeWithin(scope) to AssignAssignmentInput(scope where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_smeb6dksjy" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}}) to AssignDecideInputModeNearest(step)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_vlinncoes5" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}}) to AssignDecideInputModeWithin(step)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_py5qnbqlfp" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step) to AssignDecideInput(step)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_uw3d7lbfy5" ON "slice"."assign_decide_input_exclude" IS 'foreign key AssignDecideInputExclude(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}) to AssignDecideInputExclude(step, ordinal)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_lzlwvj6kch" ON "slice"."assign_decide_input_mode_nearest" IS 'foreign key AssignDecideInputModeNearest(step) to AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Nearest"}})';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fk_step_4aicgmlk2z" ON "slice"."assign_decide_input_mode_within" IS 'foreign key AssignDecideInputModeWithin(step) to AssignDecideInput(step where {"kind":"compare","left":{"field":"mode","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Within"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_6eza3ipk3z" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}}) to AssignDecideOutputStageRest(step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_uf2quv342e" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}}) to AssignDecideOutputStageServe(step)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_fk_step_wwk6mswm3e" ON "slice"."assign_decide_output_stage_rest" IS 'foreign key AssignDecideOutputStageRest(step) to AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Rest"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_fk_step_f2p5s2crcy" ON "slice"."assign_decide_output_stage_serve" IS 'foreign key AssignDecideOutputStageServe(step) to AssignDecideOutput(step where {"kind":"compare","left":{"field":"stage","kind":"field"},"op":"eq","right":{"kind":"literal","value":"Serve"}})';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_ii3cwlqbeg" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step) to AssignDecideOutput(step)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_nfcwpmjkm3" ON "slice"."assign_decide_output_weighed" IS 'foreign key AssignDecideOutputWeighed(step where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}, pred(ordinal) where {"kind":"compare","left":{"field":"ordinal","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:1"}}) to AssignDecideOutputWeighed(step, ordinal)';

COMMENT ON INDEX "slice"."__assign_assignment_input_exclude_ix_scope_u_6_ypqf_62yp6oy7kl" IS 'btree index AssignAssignmentInputExclude(__scope_u6ypqf2r2z, __pred_ordinal_rdz3ttleig)';

COMMENT ON INDEX "slice"."__assign_decide_input_exclude_ix_step_mjpuijzth_4_ej2iltl5l2" IS 'btree index AssignDecideInputExclude(__step_mjpuijzth4, __pred_ordinal_rdz3ttleig)';

COMMENT ON INDEX "slice"."__assign_decide_output_weighed_ix_step_mjpuijzth_4_ejefxdhh4l" IS 'btree index AssignDecideOutputWeighed(__step_mjpuijzth4, __pred_ordinal_rdz3ttleig)';
