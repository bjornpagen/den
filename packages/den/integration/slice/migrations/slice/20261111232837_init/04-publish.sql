CREATE PUBLICATION "__live_slice_wzkq6p2yii"
  FOR TABLE "slice"."audit" ("step"), "slice"."chain_chain_run_input" ("scope"), "slice"."chain_claim" ("step", "attempt"), "slice"."chain_finish" ("scope"), "slice"."chain_held" ("step"), "slice"."chain_page_input" ("step"), "slice"."chain_page_input_after" ("step"), "slice"."chain_page_output" ("step"), "slice"."chain_page_output_next" ("step"), "slice"."chain_result" ("step"), "slice"."chain_scope" ("scope"), "slice"."chain_step", "slice"."chain_within", "slice"."cursor" ("feed", "position"), "slice"."fan_batch_input" ("scope"), "slice"."fan_claim" ("step", "attempt"), "slice"."fan_fan_run_input" ("scope"), "slice"."fan_finish" ("scope"), "slice"."fan_held" ("step"), "slice"."fan_result" ("step"), "slice"."fan_scope" ("scope"), "slice"."fan_square_input" ("step"), "slice"."fan_square_output" ("step"), "slice"."fan_step", "slice"."fan_within", "slice"."item" ("feed", "seq", "n"), "slice"."settled" ("batch"), "slice"."tally" ("batch")
  WITH (publish = 'insert, update, delete, truncate', publish_generated_columns = stored);

CREATE ROLE :"slice__app" LOGIN NOINHERIT;

CREATE ROLE :"slice__auditor" NOLOGIN;

CREATE ROLE :"slice__chain_worker" NOLOGIN;

CREATE ROLE :"slice__fan_worker" NOLOGIN;

CREATE ROLE :"slice__worker" LOGIN NOINHERIT;

CREATE ROLE :"__live_slice_wzkq6p2yii" LOGIN NOINHERIT;

CREATE SCHEMA "slice__auditor";

CREATE SCHEMA "slice__chain_worker";

CREATE SCHEMA "slice__fan_worker";

CREATE VIEW "slice__auditor"."audit" ("step", "note") AS
SELECT "r1"."step", "r1"."note"
FROM "slice"."audit" AS "r1";

CREATE VIEW "slice__auditor"."chain_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice__auditor"."chain_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice__auditor"."chain_page_output" ("step", "seq", "items") AS
SELECT "r1"."step", "r1"."seq", "r1"."items"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice__auditor"."chain_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice__auditor"."chain_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_zria4jypsm"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice__auditor"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "slice__auditor"."fan_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice__auditor"."fan_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice__auditor"."fan_square_output" ("step", "square") AS
SELECT "r1"."step", "r1"."square"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice__auditor"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "slice__auditor"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "slice__auditor"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."chain_exhausted" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."chain_held" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_next" ("from", "ordinal", "to") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_page_input_after" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_page_output" ("step", "seq", "items") AS
SELECT "r1"."step", "r1"."seq", "r1"."items"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_page_output_next" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."chain_refusal" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_root" ("scope", "key") AS
SELECT "r1"."scope", "r1"."key"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_join_names_mqsumlsj56"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."chain_start_scope" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_zria4jypsm"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice__chain_worker"."chain_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."chain_within" AS "r1";

CREATE VIEW "slice__chain_worker"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "slice__chain_worker"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_batch_input" ("scope", "batch", "size") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."fan_claim" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."fan_exhausted" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_fan_run_input" ("scope", "batch", "size") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."fan_held" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."fan_refusal" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_root" ("scope", "key") AS
SELECT "r1"."scope", "r1"."key"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_join_names_gct5lzhdqo"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."fan_scope" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_square_input" ("step", "batch", "n") AS
SELECT "r1"."step", "r1"."batch", "r1"."n"
FROM "slice"."fan_square_input" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_square_output" ("step", "square") AS
SELECT "r1"."step", "r1"."square"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."fan_start_scope" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."fan_start_step" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_gikh2fxf2t"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice__fan_worker"."fan_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice__fan_worker"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "slice__fan_worker"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

GRANT :"slice__auditor" TO :"slice__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__chain_worker" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__fan_worker" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT USAGE ON SCHEMA "slice" TO :"slice__app";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice__app";

GRANT SELECT ON TABLE "slice"."__live_secret" TO :"slice__app";

GRANT USAGE ON SCHEMA "slice", "slice__auditor" TO :"slice__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_kind", "slice"."chain_outcome", "slice"."fan_outcome", "slice"."feed", "slice"."__text_t4rwovzmqj" TO :"slice__auditor";

GRANT SELECT ON TABLE "slice__auditor"."audit", "slice__auditor"."chain_claim", "slice__auditor"."chain_finish", "slice__auditor"."chain_page_output", "slice__auditor"."chain_result", "slice__auditor"."chain_step", "slice__auditor"."cursor", "slice__auditor"."fan_finish", "slice__auditor"."fan_result", "slice__auditor"."fan_square_output", "slice__auditor"."item", "slice__auditor"."settled", "slice__auditor"."tally" TO :"slice__auditor";

GRANT SELECT, INSERT ON TABLE "slice"."audit" TO :"slice__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__chain_kind_names_zria4jypsm"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"() TO :"slice__auditor";

GRANT USAGE ON SCHEMA "slice", "slice__chain_worker" TO :"slice__chain_worker";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."feed" TO :"slice__chain_worker";

GRANT SELECT ON TABLE "slice__chain_worker"."chain_chain_run_input", "slice__chain_worker"."chain_claim", "slice__chain_worker"."chain_exhausted", "slice__chain_worker"."chain_finish", "slice__chain_worker"."chain_held", "slice__chain_worker"."chain_next", "slice__chain_worker"."chain_page_input", "slice__chain_worker"."chain_page_input_after", "slice__chain_worker"."chain_page_output", "slice__chain_worker"."chain_page_output_next", "slice__chain_worker"."chain_refusal", "slice__chain_worker"."chain_result", "slice__chain_worker"."chain_root", "slice__chain_worker"."chain_scope", "slice__chain_worker"."chain_start_scope", "slice__chain_worker"."chain_start_step", "slice__chain_worker"."chain_step", "slice__chain_worker"."chain_within", "slice__chain_worker"."cursor", "slice__chain_worker"."item" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_chain_run_input" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_claim" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_exhausted" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_finish" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_held" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_next" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input_after" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output_next" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_refusal" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_result" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_root" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_scope" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_scope" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_step" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_step" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."chain_within" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."cursor" TO :"slice__chain_worker";

GRANT SELECT, INSERT ON TABLE "slice"."item" TO :"slice__chain_worker";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__chain_worker";

GRANT EXECUTE ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_mqsumlsj56"(), "slice"."__chain_kind_names_zria4jypsm"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__feed_names_azjbqebc6i"() TO :"slice__chain_worker";

GRANT USAGE ON SCHEMA "slice", "slice__fan_worker" TO :"slice__fan_worker";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."__text_t4rwovzmqj" TO :"slice__fan_worker";

GRANT SELECT ON TABLE "slice__fan_worker"."fan_batch_input", "slice__fan_worker"."fan_claim", "slice__fan_worker"."fan_exhausted", "slice__fan_worker"."fan_fan_run_input", "slice__fan_worker"."fan_finish", "slice__fan_worker"."fan_held", "slice__fan_worker"."fan_refusal", "slice__fan_worker"."fan_result", "slice__fan_worker"."fan_root", "slice__fan_worker"."fan_scope", "slice__fan_worker"."fan_square_input", "slice__fan_worker"."fan_square_output", "slice__fan_worker"."fan_start_scope", "slice__fan_worker"."fan_start_step", "slice__fan_worker"."fan_step", "slice__fan_worker"."fan_within", "slice__fan_worker"."settled", "slice__fan_worker"."tally" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_batch_input" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_claim" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_exhausted" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fan_run_input" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_finish" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_held" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_refusal" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_result" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_root" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_scope" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_square_input" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_square_output" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_start_scope" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_start_step" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_step" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."fan_within" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."settled" TO :"slice__fan_worker";

GRANT SELECT, INSERT ON TABLE "slice"."tally" TO :"slice__fan_worker";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__fan_worker";

GRANT EXECUTE ON FUNCTION "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"() TO :"slice__fan_worker";

GRANT USAGE ON SCHEMA "slice" TO :"slice__worker";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice__worker";

GRANT SELECT ON TABLE "slice"."__live_secret" TO :"slice__worker";

GRANT SELECT ON TABLE "slice"."__live_secret" TO :"__live_slice_wzkq6p2yii";

GRANT SELECT ON TABLE "slice"."__ledger" TO :"slice__app", :"slice__worker";

ALTER ROLE :"slice__app" SET search_path = "pg_catalog", "pg_temp";

ALTER ROLE :"slice__app" SET extra_float_digits = '1';

ALTER ROLE :"slice__app" SET DateStyle = 'ISO, YMD';

ALTER ROLE :"slice__app" SET bytea_output = 'hex';

ALTER ROLE :"slice__app" SET lc_monetary = 'C.UTF-8';

ALTER ROLE :"slice__app" SET lc_numeric = 'C.UTF-8';

ALTER ROLE :"slice__app" SET lc_time = 'C.UTF-8';

ALTER ROLE :"slice__worker" SET search_path = "pg_catalog", "pg_temp";

ALTER ROLE :"slice__worker" SET extra_float_digits = '1';

ALTER ROLE :"slice__worker" SET DateStyle = 'ISO, YMD';

ALTER ROLE :"slice__worker" SET bytea_output = 'hex';

ALTER ROLE :"slice__worker" SET lc_monetary = 'C.UTF-8';

ALTER ROLE :"slice__worker" SET lc_numeric = 'C.UTF-8';

ALTER ROLE :"slice__worker" SET lc_time = 'C.UTF-8';

REVOKE ALL ON SCHEMA "slice", "slice__auditor", "slice__chain_worker", "slice__fan_worker" FROM PUBLIC;

REVOKE ALL ON TABLE "slice"."audit", "slice"."chain_chain_run_input", "slice"."chain_claim", "slice"."chain_exhausted", "slice"."chain_finish", "slice"."chain_held", "slice"."chain_next", "slice"."chain_page_input", "slice"."chain_page_input_after", "slice"."chain_page_output", "slice"."chain_page_output_next", "slice"."chain_refusal", "slice"."chain_result", "slice"."chain_root", "slice"."chain_scope", "slice"."chain_start_scope", "slice"."chain_start_step", "slice"."chain_step", "slice"."chain_within", "slice"."cursor", "slice"."fan_batch_input", "slice"."fan_claim", "slice"."fan_exhausted", "slice"."fan_fan_run_input", "slice"."fan_finish", "slice"."fan_held", "slice"."fan_refusal", "slice"."fan_result", "slice"."fan_root", "slice"."fan_scope", "slice"."fan_square_input", "slice"."fan_square_output", "slice"."fan_start_scope", "slice"."fan_start_step", "slice"."fan_step", "slice"."fan_within", "slice"."item", "slice"."settled", "slice"."tally", "slice__auditor"."audit", "slice__auditor"."chain_claim", "slice__auditor"."chain_finish", "slice__auditor"."chain_page_output", "slice__auditor"."chain_result", "slice__auditor"."chain_step", "slice__auditor"."cursor", "slice__auditor"."fan_finish", "slice__auditor"."fan_result", "slice__auditor"."fan_square_output", "slice__auditor"."item", "slice__auditor"."settled", "slice__auditor"."tally", "slice__chain_worker"."chain_chain_run_input", "slice__chain_worker"."chain_claim", "slice__chain_worker"."chain_exhausted", "slice__chain_worker"."chain_finish", "slice__chain_worker"."chain_held", "slice__chain_worker"."chain_next", "slice__chain_worker"."chain_page_input", "slice__chain_worker"."chain_page_input_after", "slice__chain_worker"."chain_page_output", "slice__chain_worker"."chain_page_output_next", "slice__chain_worker"."chain_refusal", "slice__chain_worker"."chain_result", "slice__chain_worker"."chain_root", "slice__chain_worker"."chain_scope", "slice__chain_worker"."chain_start_scope", "slice__chain_worker"."chain_start_step", "slice__chain_worker"."chain_step", "slice__chain_worker"."chain_within", "slice__chain_worker"."cursor", "slice__chain_worker"."item", "slice__fan_worker"."fan_batch_input", "slice__fan_worker"."fan_claim", "slice__fan_worker"."fan_exhausted", "slice__fan_worker"."fan_fan_run_input", "slice__fan_worker"."fan_finish", "slice__fan_worker"."fan_held", "slice__fan_worker"."fan_refusal", "slice__fan_worker"."fan_result", "slice__fan_worker"."fan_root", "slice__fan_worker"."fan_scope", "slice__fan_worker"."fan_square_input", "slice__fan_worker"."fan_square_output", "slice__fan_worker"."fan_start_scope", "slice__fan_worker"."fan_start_step", "slice__fan_worker"."fan_step", "slice__fan_worker"."fan_within", "slice__fan_worker"."settled", "slice__fan_worker"."tally" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."__text_t4rwovzmqj", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph" FROM PUBLIC;

ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON TABLES FROM PUBLIC;

ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON SEQUENCES FROM PUBLIC;

ALTER DEFAULT PRIVILEGES REVOKE ALL ON FUNCTIONS FROM PUBLIC;

ALTER DEFAULT PRIVILEGES REVOKE ALL ON TYPES FROM PUBLIC;

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() IS 'names of roster ChainChainRunInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_join_names_mqsumlsj56"() IS 'names of roster ChainJoin (f57d228506d313bedb0e4c8357d4e9e6a1849f6fa5ef27f839558c9f095bd414)';

COMMENT ON FUNCTION "slice"."__chain_kind_names_zria4jypsm"() IS 'names of roster ChainKind (ec9d69d76e6f60da7b7610968bd1d99b5e7db6567321f298268f040e4caaf1e8)';

COMMENT ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() IS 'names of roster ChainOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() IS 'names of roster ChainPageInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__fan_join_names_gct5lzhdqo"() IS 'names of roster FanJoin (d77b79d385adc2a7e8acb4e4a4a35cf4e5217428ed007776aefa04ebd4a774fa)';

COMMENT ON FUNCTION "slice"."__fan_kind_names_gikh2fxf2t"() IS 'names of roster FanKind (e9aed98b3893ff20de22383ac3b4ec54f57129936d708100bd0ae678466bbe14)';

COMMENT ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() IS 'names of roster FanOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__feed_names_azjbqebc6i"() IS 'names of roster Feed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON DOMAIN "slice"."__domain_jotafzuj2i" IS 'domain of definition 2bb9f8bcd5ca34ebfde7708e229f30409aad95a1fa4f4398311673f0c0eacec4';

COMMENT ON DOMAIN "slice"."__domain_gfw43vigph" IS 'domain of definition 39922592cedecf769d6df372d6df99e0b82206b0bf6dacd9722d0490f83cc782';

COMMENT ON DOMAIN "slice"."__domain_mxhao3k6ss" IS 'domain of definition be4e1f34160619e14c4a8009e96d1ced7b683a1e169a9e4d0e9e10640701b8aa';

COMMENT ON DOMAIN "slice"."__text_t4rwovzmqj" IS 'text domain of definition 6f5ba169462bdb47db4c56bb5fe21d5091867333e4952f2c20b18e8fa085befc';

COMMENT ON CONSTRAINT "__audit_pk_dcvpvv5cjz" ON "slice"."audit" IS 'primary key of Audit';

COMMENT ON CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" ON "slice"."chain_chain_run_input" IS 'primary key of ChainChainRunInput';

COMMENT ON CONSTRAINT "__chain_claim_pk_nrr2rn3gui" ON "slice"."chain_claim" IS 'primary key of ChainClaim';

COMMENT ON CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" ON "slice"."chain_exhausted" IS 'primary key of ChainExhausted';

COMMENT ON CONSTRAINT "__chain_finish_pk_ebe75jmnzy" ON "slice"."chain_finish" IS 'primary key of ChainFinish';

COMMENT ON CONSTRAINT "__chain_finish_key_step_x7i5pvi5jm" ON "slice"."chain_finish" IS 'key ChainFinish(step)';

COMMENT ON CONSTRAINT "__chain_held_pk_73idl7oo5c" ON "slice"."chain_held" IS 'primary key of ChainHeld';

COMMENT ON CONSTRAINT "__chain_next_pk_qeumlilvtk" ON "slice"."chain_next" IS 'primary key of ChainNext';

COMMENT ON CONSTRAINT "__chain_next_key_to_jqccfs2l4c" ON "slice"."chain_next" IS 'key ChainNext(to)';

COMMENT ON CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" ON "slice"."chain_page_input" IS 'primary key of ChainPageInput';

COMMENT ON CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" ON "slice"."chain_page_input_after" IS 'primary key of ChainPageInputAfter';

COMMENT ON CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" ON "slice"."chain_page_output" IS 'primary key of ChainPageOutput';

COMMENT ON CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" ON "slice"."chain_page_output_next" IS 'primary key of ChainPageOutputNext';

COMMENT ON CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" ON "slice"."chain_refusal" IS 'primary key of ChainRefusal';

COMMENT ON CONSTRAINT "__chain_result_pk_btw3jzlkgl" ON "slice"."chain_result" IS 'primary key of ChainResult';

COMMENT ON CONSTRAINT "__chain_result_key_step_outcome_hqqrqon5z3" ON "slice"."chain_result" IS 'key ChainResult(step, outcome)';

COMMENT ON CONSTRAINT "__chain_root_pk_wqfycdg3x5" ON "slice"."chain_root" IS 'primary key of ChainRoot';

COMMENT ON CONSTRAINT "__chain_scope_pk_fxzt444lf6" ON "slice"."chain_scope" IS 'primary key of ChainScope';

COMMENT ON CONSTRAINT "__chain_scope_key_scope_kind_f3gtwiklfd" ON "slice"."chain_scope" IS 'key ChainScope(scope, kind)';

COMMENT ON CONSTRAINT "__chain_start_scope_pk_t4giphzblt" ON "slice"."chain_start_scope" IS 'primary key of ChainStartScope';

COMMENT ON CONSTRAINT "__chain_start_scope_key_child_h23cre6olg" ON "slice"."chain_start_scope" IS 'key ChainStartScope(child)';

COMMENT ON CONSTRAINT "__chain_start_step_pk_dgda7shxb4" ON "slice"."chain_start_step" IS 'primary key of ChainStartStep';

COMMENT ON CONSTRAINT "__chain_start_step_key_step_ygziyjwk3l" ON "slice"."chain_start_step" IS 'key ChainStartStep(step)';

COMMENT ON CONSTRAINT "__chain_step_pk_u6x5wnvfbv" ON "slice"."chain_step" IS 'primary key of ChainStep';

COMMENT ON CONSTRAINT "__chain_step_key_step_kind_dlshgwdqz2" ON "slice"."chain_step" IS 'key ChainStep(step, kind)';

COMMENT ON CONSTRAINT "__chain_within_pk_ihqzjavdib" ON "slice"."chain_within" IS 'primary key of ChainWithin';

COMMENT ON CONSTRAINT "__cursor_pk_wl2ngqny4j" ON "slice"."cursor" IS 'primary key of Cursor';

COMMENT ON CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" ON "slice"."fan_batch_input" IS 'primary key of FanBatchInput';

COMMENT ON CONSTRAINT "__fan_claim_pk_e7zimqppco" ON "slice"."fan_claim" IS 'primary key of FanClaim';

COMMENT ON CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" ON "slice"."fan_exhausted" IS 'primary key of FanExhausted';

COMMENT ON CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" ON "slice"."fan_fan_run_input" IS 'primary key of FanFanRunInput';

COMMENT ON CONSTRAINT "__fan_finish_pk_6mb33urjra" ON "slice"."fan_finish" IS 'primary key of FanFinish';

COMMENT ON CONSTRAINT "__fan_finish_key_step_v72sacijwp" ON "slice"."fan_finish" IS 'key FanFinish(step)';

COMMENT ON CONSTRAINT "__fan_held_pk_4ic6tjvac4" ON "slice"."fan_held" IS 'primary key of FanHeld';

COMMENT ON CONSTRAINT "__fan_refusal_pk_7va55wo2wj" ON "slice"."fan_refusal" IS 'primary key of FanRefusal';

COMMENT ON CONSTRAINT "__fan_result_pk_yeear352sx" ON "slice"."fan_result" IS 'primary key of FanResult';

COMMENT ON CONSTRAINT "__fan_result_key_step_outcome_5nrb7r22qd" ON "slice"."fan_result" IS 'key FanResult(step, outcome)';

COMMENT ON CONSTRAINT "__fan_root_pk_jesu7xtefn" ON "slice"."fan_root" IS 'primary key of FanRoot';

COMMENT ON CONSTRAINT "__fan_scope_pk_7bvjfihnef" ON "slice"."fan_scope" IS 'primary key of FanScope';

COMMENT ON CONSTRAINT "__fan_scope_key_scope_kind_epdwnzjh52" ON "slice"."fan_scope" IS 'key FanScope(scope, kind)';

COMMENT ON CONSTRAINT "__fan_square_input_pk_uzumoizv53" ON "slice"."fan_square_input" IS 'primary key of FanSquareInput';

COMMENT ON CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" ON "slice"."fan_square_output" IS 'primary key of FanSquareOutput';

COMMENT ON CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" ON "slice"."fan_start_scope" IS 'primary key of FanStartScope';

COMMENT ON CONSTRAINT "__fan_start_scope_key_child_gmvcyvsk2k" ON "slice"."fan_start_scope" IS 'key FanStartScope(child)';

COMMENT ON CONSTRAINT "__fan_start_step_pk_7e247xk4mz" ON "slice"."fan_start_step" IS 'primary key of FanStartStep';

COMMENT ON CONSTRAINT "__fan_start_step_key_step_777capvdxg" ON "slice"."fan_start_step" IS 'key FanStartStep(step)';

COMMENT ON CONSTRAINT "__fan_step_pk_2f4tcxnofk" ON "slice"."fan_step" IS 'primary key of FanStep';

COMMENT ON CONSTRAINT "__fan_step_key_step_kind_6mwvvgt65w" ON "slice"."fan_step" IS 'key FanStep(step, kind)';

COMMENT ON CONSTRAINT "__fan_within_pk_g5tswgjfa6" ON "slice"."fan_within" IS 'primary key of FanWithin';

COMMENT ON CONSTRAINT "__item_pk_ai4obgmq4k" ON "slice"."item" IS 'primary key of Item';

COMMENT ON CONSTRAINT "__settled_pk_yitdz6z3ts" ON "slice"."settled" IS 'primary key of Settled';

COMMENT ON CONSTRAINT "__tally_pk_7jc66uxxx4" ON "slice"."tally" IS 'primary key of Tally';

COMMENT ON COLUMN "slice"."chain_chain_run_input"."__tag_kind_chain_run_ufow3vhuwb" IS 'tag ChainScope.kind = ChainRun';

COMMENT ON COLUMN "slice"."chain_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."chain_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."chain_exhausted"."__tag_outcome_failed_lrxbpw73ih" IS 'tag ChainResult.outcome = failed';

COMMENT ON COLUMN "slice"."chain_page_input"."__tag_kind_page_wmj4dlxrkf" IS 'tag ChainStep.kind = Page';

COMMENT ON COLUMN "slice"."chain_page_output"."__tag_outcome_done_uhpvxcbhg2" IS 'tag ChainResult.outcome = done';

COMMENT ON COLUMN "slice"."chain_refusal"."__tag_outcome_failed_lrxbpw73ih" IS 'tag ChainResult.outcome = failed';

COMMENT ON COLUMN "slice"."fan_batch_input"."__tag_kind_batch_fkqwrqkogg" IS 'tag FanScope.kind = Batch';

COMMENT ON COLUMN "slice"."fan_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."fan_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."fan_exhausted"."__tag_outcome_failed_3kga3qw77n" IS 'tag FanResult.outcome = failed';

COMMENT ON COLUMN "slice"."fan_fan_run_input"."__tag_kind_fan_run_eorldhk2ce" IS 'tag FanScope.kind = FanRun';

COMMENT ON COLUMN "slice"."fan_refusal"."__tag_outcome_failed_3kga3qw77n" IS 'tag FanResult.outcome = failed';

COMMENT ON COLUMN "slice"."fan_square_input"."__tag_kind_square_q3stoybx3v" IS 'tag FanStep.kind = Square';

COMMENT ON COLUMN "slice"."fan_square_output"."__tag_outcome_done_tulqbccryg" IS 'tag FanResult.outcome = done';

COMMENT ON CONSTRAINT "__audit_fk_step_zgfyapbfme" ON "slice"."audit" IS 'foreign key Audit(step) to ChainResult(step)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_scope_tag_kind_chain_run_m37i2umurb" ON "slice"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(scope, tag ChainScope.kind = ChainRun) to ChainScope(scope, kind)';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_tlgqnv6mzi" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_pred_attempt_eaxsvkfnat" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to ChainClaim(step, attempt)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_step_tag_outcome_failed_2udbgsp3ck" ON "slice"."chain_exhausted" IS 'foreign key ChainExhausted(step, tag ChainResult.outcome = failed) to ChainResult(step, outcome)';

COMMENT ON CONSTRAINT "__chain_finish_fk_scope_holmjz7tss" ON "slice"."chain_finish" IS 'foreign key ChainFinish(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_finish_fk_step_djulfbbhyv" ON "slice"."chain_finish" IS 'foreign key ChainFinish(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_held_fk_step_gn4a3vhis4" ON "slice"."chain_held" IS 'foreign key ChainHeld(step) to ChainResult(step)';

COMMENT ON CONSTRAINT "__chain_held_fk_step_attempt_ha67r6xn73" ON "slice"."chain_held" IS 'foreign key ChainHeld(step, attempt) to ChainClaim(step, attempt)';

COMMENT ON CONSTRAINT "__chain_next_fk_from_y5is7epime" ON "slice"."chain_next" IS 'foreign key ChainNext(from) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_next_fk_to_4dtheiiigt" ON "slice"."chain_next" IS 'foreign key ChainNext(to) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_page_input_fk_step_tag_kind_page_iu55gzqbo5" ON "slice"."chain_page_input" IS 'foreign key ChainPageInput(step, tag ChainStep.kind = Page) to ChainStep(step, kind)';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_step_lfprg2mtrc" ON "slice"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(step) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_g37yommeoy" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_tag_outcome_done_pvpnykkthy" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step, tag ChainResult.outcome = done) to ChainResult(step, outcome)';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_step_azw5pfnnsa" ON "slice"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(step) to ChainPageOutput(step)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_step_tag_outcome_failed_2a6zwjr3n5" ON "slice"."chain_refusal" IS 'foreign key ChainRefusal(step, tag ChainResult.outcome = failed) to ChainResult(step, outcome)';

COMMENT ON CONSTRAINT "__chain_result_fk_step_dbmjl746t7" ON "slice"."chain_result" IS 'foreign key ChainResult(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_root_fk_scope_g7gu2qhyp2" ON "slice"."chain_root" IS 'foreign key ChainRoot(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_start_scope_fk_child_bz3czs5on4" ON "slice"."chain_start_scope" IS 'foreign key ChainStartScope(child) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_start_scope_fk_scope_ijdwqi66fj" ON "slice"."chain_start_scope" IS 'foreign key ChainStartScope(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_scope_gegsqdzyp5" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_step_yqr6ccimjq" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_step_fk_scope_zyevzya6lc" ON "slice"."chain_step" IS 'foreign key ChainStep(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_within_fk_parent_n3pon4mlxe" ON "slice"."chain_within" IS 'foreign key ChainWithin(parent) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_within_fk_scope_gzdy7afflv" ON "slice"."chain_within" IS 'foreign key ChainWithin(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__fan_batch_input_fk_scope_tag_kind_batch_b6gxzmmqsm" ON "slice"."fan_batch_input" IS 'foreign key FanBatchInput(scope, tag FanScope.kind = Batch) to FanScope(scope, kind)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_ihp5bkdfc7" ON "slice"."fan_claim" IS 'foreign key FanClaim(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_pred_attempt_r5pt5cwztz" ON "slice"."fan_claim" IS 'foreign key FanClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to FanClaim(step, attempt)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_step_tag_outcome_failed_s2kqkxsbyn" ON "slice"."fan_exhausted" IS 'foreign key FanExhausted(step, tag FanResult.outcome = failed) to FanResult(step, outcome)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_scope_tag_kind_fan_run_tihneov63d" ON "slice"."fan_fan_run_input" IS 'foreign key FanFanRunInput(scope, tag FanScope.kind = FanRun) to FanScope(scope, kind)';

COMMENT ON CONSTRAINT "__fan_finish_fk_scope_qa2mnv7a2g" ON "slice"."fan_finish" IS 'foreign key FanFinish(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_finish_fk_step_f3he376omz" ON "slice"."fan_finish" IS 'foreign key FanFinish(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_held_fk_step_6tkjkyjp3h" ON "slice"."fan_held" IS 'foreign key FanHeld(step) to FanResult(step)';

COMMENT ON CONSTRAINT "__fan_held_fk_step_attempt_zol2no7gql" ON "slice"."fan_held" IS 'foreign key FanHeld(step, attempt) to FanClaim(step, attempt)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_step_tag_outcome_failed_zd74wltaye" ON "slice"."fan_refusal" IS 'foreign key FanRefusal(step, tag FanResult.outcome = failed) to FanResult(step, outcome)';

COMMENT ON CONSTRAINT "__fan_result_fk_step_kzt2ms65pp" ON "slice"."fan_result" IS 'foreign key FanResult(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_root_fk_scope_7k4byqnauw" ON "slice"."fan_root" IS 'foreign key FanRoot(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_square_input_fk_step_tag_kind_square_dshd7bwrky" ON "slice"."fan_square_input" IS 'foreign key FanSquareInput(step, tag FanStep.kind = Square) to FanStep(step, kind)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_prwr7wqv35" ON "slice"."fan_square_output" IS 'foreign key FanSquareOutput(step) to FanSquareInput(step)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_tag_outcome_done_nflx2lb3xz" ON "slice"."fan_square_output" IS 'foreign key FanSquareOutput(step, tag FanResult.outcome = done) to FanResult(step, outcome)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_child_ngma7ay7kq" ON "slice"."fan_start_scope" IS 'foreign key FanStartScope(child) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_scope_ymqglh3w64" ON "slice"."fan_start_scope" IS 'foreign key FanStartScope(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_scope_nidx2ru6ls" ON "slice"."fan_start_step" IS 'foreign key FanStartStep(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_step_vjwo5huhik" ON "slice"."fan_start_step" IS 'foreign key FanStartStep(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_step_fk_scope_qjqxjbw7tr" ON "slice"."fan_step" IS 'foreign key FanStep(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_within_fk_parent_koa6wzyqvq" ON "slice"."fan_within" IS 'foreign key FanWithin(parent) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_within_fk_scope_5a7dtldf3w" ON "slice"."fan_within" IS 'foreign key FanWithin(scope) to FanScope(scope)';

COMMENT ON INDEX "slice"."__chain_claim_ix_step_fxyms_236_d_4_pred_attempt_cgz4fqmrbd" IS 'btree index ChainClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox)';

COMMENT ON INDEX "slice"."__chain_step_ix_scope_kind_spn3gys2vi" IS 'btree index ChainStep(scope, kind)';

COMMENT ON INDEX "slice"."__chain_within_ix_parent_3xemf3jvuy" IS 'btree index ChainWithin(parent)';

COMMENT ON INDEX "slice"."__fan_claim_ix_step_fxyms_236_d_4_pred_attempt_rdwu35kano" IS 'btree index FanClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox)';

COMMENT ON INDEX "slice"."__fan_step_ix_scope_kind_h2wuapaqs3" IS 'btree index FanStep(scope, kind)';

COMMENT ON INDEX "slice"."__fan_within_ix_parent_7swblvcobd" IS 'btree index FanWithin(parent)';

COMMENT ON STATISTICS "slice"."__chain_step_stats_kind_scope_tc5nmidpxu" IS 'statistics ChainStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__fan_step_stats_kind_scope_xmuvugpu6n" IS 'statistics FanStep(kind, scope)';

COMMENT ON ROLE :"__live_slice_wzkq6p2yii" IS 'live source of slice';
