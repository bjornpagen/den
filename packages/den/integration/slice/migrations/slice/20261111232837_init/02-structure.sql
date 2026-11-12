CREATE TABLE "slice"."audit" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "note" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__audit_pk_dcvpvv5cjz" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_chain_run_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "feed" "slice"."chain_chain_run_input_feed" NOT NULL,
  "pages" bigint NOT NULL,
  CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."chain_claim" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "holder" "slice"."__domain_jotafzuj2i" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__chain_claim_pk_nrr2rn3gui" PRIMARY KEY ("step", "attempt"),
  CONSTRAINT "attempt_from_one" CHECK (("attempt" >= 1::bigint) IS TRUE)
);

CREATE TABLE "slice"."chain_exhausted" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempts" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_finish" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_finish_pk_ebe75jmnzy" PRIMARY KEY ("scope"),
  CONSTRAINT "__chain_finish_key_step_x7i5pvi5jm" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."chain_held" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_held_pk_73idl7oo5c" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_next" (
  "from" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_next_pk_qeumlilvtk" PRIMARY KEY ("from", "ordinal"),
  CONSTRAINT "__chain_next_key_to_jqccfs2l4c" UNIQUE NULLS DISTINCT ("to")
);

CREATE TABLE "slice"."chain_page_input" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "feed" "slice"."chain_page_input_feed" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "pages" bigint NOT NULL,
  CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_page_input_after" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_page_output" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "items" bigint NOT NULL,
  CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_page_output_next" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_refusal" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_result" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "outcome" "slice"."chain_outcome" NOT NULL,
  CONSTRAINT "__chain_result_pk_btw3jzlkgl" PRIMARY KEY ("step"),
  CONSTRAINT "__chain_result_key_step_outcome_hqqrqon5z3" UNIQUE NULLS DISTINCT ("step", "outcome")
);

CREATE TABLE "slice"."chain_root" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_root_pk_wqfycdg3x5" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."chain_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."chain_join" NOT NULL,
  CONSTRAINT "__chain_scope_pk_fxzt444lf6" PRIMARY KEY ("scope"),
  CONSTRAINT "__chain_scope_key_scope_kind_f3gtwiklfd" UNIQUE NULLS DISTINCT ("scope", "kind")
);

CREATE TABLE "slice"."chain_start_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_start_scope_pk_t4giphzblt" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__chain_start_scope_key_child_h23cre6olg" UNIQUE NULLS DISTINCT ("child")
);

CREATE TABLE "slice"."chain_start_step" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_start_step_pk_dgda7shxb4" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__chain_start_step_key_step_ygziyjwk3l" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."chain_step" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."chain_kind" NOT NULL,
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_step_pk_u6x5wnvfbv" PRIMARY KEY ("step"),
  CONSTRAINT "__chain_step_key_step_kind_dlshgwdqz2" UNIQUE NULLS DISTINCT ("step", "kind")
);

CREATE TABLE "slice"."chain_within" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "parent" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_within_pk_ihqzjavdib" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."cursor" (
  "feed" "slice"."feed" NOT NULL,
  "position" bigint NOT NULL,
  CONSTRAINT "__cursor_pk_wl2ngqny4j" PRIMARY KEY ("feed", "position")
);

CREATE TABLE "slice"."fan_batch_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."fan_claim" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "holder" "slice"."__domain_jotafzuj2i" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__fan_claim_pk_e7zimqppco" PRIMARY KEY ("step", "attempt"),
  CONSTRAINT "attempt_from_one" CHECK (("attempt" >= 1::bigint) IS TRUE)
);

CREATE TABLE "slice"."fan_exhausted" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempts" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_fan_run_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."fan_finish" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_finish_pk_6mb33urjra" PRIMARY KEY ("scope"),
  CONSTRAINT "__fan_finish_key_step_v72sacijwp" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."fan_held" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_held_pk_4ic6tjvac4" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_refusal" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_refusal_pk_7va55wo2wj" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_result" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "outcome" "slice"."fan_outcome" NOT NULL,
  CONSTRAINT "__fan_result_pk_yeear352sx" PRIMARY KEY ("step"),
  CONSTRAINT "__fan_result_key_step_outcome_5nrb7r22qd" UNIQUE NULLS DISTINCT ("step", "outcome")
);

CREATE TABLE "slice"."fan_root" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_root_pk_jesu7xtefn" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."fan_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."fan_join" NOT NULL,
  CONSTRAINT "__fan_scope_pk_7bvjfihnef" PRIMARY KEY ("scope"),
  CONSTRAINT "__fan_scope_key_scope_kind_epdwnzjh52" UNIQUE NULLS DISTINCT ("scope", "kind")
);

CREATE TABLE "slice"."fan_square_input" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "n" bigint NOT NULL,
  CONSTRAINT "__fan_square_input_pk_uzumoizv53" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_square_output" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "square" bigint NOT NULL,
  CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_start_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__fan_start_scope_key_child_gmvcyvsk2k" UNIQUE NULLS DISTINCT ("child")
);

CREATE TABLE "slice"."fan_start_step" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_start_step_pk_7e247xk4mz" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__fan_start_step_key_step_777capvdxg" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."fan_step" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."fan_kind" NOT NULL,
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_step_pk_2f4tcxnofk" PRIMARY KEY ("step"),
  CONSTRAINT "__fan_step_key_step_kind_6mwvvgt65w" UNIQUE NULLS DISTINCT ("step", "kind")
);

CREATE TABLE "slice"."fan_within" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "parent" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_within_pk_g5tswgjfa6" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."item" (
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__item_pk_ai4obgmq4k" PRIMARY KEY ("feed", "seq", "n")
);

CREATE TABLE "slice"."settled" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__settled_pk_yitdz6z3ts" PRIMARY KEY ("batch")
);

CREATE TABLE "slice"."tally" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  "count" "slice"."__domain_gfw43vigph" NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__tally_pk_7jc66uxxx4" PRIMARY KEY ("batch")
);

CREATE TABLE "slice"."__live_secret" ("secret") AS SELECT "pg_catalog"."sha256"("pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()) || "pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()));

REVOKE ALL ON TABLE "slice"."__live_secret" FROM PUBLIC;

ALTER TABLE "slice"."chain_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."chain_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."fan_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."fan_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."chain_chain_run_input" ADD COLUMN "__tag_kind_chain_run_ufow3vhuwb" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_claim" ADD COLUMN "__step_fxyms236d4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint THEN "step" END) STORED;

ALTER TABLE "slice"."chain_claim" ADD COLUMN "__pred_attempt_xnnzpydhox" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."chain_exhausted" ADD COLUMN "__tag_outcome_failed_lrxbpw73ih" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_page_input" ADD COLUMN "__tag_kind_page_wmj4dlxrkf" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_page_output" ADD COLUMN "__tag_outcome_done_uhpvxcbhg2" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_refusal" ADD COLUMN "__tag_outcome_failed_lrxbpw73ih" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_batch_input" ADD COLUMN "__tag_kind_batch_fkqwrqkogg" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_claim" ADD COLUMN "__step_fxyms236d4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint THEN "step" END) STORED;

ALTER TABLE "slice"."fan_claim" ADD COLUMN "__pred_attempt_xnnzpydhox" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."fan_exhausted" ADD COLUMN "__tag_outcome_failed_3kga3qw77n" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_fan_run_input" ADD COLUMN "__tag_kind_fan_run_eorldhk2ce" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_refusal" ADD COLUMN "__tag_outcome_failed_3kga3qw77n" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_square_input" ADD COLUMN "__tag_kind_square_q3stoybx3v" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_square_output" ADD COLUMN "__tag_outcome_done_tulqbccryg" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."audit" ADD CONSTRAINT "__audit_fk_step_zgfyapbfme" FOREIGN KEY ("step") REFERENCES "slice"."chain_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_chain_run_input" ADD CONSTRAINT "__chain_chain_run_input_fk_scope_tag_kind_chain_run_m37i2umurb" FOREIGN KEY ("scope", "__tag_kind_chain_run_ufow3vhuwb") REFERENCES "slice"."chain_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."chain_claim" ADD CONSTRAINT "__chain_claim_fk_step_tlgqnv6mzi" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_claim" ADD CONSTRAINT "__chain_claim_fk_step_pred_attempt_eaxsvkfnat" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox") REFERENCES "slice"."chain_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_exhausted" ADD CONSTRAINT "__chain_exhausted_fk_step_tag_outcome_failed_2udbgsp3ck" FOREIGN KEY ("step", "__tag_outcome_failed_lrxbpw73ih") REFERENCES "slice"."chain_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."chain_finish" ADD CONSTRAINT "__chain_finish_fk_scope_holmjz7tss" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_finish" ADD CONSTRAINT "__chain_finish_fk_step_djulfbbhyv" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_held" ADD CONSTRAINT "__chain_held_fk_step_gn4a3vhis4" FOREIGN KEY ("step") REFERENCES "slice"."chain_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_held" ADD CONSTRAINT "__chain_held_fk_step_attempt_ha67r6xn73" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."chain_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_next" ADD CONSTRAINT "__chain_next_fk_from_y5is7epime" FOREIGN KEY ("from") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_next" ADD CONSTRAINT "__chain_next_fk_to_4dtheiiigt" FOREIGN KEY ("to") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_input" ADD CONSTRAINT "__chain_page_input_fk_step_tag_kind_page_iu55gzqbo5" FOREIGN KEY ("step", "__tag_kind_page_wmj4dlxrkf") REFERENCES "slice"."chain_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_input_after" ADD CONSTRAINT "__chain_page_input_after_fk_step_lfprg2mtrc" FOREIGN KEY ("step") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_output" ADD CONSTRAINT "__chain_page_output_fk_step_g37yommeoy" FOREIGN KEY ("step") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_output" ADD CONSTRAINT "__chain_page_output_fk_step_tag_outcome_done_pvpnykkthy" FOREIGN KEY ("step", "__tag_outcome_done_uhpvxcbhg2") REFERENCES "slice"."chain_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."chain_page_output_next" ADD CONSTRAINT "__chain_page_output_next_fk_step_azw5pfnnsa" FOREIGN KEY ("step") REFERENCES "slice"."chain_page_output" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_refusal" ADD CONSTRAINT "__chain_refusal_fk_step_tag_outcome_failed_2a6zwjr3n5" FOREIGN KEY ("step", "__tag_outcome_failed_lrxbpw73ih") REFERENCES "slice"."chain_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."chain_result" ADD CONSTRAINT "__chain_result_fk_step_dbmjl746t7" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_root" ADD CONSTRAINT "__chain_root_fk_scope_g7gu2qhyp2" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_start_scope" ADD CONSTRAINT "__chain_start_scope_fk_child_bz3czs5on4" FOREIGN KEY ("child") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_start_scope" ADD CONSTRAINT "__chain_start_scope_fk_scope_ijdwqi66fj" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_start_step" ADD CONSTRAINT "__chain_start_step_fk_scope_gegsqdzyp5" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_start_step" ADD CONSTRAINT "__chain_start_step_fk_step_yqr6ccimjq" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_step" ADD CONSTRAINT "__chain_step_fk_scope_zyevzya6lc" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_within" ADD CONSTRAINT "__chain_within_fk_parent_n3pon4mlxe" FOREIGN KEY ("parent") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_within" ADD CONSTRAINT "__chain_within_fk_scope_gzdy7afflv" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_batch_input" ADD CONSTRAINT "__fan_batch_input_fk_scope_tag_kind_batch_b6gxzmmqsm" FOREIGN KEY ("scope", "__tag_kind_batch_fkqwrqkogg") REFERENCES "slice"."fan_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."fan_claim" ADD CONSTRAINT "__fan_claim_fk_step_ihp5bkdfc7" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_claim" ADD CONSTRAINT "__fan_claim_fk_step_pred_attempt_r5pt5cwztz" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox") REFERENCES "slice"."fan_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_exhausted" ADD CONSTRAINT "__fan_exhausted_fk_step_tag_outcome_failed_s2kqkxsbyn" FOREIGN KEY ("step", "__tag_outcome_failed_3kga3qw77n") REFERENCES "slice"."fan_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."fan_fan_run_input" ADD CONSTRAINT "__fan_fan_run_input_fk_scope_tag_kind_fan_run_tihneov63d" FOREIGN KEY ("scope", "__tag_kind_fan_run_eorldhk2ce") REFERENCES "slice"."fan_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."fan_finish" ADD CONSTRAINT "__fan_finish_fk_scope_qa2mnv7a2g" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_finish" ADD CONSTRAINT "__fan_finish_fk_step_f3he376omz" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_held" ADD CONSTRAINT "__fan_held_fk_step_6tkjkyjp3h" FOREIGN KEY ("step") REFERENCES "slice"."fan_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_held" ADD CONSTRAINT "__fan_held_fk_step_attempt_zol2no7gql" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."fan_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_refusal" ADD CONSTRAINT "__fan_refusal_fk_step_tag_outcome_failed_zd74wltaye" FOREIGN KEY ("step", "__tag_outcome_failed_3kga3qw77n") REFERENCES "slice"."fan_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."fan_result" ADD CONSTRAINT "__fan_result_fk_step_kzt2ms65pp" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_root" ADD CONSTRAINT "__fan_root_fk_scope_7k4byqnauw" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_square_input" ADD CONSTRAINT "__fan_square_input_fk_step_tag_kind_square_dshd7bwrky" FOREIGN KEY ("step", "__tag_kind_square_q3stoybx3v") REFERENCES "slice"."fan_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_square_output" ADD CONSTRAINT "__fan_square_output_fk_step_prwr7wqv35" FOREIGN KEY ("step") REFERENCES "slice"."fan_square_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_square_output" ADD CONSTRAINT "__fan_square_output_fk_step_tag_outcome_done_nflx2lb3xz" FOREIGN KEY ("step", "__tag_outcome_done_tulqbccryg") REFERENCES "slice"."fan_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."fan_start_scope" ADD CONSTRAINT "__fan_start_scope_fk_child_ngma7ay7kq" FOREIGN KEY ("child") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_start_scope" ADD CONSTRAINT "__fan_start_scope_fk_scope_ymqglh3w64" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_start_step" ADD CONSTRAINT "__fan_start_step_fk_scope_nidx2ru6ls" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_start_step" ADD CONSTRAINT "__fan_start_step_fk_step_vjwo5huhik" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_step" ADD CONSTRAINT "__fan_step_fk_scope_qjqxjbw7tr" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_within" ADD CONSTRAINT "__fan_within_fk_parent_koa6wzyqvq" FOREIGN KEY ("parent") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_within" ADD CONSTRAINT "__fan_within_fk_scope_5a7dtldf3w" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;
