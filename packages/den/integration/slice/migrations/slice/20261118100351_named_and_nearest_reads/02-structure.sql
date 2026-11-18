DROP VIEW "slice_seats__loader"."chain_page_read";

DROP VIEW "slice_seats__chain_den"."chain_page_read";

DROP VIEW "slice_seats__auditor"."chain_page_read";

DROP PUBLICATION "__live_wzkq6p2yii";

CREATE TABLE "slice"."assign_admitted" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."assign_assignment_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "near" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" PRIMARY KEY ("scope"),
  CONSTRAINT "__assign_assignment_input_norm_near_mrcc7bgzvm" CHECK (("vector_ext"."vector_norm"("near") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_claim" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "holder" "slice"."__domain_jotafzuj2i" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__assign_claim_pk_gy4yhzk2me" PRIMARY KEY ("step", "attempt"),
  CONSTRAINT "attempt_from_one" CHECK (("attempt" >= 1::bigint) IS TRUE)
);

CREATE TABLE "slice"."assign_decide_input" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "near" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" PRIMARY KEY ("step"),
  CONSTRAINT "__assign_decide_input_norm_near_5yrl3p3qsu" CHECK (("vector_ext"."vector_norm"("near") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_decide_nearest_read" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "distance" double precision NOT NULL,
  CONSTRAINT "__assign_decide_nearest_read_pk_jc4zqvfwss" PRIMARY KEY ("step", "ordinal")
);

CREATE TABLE "slice"."assign_decide_output" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_decide_output_chosen" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__assign_decide_output_chosen_pk_iwcppigpd6" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_decide_seen_read" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assign_decide_seen_read_pk_sczf2f7gz7" PRIMARY KEY ("step", "ordinal")
);

CREATE TABLE "slice"."assign_done" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_done_pk_gzil7jvxpz" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_due" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__assign_due_pk_mgahvzt6eh" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_exhausted" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempts" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_failed" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_failed_pk_ygxslcya4o" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_fenced" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_fenced_pk_y6jyfviepa" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."assign_finish" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" PRIMARY KEY ("scope"),
  CONSTRAINT "__assign_finish_key_step_nthyxvagme" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."assign_held" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_held_pk_by245z7t45" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_paused" (
  "target" "slice"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_paused_pk_ulo4grv4e2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."assign_refusal" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_result" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "outcome" "slice"."assign_outcome" NOT NULL,
  CONSTRAINT "__assign_result_pk_i2yxmpkyzr" PRIMARY KEY ("step"),
  CONSTRAINT "__assign_result_key_step_outcome_4i7igve5uz" UNIQUE NULLS DISTINCT ("step", "outcome")
);

CREATE TABLE "slice"."assign_resumed" (
  "target" "slice"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."assign_retry" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."assign_root" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__assign_root_pk_b23qqyryx4" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."assign_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."assign_join" NOT NULL,
  CONSTRAINT "__assign_scope_pk_xytntbncid" PRIMARY KEY ("scope"),
  CONSTRAINT "__assign_scope_key_scope_kind_vvjb4nuh5r" UNIQUE NULLS DISTINCT ("scope", "kind")
);

CREATE TABLE "slice"."assign_skipped" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "by" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_skipped_pk_5qhgbueof7" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."assign_start_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_start_scope_pk_ldqdb5b25z" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__assign_start_scope_key_child_hlw5b67j2d" UNIQUE NULLS DISTINCT ("child")
);

CREATE TABLE "slice"."assign_start_step" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__assign_start_step_key_step_b3r7vmxqkm" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."assign_step" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."assign_kind" NOT NULL,
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_step_pk_2oc4ehvfzd" PRIMARY KEY ("step"),
  CONSTRAINT "__assign_step_key_step_kind_5vttbbv3md" UNIQUE NULLS DISTINCT ("step", "kind")
);

CREATE TABLE "slice"."assign_within" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "parent" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_within_pk_vvbm6qryed" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."assigned" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assigned_pk_72xowecbf7" PRIMARY KEY ("learner")
);

CREATE TABLE "slice"."passage" (
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "embedding" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__passage_pk_kayjlxd3gv" PRIMARY KEY ("passage"),
  CONSTRAINT "__passage_norm_embedding_d2siyt575a" CHECK (("vector_ext"."vector_norm"("embedding") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice"."seen" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__seen_pk_g4ptcxwowb" PRIMARY KEY ("learner", "passage")
);

ALTER TABLE "slice"."assign_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."assign_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."passage" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."assign_assignment_input" ADD COLUMN "__tag_kind_assignment_iybfg5upmr" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."assign_claim"
  ADD COLUMN "__step_fxyms236d4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_xnnzpydhox" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_decide_input" ADD COLUMN "__tag_kind_decide_ggginylxcj" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."assign_done" ADD COLUMN "__tag_outcome_done_3n46zakkk3" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."assign_failed" ADD COLUMN "__tag_outcome_failed_bxttnpdkga" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."assign_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_admitted" ADD CONSTRAINT "__assign_admitted_fk_scope_vfepaqjqyi" FOREIGN KEY ("scope") REFERENCES "slice"."assign_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_fk_scope_tag_kind_4hflxzmwtj" FOREIGN KEY ("scope", "__tag_kind_assignment_iybfg5upmr") REFERENCES "slice"."assign_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."assign_claim"
  ADD CONSTRAINT "__assign_claim_fk_step_4p6buiqtrc" FOREIGN KEY ("step") REFERENCES "slice"."assign_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_claim_fk_step_pred_attempt_2byinvx4o3" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox") REFERENCES "slice"."assign_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_fk_step_tag_kind_decide_xsqmsuqet4" FOREIGN KEY ("step", "__tag_kind_decide_ggginylxcj") REFERENCES "slice"."assign_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_nearest_read" ADD CONSTRAINT "__assign_decide_nearest_read_fk_step_ahvahshsfy" FOREIGN KEY ("step") REFERENCES "slice"."assign_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_output"
  ADD CONSTRAINT "__assign_decide_output_fk_step_uegzp2ojlf" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_fk_step_6birgjscft" FOREIGN KEY ("step") REFERENCES "slice"."assign_done" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."assign_decide_output_chosen" ADD CONSTRAINT "__assign_decide_output_chosen_fk_step_khpc4l7ijm" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_output" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."assign_decide_seen_read" ADD CONSTRAINT "__assign_decide_seen_read_fk_step_xfllym5krc" FOREIGN KEY ("step") REFERENCES "slice"."assign_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_done" ADD CONSTRAINT "__assign_done_fk_step_tag_outcome_done_e5hddkaj3g" FOREIGN KEY ("step", "__tag_outcome_done_3n46zakkk3") REFERENCES "slice"."assign_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."assign_due" ADD CONSTRAINT "__assign_due_fk_step_dbtohril7u" FOREIGN KEY ("step") REFERENCES "slice"."assign_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_exhausted" ADD CONSTRAINT "__assign_exhausted_fk_step_cxx7syotgn" FOREIGN KEY ("step") REFERENCES "slice"."assign_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."assign_failed" ADD CONSTRAINT "__assign_failed_fk_step_tag_outcome_failed_rzgbd4gb37" FOREIGN KEY ("step", "__tag_outcome_failed_bxttnpdkga") REFERENCES "slice"."assign_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."assign_fenced" ADD CONSTRAINT "__assign_fenced_fk_step_attempt_2rttvkznpl" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."assign_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_finish"
  ADD CONSTRAINT "__assign_finish_fk_scope_dics3axamv" FOREIGN KEY ("scope") REFERENCES "slice"."assign_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_finish_fk_step_i3ke2hxa66" FOREIGN KEY ("step") REFERENCES "slice"."assign_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_held"
  ADD CONSTRAINT "__assign_held_fk_step_ww2k5nnc4c" FOREIGN KEY ("step") REFERENCES "slice"."assign_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_held_fk_step_attempt_fklmb2xym3" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."assign_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_paused" ADD CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."assign_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_refusal" ADD CONSTRAINT "__assign_refusal_fk_step_aqlyzlq3fc" FOREIGN KEY ("step") REFERENCES "slice"."assign_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."assign_result" ADD CONSTRAINT "__assign_result_fk_step_4pnas55m6w" FOREIGN KEY ("step") REFERENCES "slice"."assign_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_resumed" ADD CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" FOREIGN KEY ("target", "turn") REFERENCES "slice"."assign_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_retry" ADD CONSTRAINT "__assign_retry_fk_step_attempt_benkemwswa" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."assign_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_root" ADD CONSTRAINT "__assign_root_fk_scope_344txuecsh" FOREIGN KEY ("scope") REFERENCES "slice"."assign_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_skipped"
  ADD CONSTRAINT "__assign_skipped_fk_by_wh4scgpwln" FOREIGN KEY ("by") REFERENCES "slice"."assign_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_skipped_fk_scope_6ks53lak4r" FOREIGN KEY ("scope") REFERENCES "slice"."assign_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_start_scope"
  ADD CONSTRAINT "__assign_start_scope_fk_child_niiue7y5lb" FOREIGN KEY ("child") REFERENCES "slice"."assign_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_start_scope_fk_scope_rpodhhkcp6" FOREIGN KEY ("scope") REFERENCES "slice"."assign_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."assign_start_step"
  ADD CONSTRAINT "__assign_start_step_fk_scope_qt2dm2vnjb" FOREIGN KEY ("scope") REFERENCES "slice"."assign_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_start_step_fk_step_2sej5uze4v" FOREIGN KEY ("step") REFERENCES "slice"."assign_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_step" ADD CONSTRAINT "__assign_step_fk_scope_gkjcwbwjuf" FOREIGN KEY ("scope") REFERENCES "slice"."assign_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."assign_within"
  ADD CONSTRAINT "__assign_within_fk_parent_kq5ksmcoez" FOREIGN KEY ("parent") REFERENCES "slice"."assign_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_within_fk_scope_2yvr2lbtxd" FOREIGN KEY ("scope") REFERENCES "slice"."assign_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

CREATE VIEW "slice_seats__auditor"."assign_decide_nearest_read" ("step", "ordinal", "passage", "topic", "distance") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice"."assign_decide_nearest_read" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_nearest_read" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."assign_decide_output_chosen" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."assign_decide_output_chosen" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_output_chosen" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."assign_decide_seen_read" ("step", "ordinal", "learner", "passage") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."learner", "r1"."passage"
FROM "slice"."assign_decide_seen_read" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_seen_read" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."assign_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."assign_result" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_result" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."assign_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_nlpfxx2ign"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."assign_step" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_step" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assigned" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."chain_page_weights_read" ("step", "ordinal", "feed", "feed_name", "factor") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."chain_page_weights_read" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."chain_page_weights_read" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__chain_den"."chain_page_weights_read" ("step", "ordinal", "feed", "feed_name", "factor") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."chain_page_weights_read" AS "r1";

GRANT SELECT ON TABLE "slice_seats__chain_den"."chain_page_weights_read" TO :"slice_seats__chain_den";

CREATE VIEW "slice_seats__loader"."assign_admitted" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."assign_admitted" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_admitted" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_assignment_input" ("scope", "learner", "topic", "near") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."near"
FROM "slice"."assign_assignment_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_claim" ("step", "attempt", "holder", "until") AS
SELECT "r1"."step", "r1"."attempt", "r1"."holder", "r1"."until"
FROM "slice"."assign_claim" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_claim" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input" ("step", "learner", "topic", "near") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."near"
FROM "slice"."assign_decide_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_nearest_read" ("step", "ordinal", "passage", "topic", "distance") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice"."assign_decide_nearest_read" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_nearest_read" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_output" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_decide_output" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_output" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_output_chosen" ("step", "value") AS
SELECT "r1"."step", "r1"."value"
FROM "slice"."assign_decide_output_chosen" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_output_chosen" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_seen_read" ("step", "ordinal", "learner", "passage") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."learner", "r1"."passage"
FROM "slice"."assign_decide_seen_read" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_seen_read" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_done" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_done" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_done" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_due" ("step", "at") AS
SELECT "r1"."step", "r1"."at"
FROM "slice"."assign_due" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_due" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_exhausted" ("step", "attempts") AS
SELECT "r1"."step", "r1"."attempts"
FROM "slice"."assign_exhausted" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_exhausted" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_failed" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_failed" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_failed" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_fenced" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."assign_fenced" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_fenced" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_finish" ("scope", "step") AS
SELECT "r1"."scope", "r1"."step"
FROM "slice"."assign_finish" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_finish" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_held" ("step", "attempt") AS
SELECT "r1"."step", "r1"."attempt"
FROM "slice"."assign_held" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_held" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_refusal" ("step", "law") AS
SELECT "r1"."step", "r1"."law"
FROM "slice"."assign_refusal" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_refusal" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_result" ("step", "outcome", "outcome_name") AS
SELECT "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice"."assign_result" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_result" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_retry" ("step", "attempt", "at", "spent") AS
SELECT "r1"."step", "r1"."attempt", "r1"."at", "r1"."spent"
FROM "slice"."assign_retry" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_retry" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_root" ("scope", "key", "at") AS
SELECT "r1"."scope", "r1"."key", "r1"."at"
FROM "slice"."assign_root" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_root" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_scope" ("scope", "kind", "kind_name") AS
SELECT "r1"."scope", "r1"."kind", ("slice"."__assign_join_names_cks63qswdh"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice"."assign_scope" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_scope" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_skipped" ("scope", "by") AS
SELECT "r1"."scope", "r1"."by"
FROM "slice"."assign_skipped" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_skipped" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_start_scope" ("scope", "ordinal", "child") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice"."assign_start_scope" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_start_scope" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_start_step" ("scope", "ordinal", "step") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice"."assign_start_step" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_start_step" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_step" ("step", "kind", "kind_name", "scope") AS
SELECT "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_nlpfxx2ign"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope"
FROM "slice"."assign_step" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_step" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_within" ("scope", "parent") AS
SELECT "r1"."scope", "r1"."parent"
FROM "slice"."assign_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_within" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assigned" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."chain_page_weights_read" ("step", "ordinal", "feed", "feed_name", "factor") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."chain_page_weights_read" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."chain_page_weights_read" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."passage" ("passage", "topic", "embedding") AS
SELECT "r1"."passage", "r1"."topic", "r1"."embedding"
FROM "slice"."passage" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."passage" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."seen" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."seen" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."seen" TO :"slice_seats__loader";
