CREATE PUBLICATION "__live_slice_wzkq6p2yii"
  FOR TABLE "slice"."audit" ("step"), "slice"."built" ("build"), "slice"."chain_admitted" ("scope"), "slice"."chain_chain_run_input" ("scope"), "slice"."chain_claim" ("step", "attempt"), "slice"."chain_due" ("step"), "slice"."chain_finish" ("scope"), "slice"."chain_held" ("step"), "slice"."chain_next" ("from", "ordinal"), "slice"."chain_ordered_input" ("scope"), "slice"."chain_page_input" ("step"), "slice"."chain_page_input_after" ("step"), "slice"."chain_page_output" ("step"), "slice"."chain_page_output_next" ("step"), "slice"."chain_page_read" ("step", "ordinal"), "slice"."chain_paused" ("target"), "slice"."chain_result" ("step"), "slice"."chain_retry" ("step", "attempt"), "slice"."chain_root" ("scope"), "slice"."chain_scope" ("scope"), "slice"."chain_skipped" ("scope"), "slice"."chain_start_scope" ("scope", "ordinal"), "slice"."chain_start_step" ("scope", "ordinal"), "slice"."chain_step", "slice"."chain_within", "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."fan_admitted" ("scope"), "slice"."fan_batch_input" ("scope"), "slice"."fan_claim" ("step", "attempt"), "slice"."fan_due" ("step"), "slice"."fan_fan_run_input" ("scope"), "slice"."fan_finish" ("scope"), "slice"."fan_held" ("step"), "slice"."fan_hold" ("resource", "seat"), "slice"."fan_paused" ("target"), "slice"."fan_result" ("step"), "slice"."fan_retry" ("step", "attempt"), "slice"."fan_root" ("scope"), "slice"."fan_scope" ("scope"), "slice"."fan_seat" ("resource", "seat"), "slice"."fan_skipped" ("scope"), "slice"."fan_square_input" ("step"), "slice"."fan_square_output" ("step"), "slice"."fan_start_scope" ("scope", "ordinal"), "slice"."fan_start_step" ("scope", "ordinal"), "slice"."fan_step", "slice"."fan_within", "slice"."item" ("feed", "seq", "n"), "slice"."retry_admitted" ("scope"), "slice"."retry_brittle_input" ("step"), "slice"."retry_brittle_output" ("step"), "slice"."retry_claim" ("step", "attempt"), "slice"."retry_due" ("step"), "slice"."retry_exhausted" ("step"), "slice"."retry_finish" ("scope"), "slice"."retry_held" ("step"), "slice"."retry_ladders_input" ("scope"), "slice"."retry_paused" ("target"), "slice"."retry_result" ("step"), "slice"."retry_retry" ("step", "attempt"), "slice"."retry_root" ("scope"), "slice"."retry_scope" ("scope"), "slice"."retry_skipped" ("scope"), "slice"."retry_steadfast_input" ("step"), "slice"."retry_steadfast_output" ("step"), "slice"."retry_step", "slice"."retry_within", "slice"."settled" ("batch"), "slice"."sync_admitted" ("scope"), "slice"."sync_build_input" ("step"), "slice"."sync_claim" ("step", "attempt"), "slice"."sync_copy_input" ("step"), "slice"."sync_due" ("step"), "slice"."sync_exclusive" ("kind", "key"), "slice"."sync_exclusive_key" ("scope"), "slice"."sync_finish" ("scope"), "slice"."sync_gold_input" ("scope"), "slice"."sync_held" ("step"), "slice"."sync_paused" ("target"), "slice"."sync_result" ("step"), "slice"."sync_retry" ("step", "attempt"), "slice"."sync_root" ("scope"), "slice"."sync_scope" ("scope"), "slice"."sync_skipped" ("scope"), "slice"."sync_step", "slice"."sync_sync_run_input" ("scope"), "slice"."sync_within", "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor")
  WITH (publish = 'insert, update, delete, truncate', publish_generated_columns = stored);

CREATE ROLE :"slice__app" LOGIN NOINHERIT;

CREATE ROLE :"slice__auditor" NOLOGIN;

CREATE ROLE :"slice__chain_den" NOLOGIN;

CREATE ROLE :"slice__chain_seats" NOLOGIN;

CREATE ROLE :"slice__fan_den" NOLOGIN;

CREATE ROLE :"slice__fan_seats" NOLOGIN;

CREATE ROLE :"slice__loader" NOLOGIN;

CREATE ROLE :"slice__retry_den" NOLOGIN;

CREATE ROLE :"slice__retry_seats" NOLOGIN;

CREATE ROLE :"slice__sync_den" NOLOGIN;

CREATE ROLE :"slice__sync_seats" NOLOGIN;

CREATE ROLE :"slice__worker" LOGIN NOINHERIT;

CREATE ROLE :"__live_slice_wzkq6p2yii" LOGIN NOINHERIT;

CREATE SCHEMA "slice__auditor";

CREATE SCHEMA "slice__chain_den";

CREATE SCHEMA "slice__chain_seats";

CREATE SCHEMA "slice__fan_den";

CREATE SCHEMA "slice__fan_seats";

CREATE SCHEMA "slice__loader";

CREATE SCHEMA "slice__retry_den";

CREATE SCHEMA "slice__retry_seats";

CREATE SCHEMA "slice__sync_den";

CREATE SCHEMA "slice__sync_seats";

CREATE VIEW "slice__auditor"."audit" ("step", "note") AS
SELECT "r1"."step", "r1"."note"
FROM "slice"."audit" AS "r1";

CREATE VIEW "slice__auditor"."built" ("build") AS
SELECT "r1"."build"
FROM "slice"."built" AS "r1";

CREATE VIEW "slice__auditor"."chain_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice__auditor"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice__auditor"."chain_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice__auditor"."chain_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice__auditor"."chain_next" ("from", "ordinal", "to") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice__auditor"."chain_ordered_input" ("scope", "feed", "feed_name", "pages") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice__auditor"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice__auditor"."chain_page_input_after" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice__auditor"."chain_page_output" ("step", "seq", "items") AS
SELECT "r1"."step", "r1"."seq", "r1"."items"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice__auditor"."chain_page_output_next" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice__auditor"."chain_page_read" ("step", "ordinal", "feed", "feed_name", "factor") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."chain_page_read" AS "r1";

CREATE VIEW "slice__auditor"."chain_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice__auditor"."chain_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice__auditor"."chain_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_join_names_hvq3dwjqow"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice__auditor"."chain_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."chain_start_scope" AS "r1";

CREATE VIEW "slice__auditor"."chain_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice__auditor"."chain_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_73btyxoydp"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice__auditor"."chain_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."chain_within" AS "r1";

CREATE VIEW "slice__auditor"."copied" ("relation", "run") AS
SELECT "r1"."relation", "r1"."run"
FROM "slice"."copied" AS "r1";

CREATE VIEW "slice__auditor"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "slice__auditor"."fan_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."fan_admitted" AS "r1";

CREATE VIEW "slice__auditor"."fan_batch_input" ("scope", "batch", "size") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice__auditor"."fan_fan_run_input" ("scope", "batch", "size") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice__auditor"."fan_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice__auditor"."fan_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice__auditor"."fan_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice__auditor"."fan_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_join_names_gct5lzhdqo"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."fan_scope" AS "r1";

CREATE VIEW "slice__auditor"."fan_square_input" ("step", "batch", "n") AS
SELECT "r1"."step", "r1"."batch", "r1"."n"
FROM "slice"."fan_square_input" AS "r1";

CREATE VIEW "slice__auditor"."fan_square_output" ("step", "square") AS
SELECT "r1"."step", "r1"."square"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice__auditor"."fan_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."fan_start_scope" AS "r1";

CREATE VIEW "slice__auditor"."fan_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."fan_start_step" AS "r1";

CREATE VIEW "slice__auditor"."fan_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_gikh2fxf2t"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice__auditor"."fan_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice__auditor"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "slice__auditor"."order" ("order", "feed", "feed_name") AS
SELECT "r1"."order", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text"
FROM "slice"."order" AS "r1";

CREATE VIEW "slice__auditor"."retry_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."retry_claim" AS "r1";

CREATE VIEW "slice__auditor"."retry_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."retry_exhausted" AS "r1";

CREATE VIEW "slice__auditor"."retry_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice__auditor"."retry_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_pa363dov7n"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."retry_step" AS "r1";

CREATE VIEW "slice__auditor"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "slice__auditor"."sync_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."sync_admitted" AS "r1";

CREATE VIEW "slice__auditor"."sync_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."sync_finish" AS "r1";

CREATE VIEW "slice__auditor"."sync_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."sync_result" AS "r1";

CREATE VIEW "slice__auditor"."sync_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_join_names_cci5jmwoiz"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."sync_scope" AS "r1";

CREATE VIEW "slice__auditor"."sync_skipped" ("scope", "by") AS
SELECT "r1"."scope", "r1"."by"
FROM "slice"."sync_skipped" AS "r1";

CREATE VIEW "slice__auditor"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "slice__auditor"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "slice__chain_den"."chain_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice__chain_den"."chain_chain_run_input" ("scope", "feed", "feed_name", "pages") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice"."chain_chain_run_input" AS "r1";

CREATE VIEW "slice__chain_den"."chain_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."chain_claim" AS "r1";

CREATE VIEW "slice__chain_den"."chain_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."chain_done" AS "r1";

CREATE VIEW "slice__chain_den"."chain_due" ("step", "at") AS
SELECT "r1"."step", "r1"."at"
FROM "slice"."chain_due" AS "r1";

CREATE VIEW "slice__chain_den"."chain_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."chain_exhausted" AS "r1";

CREATE VIEW "slice__chain_den"."chain_failed" ("step") AS
SELECT "r1"."step"
FROM "slice"."chain_failed" AS "r1";

CREATE VIEW "slice__chain_den"."chain_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice__chain_den"."chain_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."chain_held" AS "r1";

CREATE VIEW "slice__chain_den"."chain_next" ("from", "ordinal", "to") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice__chain_den"."chain_ordered_input" ("scope", "feed", "feed_name", "pages") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice__chain_den"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice__chain_den"."chain_page_input_after" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice__chain_den"."chain_page_output" ("step", "seq", "items") AS
SELECT "r1"."step", "r1"."seq", "r1"."items"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice__chain_den"."chain_page_output_next" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice__chain_den"."chain_page_read" ("step", "ordinal", "feed", "feed_name", "factor") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."chain_page_read" AS "r1";

CREATE VIEW "slice__chain_den"."chain_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."chain_refusal" AS "r1";

CREATE VIEW "slice__chain_den"."chain_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice__chain_den"."chain_retry" ("step", "attempt", "at", "spent") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent"
FROM "slice"."chain_retry" AS "r1";

CREATE VIEW "slice__chain_den"."chain_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice__chain_den"."chain_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_join_names_hvq3dwjqow"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice__chain_den"."chain_skipped" ("scope", "by") AS
SELECT "r1"."scope", "r1"."by"
FROM "slice"."chain_skipped" AS "r1";

CREATE VIEW "slice__chain_den"."chain_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."chain_start_scope" AS "r1";

CREATE VIEW "slice__chain_den"."chain_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice__chain_den"."chain_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_73btyxoydp"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice__chain_den"."chain_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."chain_within" AS "r1";

CREATE VIEW "slice__chain_seats"."chain_paused" ("target", "target_name") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text"
FROM "slice"."chain_paused" AS "r1";

CREATE VIEW "slice__fan_den"."fan_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."fan_admitted" AS "r1";

CREATE VIEW "slice__fan_den"."fan_batch_input" ("scope", "batch", "size") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice"."fan_batch_input" AS "r1";

CREATE VIEW "slice__fan_den"."fan_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."fan_claim" AS "r1";

CREATE VIEW "slice__fan_den"."fan_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."fan_done" AS "r1";

CREATE VIEW "slice__fan_den"."fan_due" ("step", "at") AS
SELECT "r1"."step", "r1"."at"
FROM "slice"."fan_due" AS "r1";

CREATE VIEW "slice__fan_den"."fan_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."fan_exhausted" AS "r1";

CREATE VIEW "slice__fan_den"."fan_failed" ("step") AS
SELECT "r1"."step"
FROM "slice"."fan_failed" AS "r1";

CREATE VIEW "slice__fan_den"."fan_fan_run_input" ("scope", "batch", "size") AS
SELECT "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice"."fan_fan_run_input" AS "r1";

CREATE VIEW "slice__fan_den"."fan_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."fan_finish" AS "r1";

CREATE VIEW "slice__fan_den"."fan_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."fan_held" AS "r1";

CREATE VIEW "slice__fan_den"."fan_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."fan_refusal" AS "r1";

CREATE VIEW "slice__fan_den"."fan_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice__fan_den"."fan_retry" ("step", "attempt", "at", "spent") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent"
FROM "slice"."fan_retry" AS "r1";

CREATE VIEW "slice__fan_den"."fan_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."fan_root" AS "r1";

CREATE VIEW "slice__fan_den"."fan_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__fan_join_names_gct5lzhdqo"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."fan_scope" AS "r1";

CREATE VIEW "slice__fan_den"."fan_skipped" ("scope", "by") AS
SELECT "r1"."scope", "r1"."by"
FROM "slice"."fan_skipped" AS "r1";

CREATE VIEW "slice__fan_den"."fan_square_input" ("step", "batch", "n") AS
SELECT "r1"."step", "r1"."batch", "r1"."n"
FROM "slice"."fan_square_input" AS "r1";

CREATE VIEW "slice__fan_den"."fan_square_output" ("step", "square") AS
SELECT "r1"."step", "r1"."square"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice__fan_den"."fan_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."fan_start_scope" AS "r1";

CREATE VIEW "slice__fan_den"."fan_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."fan_start_step" AS "r1";

CREATE VIEW "slice__fan_den"."fan_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_gikh2fxf2t"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."fan_step" AS "r1";

CREATE VIEW "slice__fan_den"."fan_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."fan_within" AS "r1";

CREATE VIEW "slice__fan_seats"."fan_hold" ("resource", "resource_name", "seat", "holder", "until") AS
SELECT "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat", "r1"."holder", "r1"."until"
FROM "slice"."fan_hold" AS "r1";

CREATE VIEW "slice__fan_seats"."fan_paused" ("target", "target_name") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_xzmaxnvnb6"())["r1"."target" + 1]::"pg_catalog"."text"
FROM "slice"."fan_paused" AS "r1";

CREATE VIEW "slice__fan_seats"."fan_seat" ("resource", "resource_name", "seat") AS
SELECT "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."seat"
FROM "slice"."fan_seat" AS "r1";

CREATE VIEW "slice__loader"."built" ("build") AS
SELECT "r1"."build"
FROM "slice"."built" AS "r1";

CREATE VIEW "slice__loader"."chain_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."chain_admitted" AS "r1";

CREATE VIEW "slice__loader"."chain_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."chain_done" AS "r1";

CREATE VIEW "slice__loader"."chain_due" ("step", "at") AS
SELECT "r1"."step", "r1"."at"
FROM "slice"."chain_due" AS "r1";

CREATE VIEW "slice__loader"."chain_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."chain_finish" AS "r1";

CREATE VIEW "slice__loader"."chain_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."chain_held" AS "r1";

CREATE VIEW "slice__loader"."chain_next" ("from", "ordinal", "to") AS
SELECT "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice"."chain_next" AS "r1";

CREATE VIEW "slice__loader"."chain_ordered_input" ("scope", "feed", "feed_name", "pages") AS
SELECT "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice"."chain_ordered_input" AS "r1";

CREATE VIEW "slice__loader"."chain_page_input" ("step", "feed", "feed_name", "seq", "pages") AS
SELECT "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_names_dxuyhzkiur"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages"
FROM "slice"."chain_page_input" AS "r1";

CREATE VIEW "slice__loader"."chain_page_input_after" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_input_after" AS "r1";

CREATE VIEW "slice__loader"."chain_page_output" ("step", "seq", "items") AS
SELECT "r1"."step", "r1"."seq", "r1"."items"
FROM "slice"."chain_page_output" AS "r1";

CREATE VIEW "slice__loader"."chain_page_output_next" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."chain_page_output_next" AS "r1";

CREATE VIEW "slice__loader"."chain_page_read" ("step", "ordinal", "feed", "feed_name", "factor") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."chain_page_read" AS "r1";

CREATE VIEW "slice__loader"."chain_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice__loader"."chain_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."chain_root" AS "r1";

CREATE VIEW "slice__loader"."chain_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__chain_join_names_hvq3dwjqow"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."chain_scope" AS "r1";

CREATE VIEW "slice__loader"."chain_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."chain_start_scope" AS "r1";

CREATE VIEW "slice__loader"."chain_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."chain_start_step" AS "r1";

CREATE VIEW "slice__loader"."chain_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_73btyxoydp"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice__loader"."chain_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."chain_within" AS "r1";

CREATE VIEW "slice__loader"."copied" ("relation", "run") AS
SELECT "r1"."relation", "r1"."run"
FROM "slice"."copied" AS "r1";

CREATE VIEW "slice__loader"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "slice__loader"."fan_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."fan_done" AS "r1";

CREATE VIEW "slice__loader"."fan_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."fan_held" AS "r1";

CREATE VIEW "slice__loader"."fan_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."fan_result" AS "r1";

CREATE VIEW "slice__loader"."fan_square_output" ("step", "square") AS
SELECT "r1"."step", "r1"."square"
FROM "slice"."fan_square_output" AS "r1";

CREATE VIEW "slice__loader"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "slice__loader"."order" ("order", "feed", "feed_name") AS
SELECT "r1"."order", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text"
FROM "slice"."order" AS "r1";

CREATE VIEW "slice__loader"."retry_brittle_output" ("step", "key") AS
SELECT "r1"."step", "r1"."key"
FROM "slice"."retry_brittle_output" AS "r1";

CREATE VIEW "slice__loader"."retry_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."retry_done" AS "r1";

CREATE VIEW "slice__loader"."retry_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."retry_held" AS "r1";

CREATE VIEW "slice__loader"."retry_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice__loader"."retry_steadfast_output" ("step", "key") AS
SELECT "r1"."step", "r1"."key"
FROM "slice"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice__loader"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "slice__loader"."sync_build_output" ("step", "build") AS
SELECT "r1"."step", "r1"."build"
FROM "slice"."sync_build_output" AS "r1";

CREATE VIEW "slice__loader"."sync_copy_output" ("step", "run") AS
SELECT "r1"."step", "r1"."run"
FROM "slice"."sync_copy_output" AS "r1";

CREATE VIEW "slice__loader"."sync_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."sync_done" AS "r1";

CREATE VIEW "slice__loader"."sync_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."sync_held" AS "r1";

CREATE VIEW "slice__loader"."sync_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."sync_result" AS "r1";

CREATE VIEW "slice__loader"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "slice__loader"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "slice__retry_den"."retry_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."retry_admitted" AS "r1";

CREATE VIEW "slice__retry_den"."retry_brittle_input" ("step", "key") AS
SELECT "r1"."step", "r1"."key"
FROM "slice"."retry_brittle_input" AS "r1";

CREATE VIEW "slice__retry_den"."retry_brittle_output" ("step", "key") AS
SELECT "r1"."step", "r1"."key"
FROM "slice"."retry_brittle_output" AS "r1";

CREATE VIEW "slice__retry_den"."retry_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."retry_claim" AS "r1";

CREATE VIEW "slice__retry_den"."retry_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."retry_done" AS "r1";

CREATE VIEW "slice__retry_den"."retry_due" ("step", "at") AS
SELECT "r1"."step", "r1"."at"
FROM "slice"."retry_due" AS "r1";

CREATE VIEW "slice__retry_den"."retry_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."retry_exhausted" AS "r1";

CREATE VIEW "slice__retry_den"."retry_failed" ("step") AS
SELECT "r1"."step"
FROM "slice"."retry_failed" AS "r1";

CREATE VIEW "slice__retry_den"."retry_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."retry_finish" AS "r1";

CREATE VIEW "slice__retry_den"."retry_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."retry_held" AS "r1";

CREATE VIEW "slice__retry_den"."retry_ladders_input" ("scope", "steadfast", "brittle") AS
SELECT "r1"."scope", "r1"."steadfast", "r1"."brittle"
FROM "slice"."retry_ladders_input" AS "r1";

CREATE VIEW "slice__retry_den"."retry_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."retry_refusal" AS "r1";

CREATE VIEW "slice__retry_den"."retry_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."retry_result" AS "r1";

CREATE VIEW "slice__retry_den"."retry_retry" ("step", "attempt", "at", "spent") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent"
FROM "slice"."retry_retry" AS "r1";

CREATE VIEW "slice__retry_den"."retry_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."retry_root" AS "r1";

CREATE VIEW "slice__retry_den"."retry_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__retry_join_names_st4whng7gb"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."retry_scope" AS "r1";

CREATE VIEW "slice__retry_den"."retry_skipped" ("scope", "by") AS
SELECT "r1"."scope", "r1"."by"
FROM "slice"."retry_skipped" AS "r1";

CREATE VIEW "slice__retry_den"."retry_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."retry_start_scope" AS "r1";

CREATE VIEW "slice__retry_den"."retry_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."retry_start_step" AS "r1";

CREATE VIEW "slice__retry_den"."retry_steadfast_input" ("step", "key") AS
SELECT "r1"."step", "r1"."key"
FROM "slice"."retry_steadfast_input" AS "r1";

CREATE VIEW "slice__retry_den"."retry_steadfast_output" ("step", "key") AS
SELECT "r1"."step", "r1"."key"
FROM "slice"."retry_steadfast_output" AS "r1";

CREATE VIEW "slice__retry_den"."retry_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_pa363dov7n"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."retry_step" AS "r1";

CREATE VIEW "slice__retry_den"."retry_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."retry_within" AS "r1";

CREATE VIEW "slice__retry_seats"."retry_paused" ("target", "target_name") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_damz4vyplb"())["r1"."target" + 1]::"pg_catalog"."text"
FROM "slice"."retry_paused" AS "r1";

CREATE VIEW "slice__sync_den"."chain_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."chain_result" AS "r1";

CREATE VIEW "slice__sync_den"."chain_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_73btyxoydp"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."chain_step" AS "r1";

CREATE VIEW "slice__sync_den"."sync_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."sync_admitted" AS "r1";

CREATE VIEW "slice__sync_den"."sync_build_input" ("step", "build") AS
SELECT "r1"."step", "r1"."build"
FROM "slice"."sync_build_input" AS "r1";

CREATE VIEW "slice__sync_den"."sync_build_output" ("step", "build") AS
SELECT "r1"."step", "r1"."build"
FROM "slice"."sync_build_output" AS "r1";

CREATE VIEW "slice__sync_den"."sync_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."sync_claim" AS "r1";

CREATE VIEW "slice__sync_den"."sync_copy_input" ("step", "relation", "run") AS
SELECT "r1"."step", "r1"."relation", "r1"."run"
FROM "slice"."sync_copy_input" AS "r1";

CREATE VIEW "slice__sync_den"."sync_copy_output" ("step", "run") AS
SELECT "r1"."step", "r1"."run"
FROM "slice"."sync_copy_output" AS "r1";

CREATE VIEW "slice__sync_den"."sync_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."sync_done" AS "r1";

CREATE VIEW "slice__sync_den"."sync_due" ("step", "at") AS
SELECT "r1"."step", "r1"."at"
FROM "slice"."sync_due" AS "r1";

CREATE VIEW "slice__sync_den"."sync_exclusive_key" ("scope", "key", "id") AS
SELECT "r1"."scope", "r1"."key", "r1"."id"
FROM "slice"."sync_exclusive_key" AS "r1";

CREATE VIEW "slice__sync_den"."sync_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."sync_exhausted" AS "r1";

CREATE VIEW "slice__sync_den"."sync_failed" ("step") AS
SELECT "r1"."step"
FROM "slice"."sync_failed" AS "r1";

CREATE VIEW "slice__sync_den"."sync_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."sync_finish" AS "r1";

CREATE VIEW "slice__sync_den"."sync_gold_input" ("scope", "build") AS
SELECT "r1"."scope", "r1"."build"
FROM "slice"."sync_gold_input" AS "r1";

CREATE VIEW "slice__sync_den"."sync_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."sync_held" AS "r1";

CREATE VIEW "slice__sync_den"."sync_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."sync_refusal" AS "r1";

CREATE VIEW "slice__sync_den"."sync_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."sync_result" AS "r1";

CREATE VIEW "slice__sync_den"."sync_retry" ("step", "attempt", "at", "spent") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent"
FROM "slice"."sync_retry" AS "r1";

CREATE VIEW "slice__sync_den"."sync_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."sync_root" AS "r1";

CREATE VIEW "slice__sync_den"."sync_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__sync_join_names_cci5jmwoiz"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."sync_scope" AS "r1";

CREATE VIEW "slice__sync_den"."sync_skipped" ("scope", "by") AS
SELECT "r1"."scope", "r1"."by"
FROM "slice"."sync_skipped" AS "r1";

CREATE VIEW "slice__sync_den"."sync_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."sync_start_scope" AS "r1";

CREATE VIEW "slice__sync_den"."sync_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."sync_start_step" AS "r1";

CREATE VIEW "slice__sync_den"."sync_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_4mra6ojpzm"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."sync_step" AS "r1";

CREATE VIEW "slice__sync_den"."sync_sync_run_input" ("scope", "relation", "run") AS
SELECT "r1"."scope", "r1"."relation", "r1"."run"
FROM "slice"."sync_sync_run_input" AS "r1";

CREATE VIEW "slice__sync_den"."sync_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."sync_within" AS "r1";

CREATE VIEW "slice__sync_seats"."sync_exclusive" ("kind", "kind_name", "key", "scope") AS
SELECT "r1"."kind", ("slice"."__sync_join_names_cci5jmwoiz"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."scope"
FROM "slice"."sync_exclusive" AS "r1";

CREATE VIEW "slice__sync_seats"."sync_paused" ("target", "target_name") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_ehqx6eh7nb"())["r1"."target" + 1]::"pg_catalog"."text"
FROM "slice"."sync_paused" AS "r1";

GRANT :"slice__auditor" TO :"slice__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__chain_den" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__chain_seats" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__fan_den" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__fan_seats" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__loader" TO :"slice__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__retry_den" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__retry_seats" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__sync_den" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice__sync_seats" TO :"slice__worker" WITH INHERIT FALSE, SET TRUE;

GRANT USAGE ON SCHEMA "slice" TO :"slice__app";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice__app";

GRANT SELECT ON TABLE "slice"."__live_secret" TO :"slice__app";

GRANT USAGE ON SCHEMA "slice", "slice__auditor" TO :"slice__auditor";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."feed", "slice"."retry_kind", "slice"."retry_outcome", "slice"."sync_join", "slice"."sync_outcome", "slice"."__text_t4rwovzmqj" TO :"slice__auditor";

GRANT SELECT ON TABLE "slice__auditor"."audit", "slice__auditor"."built", "slice__auditor"."chain_admitted", "slice__auditor"."chain_chain_run_input", "slice__auditor"."chain_claim", "slice__auditor"."chain_finish", "slice__auditor"."chain_next", "slice__auditor"."chain_ordered_input", "slice__auditor"."chain_page_input", "slice__auditor"."chain_page_input_after", "slice__auditor"."chain_page_output", "slice__auditor"."chain_page_output_next", "slice__auditor"."chain_page_read", "slice__auditor"."chain_result", "slice__auditor"."chain_root", "slice__auditor"."chain_scope", "slice__auditor"."chain_start_scope", "slice__auditor"."chain_start_step", "slice__auditor"."chain_step", "slice__auditor"."chain_within", "slice__auditor"."copied", "slice__auditor"."cursor", "slice__auditor"."fan_admitted", "slice__auditor"."fan_batch_input", "slice__auditor"."fan_fan_run_input", "slice__auditor"."fan_finish", "slice__auditor"."fan_result", "slice__auditor"."fan_root", "slice__auditor"."fan_scope", "slice__auditor"."fan_square_input", "slice__auditor"."fan_square_output", "slice__auditor"."fan_start_scope", "slice__auditor"."fan_start_step", "slice__auditor"."fan_step", "slice__auditor"."fan_within", "slice__auditor"."item", "slice__auditor"."order", "slice__auditor"."retry_claim", "slice__auditor"."retry_exhausted", "slice__auditor"."retry_result", "slice__auditor"."retry_step", "slice__auditor"."settled", "slice__auditor"."sync_admitted", "slice__auditor"."sync_finish", "slice__auditor"."sync_result", "slice__auditor"."sync_scope", "slice__auditor"."sync_skipped", "slice__auditor"."tally", "slice__auditor"."weight" TO :"slice__auditor";

GRANT SELECT, INSERT ON TABLE "slice"."audit" TO :"slice__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_outcome_names_xzb4y4xgki"() TO :"slice__auditor";

GRANT USAGE ON SCHEMA "slice", "slice__chain_den" TO :"slice__chain_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."feed" TO :"slice__chain_den";

GRANT SELECT ON TABLE "slice__chain_den"."chain_admitted", "slice__chain_den"."chain_chain_run_input", "slice__chain_den"."chain_claim", "slice__chain_den"."chain_done", "slice__chain_den"."chain_due", "slice__chain_den"."chain_exhausted", "slice__chain_den"."chain_failed", "slice__chain_den"."chain_finish", "slice__chain_den"."chain_held", "slice__chain_den"."chain_next", "slice__chain_den"."chain_ordered_input", "slice__chain_den"."chain_page_input", "slice__chain_den"."chain_page_input_after", "slice__chain_den"."chain_page_output", "slice__chain_den"."chain_page_output_next", "slice__chain_den"."chain_page_read", "slice__chain_den"."chain_refusal", "slice__chain_den"."chain_result", "slice__chain_den"."chain_retry", "slice__chain_den"."chain_root", "slice__chain_den"."chain_scope", "slice__chain_den"."chain_skipped", "slice__chain_den"."chain_start_scope", "slice__chain_den"."chain_start_step", "slice__chain_den"."chain_step", "slice__chain_den"."chain_within" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_admitted" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_chain_run_input" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_claim" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_done" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_due" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_exhausted" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_failed" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_finish" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_held" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_input" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input_after" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_read" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_refusal" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_result" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_retry" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_root" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_scope" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_skipped" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_scope" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_step" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_step" TO :"slice__chain_den";

GRANT SELECT, INSERT ON TABLE "slice"."chain_within" TO :"slice__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__feed_names_azjbqebc6i"() TO :"slice__chain_den";

GRANT USAGE ON SCHEMA "slice", "slice__chain_seats" TO :"slice__chain_seats";

GRANT USAGE ON DOMAIN "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable" TO :"slice__chain_seats";

GRANT SELECT ON TABLE "slice__chain_seats"."chain_paused" TO :"slice__chain_seats";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."chain_paused" TO :"slice__chain_seats";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__chain_seats";

GRANT EXECUTE ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"() TO :"slice__chain_seats";

GRANT USAGE ON SCHEMA "slice", "slice__fan_den" TO :"slice__fan_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource" TO :"slice__fan_den";

GRANT SELECT ON TABLE "slice__fan_den"."fan_admitted", "slice__fan_den"."fan_batch_input", "slice__fan_den"."fan_claim", "slice__fan_den"."fan_done", "slice__fan_den"."fan_due", "slice__fan_den"."fan_exhausted", "slice__fan_den"."fan_failed", "slice__fan_den"."fan_fan_run_input", "slice__fan_den"."fan_finish", "slice__fan_den"."fan_held", "slice__fan_den"."fan_refusal", "slice__fan_den"."fan_result", "slice__fan_den"."fan_retry", "slice__fan_den"."fan_root", "slice__fan_den"."fan_scope", "slice__fan_den"."fan_skipped", "slice__fan_den"."fan_square_input", "slice__fan_den"."fan_square_output", "slice__fan_den"."fan_start_scope", "slice__fan_den"."fan_start_step", "slice__fan_den"."fan_step", "slice__fan_den"."fan_within" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_admitted" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_batch_input" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_claim" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_done" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_due" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_exhausted" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_failed" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_fan_run_input" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_finish" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_held" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_refusal" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_result" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_retry" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_root" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_scope" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_skipped" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_square_input" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_start_scope" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_start_step" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_step" TO :"slice__fan_den";

GRANT SELECT, INSERT ON TABLE "slice"."fan_within" TO :"slice__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"() TO :"slice__fan_den";

GRANT USAGE ON SCHEMA "slice", "slice__fan_seats" TO :"slice__fan_seats";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource" TO :"slice__fan_seats";

GRANT SELECT ON TABLE "slice__fan_seats"."fan_hold", "slice__fan_seats"."fan_paused", "slice__fan_seats"."fan_seat" TO :"slice__fan_seats";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."fan_hold" TO :"slice__fan_seats";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."fan_paused" TO :"slice__fan_seats";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."fan_seat" TO :"slice__fan_seats";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__fan_seats";

GRANT EXECUTE ON FUNCTION "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"() TO :"slice__fan_seats";

GRANT USAGE ON SCHEMA "slice", "slice__loader" TO :"slice__loader";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj" TO :"slice__loader";

GRANT SELECT ON TABLE "slice__loader"."built", "slice__loader"."chain_admitted", "slice__loader"."chain_done", "slice__loader"."chain_due", "slice__loader"."chain_finish", "slice__loader"."chain_held", "slice__loader"."chain_next", "slice__loader"."chain_ordered_input", "slice__loader"."chain_page_input", "slice__loader"."chain_page_input_after", "slice__loader"."chain_page_output", "slice__loader"."chain_page_output_next", "slice__loader"."chain_page_read", "slice__loader"."chain_result", "slice__loader"."chain_root", "slice__loader"."chain_scope", "slice__loader"."chain_start_scope", "slice__loader"."chain_start_step", "slice__loader"."chain_step", "slice__loader"."chain_within", "slice__loader"."copied", "slice__loader"."cursor", "slice__loader"."fan_done", "slice__loader"."fan_held", "slice__loader"."fan_result", "slice__loader"."fan_square_output", "slice__loader"."item", "slice__loader"."order", "slice__loader"."retry_brittle_output", "slice__loader"."retry_done", "slice__loader"."retry_held", "slice__loader"."retry_result", "slice__loader"."retry_steadfast_output", "slice__loader"."settled", "slice__loader"."sync_build_output", "slice__loader"."sync_copy_output", "slice__loader"."sync_done", "slice__loader"."sync_held", "slice__loader"."sync_result", "slice__loader"."tally", "slice__loader"."weight" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."built" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_admitted" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_done" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_due" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_finish" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_held" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_next" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_ordered_input" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_input_after" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_output_next" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_page_read" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_result" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_root" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_scope" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_scope" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_start_step" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_step" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chain_within" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."copied" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."cursor" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_done" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_held" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_result" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."fan_square_output" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."item" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."order" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_brittle_output" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_done" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_held" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_result" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."retry_steadfast_output" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."settled" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_build_output" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_copy_output" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_done" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_held" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."sync_result" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."tally" TO :"slice__loader";

GRANT SELECT, INSERT ON TABLE "slice"."weight" TO :"slice__loader";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__loader";

GRANT EXECUTE ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"(), "slice"."__chain_join_names_hvq3dwjqow"(), "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_page_input_feed_names_dxuyhzkiur"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__fan_join_names_gct5lzhdqo"(), "slice"."__fan_kind_names_gikh2fxf2t"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_xzmaxnvnb6"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() TO :"slice__loader";

GRANT USAGE ON SCHEMA "slice", "slice__retry_den" TO :"slice__retry_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable" TO :"slice__retry_den";

GRANT SELECT ON TABLE "slice__retry_den"."retry_admitted", "slice__retry_den"."retry_brittle_input", "slice__retry_den"."retry_brittle_output", "slice__retry_den"."retry_claim", "slice__retry_den"."retry_done", "slice__retry_den"."retry_due", "slice__retry_den"."retry_exhausted", "slice__retry_den"."retry_failed", "slice__retry_den"."retry_finish", "slice__retry_den"."retry_held", "slice__retry_den"."retry_ladders_input", "slice__retry_den"."retry_refusal", "slice__retry_den"."retry_result", "slice__retry_den"."retry_retry", "slice__retry_den"."retry_root", "slice__retry_den"."retry_scope", "slice__retry_den"."retry_skipped", "slice__retry_den"."retry_start_scope", "slice__retry_den"."retry_start_step", "slice__retry_den"."retry_steadfast_input", "slice__retry_den"."retry_steadfast_output", "slice__retry_den"."retry_step", "slice__retry_den"."retry_within" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_admitted" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_brittle_input" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_claim" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_done" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_due" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_exhausted" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_failed" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_finish" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_held" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_ladders_input" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_refusal" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_result" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_retry" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_root" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_scope" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_skipped" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_start_scope" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_start_step" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_steadfast_input" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_step" TO :"slice__retry_den";

GRANT SELECT, INSERT ON TABLE "slice"."retry_within" TO :"slice__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"() TO :"slice__retry_den";

GRANT USAGE ON SCHEMA "slice", "slice__retry_seats" TO :"slice__retry_seats";

GRANT USAGE ON DOMAIN "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable" TO :"slice__retry_seats";

GRANT SELECT ON TABLE "slice__retry_seats"."retry_paused" TO :"slice__retry_seats";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."retry_paused" TO :"slice__retry_seats";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__retry_seats";

GRANT EXECUTE ON FUNCTION "slice"."__retry_join_names_st4whng7gb"(), "slice"."__retry_kind_names_pa363dov7n"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_damz4vyplb"() TO :"slice__retry_seats";

GRANT USAGE ON SCHEMA "slice", "slice__sync_den" TO :"slice__sync_den";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."__domain_gfw43vigph", "slice"."__domain_mxhao3k6ss", "slice"."chain_kind", "slice"."chain_outcome", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable" TO :"slice__sync_den";

GRANT SELECT ON TABLE "slice__sync_den"."chain_result", "slice__sync_den"."chain_step", "slice__sync_den"."sync_admitted", "slice__sync_den"."sync_build_input", "slice__sync_den"."sync_build_output", "slice__sync_den"."sync_claim", "slice__sync_den"."sync_copy_input", "slice__sync_den"."sync_copy_output", "slice__sync_den"."sync_done", "slice__sync_den"."sync_due", "slice__sync_den"."sync_exclusive_key", "slice__sync_den"."sync_exhausted", "slice__sync_den"."sync_failed", "slice__sync_den"."sync_finish", "slice__sync_den"."sync_gold_input", "slice__sync_den"."sync_held", "slice__sync_den"."sync_refusal", "slice__sync_den"."sync_result", "slice__sync_den"."sync_retry", "slice__sync_den"."sync_root", "slice__sync_den"."sync_scope", "slice__sync_den"."sync_skipped", "slice__sync_den"."sync_start_scope", "slice__sync_den"."sync_start_step", "slice__sync_den"."sync_step", "slice__sync_den"."sync_sync_run_input", "slice__sync_den"."sync_within" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_admitted" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_build_input" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_claim" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_copy_input" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_done" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_due" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_exclusive_key" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_exhausted" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_failed" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_finish" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_gold_input" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_held" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_refusal" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_result" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_retry" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_root" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_scope" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_skipped" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_start_scope" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_start_step" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_step" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_sync_run_input" TO :"slice__sync_den";

GRANT SELECT, INSERT ON TABLE "slice"."sync_within" TO :"slice__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__chain_kind_names_73btyxoydp"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() TO :"slice__sync_den";

GRANT USAGE ON SCHEMA "slice", "slice__sync_seats" TO :"slice__sync_seats";

GRANT USAGE ON DOMAIN "slice"."__domain_jotafzuj2i", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable" TO :"slice__sync_seats";

GRANT SELECT ON TABLE "slice__sync_seats"."sync_exclusive", "slice__sync_seats"."sync_paused" TO :"slice__sync_seats";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."sync_exclusive" TO :"slice__sync_seats";

GRANT SELECT, INSERT, DELETE ON TABLE "slice"."sync_paused" TO :"slice__sync_seats";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice__sync_seats";

GRANT EXECUTE ON FUNCTION "slice"."__sync_join_names_cci5jmwoiz"(), "slice"."__sync_kind_names_4mra6ojpzm"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_ehqx6eh7nb"() TO :"slice__sync_seats";

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

REVOKE ALL ON SCHEMA "slice", "slice__auditor", "slice__loader", "slice__chain_den", "slice__chain_seats", "slice__fan_den", "slice__fan_seats", "slice__retry_den", "slice__retry_seats", "slice__sync_den", "slice__sync_seats" FROM PUBLIC;

REVOKE ALL ON TABLE "slice"."audit", "slice"."built", "slice"."chain_admitted", "slice"."chain_chain_run_input", "slice"."chain_claim", "slice"."chain_done", "slice"."chain_due", "slice"."chain_exhausted", "slice"."chain_failed", "slice"."chain_finish", "slice"."chain_held", "slice"."chain_next", "slice"."chain_ordered_input", "slice"."chain_page_input", "slice"."chain_page_input_after", "slice"."chain_page_output", "slice"."chain_page_output_next", "slice"."chain_page_read", "slice"."chain_paused", "slice"."chain_refusal", "slice"."chain_result", "slice"."chain_retry", "slice"."chain_root", "slice"."chain_scope", "slice"."chain_skipped", "slice"."chain_start_scope", "slice"."chain_start_step", "slice"."chain_step", "slice"."chain_within", "slice"."copied", "slice"."cursor", "slice"."fan_admitted", "slice"."fan_batch_input", "slice"."fan_claim", "slice"."fan_done", "slice"."fan_due", "slice"."fan_exhausted", "slice"."fan_failed", "slice"."fan_fan_run_input", "slice"."fan_finish", "slice"."fan_held", "slice"."fan_hold", "slice"."fan_paused", "slice"."fan_refusal", "slice"."fan_result", "slice"."fan_retry", "slice"."fan_root", "slice"."fan_scope", "slice"."fan_seat", "slice"."fan_skipped", "slice"."fan_square_input", "slice"."fan_square_output", "slice"."fan_start_scope", "slice"."fan_start_step", "slice"."fan_step", "slice"."fan_within", "slice"."item", "slice"."order", "slice"."retry_admitted", "slice"."retry_brittle_input", "slice"."retry_brittle_output", "slice"."retry_claim", "slice"."retry_done", "slice"."retry_due", "slice"."retry_exhausted", "slice"."retry_failed", "slice"."retry_finish", "slice"."retry_held", "slice"."retry_ladders_input", "slice"."retry_paused", "slice"."retry_refusal", "slice"."retry_result", "slice"."retry_retry", "slice"."retry_root", "slice"."retry_scope", "slice"."retry_skipped", "slice"."retry_start_scope", "slice"."retry_start_step", "slice"."retry_steadfast_input", "slice"."retry_steadfast_output", "slice"."retry_step", "slice"."retry_within", "slice"."settled", "slice"."sync_admitted", "slice"."sync_build_input", "slice"."sync_build_output", "slice"."sync_claim", "slice"."sync_copy_input", "slice"."sync_copy_output", "slice"."sync_done", "slice"."sync_due", "slice"."sync_exclusive", "slice"."sync_exclusive_key", "slice"."sync_exhausted", "slice"."sync_failed", "slice"."sync_finish", "slice"."sync_gold_input", "slice"."sync_held", "slice"."sync_paused", "slice"."sync_refusal", "slice"."sync_result", "slice"."sync_retry", "slice"."sync_root", "slice"."sync_scope", "slice"."sync_skipped", "slice"."sync_start_scope", "slice"."sync_start_step", "slice"."sync_step", "slice"."sync_sync_run_input", "slice"."sync_within", "slice"."tally", "slice"."weight", "slice__auditor"."audit", "slice__auditor"."built", "slice__auditor"."chain_admitted", "slice__auditor"."chain_chain_run_input", "slice__auditor"."chain_claim", "slice__auditor"."chain_finish", "slice__auditor"."chain_next", "slice__auditor"."chain_ordered_input", "slice__auditor"."chain_page_input", "slice__auditor"."chain_page_input_after", "slice__auditor"."chain_page_output", "slice__auditor"."chain_page_output_next", "slice__auditor"."chain_page_read", "slice__auditor"."chain_result", "slice__auditor"."chain_root", "slice__auditor"."chain_scope", "slice__auditor"."chain_start_scope", "slice__auditor"."chain_start_step", "slice__auditor"."chain_step", "slice__auditor"."chain_within", "slice__auditor"."copied", "slice__auditor"."cursor", "slice__auditor"."fan_admitted", "slice__auditor"."fan_batch_input", "slice__auditor"."fan_fan_run_input", "slice__auditor"."fan_finish", "slice__auditor"."fan_result", "slice__auditor"."fan_root", "slice__auditor"."fan_scope", "slice__auditor"."fan_square_input", "slice__auditor"."fan_square_output", "slice__auditor"."fan_start_scope", "slice__auditor"."fan_start_step", "slice__auditor"."fan_step", "slice__auditor"."fan_within", "slice__auditor"."item", "slice__auditor"."order", "slice__auditor"."retry_claim", "slice__auditor"."retry_exhausted", "slice__auditor"."retry_result", "slice__auditor"."retry_step", "slice__auditor"."settled", "slice__auditor"."sync_admitted", "slice__auditor"."sync_finish", "slice__auditor"."sync_result", "slice__auditor"."sync_scope", "slice__auditor"."sync_skipped", "slice__auditor"."tally", "slice__auditor"."weight", "slice__loader"."built", "slice__loader"."chain_admitted", "slice__loader"."chain_done", "slice__loader"."chain_due", "slice__loader"."chain_finish", "slice__loader"."chain_held", "slice__loader"."chain_next", "slice__loader"."chain_ordered_input", "slice__loader"."chain_page_input", "slice__loader"."chain_page_input_after", "slice__loader"."chain_page_output", "slice__loader"."chain_page_output_next", "slice__loader"."chain_page_read", "slice__loader"."chain_result", "slice__loader"."chain_root", "slice__loader"."chain_scope", "slice__loader"."chain_start_scope", "slice__loader"."chain_start_step", "slice__loader"."chain_step", "slice__loader"."chain_within", "slice__loader"."copied", "slice__loader"."cursor", "slice__loader"."fan_done", "slice__loader"."fan_held", "slice__loader"."fan_result", "slice__loader"."fan_square_output", "slice__loader"."item", "slice__loader"."order", "slice__loader"."retry_brittle_output", "slice__loader"."retry_done", "slice__loader"."retry_held", "slice__loader"."retry_result", "slice__loader"."retry_steadfast_output", "slice__loader"."settled", "slice__loader"."sync_build_output", "slice__loader"."sync_copy_output", "slice__loader"."sync_done", "slice__loader"."sync_held", "slice__loader"."sync_result", "slice__loader"."tally", "slice__loader"."weight", "slice__chain_den"."chain_admitted", "slice__chain_den"."chain_chain_run_input", "slice__chain_den"."chain_claim", "slice__chain_den"."chain_done", "slice__chain_den"."chain_due", "slice__chain_den"."chain_exhausted", "slice__chain_den"."chain_failed", "slice__chain_den"."chain_finish", "slice__chain_den"."chain_held", "slice__chain_den"."chain_next", "slice__chain_den"."chain_ordered_input", "slice__chain_den"."chain_page_input", "slice__chain_den"."chain_page_input_after", "slice__chain_den"."chain_page_output", "slice__chain_den"."chain_page_output_next", "slice__chain_den"."chain_page_read", "slice__chain_den"."chain_refusal", "slice__chain_den"."chain_result", "slice__chain_den"."chain_retry", "slice__chain_den"."chain_root", "slice__chain_den"."chain_scope", "slice__chain_den"."chain_skipped", "slice__chain_den"."chain_start_scope", "slice__chain_den"."chain_start_step", "slice__chain_den"."chain_step", "slice__chain_den"."chain_within", "slice__chain_seats"."chain_paused", "slice__fan_den"."fan_admitted", "slice__fan_den"."fan_batch_input", "slice__fan_den"."fan_claim", "slice__fan_den"."fan_done", "slice__fan_den"."fan_due", "slice__fan_den"."fan_exhausted", "slice__fan_den"."fan_failed", "slice__fan_den"."fan_fan_run_input", "slice__fan_den"."fan_finish", "slice__fan_den"."fan_held", "slice__fan_den"."fan_refusal", "slice__fan_den"."fan_result", "slice__fan_den"."fan_retry", "slice__fan_den"."fan_root", "slice__fan_den"."fan_scope", "slice__fan_den"."fan_skipped", "slice__fan_den"."fan_square_input", "slice__fan_den"."fan_square_output", "slice__fan_den"."fan_start_scope", "slice__fan_den"."fan_start_step", "slice__fan_den"."fan_step", "slice__fan_den"."fan_within", "slice__fan_seats"."fan_hold", "slice__fan_seats"."fan_paused", "slice__fan_seats"."fan_seat", "slice__retry_den"."retry_admitted", "slice__retry_den"."retry_brittle_input", "slice__retry_den"."retry_brittle_output", "slice__retry_den"."retry_claim", "slice__retry_den"."retry_done", "slice__retry_den"."retry_due", "slice__retry_den"."retry_exhausted", "slice__retry_den"."retry_failed", "slice__retry_den"."retry_finish", "slice__retry_den"."retry_held", "slice__retry_den"."retry_ladders_input", "slice__retry_den"."retry_refusal", "slice__retry_den"."retry_result", "slice__retry_den"."retry_retry", "slice__retry_den"."retry_root", "slice__retry_den"."retry_scope", "slice__retry_den"."retry_skipped", "slice__retry_den"."retry_start_scope", "slice__retry_den"."retry_start_step", "slice__retry_den"."retry_steadfast_input", "slice__retry_den"."retry_steadfast_output", "slice__retry_den"."retry_step", "slice__retry_den"."retry_within", "slice__retry_seats"."retry_paused", "slice__sync_den"."chain_result", "slice__sync_den"."chain_step", "slice__sync_den"."sync_admitted", "slice__sync_den"."sync_build_input", "slice__sync_den"."sync_build_output", "slice__sync_den"."sync_claim", "slice__sync_den"."sync_copy_input", "slice__sync_den"."sync_copy_output", "slice__sync_den"."sync_done", "slice__sync_den"."sync_due", "slice__sync_den"."sync_exclusive_key", "slice__sync_den"."sync_exhausted", "slice__sync_den"."sync_failed", "slice__sync_den"."sync_finish", "slice__sync_den"."sync_gold_input", "slice__sync_den"."sync_held", "slice__sync_den"."sync_refusal", "slice__sync_den"."sync_result", "slice__sync_den"."sync_retry", "slice__sync_den"."sync_root", "slice__sync_den"."sync_scope", "slice__sync_den"."sync_skipped", "slice__sync_den"."sync_start_scope", "slice__sync_den"."sync_start_step", "slice__sync_den"."sync_step", "slice__sync_den"."sync_sync_run_input", "slice__sync_den"."sync_within", "slice__sync_seats"."sync_exclusive", "slice__sync_seats"."sync_paused" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."chain_chain_run_input_feed", "slice"."chain_join", "slice"."chain_kind", "slice"."chain_ordered_input_feed", "slice"."chain_outcome", "slice"."chain_page_input_feed", "slice"."chain_pausable", "slice"."fan_join", "slice"."fan_kind", "slice"."fan_outcome", "slice"."fan_pausable", "slice"."fan_resource", "slice"."feed", "slice"."retry_join", "slice"."retry_kind", "slice"."retry_outcome", "slice"."retry_pausable", "slice"."sync_join", "slice"."sync_kind", "slice"."sync_outcome", "slice"."sync_pausable", "slice"."__text_t4rwovzmqj", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_jotafzuj2i", "slice"."__domain_jotafzuj2i", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph" FROM PUBLIC;

ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON TABLES FROM PUBLIC;

ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON SEQUENCES FROM PUBLIC;

ALTER DEFAULT PRIVILEGES REVOKE ALL ON FUNCTIONS FROM PUBLIC;

ALTER DEFAULT PRIVILEGES REVOKE ALL ON TYPES FROM PUBLIC;

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() IS 'names of roster ChainChainRunInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_join_names_hvq3dwjqow"() IS 'names of roster ChainJoin (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__chain_kind_names_73btyxoydp"() IS 'names of roster ChainKind (9f81ebefc25c080051160f0355945ed15c2d040b21830ba29c9f558be9018807)';

COMMENT ON FUNCTION "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"() IS 'names of roster ChainOrderedInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() IS 'names of roster ChainOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() IS 'names of roster ChainPageInputFeed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_pausable_names_vjdoymenyq"() IS 'names of roster ChainPausable (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__fan_join_names_gct5lzhdqo"() IS 'names of roster FanJoin (d77b79d385adc2a7e8acb4e4a4a35cf4e5217428ed007776aefa04ebd4a774fa)';

COMMENT ON FUNCTION "slice"."__fan_kind_names_gikh2fxf2t"() IS 'names of roster FanKind (e9aed98b3893ff20de22383ac3b4ec54f57129936d708100bd0ae678466bbe14)';

COMMENT ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() IS 'names of roster FanOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__fan_pausable_names_xzmaxnvnb6"() IS 'names of roster FanPausable (20902385642e885b461980fb4003ba938392e07c1b7fca42d8b11a7019d3091f)';

COMMENT ON FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() IS 'names of roster FanResource (5bea949a8ab6e8182609b54fd43410c2c13a5abe4a43bb2905848fd3ad333c76)';

COMMENT ON FUNCTION "slice"."__feed_names_azjbqebc6i"() IS 'names of roster Feed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__retry_join_names_st4whng7gb"() IS 'names of roster RetryJoin (38b360cad31dcf5dfc30ec703da8ce5ff3ddf536a6f81ae889f8b55c07dfdf81)';

COMMENT ON FUNCTION "slice"."__retry_kind_names_pa363dov7n"() IS 'names of roster RetryKind (899f76629c33c2f6c599bbf5cc5cfcce7c6e1b31e1f3ec605d65281fbce5603d)';

COMMENT ON FUNCTION "slice"."__retry_outcome_names_zzz2kawwsa"() IS 'names of roster RetryOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__retry_pausable_names_damz4vyplb"() IS 'names of roster RetryPausable (38b360cad31dcf5dfc30ec703da8ce5ff3ddf536a6f81ae889f8b55c07dfdf81)';

COMMENT ON FUNCTION "slice"."__sync_join_names_cci5jmwoiz"() IS 'names of roster SyncJoin (1f6eed5aa44510dabb94bfc8a1546f51eaccff47307b5a24adf0b89e7f13841a)';

COMMENT ON FUNCTION "slice"."__sync_kind_names_4mra6ojpzm"() IS 'names of roster SyncKind (c8e254e34ead41eb1b2aa11d20aa73efafb60657f8b54f68d78f09f72c82431d)';

COMMENT ON FUNCTION "slice"."__sync_outcome_names_xzb4y4xgki"() IS 'names of roster SyncOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__sync_pausable_names_ehqx6eh7nb"() IS 'names of roster SyncPausable (1f6eed5aa44510dabb94bfc8a1546f51eaccff47307b5a24adf0b89e7f13841a)';

COMMENT ON DOMAIN "slice"."__domain_jotafzuj2i" IS 'domain of definition 2bb9f8bcd5ca34ebfde7708e229f30409aad95a1fa4f4398311673f0c0eacec4';

COMMENT ON DOMAIN "slice"."__domain_gfw43vigph" IS 'domain of definition 39922592cedecf769d6df372d6df99e0b82206b0bf6dacd9722d0490f83cc782';

COMMENT ON DOMAIN "slice"."__domain_mxhao3k6ss" IS 'domain of definition be4e1f34160619e14c4a8009e96d1ced7b683a1e169a9e4d0e9e10640701b8aa';

COMMENT ON DOMAIN "slice"."__text_t4rwovzmqj" IS 'text domain of definition 6f5ba169462bdb47db4c56bb5fe21d5091867333e4952f2c20b18e8fa085befc';

COMMENT ON CONSTRAINT "__audit_pk_dcvpvv5cjz" ON "slice"."audit" IS 'primary key of Audit';

COMMENT ON CONSTRAINT "__built_pk_5tj25hcq6k" ON "slice"."built" IS 'primary key of Built';

COMMENT ON CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" ON "slice"."chain_admitted" IS 'primary key of ChainAdmitted';

COMMENT ON CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" ON "slice"."chain_chain_run_input" IS 'primary key of ChainChainRunInput';

COMMENT ON CONSTRAINT "__chain_claim_pk_nrr2rn3gui" ON "slice"."chain_claim" IS 'primary key of ChainClaim';

COMMENT ON CONSTRAINT "__chain_done_pk_tyyx2hmu3r" ON "slice"."chain_done" IS 'primary key of ChainDone';

COMMENT ON CONSTRAINT "__chain_due_pk_d5xdvmzepr" ON "slice"."chain_due" IS 'primary key of ChainDue';

COMMENT ON CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" ON "slice"."chain_exhausted" IS 'primary key of ChainExhausted';

COMMENT ON CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" ON "slice"."chain_failed" IS 'primary key of ChainFailed';

COMMENT ON CONSTRAINT "__chain_finish_pk_ebe75jmnzy" ON "slice"."chain_finish" IS 'primary key of ChainFinish';

COMMENT ON CONSTRAINT "__chain_finish_key_step_x7i5pvi5jm" ON "slice"."chain_finish" IS 'key ChainFinish(step)';

COMMENT ON CONSTRAINT "__chain_held_pk_73idl7oo5c" ON "slice"."chain_held" IS 'primary key of ChainHeld';

COMMENT ON CONSTRAINT "__chain_next_pk_qeumlilvtk" ON "slice"."chain_next" IS 'primary key of ChainNext';

COMMENT ON CONSTRAINT "__chain_next_key_to_jqccfs2l4c" ON "slice"."chain_next" IS 'key ChainNext(to)';

COMMENT ON CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" ON "slice"."chain_ordered_input" IS 'primary key of ChainOrderedInput';

COMMENT ON CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" ON "slice"."chain_page_input" IS 'primary key of ChainPageInput';

COMMENT ON CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" ON "slice"."chain_page_input_after" IS 'primary key of ChainPageInputAfter';

COMMENT ON CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" ON "slice"."chain_page_output" IS 'primary key of ChainPageOutput';

COMMENT ON CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" ON "slice"."chain_page_output_next" IS 'primary key of ChainPageOutputNext';

COMMENT ON CONSTRAINT "__chain_page_read_pk_yets7gftg6" ON "slice"."chain_page_read" IS 'primary key of ChainPageRead';

COMMENT ON CONSTRAINT "__chain_paused_pk_oorovhvyps" ON "slice"."chain_paused" IS 'primary key of ChainPaused';

COMMENT ON CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" ON "slice"."chain_refusal" IS 'primary key of ChainRefusal';

COMMENT ON CONSTRAINT "__chain_result_pk_btw3jzlkgl" ON "slice"."chain_result" IS 'primary key of ChainResult';

COMMENT ON CONSTRAINT "__chain_result_key_step_outcome_hqqrqon5z3" ON "slice"."chain_result" IS 'key ChainResult(step, outcome)';

COMMENT ON CONSTRAINT "__chain_retry_pk_522nodru3s" ON "slice"."chain_retry" IS 'primary key of ChainRetry';

COMMENT ON CONSTRAINT "__chain_root_pk_wqfycdg3x5" ON "slice"."chain_root" IS 'primary key of ChainRoot';

COMMENT ON CONSTRAINT "__chain_scope_pk_fxzt444lf6" ON "slice"."chain_scope" IS 'primary key of ChainScope';

COMMENT ON CONSTRAINT "__chain_scope_key_scope_kind_f3gtwiklfd" ON "slice"."chain_scope" IS 'key ChainScope(scope, kind)';

COMMENT ON CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" ON "slice"."chain_skipped" IS 'primary key of ChainSkipped';

COMMENT ON CONSTRAINT "__chain_start_scope_pk_t4giphzblt" ON "slice"."chain_start_scope" IS 'primary key of ChainStartScope';

COMMENT ON CONSTRAINT "__chain_start_scope_key_child_h23cre6olg" ON "slice"."chain_start_scope" IS 'key ChainStartScope(child)';

COMMENT ON CONSTRAINT "__chain_start_step_pk_dgda7shxb4" ON "slice"."chain_start_step" IS 'primary key of ChainStartStep';

COMMENT ON CONSTRAINT "__chain_start_step_key_step_ygziyjwk3l" ON "slice"."chain_start_step" IS 'key ChainStartStep(step)';

COMMENT ON CONSTRAINT "__chain_step_pk_u6x5wnvfbv" ON "slice"."chain_step" IS 'primary key of ChainStep';

COMMENT ON CONSTRAINT "__chain_step_key_step_kind_dlshgwdqz2" ON "slice"."chain_step" IS 'key ChainStep(step, kind)';

COMMENT ON CONSTRAINT "__chain_within_pk_ihqzjavdib" ON "slice"."chain_within" IS 'primary key of ChainWithin';

COMMENT ON CONSTRAINT "__copied_pk_6dsi4gohbu" ON "slice"."copied" IS 'primary key of Copied';

COMMENT ON CONSTRAINT "__cursor_pk_wl2ngqny4j" ON "slice"."cursor" IS 'primary key of Cursor';

COMMENT ON CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" ON "slice"."fan_admitted" IS 'primary key of FanAdmitted';

COMMENT ON CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" ON "slice"."fan_batch_input" IS 'primary key of FanBatchInput';

COMMENT ON CONSTRAINT "__fan_claim_pk_e7zimqppco" ON "slice"."fan_claim" IS 'primary key of FanClaim';

COMMENT ON CONSTRAINT "__fan_done_pk_5u65252q52" ON "slice"."fan_done" IS 'primary key of FanDone';

COMMENT ON CONSTRAINT "__fan_due_pk_yc6ppd3zm6" ON "slice"."fan_due" IS 'primary key of FanDue';

COMMENT ON CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" ON "slice"."fan_exhausted" IS 'primary key of FanExhausted';

COMMENT ON CONSTRAINT "__fan_failed_pk_z4etp5dmax" ON "slice"."fan_failed" IS 'primary key of FanFailed';

COMMENT ON CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" ON "slice"."fan_fan_run_input" IS 'primary key of FanFanRunInput';

COMMENT ON CONSTRAINT "__fan_finish_pk_6mb33urjra" ON "slice"."fan_finish" IS 'primary key of FanFinish';

COMMENT ON CONSTRAINT "__fan_finish_key_step_v72sacijwp" ON "slice"."fan_finish" IS 'key FanFinish(step)';

COMMENT ON CONSTRAINT "__fan_held_pk_4ic6tjvac4" ON "slice"."fan_held" IS 'primary key of FanHeld';

COMMENT ON CONSTRAINT "__fan_hold_pk_avuqdkljvb" ON "slice"."fan_hold" IS 'primary key of FanHold';

COMMENT ON CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" ON "slice"."fan_paused" IS 'primary key of FanPaused';

COMMENT ON CONSTRAINT "__fan_refusal_pk_7va55wo2wj" ON "slice"."fan_refusal" IS 'primary key of FanRefusal';

COMMENT ON CONSTRAINT "__fan_result_pk_yeear352sx" ON "slice"."fan_result" IS 'primary key of FanResult';

COMMENT ON CONSTRAINT "__fan_result_key_step_outcome_5nrb7r22qd" ON "slice"."fan_result" IS 'key FanResult(step, outcome)';

COMMENT ON CONSTRAINT "__fan_retry_pk_7xubce4v66" ON "slice"."fan_retry" IS 'primary key of FanRetry';

COMMENT ON CONSTRAINT "__fan_root_pk_jesu7xtefn" ON "slice"."fan_root" IS 'primary key of FanRoot';

COMMENT ON CONSTRAINT "__fan_scope_pk_7bvjfihnef" ON "slice"."fan_scope" IS 'primary key of FanScope';

COMMENT ON CONSTRAINT "__fan_scope_key_scope_kind_epdwnzjh52" ON "slice"."fan_scope" IS 'key FanScope(scope, kind)';

COMMENT ON CONSTRAINT "__fan_seat_pk_ad6aaozjhg" ON "slice"."fan_seat" IS 'primary key of FanSeat';

COMMENT ON CONSTRAINT "__fan_skipped_pk_22erbmfzer" ON "slice"."fan_skipped" IS 'primary key of FanSkipped';

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

COMMENT ON CONSTRAINT "__order_pk_qodq3est7o" ON "slice"."order" IS 'primary key of Order';

COMMENT ON CONSTRAINT "__retry_admitted_pk_qyp7cminjx" ON "slice"."retry_admitted" IS 'primary key of RetryAdmitted';

COMMENT ON CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" ON "slice"."retry_brittle_input" IS 'primary key of RetryBrittleInput';

COMMENT ON CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" ON "slice"."retry_brittle_output" IS 'primary key of RetryBrittleOutput';

COMMENT ON CONSTRAINT "__retry_claim_pk_aayzt5ni6z" ON "slice"."retry_claim" IS 'primary key of RetryClaim';

COMMENT ON CONSTRAINT "__retry_done_pk_vtkpce7rkq" ON "slice"."retry_done" IS 'primary key of RetryDone';

COMMENT ON CONSTRAINT "__retry_due_pk_lerzzlnz7o" ON "slice"."retry_due" IS 'primary key of RetryDue';

COMMENT ON CONSTRAINT "__retry_exhausted_pk_v56c23krid" ON "slice"."retry_exhausted" IS 'primary key of RetryExhausted';

COMMENT ON CONSTRAINT "__retry_failed_pk_mygc4onczp" ON "slice"."retry_failed" IS 'primary key of RetryFailed';

COMMENT ON CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" ON "slice"."retry_finish" IS 'primary key of RetryFinish';

COMMENT ON CONSTRAINT "__retry_finish_key_step_lifwe43hve" ON "slice"."retry_finish" IS 'key RetryFinish(step)';

COMMENT ON CONSTRAINT "__retry_held_pk_nvgeylmjp2" ON "slice"."retry_held" IS 'primary key of RetryHeld';

COMMENT ON CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" ON "slice"."retry_ladders_input" IS 'primary key of RetryLaddersInput';

COMMENT ON CONSTRAINT "__retry_paused_pk_umm2nscqny" ON "slice"."retry_paused" IS 'primary key of RetryPaused';

COMMENT ON CONSTRAINT "__retry_refusal_pk_nifndsd6pp" ON "slice"."retry_refusal" IS 'primary key of RetryRefusal';

COMMENT ON CONSTRAINT "__retry_result_pk_5fegihvmml" ON "slice"."retry_result" IS 'primary key of RetryResult';

COMMENT ON CONSTRAINT "__retry_result_key_step_outcome_vx2zehdpf7" ON "slice"."retry_result" IS 'key RetryResult(step, outcome)';

COMMENT ON CONSTRAINT "__retry_retry_pk_slrwn4rt5d" ON "slice"."retry_retry" IS 'primary key of RetryRetry';

COMMENT ON CONSTRAINT "__retry_root_pk_qi2iw36jky" ON "slice"."retry_root" IS 'primary key of RetryRoot';

COMMENT ON CONSTRAINT "__retry_scope_pk_fgji2phvxy" ON "slice"."retry_scope" IS 'primary key of RetryScope';

COMMENT ON CONSTRAINT "__retry_scope_key_scope_kind_u77uvbp4xb" ON "slice"."retry_scope" IS 'key RetryScope(scope, kind)';

COMMENT ON CONSTRAINT "__retry_skipped_pk_au5z33ql7a" ON "slice"."retry_skipped" IS 'primary key of RetrySkipped';

COMMENT ON CONSTRAINT "__retry_start_scope_pk_wsif6notdn" ON "slice"."retry_start_scope" IS 'primary key of RetryStartScope';

COMMENT ON CONSTRAINT "__retry_start_scope_key_child_6csfbzabat" ON "slice"."retry_start_scope" IS 'key RetryStartScope(child)';

COMMENT ON CONSTRAINT "__retry_start_step_pk_mp77csmi26" ON "slice"."retry_start_step" IS 'primary key of RetryStartStep';

COMMENT ON CONSTRAINT "__retry_start_step_key_step_bbqb64zg6p" ON "slice"."retry_start_step" IS 'key RetryStartStep(step)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" ON "slice"."retry_steadfast_input" IS 'primary key of RetrySteadfastInput';

COMMENT ON CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" ON "slice"."retry_steadfast_output" IS 'primary key of RetrySteadfastOutput';

COMMENT ON CONSTRAINT "__retry_step_pk_opjqidwhzg" ON "slice"."retry_step" IS 'primary key of RetryStep';

COMMENT ON CONSTRAINT "__retry_step_key_step_kind_aacvsq3pqx" ON "slice"."retry_step" IS 'key RetryStep(step, kind)';

COMMENT ON CONSTRAINT "__retry_within_pk_t64odgwbuc" ON "slice"."retry_within" IS 'primary key of RetryWithin';

COMMENT ON CONSTRAINT "__settled_pk_yitdz6z3ts" ON "slice"."settled" IS 'primary key of Settled';

COMMENT ON CONSTRAINT "__sync_admitted_pk_ral53o3fpi" ON "slice"."sync_admitted" IS 'primary key of SyncAdmitted';

COMMENT ON CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" ON "slice"."sync_build_input" IS 'primary key of SyncBuildInput';

COMMENT ON CONSTRAINT "__sync_build_output_pk_rhnco3epch" ON "slice"."sync_build_output" IS 'primary key of SyncBuildOutput';

COMMENT ON CONSTRAINT "__sync_claim_pk_s2tqnziq4u" ON "slice"."sync_claim" IS 'primary key of SyncClaim';

COMMENT ON CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" ON "slice"."sync_copy_input" IS 'primary key of SyncCopyInput';

COMMENT ON CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" ON "slice"."sync_copy_output" IS 'primary key of SyncCopyOutput';

COMMENT ON CONSTRAINT "__sync_done_pk_nllomjb7og" ON "slice"."sync_done" IS 'primary key of SyncDone';

COMMENT ON CONSTRAINT "__sync_due_pk_hkeoswqthe" ON "slice"."sync_due" IS 'primary key of SyncDue';

COMMENT ON CONSTRAINT "__sync_exclusive_pk_joiibnjuvf" ON "slice"."sync_exclusive" IS 'primary key of SyncExclusive';

COMMENT ON CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" ON "slice"."sync_exclusive_key" IS 'primary key of SyncExclusiveKey';

COMMENT ON CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" ON "slice"."sync_exhausted" IS 'primary key of SyncExhausted';

COMMENT ON CONSTRAINT "__sync_failed_pk_gqykngewxb" ON "slice"."sync_failed" IS 'primary key of SyncFailed';

COMMENT ON CONSTRAINT "__sync_finish_pk_hn7tmx25xc" ON "slice"."sync_finish" IS 'primary key of SyncFinish';

COMMENT ON CONSTRAINT "__sync_finish_key_step_wzmqfzha66" ON "slice"."sync_finish" IS 'key SyncFinish(step)';

COMMENT ON CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" ON "slice"."sync_gold_input" IS 'primary key of SyncGoldInput';

COMMENT ON CONSTRAINT "__sync_held_pk_wsme4moka4" ON "slice"."sync_held" IS 'primary key of SyncHeld';

COMMENT ON CONSTRAINT "__sync_paused_pk_tstk2okngj" ON "slice"."sync_paused" IS 'primary key of SyncPaused';

COMMENT ON CONSTRAINT "__sync_refusal_pk_mbmfornc5c" ON "slice"."sync_refusal" IS 'primary key of SyncRefusal';

COMMENT ON CONSTRAINT "__sync_result_pk_jmwy2p3mqf" ON "slice"."sync_result" IS 'primary key of SyncResult';

COMMENT ON CONSTRAINT "__sync_result_key_step_outcome_wyar5y72qb" ON "slice"."sync_result" IS 'key SyncResult(step, outcome)';

COMMENT ON CONSTRAINT "__sync_retry_pk_6q52red7iw" ON "slice"."sync_retry" IS 'primary key of SyncRetry';

COMMENT ON CONSTRAINT "__sync_root_pk_daktpubfe2" ON "slice"."sync_root" IS 'primary key of SyncRoot';

COMMENT ON CONSTRAINT "__sync_scope_pk_bg72sm6p4z" ON "slice"."sync_scope" IS 'primary key of SyncScope';

COMMENT ON CONSTRAINT "__sync_scope_key_scope_kind_unp3injvzz" ON "slice"."sync_scope" IS 'key SyncScope(scope, kind)';

COMMENT ON CONSTRAINT "__sync_skipped_pk_yutjqacvws" ON "slice"."sync_skipped" IS 'primary key of SyncSkipped';

COMMENT ON CONSTRAINT "__sync_start_scope_pk_zsezuom4ll" ON "slice"."sync_start_scope" IS 'primary key of SyncStartScope';

COMMENT ON CONSTRAINT "__sync_start_scope_key_child_5un3xf76pf" ON "slice"."sync_start_scope" IS 'key SyncStartScope(child)';

COMMENT ON CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" ON "slice"."sync_start_step" IS 'primary key of SyncStartStep';

COMMENT ON CONSTRAINT "__sync_start_step_key_step_qq4dgpmkqz" ON "slice"."sync_start_step" IS 'key SyncStartStep(step)';

COMMENT ON CONSTRAINT "__sync_step_pk_wfgcxdvbwo" ON "slice"."sync_step" IS 'primary key of SyncStep';

COMMENT ON CONSTRAINT "__sync_step_key_step_kind_wiu4mx45lf" ON "slice"."sync_step" IS 'key SyncStep(step, kind)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" ON "slice"."sync_sync_run_input" IS 'primary key of SyncSyncRunInput';

COMMENT ON CONSTRAINT "__sync_within_pk_xcfutikja2" ON "slice"."sync_within" IS 'primary key of SyncWithin';

COMMENT ON CONSTRAINT "__tally_pk_7jc66uxxx4" ON "slice"."tally" IS 'primary key of Tally';

COMMENT ON CONSTRAINT "__weight_pk_p77rl634io" ON "slice"."weight" IS 'primary key of Weight';

COMMENT ON COLUMN "slice"."chain_chain_run_input"."__tag_kind_chain_run_ufow3vhuwb" IS 'tag ChainScope.kind = ChainRun';

COMMENT ON COLUMN "slice"."chain_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."chain_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."chain_done"."__tag_outcome_done_uhpvxcbhg2" IS 'tag ChainResult.outcome = done';

COMMENT ON COLUMN "slice"."chain_failed"."__tag_outcome_failed_lrxbpw73ih" IS 'tag ChainResult.outcome = failed';

COMMENT ON COLUMN "slice"."chain_ordered_input"."__tag_kind_ordered_bcobbqxaja" IS 'tag ChainScope.kind = Ordered';

COMMENT ON COLUMN "slice"."chain_page_input"."__tag_kind_page_wmj4dlxrkf" IS 'tag ChainStep.kind = Page';

COMMENT ON COLUMN "slice"."fan_batch_input"."__tag_kind_batch_fkqwrqkogg" IS 'tag FanScope.kind = Batch';

COMMENT ON COLUMN "slice"."fan_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."fan_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."fan_done"."__tag_outcome_done_tulqbccryg" IS 'tag FanResult.outcome = done';

COMMENT ON COLUMN "slice"."fan_failed"."__tag_outcome_failed_3kga3qw77n" IS 'tag FanResult.outcome = failed';

COMMENT ON COLUMN "slice"."fan_fan_run_input"."__tag_kind_fan_run_eorldhk2ce" IS 'tag FanScope.kind = FanRun';

COMMENT ON COLUMN "slice"."fan_square_input"."__tag_kind_square_q3stoybx3v" IS 'tag FanStep.kind = Square';

COMMENT ON COLUMN "slice"."retry_brittle_input"."__tag_kind_brittle_wzfwqdkbkg" IS 'tag RetryStep.kind = Brittle';

COMMENT ON COLUMN "slice"."retry_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."retry_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."retry_done"."__tag_outcome_done_k5wikz4kly" IS 'tag RetryResult.outcome = done';

COMMENT ON COLUMN "slice"."retry_failed"."__tag_outcome_failed_446fx3eezg" IS 'tag RetryResult.outcome = failed';

COMMENT ON COLUMN "slice"."retry_ladders_input"."__tag_kind_ladders_gimfs6gp4j" IS 'tag RetryScope.kind = Ladders';

COMMENT ON COLUMN "slice"."retry_steadfast_input"."__tag_kind_steadfast_4rudtmco65" IS 'tag RetryStep.kind = Steadfast';

COMMENT ON COLUMN "slice"."sync_build_input"."__tag_kind_build_pslevsssox" IS 'tag SyncStep.kind = Build';

COMMENT ON COLUMN "slice"."sync_claim"."__step_fxyms236d4" IS 'step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."sync_claim"."__pred_attempt_xnnzpydhox" IS 'pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}';

COMMENT ON COLUMN "slice"."sync_copy_input"."__tag_kind_copy_wfaj52nfh7" IS 'tag SyncStep.kind = Copy';

COMMENT ON COLUMN "slice"."sync_done"."__tag_outcome_done_pkvv6jrgpq" IS 'tag SyncResult.outcome = done';

COMMENT ON COLUMN "slice"."sync_failed"."__tag_outcome_failed_26do6twsnf" IS 'tag SyncResult.outcome = failed';

COMMENT ON COLUMN "slice"."sync_gold_input"."__tag_kind_gold_7mgmvxjg34" IS 'tag SyncScope.kind = Gold';

COMMENT ON COLUMN "slice"."sync_sync_run_input"."__tag_kind_sync_run_wcjtzgltvo" IS 'tag SyncScope.kind = SyncRun';

COMMENT ON CONSTRAINT "__audit_fk_step_zgfyapbfme" ON "slice"."audit" IS 'foreign key Audit(step) to ChainResult(step)';

COMMENT ON CONSTRAINT "__chain_admitted_fk_scope_ayutazf7v2" ON "slice"."chain_admitted" IS 'foreign key ChainAdmitted(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_fk_scope_tag_kind_chain_run_m37i2umurb" ON "slice"."chain_chain_run_input" IS 'foreign key ChainChainRunInput(scope, tag ChainScope.kind = ChainRun) to ChainScope(scope, kind)';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_tlgqnv6mzi" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_claim_fk_step_pred_attempt_eaxsvkfnat" ON "slice"."chain_claim" IS 'foreign key ChainClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to ChainClaim(step, attempt)';

COMMENT ON CONSTRAINT "__chain_done_fk_step_tag_outcome_done_chiiliaypx" ON "slice"."chain_done" IS 'foreign key ChainDone(step, tag ChainResult.outcome = done) to ChainResult(step, outcome)';

COMMENT ON CONSTRAINT "__chain_due_fk_step_dcq52t54ph" ON "slice"."chain_due" IS 'foreign key ChainDue(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_step_fa2jqgxojj" ON "slice"."chain_exhausted" IS 'foreign key ChainExhausted(step) to ChainFailed(step)';

COMMENT ON CONSTRAINT "__chain_failed_fk_step_tag_outcome_failed_2enwrjafnc" ON "slice"."chain_failed" IS 'foreign key ChainFailed(step, tag ChainResult.outcome = failed) to ChainResult(step, outcome)';

COMMENT ON CONSTRAINT "__chain_finish_fk_scope_cfnzgc3ln5" ON "slice"."chain_finish" IS 'foreign key ChainFinish(scope) to ChainAdmitted(scope)';

COMMENT ON CONSTRAINT "__chain_finish_fk_step_djulfbbhyv" ON "slice"."chain_finish" IS 'foreign key ChainFinish(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_held_fk_step_gn4a3vhis4" ON "slice"."chain_held" IS 'foreign key ChainHeld(step) to ChainResult(step)';

COMMENT ON CONSTRAINT "__chain_held_fk_step_attempt_ha67r6xn73" ON "slice"."chain_held" IS 'foreign key ChainHeld(step, attempt) to ChainClaim(step, attempt)';

COMMENT ON CONSTRAINT "__chain_next_fk_from_y5is7epime" ON "slice"."chain_next" IS 'foreign key ChainNext(from) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_next_fk_to_4dtheiiigt" ON "slice"."chain_next" IS 'foreign key ChainNext(to) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_ordered_input_fk_scope_tag_kind_ordered_hubpibwkd5" ON "slice"."chain_ordered_input" IS 'foreign key ChainOrderedInput(scope, tag ChainScope.kind = Ordered) to ChainScope(scope, kind)';

COMMENT ON CONSTRAINT "__chain_page_input_fk_step_tag_kind_page_iu55gzqbo5" ON "slice"."chain_page_input" IS 'foreign key ChainPageInput(step, tag ChainStep.kind = Page) to ChainStep(step, kind)';

COMMENT ON CONSTRAINT "__chain_page_input_after_fk_step_lfprg2mtrc" ON "slice"."chain_page_input_after" IS 'foreign key ChainPageInputAfter(step) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_ski2uzorzn" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step) to ChainDone(step)';

COMMENT ON CONSTRAINT "__chain_page_output_fk_step_g37yommeoy" ON "slice"."chain_page_output" IS 'foreign key ChainPageOutput(step) to ChainPageInput(step)';

COMMENT ON CONSTRAINT "__chain_page_output_next_fk_step_azw5pfnnsa" ON "slice"."chain_page_output_next" IS 'foreign key ChainPageOutputNext(step) to ChainPageOutput(step)';

COMMENT ON CONSTRAINT "__chain_page_read_fk_step_wj2fe2lazd" ON "slice"."chain_page_read" IS 'foreign key ChainPageRead(step) to ChainResult(step)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_step_bac3stmrn3" ON "slice"."chain_refusal" IS 'foreign key ChainRefusal(step) to ChainFailed(step)';

COMMENT ON CONSTRAINT "__chain_result_fk_step_dbmjl746t7" ON "slice"."chain_result" IS 'foreign key ChainResult(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_retry_fk_step_attempt_ezek5vymkn" ON "slice"."chain_retry" IS 'foreign key ChainRetry(step, attempt) to ChainClaim(step, attempt)';

COMMENT ON CONSTRAINT "__chain_root_fk_scope_g7gu2qhyp2" ON "slice"."chain_root" IS 'foreign key ChainRoot(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_by_6rnf2fiiiy" ON "slice"."chain_skipped" IS 'foreign key ChainSkipped(by) to ChainAdmitted(scope)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_scope_ozicxyda6o" ON "slice"."chain_skipped" IS 'foreign key ChainSkipped(scope) to ChainRoot(scope)';

COMMENT ON CONSTRAINT "__chain_start_scope_fk_child_bz3czs5on4" ON "slice"."chain_start_scope" IS 'foreign key ChainStartScope(child) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_start_scope_fk_scope_j7b72gqt5h" ON "slice"."chain_start_scope" IS 'foreign key ChainStartScope(scope) to ChainAdmitted(scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_scope_fo4zcmg3hw" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(scope) to ChainAdmitted(scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_step_yqr6ccimjq" ON "slice"."chain_start_step" IS 'foreign key ChainStartStep(step) to ChainStep(step)';

COMMENT ON CONSTRAINT "__chain_step_fk_scope_gig4dsmris" ON "slice"."chain_step" IS 'foreign key ChainStep(scope) to ChainAdmitted(scope)';

COMMENT ON CONSTRAINT "__chain_within_fk_parent_n3pon4mlxe" ON "slice"."chain_within" IS 'foreign key ChainWithin(parent) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_within_fk_scope_gzdy7afflv" ON "slice"."chain_within" IS 'foreign key ChainWithin(scope) to ChainScope(scope)';

COMMENT ON CONSTRAINT "__fan_admitted_fk_scope_zsdeiuzwyh" ON "slice"."fan_admitted" IS 'foreign key FanAdmitted(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_batch_input_fk_scope_tag_kind_batch_b6gxzmmqsm" ON "slice"."fan_batch_input" IS 'foreign key FanBatchInput(scope, tag FanScope.kind = Batch) to FanScope(scope, kind)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_ihp5bkdfc7" ON "slice"."fan_claim" IS 'foreign key FanClaim(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_claim_fk_step_pred_attempt_r5pt5cwztz" ON "slice"."fan_claim" IS 'foreign key FanClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to FanClaim(step, attempt)';

COMMENT ON CONSTRAINT "__fan_done_fk_step_tag_outcome_done_jagqpg3plp" ON "slice"."fan_done" IS 'foreign key FanDone(step, tag FanResult.outcome = done) to FanResult(step, outcome)';

COMMENT ON CONSTRAINT "__fan_due_fk_step_ddpvumwcis" ON "slice"."fan_due" IS 'foreign key FanDue(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_step_j42evr2xp3" ON "slice"."fan_exhausted" IS 'foreign key FanExhausted(step) to FanFailed(step)';

COMMENT ON CONSTRAINT "__fan_failed_fk_step_tag_outcome_failed_isdm7nl2mt" ON "slice"."fan_failed" IS 'foreign key FanFailed(step, tag FanResult.outcome = failed) to FanResult(step, outcome)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_fk_scope_tag_kind_fan_run_tihneov63d" ON "slice"."fan_fan_run_input" IS 'foreign key FanFanRunInput(scope, tag FanScope.kind = FanRun) to FanScope(scope, kind)';

COMMENT ON CONSTRAINT "__fan_finish_fk_scope_7bafbqarll" ON "slice"."fan_finish" IS 'foreign key FanFinish(scope) to FanAdmitted(scope)';

COMMENT ON CONSTRAINT "__fan_finish_fk_step_f3he376omz" ON "slice"."fan_finish" IS 'foreign key FanFinish(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_held_fk_step_6tkjkyjp3h" ON "slice"."fan_held" IS 'foreign key FanHeld(step) to FanResult(step)';

COMMENT ON CONSTRAINT "__fan_held_fk_step_attempt_zol2no7gql" ON "slice"."fan_held" IS 'foreign key FanHeld(step, attempt) to FanClaim(step, attempt)';

COMMENT ON CONSTRAINT "__fan_hold_fk_resource_seat_ckrj3dllkr" ON "slice"."fan_hold" IS 'foreign key FanHold(resource, seat) to FanSeat(resource, seat)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_step_otwlhohyvs" ON "slice"."fan_refusal" IS 'foreign key FanRefusal(step) to FanFailed(step)';

COMMENT ON CONSTRAINT "__fan_result_fk_step_kzt2ms65pp" ON "slice"."fan_result" IS 'foreign key FanResult(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_retry_fk_step_attempt_ch6qjnmtkt" ON "slice"."fan_retry" IS 'foreign key FanRetry(step, attempt) to FanClaim(step, attempt)';

COMMENT ON CONSTRAINT "__fan_root_fk_scope_7k4byqnauw" ON "slice"."fan_root" IS 'foreign key FanRoot(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_by_ofiy7h4yez" ON "slice"."fan_skipped" IS 'foreign key FanSkipped(by) to FanAdmitted(scope)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_scope_eomkgfbxwj" ON "slice"."fan_skipped" IS 'foreign key FanSkipped(scope) to FanRoot(scope)';

COMMENT ON CONSTRAINT "__fan_square_input_fk_step_tag_kind_square_dshd7bwrky" ON "slice"."fan_square_input" IS 'foreign key FanSquareInput(step, tag FanStep.kind = Square) to FanStep(step, kind)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_ho2zf7mac5" ON "slice"."fan_square_output" IS 'foreign key FanSquareOutput(step) to FanDone(step)';

COMMENT ON CONSTRAINT "__fan_square_output_fk_step_prwr7wqv35" ON "slice"."fan_square_output" IS 'foreign key FanSquareOutput(step) to FanSquareInput(step)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_child_ngma7ay7kq" ON "slice"."fan_start_scope" IS 'foreign key FanStartScope(child) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_scope_ewnvx2xo4c" ON "slice"."fan_start_scope" IS 'foreign key FanStartScope(scope) to FanAdmitted(scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_scope_jcmkodvipd" ON "slice"."fan_start_step" IS 'foreign key FanStartStep(scope) to FanAdmitted(scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_step_vjwo5huhik" ON "slice"."fan_start_step" IS 'foreign key FanStartStep(step) to FanStep(step)';

COMMENT ON CONSTRAINT "__fan_step_fk_scope_p7ymxnnzil" ON "slice"."fan_step" IS 'foreign key FanStep(scope) to FanAdmitted(scope)';

COMMENT ON CONSTRAINT "__fan_within_fk_parent_koa6wzyqvq" ON "slice"."fan_within" IS 'foreign key FanWithin(parent) to FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_within_fk_scope_5a7dtldf3w" ON "slice"."fan_within" IS 'foreign key FanWithin(scope) to FanScope(scope)';

COMMENT ON CONSTRAINT "__retry_admitted_fk_scope_o3jg25sttd" ON "slice"."retry_admitted" IS 'foreign key RetryAdmitted(scope) to RetryScope(scope)';

COMMENT ON CONSTRAINT "__retry_brittle_input_fk_step_tag_kind_brittle_kchbox44ml" ON "slice"."retry_brittle_input" IS 'foreign key RetryBrittleInput(step, tag RetryStep.kind = Brittle) to RetryStep(step, kind)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_yzpan63y25" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step) to RetryBrittleInput(step)';

COMMENT ON CONSTRAINT "__retry_brittle_output_fk_step_2duuaxh72x" ON "slice"."retry_brittle_output" IS 'foreign key RetryBrittleOutput(step) to RetryDone(step)';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_t3456bndar" ON "slice"."retry_claim" IS 'foreign key RetryClaim(step) to RetryStep(step)';

COMMENT ON CONSTRAINT "__retry_claim_fk_step_pred_attempt_eub2tikpeh" ON "slice"."retry_claim" IS 'foreign key RetryClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to RetryClaim(step, attempt)';

COMMENT ON CONSTRAINT "__retry_done_fk_step_tag_outcome_done_fmzgo4pn2r" ON "slice"."retry_done" IS 'foreign key RetryDone(step, tag RetryResult.outcome = done) to RetryResult(step, outcome)';

COMMENT ON CONSTRAINT "__retry_due_fk_step_sm2v4p4wn5" ON "slice"."retry_due" IS 'foreign key RetryDue(step) to RetryStep(step)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_step_sanifiwunj" ON "slice"."retry_exhausted" IS 'foreign key RetryExhausted(step) to RetryFailed(step)';

COMMENT ON CONSTRAINT "__retry_failed_fk_step_tag_outcome_failed_3iz2aprkti" ON "slice"."retry_failed" IS 'foreign key RetryFailed(step, tag RetryResult.outcome = failed) to RetryResult(step, outcome)';

COMMENT ON CONSTRAINT "__retry_finish_fk_scope_fwo5tjrgbx" ON "slice"."retry_finish" IS 'foreign key RetryFinish(scope) to RetryAdmitted(scope)';

COMMENT ON CONSTRAINT "__retry_finish_fk_step_rjhqbqx2wh" ON "slice"."retry_finish" IS 'foreign key RetryFinish(step) to RetryStep(step)';

COMMENT ON CONSTRAINT "__retry_held_fk_step_rlbcm6phjy" ON "slice"."retry_held" IS 'foreign key RetryHeld(step) to RetryResult(step)';

COMMENT ON CONSTRAINT "__retry_held_fk_step_attempt_g534cnd4ee" ON "slice"."retry_held" IS 'foreign key RetryHeld(step, attempt) to RetryClaim(step, attempt)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fk_scope_tag_kind_ladders_vn6lnz3pry" ON "slice"."retry_ladders_input" IS 'foreign key RetryLaddersInput(scope, tag RetryScope.kind = Ladders) to RetryScope(scope, kind)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_step_lcou3dggjh" ON "slice"."retry_refusal" IS 'foreign key RetryRefusal(step) to RetryFailed(step)';

COMMENT ON CONSTRAINT "__retry_result_fk_step_6eyc56xk3a" ON "slice"."retry_result" IS 'foreign key RetryResult(step) to RetryStep(step)';

COMMENT ON CONSTRAINT "__retry_retry_fk_step_attempt_ykromtpll2" ON "slice"."retry_retry" IS 'foreign key RetryRetry(step, attempt) to RetryClaim(step, attempt)';

COMMENT ON CONSTRAINT "__retry_root_fk_scope_sq2qa4m6ld" ON "slice"."retry_root" IS 'foreign key RetryRoot(scope) to RetryScope(scope)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_by_xhx6i6337v" ON "slice"."retry_skipped" IS 'foreign key RetrySkipped(by) to RetryAdmitted(scope)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_scope_q4224gzqrl" ON "slice"."retry_skipped" IS 'foreign key RetrySkipped(scope) to RetryRoot(scope)';

COMMENT ON CONSTRAINT "__retry_start_scope_fk_child_ive3vl5wpv" ON "slice"."retry_start_scope" IS 'foreign key RetryStartScope(child) to RetryScope(scope)';

COMMENT ON CONSTRAINT "__retry_start_scope_fk_scope_bmkrykqxr3" ON "slice"."retry_start_scope" IS 'foreign key RetryStartScope(scope) to RetryAdmitted(scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_scope_aijgs4np4p" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(scope) to RetryAdmitted(scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_step_lj6wlrxxh4" ON "slice"."retry_start_step" IS 'foreign key RetryStartStep(step) to RetryStep(step)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_fk_step_tag_kind_steadfast_u2z775muth" ON "slice"."retry_steadfast_input" IS 'foreign key RetrySteadfastInput(step, tag RetryStep.kind = Steadfast) to RetryStep(step, kind)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_gzrgos6ptu" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step) to RetryDone(step)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_fk_step_ifxk5bkk6h" ON "slice"."retry_steadfast_output" IS 'foreign key RetrySteadfastOutput(step) to RetrySteadfastInput(step)';

COMMENT ON CONSTRAINT "__retry_step_fk_scope_ouksmumzap" ON "slice"."retry_step" IS 'foreign key RetryStep(scope) to RetryAdmitted(scope)';

COMMENT ON CONSTRAINT "__retry_within_fk_parent_d2h4ezdtjn" ON "slice"."retry_within" IS 'foreign key RetryWithin(parent) to RetryScope(scope)';

COMMENT ON CONSTRAINT "__retry_within_fk_scope_zng7hmvot6" ON "slice"."retry_within" IS 'foreign key RetryWithin(scope) to RetryScope(scope)';

COMMENT ON CONSTRAINT "__sync_admitted_fk_scope_jli7ioqs7e" ON "slice"."sync_admitted" IS 'foreign key SyncAdmitted(scope) to SyncScope(scope)';

COMMENT ON CONSTRAINT "__sync_build_input_fk_step_tag_kind_build_2rrvrdqk3o" ON "slice"."sync_build_input" IS 'foreign key SyncBuildInput(step, tag SyncStep.kind = Build) to SyncStep(step, kind)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_4psndc3t3d" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(step) to SyncBuildInput(step)';

COMMENT ON CONSTRAINT "__sync_build_output_fk_step_i3x7e6uuln" ON "slice"."sync_build_output" IS 'foreign key SyncBuildOutput(step) to SyncDone(step)';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_l27dgy3dwh" ON "slice"."sync_claim" IS 'foreign key SyncClaim(step) to SyncStep(step)';

COMMENT ON CONSTRAINT "__sync_claim_fk_step_pred_attempt_4du2uws4ru" ON "slice"."sync_claim" IS 'foreign key SyncClaim(step where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}, pred(attempt) where {"kind":"compare","left":{"field":"attempt","kind":"field"},"op":"ge","right":{"kind":"literal","value":"~n:2"}}) to SyncClaim(step, attempt)';

COMMENT ON CONSTRAINT "__sync_copy_input_fk_step_tag_kind_copy_uakhf373ei" ON "slice"."sync_copy_input" IS 'foreign key SyncCopyInput(step, tag SyncStep.kind = Copy) to SyncStep(step, kind)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_ydkxdq3bkd" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(step) to SyncCopyInput(step)';

COMMENT ON CONSTRAINT "__sync_copy_output_fk_step_vgu5ci7zsn" ON "slice"."sync_copy_output" IS 'foreign key SyncCopyOutput(step) to SyncDone(step)';

COMMENT ON CONSTRAINT "__sync_done_fk_step_tag_outcome_done_axqxsievib" ON "slice"."sync_done" IS 'foreign key SyncDone(step, tag SyncResult.outcome = done) to SyncResult(step, outcome)';

COMMENT ON CONSTRAINT "__sync_due_fk_step_o5af5jr33h" ON "slice"."sync_due" IS 'foreign key SyncDue(step) to SyncStep(step)';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_scope_cy4cbhycir" ON "slice"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(scope) to SyncScope(scope)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_step_qdkuopifxf" ON "slice"."sync_exhausted" IS 'foreign key SyncExhausted(step) to SyncFailed(step)';

COMMENT ON CONSTRAINT "__sync_failed_fk_step_tag_outcome_failed_w7buaawyeg" ON "slice"."sync_failed" IS 'foreign key SyncFailed(step, tag SyncResult.outcome = failed) to SyncResult(step, outcome)';

COMMENT ON CONSTRAINT "__sync_finish_fk_scope_bv3hsrlx5y" ON "slice"."sync_finish" IS 'foreign key SyncFinish(scope) to SyncAdmitted(scope)';

COMMENT ON CONSTRAINT "__sync_finish_fk_step_vhog6r5pu5" ON "slice"."sync_finish" IS 'foreign key SyncFinish(step) to SyncStep(step)';

COMMENT ON CONSTRAINT "__sync_gold_input_fk_scope_tag_kind_gold_m6g42g4z2p" ON "slice"."sync_gold_input" IS 'foreign key SyncGoldInput(scope, tag SyncScope.kind = Gold) to SyncScope(scope, kind)';

COMMENT ON CONSTRAINT "__sync_held_fk_step_cko2wzco3r" ON "slice"."sync_held" IS 'foreign key SyncHeld(step) to SyncResult(step)';

COMMENT ON CONSTRAINT "__sync_held_fk_step_attempt_r37vvfdble" ON "slice"."sync_held" IS 'foreign key SyncHeld(step, attempt) to SyncClaim(step, attempt)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_step_pkbm4yq2hj" ON "slice"."sync_refusal" IS 'foreign key SyncRefusal(step) to SyncFailed(step)';

COMMENT ON CONSTRAINT "__sync_result_fk_step_4ueb5frgri" ON "slice"."sync_result" IS 'foreign key SyncResult(step) to SyncStep(step)';

COMMENT ON CONSTRAINT "__sync_retry_fk_step_attempt_dbfp7g6nwv" ON "slice"."sync_retry" IS 'foreign key SyncRetry(step, attempt) to SyncClaim(step, attempt)';

COMMENT ON CONSTRAINT "__sync_root_fk_scope_ku5xrga5hw" ON "slice"."sync_root" IS 'foreign key SyncRoot(scope) to SyncScope(scope)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_by_shlpjbklec" ON "slice"."sync_skipped" IS 'foreign key SyncSkipped(by) to SyncAdmitted(scope)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_scope_33qsksdlcc" ON "slice"."sync_skipped" IS 'foreign key SyncSkipped(scope) to SyncRoot(scope)';

COMMENT ON CONSTRAINT "__sync_start_scope_fk_child_khciqf3gvg" ON "slice"."sync_start_scope" IS 'foreign key SyncStartScope(child) to SyncScope(scope)';

COMMENT ON CONSTRAINT "__sync_start_scope_fk_scope_f3rtdt5nag" ON "slice"."sync_start_scope" IS 'foreign key SyncStartScope(scope) to SyncAdmitted(scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_scope_m2ya6p5z52" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(scope) to SyncAdmitted(scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_step_xlobk7ohaz" ON "slice"."sync_start_step" IS 'foreign key SyncStartStep(step) to SyncStep(step)';

COMMENT ON CONSTRAINT "__sync_step_fk_scope_ficxssqmik" ON "slice"."sync_step" IS 'foreign key SyncStep(scope) to SyncAdmitted(scope)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_fk_scope_tag_kind_sync_run_axve4fqawx" ON "slice"."sync_sync_run_input" IS 'foreign key SyncSyncRunInput(scope, tag SyncScope.kind = SyncRun) to SyncScope(scope, kind)';

COMMENT ON CONSTRAINT "__sync_within_fk_parent_gy7kgf4tam" ON "slice"."sync_within" IS 'foreign key SyncWithin(parent) to SyncScope(scope)';

COMMENT ON CONSTRAINT "__sync_within_fk_scope_rkiw3n47nn" ON "slice"."sync_within" IS 'foreign key SyncWithin(scope) to SyncScope(scope)';

COMMENT ON INDEX "slice"."__chain_claim_ix_step_fxyms_236_d_4_pred_attempt_cgz4fqmrbd" IS 'btree index ChainClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox)';

COMMENT ON INDEX "slice"."__chain_skipped_ix_by_2c45vyfwzy" IS 'btree index ChainSkipped(by)';

COMMENT ON INDEX "slice"."__chain_step_ix_scope_kind_spn3gys2vi" IS 'btree index ChainStep(scope, kind)';

COMMENT ON INDEX "slice"."__chain_within_ix_parent_3xemf3jvuy" IS 'btree index ChainWithin(parent)';

COMMENT ON INDEX "slice"."__fan_claim_ix_step_fxyms_236_d_4_pred_attempt_rdwu35kano" IS 'btree index FanClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox)';

COMMENT ON INDEX "slice"."__fan_skipped_ix_by_3aejofkhor" IS 'btree index FanSkipped(by)';

COMMENT ON INDEX "slice"."__fan_step_ix_scope_kind_h2wuapaqs3" IS 'btree index FanStep(scope, kind)';

COMMENT ON INDEX "slice"."__fan_within_ix_parent_7swblvcobd" IS 'btree index FanWithin(parent)';

COMMENT ON INDEX "slice"."__retry_claim_ix_step_fxyms_236_d_4_pred_attempt_ln4othihnf" IS 'btree index RetryClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox)';

COMMENT ON INDEX "slice"."__retry_skipped_ix_by_s7pekf7xtg" IS 'btree index RetrySkipped(by)';

COMMENT ON INDEX "slice"."__retry_step_ix_scope_kind_gvjz7p6rcr" IS 'btree index RetryStep(scope, kind)';

COMMENT ON INDEX "slice"."__retry_within_ix_parent_d7nkgphtnq" IS 'btree index RetryWithin(parent)';

COMMENT ON INDEX "slice"."__sync_claim_ix_step_fxyms_236_d_4_pred_attempt_ltqcryx7yu" IS 'btree index SyncClaim(__step_fxyms236d4, __pred_attempt_xnnzpydhox)';

COMMENT ON INDEX "slice"."__sync_skipped_ix_by_ttq6dm55n2" IS 'btree index SyncSkipped(by)';

COMMENT ON INDEX "slice"."__sync_step_ix_scope_qlsdbwk3lt" IS 'btree index SyncStep(scope)';

COMMENT ON INDEX "slice"."__sync_within_ix_parent_xnkjm556so" IS 'btree index SyncWithin(parent)';

COMMENT ON STATISTICS "slice"."__chain_step_stats_kind_scope_tc5nmidpxu" IS 'statistics ChainStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__fan_step_stats_kind_scope_xmuvugpu6n" IS 'statistics FanStep(kind, scope)';

COMMENT ON STATISTICS "slice"."__retry_step_stats_kind_scope_osnqmvpfhd" IS 'statistics RetryStep(kind, scope)';

COMMENT ON ROLE :"__live_slice_wzkq6p2yii" IS 'live source of slice';
