CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice"."assign_admitted" ("scope"), "slice"."assign_assignment_input" ("scope"), "slice"."assign_claim" ("step", "attempt"), "slice"."assign_decide_input" ("step"), "slice"."assign_decide_nearest_read" ("step", "ordinal"), "slice"."assign_decide_output" ("step"), "slice"."assign_decide_output_chosen" ("step"), "slice"."assign_decide_seen_read" ("step", "ordinal"), "slice"."assign_due" ("step"), "slice"."assign_fenced" ("step", "attempt"), "slice"."assign_finish" ("scope"), "slice"."assign_held" ("step"), "slice"."assign_paused" ("target", "turn"), "slice"."assign_result" ("step"), "slice"."assign_resumed" ("target", "turn"), "slice"."assign_retry" ("step", "attempt"), "slice"."assign_root" ("scope"), "slice"."assign_scope" ("scope"), "slice"."assign_skipped" ("scope"), "slice"."assign_step", "slice"."assign_within", "slice"."assigned" ("learner"), "slice"."audit" ("step"), "slice"."built" ("build"), "slice"."chain_admitted" ("scope"), "slice"."chain_chain_run_input" ("scope"), "slice"."chain_claim" ("step", "attempt"), "slice"."chain_due" ("step"), "slice"."chain_fenced" ("step", "attempt"), "slice"."chain_finish" ("scope"), "slice"."chain_held" ("step"), "slice"."chain_next" ("from", "ordinal"), "slice"."chain_ordered_input" ("scope"), "slice"."chain_page_input" ("step"), "slice"."chain_page_input_after" ("step"), "slice"."chain_page_output" ("step"), "slice"."chain_page_output_next" ("step"), "slice"."chain_page_weights_read" ("step", "ordinal"), "slice"."chain_paused" ("target", "turn"), "slice"."chain_result" ("step"), "slice"."chain_resumed" ("target", "turn"), "slice"."chain_retry" ("step", "attempt"), "slice"."chain_root" ("scope"), "slice"."chain_scope" ("scope"), "slice"."chain_skipped" ("scope"), "slice"."chain_start_scope" ("scope", "ordinal"), "slice"."chain_start_step" ("scope", "ordinal"), "slice"."chain_step", "slice"."chain_within", "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."fan_admitted" ("scope"), "slice"."fan_batch_input" ("scope"), "slice"."fan_claim" ("step", "attempt"), "slice"."fan_due" ("step"), "slice"."fan_fan_run_input" ("scope"), "slice"."fan_fenced" ("step", "attempt"), "slice"."fan_finish" ("scope"), "slice"."fan_freed" ("resource", "seat", "turn"), "slice"."fan_held" ("step"), "slice"."fan_hold" ("resource", "seat", "turn"), "slice"."fan_paused" ("target", "turn"), "slice"."fan_result" ("step"), "slice"."fan_resumed" ("target", "turn"), "slice"."fan_retry" ("step", "attempt"), "slice"."fan_root" ("scope"), "slice"."fan_scope" ("scope"), "slice"."fan_skipped" ("scope"), "slice"."fan_square_input" ("step"), "slice"."fan_square_output" ("step"), "slice"."fan_start_scope" ("scope", "ordinal"), "slice"."fan_start_step" ("scope", "ordinal"), "slice"."fan_step", "slice"."fan_within", "slice"."item" ("feed", "seq", "n"), "slice"."passage", "slice"."retry_admitted" ("scope"), "slice"."retry_brittle_input" ("step"), "slice"."retry_brittle_output" ("step"), "slice"."retry_claim" ("step", "attempt"), "slice"."retry_due" ("step"), "slice"."retry_exhausted" ("step"), "slice"."retry_fenced" ("step", "attempt"), "slice"."retry_finish" ("scope"), "slice"."retry_held" ("step"), "slice"."retry_ladders_input" ("scope"), "slice"."retry_paused" ("target", "turn"), "slice"."retry_result" ("step"), "slice"."retry_resumed" ("target", "turn"), "slice"."retry_retry" ("step", "attempt"), "slice"."retry_root" ("scope"), "slice"."retry_scope" ("scope"), "slice"."retry_skipped" ("scope"), "slice"."retry_steadfast_input" ("step"), "slice"."retry_steadfast_output" ("step"), "slice"."retry_step", "slice"."retry_within", "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."sync_admitted" ("scope"), "slice"."sync_build_input" ("step"), "slice"."sync_claim" ("step", "attempt"), "slice"."sync_copy_input" ("step"), "slice"."sync_due" ("step"), "slice"."sync_exclusive" ("kind", "key", "turn"), "slice"."sync_exclusive_key" ("scope"), "slice"."sync_fenced" ("step", "attempt"), "slice"."sync_finish" ("scope"), "slice"."sync_gold_input" ("scope"), "slice"."sync_held" ("step"), "slice"."sync_paused" ("target", "turn"), "slice"."sync_released" ("kind", "key", "turn"), "slice"."sync_result" ("step"), "slice"."sync_resumed" ("target", "turn"), "slice"."sync_retry" ("step", "attempt"), "slice"."sync_root" ("scope"), "slice"."sync_scope" ("scope"), "slice"."sync_skipped" ("scope"), "slice"."sync_step", "slice"."sync_sync_run_input" ("scope"), "slice"."sync_within", "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice"."__ledger"
  WITH (publish_generated_columns = stored);

CREATE ROLE :"slice_seats__assign_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__assign_den" NOLOGIN;

CREATE SCHEMA "slice_seats__assign_coordinator";

CREATE SCHEMA "slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_coordinator"."assign_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."assign_paused" AS "r1";

CREATE VIEW "slice_seats__assign_coordinator"."assign_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice"."assign_resumed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."assign_admitted" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input" ("scope", "learner", "topic", "near") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."near"
FROM "slice"."assign_assignment_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."assign_claim" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input" ("step", "learner", "topic", "near") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."near"
FROM "slice"."assign_decide_input" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_nearest_read" ("step", "ordinal", "passage", "topic", "distance") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice"."assign_decide_nearest_read" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_decide_output" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_chosen" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."assign_decide_output_chosen" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_decide_seen_read" ("step", "ordinal", "learner", "passage") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."learner", "r1"."passage"
FROM "slice"."assign_decide_seen_read" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_done" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_due" ("step", "at") AS
SELECT "r1"."step", "r1"."at"
FROM "slice"."assign_due" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."assign_exhausted" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_failed" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_failed" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_fenced" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."assign_fenced" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."assign_finish" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."assign_held" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."assign_refusal" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."assign_result" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_retry" ("step", "attempt", "at", "spent") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent"
FROM "slice"."assign_retry" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."assign_root" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_join_names_cks63qswdh"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."assign_scope" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_skipped" ("scope", "by") AS
SELECT "r1"."scope", "r1"."by"
FROM "slice"."assign_skipped" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."assign_start_scope" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."assign_start_step" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_nlpfxx2ign"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."assign_step" AS "r1";

CREATE VIEW "slice_seats__assign_den"."assign_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."assign_within" AS "r1";

GRANT :"slice_seats__assign_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__assign_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__auditor" FROM :"slice_seats__auditor";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."sync_join", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__auditor";

REVOKE SELECT ON TABLE "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" FROM :"slice_seats__auditor";

REVOKE SELECT, INSERT ON TABLE "slice"."audit" FROM :"slice_seats__auditor";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__auditor";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_outcome_names_xzb4y4xgki"() FROM :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__chain_den" FROM :"slice_seats__chain_den";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."feed" FROM :"slice_seats__chain_den";

REVOKE SELECT ON TABLE "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_due", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_scope", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_den"."chain_within" FROM :"slice_seats__chain_den";

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
REVOKE USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" FROM :"slice_seats__loader";

REVOKE USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" FROM :"slice_seats__loader";

REVOKE SELECT ON TABLE "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight" FROM :"slice_seats__loader";

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

REVOKE SELECT, INSERT ON TABLE "slice"."retry_brittle_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_done" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_held" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_result" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."retry_steadfast_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."settled" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_build_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_copy_output" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_done" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_held" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."sync_result" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."tally" FROM :"slice_seats__loader";

REVOKE SELECT, INSERT ON TABLE "slice"."weight" FROM :"slice_seats__loader";

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM :"slice_seats__loader";

REVOKE EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() FROM :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_coordinator" TO :"slice_seats__assign_coordinator";

GRANT USAGE ON DOMAIN "slice"."__domain_gfw43vigph", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable" TO :"slice_seats__assign_coordinator";

GRANT SELECT ON TABLE "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."assign_paused" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() TO :"slice_seats__assign_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__assign_den" TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."__text_t4rwovzmqj" TO :"slice_seats__assign_den";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_chosen", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_admitted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_assignment_input" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_claim" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_input" TO :"slice_seats__assign_den";

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

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"() TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__auditor" TO :"slice_seats__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_kind", "slice"."assign_outcome", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."sync_join", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" TO :"slice_seats__auditor";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_output_chosen", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight" TO :"slice_seats__auditor";

GRANT SELECT, INSERT ON TABLE "slice"."audit" TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_outcome_names_xzb4y4xgki"() TO :"slice_seats__auditor";

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
GRANT USAGE ON SCHEMA "slice", "slice_seats", "slice_seats__loader" TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__loader";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" TO :"slice_seats__loader";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_chosen", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_nearest_read" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assign_decide_output_chosen" TO :"slice_seats__loader";

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

GRANT EXECUTE ON FUNCTION "slice"."__constant_ejkw66w2je"(), "slice"."__constant_ib5zplua3f"(), "slice"."__assign_join_names_cks63qswdh"(), "slice"."__assign_kind_names_nlpfxx2ign"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() TO :"slice_seats__loader";

SELECT "vector_ext"."vector_dims"('[1]'::"vector_ext"."vector");

ALTER ROLE :"slice_seats__app" SET hnsw.iterative_scan = 'strict_order';

ALTER ROLE :"slice_seats__worker" SET hnsw.iterative_scan = 'strict_order';

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE ALL ON SCHEMA "slice", "slice_seats", "slice_seats__auditor", "slice_seats__loader", "slice_seats__assign_coordinator", "slice_seats__assign_den", "slice_seats__chain_coordinator", "slice_seats__chain_den", "slice_seats__fan_coordinator", "slice_seats__fan_den", "slice_seats__retry_coordinator", "slice_seats__retry_den", "slice_seats__sync_coordinator", "slice_seats__sync_den" FROM PUBLIC;

REVOKE ALL ON TABLE "slice"."assign_admitted", "slice"."assign_assignment_input", "slice"."assign_claim", "slice"."assign_decide_input", "slice"."assign_decide_nearest_read", "slice"."assign_decide_output", "slice"."assign_decide_output_chosen", "slice"."assign_decide_seen_read", "slice"."assign_done", "slice"."assign_due", "slice"."assign_exhausted", "slice"."assign_failed", "slice"."assign_fenced", "slice"."assign_finish", "slice"."assign_held", "slice"."assign_paused", "slice"."assign_refusal", "slice"."assign_result", "slice"."assign_resumed", "slice"."assign_retry", "slice"."assign_root", "slice"."assign_scope", "slice"."assign_skipped", "slice"."assign_start_scope", "slice"."assign_start_step", "slice"."assign_step", "slice"."assign_within", "slice"."assigned", "slice"."audit", "slice"."built", "slice"."chain_admitted", "slice"."chain_chain_run_input", "slice"."chain_claim", "slice"."chain_done", "slice"."chain_due", "slice"."chain_exhausted", "slice"."chain_failed", "slice"."chain_fenced", "slice"."chain_finish", "slice"."chain_held", "slice"."chain_next", "slice"."chain_ordered_input", "slice"."chain_page_input", "slice"."chain_page_input_after", "slice"."chain_page_output", "slice"."chain_page_output_next", "slice"."chain_page_weights_read", "slice"."chain_paused", "slice"."chain_refusal", "slice"."chain_result", "slice"."chain_resumed", "slice"."chain_retry", "slice"."chain_root", "slice"."chain_scope", "slice"."chain_skipped", "slice"."chain_start_scope", "slice"."chain_start_step", "slice"."chain_step", "slice"."chain_within", "slice"."copied", "slice"."cursor", "slice"."fan_admitted", "slice"."fan_batch_input", "slice"."fan_claim", "slice"."fan_done", "slice"."fan_due", "slice"."fan_exhausted", "slice"."fan_failed", "slice"."fan_fan_run_input", "slice"."fan_fenced", "slice"."fan_finish", "slice"."fan_freed", "slice"."fan_held", "slice"."fan_hold", "slice"."fan_paused", "slice"."fan_refusal", "slice"."fan_result", "slice"."fan_resumed", "slice"."fan_retry", "slice"."fan_root", "slice"."fan_scope", "slice"."fan_skipped", "slice"."fan_square_input", "slice"."fan_square_output", "slice"."fan_start_scope", "slice"."fan_start_step", "slice"."fan_step", "slice"."fan_within", "slice"."item", "slice"."order", "slice"."passage", "slice"."retry_admitted", "slice"."retry_brittle_input", "slice"."retry_brittle_output", "slice"."retry_claim", "slice"."retry_done", "slice"."retry_due", "slice"."retry_exhausted", "slice"."retry_failed", "slice"."retry_fenced", "slice"."retry_finish", "slice"."retry_held", "slice"."retry_ladders_input", "slice"."retry_paused", "slice"."retry_refusal", "slice"."retry_result", "slice"."retry_resumed", "slice"."retry_retry", "slice"."retry_root", "slice"."retry_scope", "slice"."retry_skipped", "slice"."retry_start_scope", "slice"."retry_start_step", "slice"."retry_steadfast_input", "slice"."retry_steadfast_output", "slice"."retry_step", "slice"."retry_within", "slice"."seen", "slice"."settled", "slice"."sync_admitted", "slice"."sync_build_input", "slice"."sync_build_output", "slice"."sync_claim", "slice"."sync_copy_input", "slice"."sync_copy_output", "slice"."sync_done", "slice"."sync_due", "slice"."sync_exclusive", "slice"."sync_exclusive_key", "slice"."sync_exhausted", "slice"."sync_failed", "slice"."sync_fenced", "slice"."sync_finish", "slice"."sync_gold_input", "slice"."sync_held", "slice"."sync_paused", "slice"."sync_refusal", "slice"."sync_released", "slice"."sync_result", "slice"."sync_resumed", "slice"."sync_retry", "slice"."sync_root", "slice"."sync_scope", "slice"."sync_skipped", "slice"."sync_start_scope", "slice"."sync_start_step", "slice"."sync_step", "slice"."sync_sync_run_input", "slice"."sync_within", "slice"."tally", "slice"."weight", "slice_seats__auditor"."assign_decide_nearest_read", "slice_seats__auditor"."assign_decide_output_chosen", "slice_seats__auditor"."assign_decide_seen_read", "slice_seats__auditor"."assign_result", "slice_seats__auditor"."assign_step", "slice_seats__auditor"."assigned", "slice_seats__auditor"."audit", "slice_seats__auditor"."built", "slice_seats__auditor"."chain_admitted", "slice_seats__auditor"."chain_chain_run_input", "slice_seats__auditor"."chain_claim", "slice_seats__auditor"."chain_finish", "slice_seats__auditor"."chain_next", "slice_seats__auditor"."chain_ordered_input", "slice_seats__auditor"."chain_page_input", "slice_seats__auditor"."chain_page_input_after", "slice_seats__auditor"."chain_page_output", "slice_seats__auditor"."chain_page_output_next", "slice_seats__auditor"."chain_page_weights_read", "slice_seats__auditor"."chain_result", "slice_seats__auditor"."chain_root", "slice_seats__auditor"."chain_scope", "slice_seats__auditor"."chain_start_scope", "slice_seats__auditor"."chain_start_step", "slice_seats__auditor"."chain_step", "slice_seats__auditor"."chain_within", "slice_seats__auditor"."copied", "slice_seats__auditor"."cursor", "slice_seats__auditor"."fan_admitted", "slice_seats__auditor"."fan_batch_input", "slice_seats__auditor"."fan_fan_run_input", "slice_seats__auditor"."fan_finish", "slice_seats__auditor"."fan_result", "slice_seats__auditor"."fan_root", "slice_seats__auditor"."fan_scope", "slice_seats__auditor"."fan_square_input", "slice_seats__auditor"."fan_square_output", "slice_seats__auditor"."fan_start_scope", "slice_seats__auditor"."fan_start_step", "slice_seats__auditor"."fan_step", "slice_seats__auditor"."fan_within", "slice_seats__auditor"."item", "slice_seats__auditor"."order", "slice_seats__auditor"."retry_claim", "slice_seats__auditor"."retry_exhausted", "slice_seats__auditor"."retry_result", "slice_seats__auditor"."retry_step", "slice_seats__auditor"."settled", "slice_seats__auditor"."sync_admitted", "slice_seats__auditor"."sync_finish", "slice_seats__auditor"."sync_result", "slice_seats__auditor"."sync_scope", "slice_seats__auditor"."sync_skipped", "slice_seats__auditor"."tally", "slice_seats__auditor"."weight", "slice_seats__loader"."assign_admitted", "slice_seats__loader"."assign_assignment_input", "slice_seats__loader"."assign_claim", "slice_seats__loader"."assign_decide_input", "slice_seats__loader"."assign_decide_nearest_read", "slice_seats__loader"."assign_decide_output", "slice_seats__loader"."assign_decide_output_chosen", "slice_seats__loader"."assign_decide_seen_read", "slice_seats__loader"."assign_done", "slice_seats__loader"."assign_due", "slice_seats__loader"."assign_exhausted", "slice_seats__loader"."assign_failed", "slice_seats__loader"."assign_fenced", "slice_seats__loader"."assign_finish", "slice_seats__loader"."assign_held", "slice_seats__loader"."assign_refusal", "slice_seats__loader"."assign_result", "slice_seats__loader"."assign_retry", "slice_seats__loader"."assign_root", "slice_seats__loader"."assign_scope", "slice_seats__loader"."assign_skipped", "slice_seats__loader"."assign_start_scope", "slice_seats__loader"."assign_start_step", "slice_seats__loader"."assign_step", "slice_seats__loader"."assign_within", "slice_seats__loader"."assigned", "slice_seats__loader"."built", "slice_seats__loader"."chain_admitted", "slice_seats__loader"."chain_chain_run_input", "slice_seats__loader"."chain_claim", "slice_seats__loader"."chain_done", "slice_seats__loader"."chain_due", "slice_seats__loader"."chain_exhausted", "slice_seats__loader"."chain_failed", "slice_seats__loader"."chain_fenced", "slice_seats__loader"."chain_finish", "slice_seats__loader"."chain_held", "slice_seats__loader"."chain_next", "slice_seats__loader"."chain_ordered_input", "slice_seats__loader"."chain_page_input", "slice_seats__loader"."chain_page_input_after", "slice_seats__loader"."chain_page_output", "slice_seats__loader"."chain_page_output_next", "slice_seats__loader"."chain_page_weights_read", "slice_seats__loader"."chain_refusal", "slice_seats__loader"."chain_result", "slice_seats__loader"."chain_retry", "slice_seats__loader"."chain_root", "slice_seats__loader"."chain_scope", "slice_seats__loader"."chain_skipped", "slice_seats__loader"."chain_start_scope", "slice_seats__loader"."chain_start_step", "slice_seats__loader"."chain_step", "slice_seats__loader"."chain_within", "slice_seats__loader"."copied", "slice_seats__loader"."cursor", "slice_seats__loader"."fan_admitted", "slice_seats__loader"."fan_batch_input", "slice_seats__loader"."fan_claim", "slice_seats__loader"."fan_done", "slice_seats__loader"."fan_due", "slice_seats__loader"."fan_exhausted", "slice_seats__loader"."fan_failed", "slice_seats__loader"."fan_fan_run_input", "slice_seats__loader"."fan_fenced", "slice_seats__loader"."fan_finish", "slice_seats__loader"."fan_held", "slice_seats__loader"."fan_refusal", "slice_seats__loader"."fan_result", "slice_seats__loader"."fan_retry", "slice_seats__loader"."fan_root", "slice_seats__loader"."fan_scope", "slice_seats__loader"."fan_skipped", "slice_seats__loader"."fan_square_input", "slice_seats__loader"."fan_square_output", "slice_seats__loader"."fan_start_scope", "slice_seats__loader"."fan_start_step", "slice_seats__loader"."fan_step", "slice_seats__loader"."fan_within", "slice_seats__loader"."item", "slice_seats__loader"."order", "slice_seats__loader"."passage", "slice_seats__loader"."retry_admitted", "slice_seats__loader"."retry_brittle_input", "slice_seats__loader"."retry_brittle_output", "slice_seats__loader"."retry_claim", "slice_seats__loader"."retry_done", "slice_seats__loader"."retry_due", "slice_seats__loader"."retry_exhausted", "slice_seats__loader"."retry_failed", "slice_seats__loader"."retry_fenced", "slice_seats__loader"."retry_finish", "slice_seats__loader"."retry_held", "slice_seats__loader"."retry_ladders_input", "slice_seats__loader"."retry_refusal", "slice_seats__loader"."retry_result", "slice_seats__loader"."retry_retry", "slice_seats__loader"."retry_root", "slice_seats__loader"."retry_scope", "slice_seats__loader"."retry_skipped", "slice_seats__loader"."retry_start_scope", "slice_seats__loader"."retry_start_step", "slice_seats__loader"."retry_steadfast_input", "slice_seats__loader"."retry_steadfast_output", "slice_seats__loader"."retry_step", "slice_seats__loader"."retry_within", "slice_seats__loader"."seen", "slice_seats__loader"."settled", "slice_seats__loader"."sync_admitted", "slice_seats__loader"."sync_build_input", "slice_seats__loader"."sync_build_output", "slice_seats__loader"."sync_claim", "slice_seats__loader"."sync_copy_input", "slice_seats__loader"."sync_copy_output", "slice_seats__loader"."sync_done", "slice_seats__loader"."sync_due", "slice_seats__loader"."sync_exclusive_key", "slice_seats__loader"."sync_exhausted", "slice_seats__loader"."sync_failed", "slice_seats__loader"."sync_fenced", "slice_seats__loader"."sync_finish", "slice_seats__loader"."sync_gold_input", "slice_seats__loader"."sync_held", "slice_seats__loader"."sync_refusal", "slice_seats__loader"."sync_result", "slice_seats__loader"."sync_retry", "slice_seats__loader"."sync_root", "slice_seats__loader"."sync_scope", "slice_seats__loader"."sync_skipped", "slice_seats__loader"."sync_start_scope", "slice_seats__loader"."sync_start_step", "slice_seats__loader"."sync_step", "slice_seats__loader"."sync_sync_run_input", "slice_seats__loader"."sync_within", "slice_seats__loader"."tally", "slice_seats__loader"."weight", "slice_seats__assign_coordinator"."assign_paused", "slice_seats__assign_coordinator"."assign_resumed", "slice_seats__assign_den"."assign_admitted", "slice_seats__assign_den"."assign_assignment_input", "slice_seats__assign_den"."assign_claim", "slice_seats__assign_den"."assign_decide_input", "slice_seats__assign_den"."assign_decide_nearest_read", "slice_seats__assign_den"."assign_decide_output", "slice_seats__assign_den"."assign_decide_output_chosen", "slice_seats__assign_den"."assign_decide_seen_read", "slice_seats__assign_den"."assign_done", "slice_seats__assign_den"."assign_due", "slice_seats__assign_den"."assign_exhausted", "slice_seats__assign_den"."assign_failed", "slice_seats__assign_den"."assign_fenced", "slice_seats__assign_den"."assign_finish", "slice_seats__assign_den"."assign_held", "slice_seats__assign_den"."assign_refusal", "slice_seats__assign_den"."assign_result", "slice_seats__assign_den"."assign_retry", "slice_seats__assign_den"."assign_root", "slice_seats__assign_den"."assign_scope", "slice_seats__assign_den"."assign_skipped", "slice_seats__assign_den"."assign_start_scope", "slice_seats__assign_den"."assign_start_step", "slice_seats__assign_den"."assign_step", "slice_seats__assign_den"."assign_within", "slice_seats__chain_coordinator"."chain_paused", "slice_seats__chain_coordinator"."chain_resumed", "slice_seats__chain_den"."chain_admitted", "slice_seats__chain_den"."chain_chain_run_input", "slice_seats__chain_den"."chain_claim", "slice_seats__chain_den"."chain_done", "slice_seats__chain_den"."chain_due", "slice_seats__chain_den"."chain_exhausted", "slice_seats__chain_den"."chain_failed", "slice_seats__chain_den"."chain_fenced", "slice_seats__chain_den"."chain_finish", "slice_seats__chain_den"."chain_held", "slice_seats__chain_den"."chain_next", "slice_seats__chain_den"."chain_ordered_input", "slice_seats__chain_den"."chain_page_input", "slice_seats__chain_den"."chain_page_input_after", "slice_seats__chain_den"."chain_page_output", "slice_seats__chain_den"."chain_page_output_next", "slice_seats__chain_den"."chain_page_weights_read", "slice_seats__chain_den"."chain_refusal", "slice_seats__chain_den"."chain_result", "slice_seats__chain_den"."chain_retry", "slice_seats__chain_den"."chain_root", "slice_seats__chain_den"."chain_scope", "slice_seats__chain_den"."chain_skipped", "slice_seats__chain_den"."chain_start_scope", "slice_seats__chain_den"."chain_start_step", "slice_seats__chain_den"."chain_step", "slice_seats__chain_den"."chain_within", "slice_seats__fan_coordinator"."fan_freed", "slice_seats__fan_coordinator"."fan_hold", "slice_seats__fan_coordinator"."fan_live", "slice_seats__fan_coordinator"."fan_paused", "slice_seats__fan_coordinator"."fan_resumed", "slice_seats__fan_den"."fan_admitted", "slice_seats__fan_den"."fan_batch_input", "slice_seats__fan_den"."fan_claim", "slice_seats__fan_den"."fan_done", "slice_seats__fan_den"."fan_due", "slice_seats__fan_den"."fan_exhausted", "slice_seats__fan_den"."fan_failed", "slice_seats__fan_den"."fan_fan_run_input", "slice_seats__fan_den"."fan_fenced", "slice_seats__fan_den"."fan_finish", "slice_seats__fan_den"."fan_held", "slice_seats__fan_den"."fan_refusal", "slice_seats__fan_den"."fan_result", "slice_seats__fan_den"."fan_retry", "slice_seats__fan_den"."fan_root", "slice_seats__fan_den"."fan_scope", "slice_seats__fan_den"."fan_skipped", "slice_seats__fan_den"."fan_square_input", "slice_seats__fan_den"."fan_square_output", "slice_seats__fan_den"."fan_start_scope", "slice_seats__fan_den"."fan_start_step", "slice_seats__fan_den"."fan_step", "slice_seats__fan_den"."fan_within", "slice_seats__retry_coordinator"."retry_paused", "slice_seats__retry_coordinator"."retry_resumed", "slice_seats__retry_den"."retry_admitted", "slice_seats__retry_den"."retry_brittle_input", "slice_seats__retry_den"."retry_brittle_output", "slice_seats__retry_den"."retry_claim", "slice_seats__retry_den"."retry_done", "slice_seats__retry_den"."retry_due", "slice_seats__retry_den"."retry_exhausted", "slice_seats__retry_den"."retry_failed", "slice_seats__retry_den"."retry_fenced", "slice_seats__retry_den"."retry_finish", "slice_seats__retry_den"."retry_held", "slice_seats__retry_den"."retry_ladders_input", "slice_seats__retry_den"."retry_refusal", "slice_seats__retry_den"."retry_result", "slice_seats__retry_den"."retry_retry", "slice_seats__retry_den"."retry_root", "slice_seats__retry_den"."retry_scope", "slice_seats__retry_den"."retry_skipped", "slice_seats__retry_den"."retry_start_scope", "slice_seats__retry_den"."retry_start_step", "slice_seats__retry_den"."retry_steadfast_input", "slice_seats__retry_den"."retry_steadfast_output", "slice_seats__retry_den"."retry_step", "slice_seats__retry_den"."retry_within", "slice_seats__sync_coordinator"."sync_exclusive", "slice_seats__sync_coordinator"."sync_paused", "slice_seats__sync_coordinator"."sync_released", "slice_seats__sync_coordinator"."sync_resumed", "slice_seats__sync_den"."chain_result", "slice_seats__sync_den"."chain_step", "slice_seats__sync_den"."sync_admitted", "slice_seats__sync_den"."sync_build_input", "slice_seats__sync_den"."sync_build_output", "slice_seats__sync_den"."sync_claim", "slice_seats__sync_den"."sync_copy_input", "slice_seats__sync_den"."sync_copy_output", "slice_seats__sync_den"."sync_done", "slice_seats__sync_den"."sync_due", "slice_seats__sync_den"."sync_exclusive_key", "slice_seats__sync_den"."sync_exhausted", "slice_seats__sync_den"."sync_failed", "slice_seats__sync_den"."sync_fenced", "slice_seats__sync_den"."sync_finish", "slice_seats__sync_den"."sync_gold_input", "slice_seats__sync_den"."sync_held", "slice_seats__sync_den"."sync_refusal", "slice_seats__sync_den"."sync_result", "slice_seats__sync_den"."sync_retry", "slice_seats__sync_den"."sync_root", "slice_seats__sync_den"."sync_scope", "slice_seats__sync_den"."sync_skipped", "slice_seats__sync_den"."sync_start_scope", "slice_seats__sync_den"."sync_start_step", "slice_seats__sync_den"."sync_step", "slice_seats__sync_den"."sync_sync_run_input", "slice_seats__sync_den"."sync_within" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."assign_join", "slice"."assign_kind", "slice"."assign_outcome", "slice"."assign_pausable", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph", "slice"."__param_topic_q7i3hfsnkd", "slice"."__param_learner_um3dilfdml" FROM PUBLIC;

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

COMMENT ON FUNCTION "slice"."__assign_join_names_cks63qswdh"() IS 'names of roster AssignJoin (1c3fe9c5114875213e61eef4023fbb27b30c5ca204b84f617d53b3a1262d2815)';

COMMENT ON FUNCTION "slice"."__assign_kind_names_nlpfxx2ign"() IS 'names of roster AssignKind (531974a530ab8dec7d7ae6f3a9a7049fbcc50f5f1a7fd5d289940b2b1abe7012)';

COMMENT ON FUNCTION "slice"."__assign_outcome_names_2mccfiah6k"() IS 'names of roster AssignOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__assign_pausable_names_r7pjdx7o42"() IS 'names of roster AssignPausable (1c3fe9c5114875213e61eef4023fbb27b30c5ca204b84f617d53b3a1262d2815)';

COMMENT ON DOMAIN "slice"."__param_learner_um3dilfdml" IS 'pattern domain of parameter learner of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON DOMAIN "slice"."__param_topic_q7i3hfsnkd" IS 'pattern domain of parameter topic of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" ON "slice"."assign_admitted" IS 'primary key of AssignAdmitted';

COMMENT ON CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" ON "slice"."assign_assignment_input" IS 'primary key of AssignAssignmentInput';

COMMENT ON CONSTRAINT "__assign_assignment_input_norm_near_mrcc7bgzvm" ON "slice"."assign_assignment_input" IS 'cosine norm check of AssignAssignmentInput.near';

COMMENT ON CONSTRAINT "__assign_claim_pk_gy4yhzk2me" ON "slice"."assign_claim" IS 'primary key of AssignClaim';

COMMENT ON CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" ON "slice"."assign_decide_input" IS 'primary key of AssignDecideInput';

COMMENT ON CONSTRAINT "__assign_decide_input_norm_near_5yrl3p3qsu" ON "slice"."assign_decide_input" IS 'cosine norm check of AssignDecideInput.near';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_pk_jc4zqvfwss" ON "slice"."assign_decide_nearest_read" IS 'primary key of AssignDecideNearestRead';

COMMENT ON CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" ON "slice"."assign_decide_output" IS 'primary key of AssignDecideOutput';

COMMENT ON CONSTRAINT "__assign_decide_output_chosen_pk_iwcppigpd6" ON "slice"."assign_decide_output_chosen" IS 'primary key of AssignDecideOutputChosen';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_pk_sczf2f7gz7" ON "slice"."assign_decide_seen_read" IS 'primary key of AssignDecideSeenRead';

COMMENT ON CONSTRAINT "__assign_done_pk_gzil7jvxpz" ON "slice"."assign_done" IS 'primary key of AssignDone';

COMMENT ON CONSTRAINT "__assign_due_pk_mgahvzt6eh" ON "slice"."assign_due" IS 'primary key of AssignDue';

COMMENT ON CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" ON "slice"."assign_exhausted" IS 'primary key of AssignExhausted';

COMMENT ON CONSTRAINT "__assign_failed_pk_ygxslcya4o" ON "slice"."assign_failed" IS 'primary key of AssignFailed';

COMMENT ON CONSTRAINT "__assign_fenced_pk_y6jyfviepa" ON "slice"."assign_fenced" IS 'primary key of AssignFenced';

COMMENT ON CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" ON "slice"."assign_finish" IS 'primary key of AssignFinish';

COMMENT ON CONSTRAINT "__assign_finish_key_step_nthyxvagme" ON "slice"."assign_finish" IS 'key AssignFinish(step)';

COMMENT ON CONSTRAINT "__assign_held_pk_by245z7t45" ON "slice"."assign_held" IS 'primary key of AssignHeld';

COMMENT ON CONSTRAINT "__assign_paused_pk_ulo4grv4e2" ON "slice"."assign_paused" IS 'primary key of AssignPaused';

COMMENT ON CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" ON "slice"."assign_refusal" IS 'primary key of AssignRefusal';

COMMENT ON CONSTRAINT "__assign_result_pk_i2yxmpkyzr" ON "slice"."assign_result" IS 'primary key of AssignResult';

COMMENT ON CONSTRAINT "__assign_result_key_step_outcome_4i7igve5uz" ON "slice"."assign_result" IS 'key AssignResult(step, outcome)';

COMMENT ON CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" ON "slice"."assign_resumed" IS 'primary key of AssignResumed';

COMMENT ON CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" ON "slice"."assign_retry" IS 'primary key of AssignRetry';

COMMENT ON CONSTRAINT "__assign_root_pk_b23qqyryx4" ON "slice"."assign_root" IS 'primary key of AssignRoot';

COMMENT ON CONSTRAINT "__assign_scope_pk_xytntbncid" ON "slice"."assign_scope" IS 'primary key of AssignScope';

COMMENT ON CONSTRAINT "__assign_scope_key_scope_kind_vvjb4nuh5r" ON "slice"."assign_scope" IS 'key AssignScope(scope, kind)';

COMMENT ON CONSTRAINT "__assign_skipped_pk_5qhgbueof7" ON "slice"."assign_skipped" IS 'primary key of AssignSkipped';

COMMENT ON CONSTRAINT "__assign_start_scope_pk_ldqdb5b25z" ON "slice"."assign_start_scope" IS 'primary key of AssignStartScope';

COMMENT ON CONSTRAINT "__assign_start_scope_key_child_hlw5b67j2d" ON "slice"."assign_start_scope" IS 'key AssignStartScope(child)';

COMMENT ON CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" ON "slice"."assign_start_step" IS 'primary key of AssignStartStep';

COMMENT ON CONSTRAINT "__assign_start_step_key_step_b3r7vmxqkm" ON "slice"."assign_start_step" IS 'key AssignStartStep(step)';

COMMENT ON CONSTRAINT "__assign_step_pk_2oc4ehvfzd" ON "slice"."assign_step" IS 'primary key of AssignStep';

COMMENT ON CONSTRAINT "__assign_step_key_step_kind_5vttbbv3md" ON "slice"."assign_step" IS 'key AssignStep(step, kind)';

COMMENT ON CONSTRAINT "__assign_within_pk_vvbm6qryed" ON "slice"."assign_within" IS 'primary key of AssignWithin';

COMMENT ON CONSTRAINT "__assigned_pk_72xowecbf7" ON "slice"."assigned" IS 'primary key of Assigned';

COMMENT ON CONSTRAINT "__chain_page_weights_read_pk_mvr5jc4gry" ON "slice"."chain_page_weights_read" IS 'primary key of ChainPageWeightsRead';

COMMENT ON CONSTRAINT "__passage_pk_kayjlxd3gv" ON "slice"."passage" IS 'primary key of Passage';

COMMENT ON CONSTRAINT "__passage_norm_embedding_d2siyt575a" ON "slice"."passage" IS 'cosine norm check of Passage.embedding';

COMMENT ON CONSTRAINT "__seen_pk_g4ptcxwowb" ON "slice"."seen" IS 'primary key of Seen';

COMMENT ON COLUMN "slice"."assign_assignment_input"."__tag_kind_assignment_iybfg5upmr" IS 'tag AssignScope.kind = Assignment';

COMMENT ON COLUMN "slice"."assign_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."assign_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."assign_decide_input"."__tag_kind_decide_ggginylxcj" IS 'tag AssignStep.kind = Decide';

COMMENT ON COLUMN "slice"."assign_done"."__tag_outcome_done_3n46zakkk3" IS 'tag AssignResult.outcome = done';

COMMENT ON COLUMN "slice"."assign_failed"."__tag_outcome_failed_bxttnpdkga" IS 'tag AssignResult.outcome = failed';

COMMENT ON COLUMN "slice"."assign_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON CONSTRAINT "__assign_admitted_fk_scope_vfepaqjqyi" ON "slice"."assign_admitted" IS 'foreign key AssignAdmitted(scope) to AssignScope(scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_fk_scope_tag_kind_4hflxzmwtj" ON "slice"."assign_assignment_input" IS 'foreign key AssignAssignmentInput(scope, tag AssignScope.kind = Assignment) to AssignScope(scope, kind)';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_4p6buiqtrc" ON "slice"."assign_claim" IS 'foreign key AssignClaim(step) to AssignStep(step)';

COMMENT ON CONSTRAINT "__assign_claim_fk_step_pred_attempt_2byinvx4o3" ON "slice"."assign_claim" IS 'foreign key AssignClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to AssignClaim(step, attempt)';

COMMENT ON CONSTRAINT "__assign_decide_input_fk_step_tag_kind_decide_xsqmsuqet4" ON "slice"."assign_decide_input" IS 'foreign key AssignDecideInput(step, tag AssignStep.kind = Decide) to AssignStep(step, kind)';

COMMENT ON CONSTRAINT "__assign_decide_nearest_read_fk_step_ahvahshsfy" ON "slice"."assign_decide_nearest_read" IS 'foreign key AssignDecideNearestRead(step) to AssignResult(step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_uegzp2ojlf" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step) to AssignDecideInput(step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fk_step_6birgjscft" ON "slice"."assign_decide_output" IS 'foreign key AssignDecideOutput(step) to AssignDone(step)';

COMMENT ON CONSTRAINT "__assign_decide_output_chosen_fk_step_khpc4l7ijm" ON "slice"."assign_decide_output_chosen" IS 'foreign key AssignDecideOutputChosen(step) to AssignDecideOutput(step)';

COMMENT ON CONSTRAINT "__assign_decide_seen_read_fk_step_xfllym5krc" ON "slice"."assign_decide_seen_read" IS 'foreign key AssignDecideSeenRead(step) to AssignResult(step)';

COMMENT ON CONSTRAINT "__assign_done_fk_step_tag_outcome_done_e5hddkaj3g" ON "slice"."assign_done" IS 'foreign key AssignDone(step, tag AssignResult.outcome = done) to AssignResult(step, outcome)';

COMMENT ON CONSTRAINT "__assign_due_fk_step_dbtohril7u" ON "slice"."assign_due" IS 'foreign key AssignDue(step) to AssignStep(step)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_step_cxx7syotgn" ON "slice"."assign_exhausted" IS 'foreign key AssignExhausted(step) to AssignFailed(step)';

COMMENT ON CONSTRAINT "__assign_failed_fk_step_tag_outcome_failed_rzgbd4gb37" ON "slice"."assign_failed" IS 'foreign key AssignFailed(step, tag AssignResult.outcome = failed) to AssignResult(step, outcome)';

COMMENT ON CONSTRAINT "__assign_fenced_fk_step_attempt_2rttvkznpl" ON "slice"."assign_fenced" IS 'foreign key AssignFenced(step, attempt) to AssignClaim(step, attempt)';

COMMENT ON CONSTRAINT "__assign_finish_fk_scope_dics3axamv" ON "slice"."assign_finish" IS 'foreign key AssignFinish(scope) to AssignAdmitted(scope)';

COMMENT ON CONSTRAINT "__assign_finish_fk_step_i3ke2hxa66" ON "slice"."assign_finish" IS 'foreign key AssignFinish(step) to AssignStep(step)';

COMMENT ON CONSTRAINT "__assign_held_fk_step_ww2k5nnc4c" ON "slice"."assign_held" IS 'foreign key AssignHeld(step) to AssignResult(step)';

COMMENT ON CONSTRAINT "__assign_held_fk_step_attempt_fklmb2xym3" ON "slice"."assign_held" IS 'foreign key AssignHeld(step, attempt) to AssignClaim(step, attempt)';

COMMENT ON CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" ON "slice"."assign_paused" IS 'foreign key AssignPaused(target, pred(turn)) to AssignResumed(target, turn)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_step_aqlyzlq3fc" ON "slice"."assign_refusal" IS 'foreign key AssignRefusal(step) to AssignFailed(step)';

COMMENT ON CONSTRAINT "__assign_result_fk_step_4pnas55m6w" ON "slice"."assign_result" IS 'foreign key AssignResult(step) to AssignStep(step)';

COMMENT ON CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" ON "slice"."assign_resumed" IS 'foreign key AssignResumed(target, turn) to AssignPaused(target, turn)';

COMMENT ON CONSTRAINT "__assign_retry_fk_step_attempt_benkemwswa" ON "slice"."assign_retry" IS 'foreign key AssignRetry(step, attempt) to AssignClaim(step, attempt)';

COMMENT ON CONSTRAINT "__assign_root_fk_scope_344txuecsh" ON "slice"."assign_root" IS 'foreign key AssignRoot(scope) to AssignScope(scope)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_by_wh4scgpwln" ON "slice"."assign_skipped" IS 'foreign key AssignSkipped(by) to AssignAdmitted(scope)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_scope_6ks53lak4r" ON "slice"."assign_skipped" IS 'foreign key AssignSkipped(scope) to AssignRoot(scope)';

COMMENT ON CONSTRAINT "__assign_start_scope_fk_child_niiue7y5lb" ON "slice"."assign_start_scope" IS 'foreign key AssignStartScope(child) to AssignScope(scope)';

COMMENT ON CONSTRAINT "__assign_start_scope_fk_scope_rpodhhkcp6" ON "slice"."assign_start_scope" IS 'foreign key AssignStartScope(scope) to AssignAdmitted(scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_scope_qt2dm2vnjb" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(scope) to AssignAdmitted(scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_step_2sej5uze4v" ON "slice"."assign_start_step" IS 'foreign key AssignStartStep(step) to AssignStep(step)';

COMMENT ON CONSTRAINT "__assign_step_fk_scope_gkjcwbwjuf" ON "slice"."assign_step" IS 'foreign key AssignStep(scope) to AssignAdmitted(scope)';

COMMENT ON CONSTRAINT "__assign_within_fk_parent_kq5ksmcoez" ON "slice"."assign_within" IS 'foreign key AssignWithin(parent) to AssignScope(scope)';

COMMENT ON CONSTRAINT "__assign_within_fk_scope_2yvr2lbtxd" ON "slice"."assign_within" IS 'foreign key AssignWithin(scope) to AssignScope(scope)';

COMMENT ON CONSTRAINT "__chain_page_weights_read_fk_step_gpovo4cp33" ON "slice"."chain_page_weights_read" IS 'foreign key ChainPageWeightsRead(step) to ChainResult(step)';

COMMENT ON INDEX "slice"."__assign_claim_ix_step_fxyms_236_d_4_pred_attempt_x24ydo4nq6" IS 'btree index AssignClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox)';

COMMENT ON INDEX "slice"."__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" IS 'btree index AssignPaused(target, __pred_turn_qryngij6c4)';

COMMENT ON INDEX "slice"."__assign_skipped_ix_by_phe5rdziqg" IS 'btree index AssignSkipped(by)';

COMMENT ON INDEX "slice"."__assign_step_ix_scope_kind_4jyx7qz4gq" IS 'btree index AssignStep(scope, kind)';

COMMENT ON INDEX "slice"."__assign_within_ix_parent_pf64og3aei" IS 'btree index AssignWithin(parent)';

COMMENT ON INDEX "slice"."__passage_ix_topic_lzh6djzwn4" IS 'btree index Passage(topic)';

COMMENT ON INDEX "slice"."__passage_ix_embedding_ujugi77ft2" IS 'hnsw index Passage(embedding vectorCosine)';

COMMENT ON STATISTICS "slice"."__assign_step_stats_kind_scope_wiztsdmmtf" IS 'statistics AssignStep(kind, scope)';
