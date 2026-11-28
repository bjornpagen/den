CREATE TABLE "slice"."assigned" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assigned_pk_72xowecbf7" PRIMARY KEY ("learner")
);

CREATE TABLE "slice"."built" (
  "build" "slice"."__domain_dmf76trth4" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__built_pk_5tj25hcq6k" PRIMARY KEY ("build")
);

CREATE TABLE "slice"."chimed" (
  "hour" bigint NOT NULL,
  "bell" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__chimed_pk_7p6ypuplhn" PRIMARY KEY ("hour", "bell")
);

CREATE TABLE "slice"."concluded" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "served" "slice"."__text_t4rwovzmqj" NOT NULL,
  "weighed" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__concluded_pk_b44jbktrki" PRIMARY KEY ("learner")
);

CREATE TABLE "slice"."copied" (
  "relation" "slice"."__text_t4rwovzmqj" NOT NULL,
  "run" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__copied_pk_6dsi4gohbu" PRIMARY KEY ("relation", "run")
);

CREATE TABLE "slice"."cursor" (
  "feed" "slice"."feed" NOT NULL,
  "position" bigint NOT NULL,
  CONSTRAINT "__cursor_pk_wl2ngqny4j" PRIMARY KEY ("feed", "position")
);

CREATE TABLE "slice"."delivered" (
  "attempt" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__delivered_pk_xzukubt47t" PRIMARY KEY ("attempt")
);

CREATE TABLE "slice"."heard" (
  "key" "slice"."__text_t4rwovzmqj" NOT NULL,
  "answered" boolean NOT NULL,
  CONSTRAINT "__heard_pk_sdu7ysinks" PRIMARY KEY ("key")
);

CREATE TABLE "slice"."item" (
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__item_pk_ai4obgmq4k" PRIMARY KEY ("feed", "seq", "n")
);

CREATE TABLE "slice"."order" (
  "order" "slice"."__text_t4rwovzmqj" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  CONSTRAINT "__order_pk_qodq3est7o" PRIMARY KEY ("order")
);

CREATE TABLE "slice"."passage" (
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "embedding" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__passage_pk_kayjlxd3gv" PRIMARY KEY ("passage"),
  CONSTRAINT "__passage_norm_embedding_d2siyt575a" CHECK (("vector_ext"."vector_norm"("embedding") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice"."reviewed" (
  "review" "slice"."__text_t4rwovzmqj" NOT NULL,
  "group" "slice"."__domain_gfw43vigph" NOT NULL,
  "count" "slice"."__domain_gfw43vigph" NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__reviewed_pk_z3sm6wzse2" PRIMARY KEY ("review", "group")
);

CREATE TABLE "slice"."seen" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__seen_pk_g4ptcxwowb" PRIMARY KEY ("learner", "passage")
);

CREATE TABLE "slice"."settled" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__settled_pk_yitdz6z3ts" PRIMARY KEY ("batch")
);

CREATE TABLE "slice"."summary" (
  "review" "slice"."__text_t4rwovzmqj" NOT NULL,
  "groups" "slice"."__domain_gfw43vigph" NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__summary_pk_rpajkerfah" PRIMARY KEY ("review")
);

CREATE TABLE "slice"."tally" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  "count" "slice"."__domain_gfw43vigph" NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__tally_pk_7jc66uxxx4" PRIMARY KEY ("batch")
);

CREATE TABLE "slice"."want" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__want_pk_exjpgudfoz" PRIMARY KEY ("batch", "size")
);

CREATE TABLE "slice"."weight" (
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__weight_pk_p77rl634io" PRIMARY KEY ("feed", "factor")
);

CREATE TABLE "slice_den"."assign_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."assign_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_claim_pk_gy4yhzk2me" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."assign_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_done_pk_gzil7jvxpz" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_ended_pk_nriwwbcneu" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."assign_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_failed_pk_ygxslcya4o" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_fenced_pk_y6jyfviepa" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."assign_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__assign_finish_key_root_step_eqtmpheihj" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."assign_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_held_pk_by245z7t45" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_paused" (
  "target" "slice_den"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_paused_pk_ulo4grv4e2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."assign_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_requested_with_pk_on2y3g7zqy" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."assign_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."assign_outcome" NOT NULL,
  CONSTRAINT "__assign_result_pk_i2yxmpkyzr" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_resumed" (
  "target" "slice_den"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."assign_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."assign_retry_why" NOT NULL,
  CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."assign_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."assign_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__assign_root_pk_b23qqyryx4" PRIMARY KEY ("root"),
  CONSTRAINT "__assign_root_key_root_kind_albudrr2vv" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."assign_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_scope_pk_xytntbncid" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__assign_scope_key_scope_6ayivwnr6w" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."assign_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__assign_served_pk_gahaxyiegw" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."assign_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_skipped_pk_5qhgbueof7" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."assign_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__assign_start_step_key_root_step_n7nc3rlewh" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."assign_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."assign_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__assign_step_pk_2oc4ehvfzd" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__assign_step_key_step_onrbsu6v67" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."audit" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "note" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__audit_pk_dcvpvv5cjz" PRIMARY KEY ("step")
);

CREATE TABLE "slice_den"."chain_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."chain_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_claim_pk_nrr2rn3gui" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."chain_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_done_pk_tyyx2hmu3r" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_ended_pk_wusc7vjjx6" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."chain_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."chain_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_finish_pk_ebe75jmnzy" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__chain_finish_key_root_step_jhhtviztjs" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."chain_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_held_pk_73idl7oo5c" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_paused" (
  "target" "slice_den"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_paused_pk_oorovhvyps" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."chain_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_requested_with_pk_lkg4jmp76c" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."chain_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."chain_outcome" NOT NULL,
  CONSTRAINT "__chain_result_pk_btw3jzlkgl" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_resumed" (
  "target" "slice_den"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."chain_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."chain_retry_why" NOT NULL,
  CONSTRAINT "__chain_retry_pk_522nodru3s" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."chain_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."chain_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__chain_root_pk_wqfycdg3x5" PRIMARY KEY ("root"),
  CONSTRAINT "__chain_root_key_root_kind_nrgbg46psl" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."chain_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_scope_pk_fxzt444lf6" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__chain_scope_key_scope_w373uqpwyq" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."chain_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_served_pk_wzbdafznld" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."chain_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."chain_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_start_step_pk_dgda7shxb4" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__chain_start_step_key_root_step_ncsd5g5nar" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."chain_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."chain_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__chain_step_pk_u6x5wnvfbv" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__chain_step_key_step_32tfhd2p5e" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."clock_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_admitted_pk_a7wwsyakra" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."clock_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__clock_claim_pk_ihqmnokjqm" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."clock_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_done_pk_f4vl6frrax" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__clock_ended_pk_pqp6yh3qgg" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."clock_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_exhausted_pk_4m2tieyrky" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_failed_pk_6twuzcs6kf" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__clock_fenced_pk_mzppv2rrab" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."clock_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_finish_pk_eqj7fcnrnq" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__clock_finish_key_root_step_gg4t25lynz" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."clock_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__clock_held_pk_qqxrvee2gy" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_paused" (
  "target" "slice_den"."clock_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__clock_paused_pk_fsld2lekav" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."clock_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__clock_refusal_pk_dslb6cgxa3" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_requested_with_pk_4p3mwvs5e3" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."clock_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."clock_outcome" NOT NULL,
  CONSTRAINT "__clock_result_pk_yptcdjm6pu" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_resumed" (
  "target" "slice_den"."clock_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__clock_resumed_pk_iqjwv5tioc" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."clock_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."clock_retry_why" NOT NULL,
  CONSTRAINT "__clock_retry_pk_4kyiqeoeqd" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."clock_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."clock_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__clock_root_pk_rnmiw3efr2" PRIMARY KEY ("root"),
  CONSTRAINT "__clock_root_key_root_kind_e4vt5g6ggk" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."clock_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_scope_pk_dux445xz6c" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__clock_scope_key_scope_ikor7cy7lf" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."clock_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__clock_served_pk_t5lm3cvd5b" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."clock_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_skipped_pk_2whj2jo6zo" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."clock_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_start_step_pk_qgw6bnuo54" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__clock_start_step_key_root_step_pknqcsg3yv" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."clock_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."clock_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__clock_step_pk_jjmk3diqpl" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__clock_step_key_step_hgcnovy6vv" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."fan_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."fan_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "holds" "slice"."__domain_gfw43vigph" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__root_krweilnoma" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  "__pred_holds_lq7itfruzz" bigint GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "holds"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_claim_pk_e7zimqppco" PRIMARY KEY ("root", "step", "attempt"),
  CONSTRAINT "__fan_claim_key_root_step_attempt_raqrzlrtrk" UNIQUE NULLS DISTINCT ("__root_krweilnoma", "step", "attempt")
);

CREATE TABLE "slice_den"."fan_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_done_pk_5u65252q52" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_ended_pk_23aeteyyv7" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."fan_exclusive" (
  "kind" "slice_den"."fan_root_kind" NOT NULL,
  "key" "slice"."__sha256" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_exclusive_pk_m6sgdzlvmh" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice_den"."fan_exclusive_key" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "id" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_exclusive_key_pk_dqq46aar7y" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."fan_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_failed_pk_z4etp5dmax" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_fenced_pk_6tkvirerez" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."fan_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_finish_pk_6mb33urjra" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__fan_finish_key_root_step_4hpunaiysi" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."fan_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_held_pk_4ic6tjvac4" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_hold" (
  "resource" "slice_den"."fan_resource" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "seat" "slice"."__domain_gfw43vigph" NOT NULL,
  "__next_holds_qe2ylbyjxu" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_hold_pk_avuqdkljvb" PRIMARY KEY ("resource", "root", "step", "attempt"),
  CONSTRAINT "__fan_hold_key_root_step_attempt_at_vy3k4db54f" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "at"),
  CONSTRAINT "__fan_hold_key_root_step_attempt_at_next_holds_2jq65xeeeq" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "at", "__next_holds_qe2ylbyjxu"),
  CONSTRAINT "__fan_hold_key_root_step_attempt_pred_at_pr3hqe44bn" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "__pred_at_xktcobhsti")
);

CREATE TABLE "slice_den"."fan_paused" (
  "target" "slice_den"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."fan_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_refusal_pk_7va55wo2wj" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_released" (
  "kind" "slice_den"."fan_root_kind" NOT NULL,
  "key" "slice"."__sha256" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_released_pk_kzdup6rx4m" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice_den"."fan_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_requested_with_pk_vaj2obx6si" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."fan_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."fan_outcome" NOT NULL,
  CONSTRAINT "__fan_result_pk_yeear352sx" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_resumed" (
  "target" "slice_den"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."fan_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."fan_retry_why" NOT NULL,
  CONSTRAINT "__fan_retry_pk_7xubce4v66" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."fan_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."fan_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__fan_root_pk_jesu7xtefn" PRIMARY KEY ("root"),
  CONSTRAINT "__fan_root_key_root_kind_fhgsejgmzx" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."fan_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_scope_pk_7bvjfihnef" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__fan_scope_key_scope_ehh72plhww" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."fan_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_served_pk_hcfoxxhdsr" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."fan_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_skipped_pk_22erbmfzer" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."fan_start_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__fan_start_scope_key_root_child_7zmuuriysl" UNIQUE NULLS DISTINCT ("root", "child")
);

CREATE TABLE "slice_den"."fan_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_start_step_pk_7e247xk4mz" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__fan_start_step_key_root_step_edhkhzfqxw" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."fan_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."fan_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__fan_step_pk_2f4tcxnofk" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__fan_step_key_step_zhkwete5vm" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."fan_within" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "parent" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."fan_child_kind" NOT NULL,
  CONSTRAINT "__fan_within_pk_g5tswgjfa6" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."retry_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_admitted_pk_qyp7cminjx" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."retry_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__retry_claim_pk_aayzt5ni6z" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."retry_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_done_pk_vtkpce7rkq" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_ended_pk_hq35r7u2t2" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."retry_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_exhausted_pk_v56c23krid" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_failed_pk_mygc4onczp" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_fenced_pk_umzicmiruo" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."retry_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__retry_finish_key_root_step_lrmuwwupuk" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."retry_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_held_pk_nvgeylmjp2" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_paused" (
  "target" "slice_den"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__retry_paused_pk_umm2nscqny" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."retry_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_refusal_pk_nifndsd6pp" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_requested_with_pk_hud2g5nhzq" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."retry_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."retry_outcome" NOT NULL,
  CONSTRAINT "__retry_result_pk_5fegihvmml" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_resumed" (
  "target" "slice_den"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."retry_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."retry_retry_why" NOT NULL,
  CONSTRAINT "__retry_retry_pk_slrwn4rt5d" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."retry_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."retry_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__retry_root_pk_qi2iw36jky" PRIMARY KEY ("root"),
  CONSTRAINT "__retry_root_key_root_kind_fljwbhyeaq" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."retry_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_scope_pk_fgji2phvxy" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__retry_scope_key_scope_cxzylhyf64" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."retry_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_served_pk_wgxtug7z34" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."retry_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_skipped_pk_au5z33ql7a" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."retry_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_start_step_pk_mp77csmi26" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__retry_start_step_key_root_step_zrielh73lq" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."retry_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."retry_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__retry_step_pk_opjqidwhzg" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__retry_step_key_step_nrthvwlxer" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."review_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_admitted_pk_woy7ee4y4p" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."review_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "holds" "slice"."__domain_gfw43vigph" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__root_krweilnoma" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  "__pred_holds_lq7itfruzz" bigint GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "holds"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_claim_pk_twa72qaol7" PRIMARY KEY ("root", "step", "attempt"),
  CONSTRAINT "__review_claim_key_root_step_attempt_aa6aoqmhae" UNIQUE NULLS DISTINCT ("__root_krweilnoma", "step", "attempt")
);

CREATE TABLE "slice_den"."review_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_done_pk_ve6inioidy" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__review_ended_pk_2hihcuxln2" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."review_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_exhausted_pk_5bmktauwd3" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_failed_pk_7iszsjaybr" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__review_fenced_pk_chaexdbnzu" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."review_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_finish_pk_ovczbakxjz" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__review_finish_key_root_step_cq4yeqzi25" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."review_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__review_held_pk_cwyo7jovuu" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_hold" (
  "resource" "slice_den"."review_resource" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "seat" "slice"."__domain_gfw43vigph" NOT NULL,
  "__next_holds_7j7ynyqmw6" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_hold_pk_uhb6w3fp5v" PRIMARY KEY ("resource", "root", "step", "attempt"),
  CONSTRAINT "__review_hold_key_root_step_attempt_at_6p3v4lr6zi" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "at"),
  CONSTRAINT "__review_hold_key_root_step_attempt_at_next_holds_yiw42djdl7" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "at", "__next_holds_7j7ynyqmw6"),
  CONSTRAINT "__review_hold_key_root_step_attempt_pred_at_adiit7mrkk" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "__pred_at_xktcobhsti")
);

CREATE TABLE "slice_den"."review_paused" (
  "target" "slice_den"."review_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_paused_pk_eamccblv6g" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."review_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__review_refusal_pk_ajyglinn6r" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_requested_with_pk_eauvdhg7kh" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."review_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."review_outcome" NOT NULL,
  CONSTRAINT "__review_result_pk_o5x5griurk" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_resumed" (
  "target" "slice_den"."review_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__review_resumed_pk_jqgqbkvl65" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."review_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."review_retry_why" NOT NULL,
  CONSTRAINT "__review_retry_pk_is3m5sa5tx" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."review_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."review_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__review_root_pk_btvrw2kxvs" PRIMARY KEY ("root"),
  CONSTRAINT "__review_root_key_root_kind_g7dcwn7ekf" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."review_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_scope_pk_grsivyyp7b" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__review_scope_key_scope_zikoayu732" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."review_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__review_served_pk_bkbrtbk3k7" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."review_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_skipped_pk_ymsn25w74u" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."review_start_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_start_scope_pk_qlm2r5uhqp" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__review_start_scope_key_root_child_cz7ajv7kqf" UNIQUE NULLS DISTINCT ("root", "child")
);

CREATE TABLE "slice_den"."review_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_start_step_pk_w5suwqqg4p" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__review_start_step_key_root_step_sgv2fu4bpg" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."review_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."review_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__review_step_pk_gfbmnzqbc3" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__review_step_key_step_6zswnepqkd" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."review_within" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "parent" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."review_child_kind" NOT NULL,
  CONSTRAINT "__review_within_pk_ohgogpkz4s" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."sync_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_admitted_pk_ral53o3fpi" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."sync_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__sync_claim_pk_s2tqnziq4u" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."sync_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_done_pk_nllomjb7og" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_ended_pk_uxijjz7koz" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."sync_exclusive" (
  "kind" "slice_den"."sync_root_kind" NOT NULL,
  "key" "slice"."__sha256" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__sync_exclusive_pk_joiibnjuvf" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice_den"."sync_exclusive_key" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "id" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."sync_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_failed_pk_gqykngewxb" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."sync_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_finish_pk_hn7tmx25xc" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__sync_finish_key_root_step_mccyu3467o" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."sync_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_held_pk_wsme4moka4" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_paused" (
  "target" "slice_den"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__sync_paused_pk_tstk2okngj" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."sync_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__sync_refusal_pk_mbmfornc5c" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_released" (
  "kind" "slice_den"."sync_root_kind" NOT NULL,
  "key" "slice"."__sha256" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_released_pk_k7qaw2iram" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice_den"."sync_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_requested_with_pk_dz754jk7j3" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."sync_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."sync_outcome" NOT NULL,
  CONSTRAINT "__sync_result_pk_jmwy2p3mqf" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_resumed" (
  "target" "slice_den"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."sync_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."sync_retry_why" NOT NULL,
  CONSTRAINT "__sync_retry_pk_6q52red7iw" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."sync_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."sync_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__sync_root_pk_daktpubfe2" PRIMARY KEY ("root"),
  CONSTRAINT "__sync_root_key_root_kind_eiyeq632ma" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."sync_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_scope_pk_bg72sm6p4z" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__sync_scope_key_scope_wd7ijpypy3" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."sync_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__sync_served_pk_ed5gkrpyzv" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."sync_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_skipped_pk_yutjqacvws" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."sync_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__sync_start_step_key_root_step_otrdmdbrol" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."sync_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."sync_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__sync_step_pk_wfgcxdvbwo" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__sync_step_key_step_d7ugjkasz4" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."writeback_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_admitted_pk_eplj3gsbzy" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."writeback_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__writeback_claim_pk_j7bglnjq7b" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."writeback_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_done_pk_x32l3wxb3c" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_ended" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__writeback_ended_pk_atnezxtfz6" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."writeback_exhausted" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_exhausted_pk_sqddw6eedo" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_failed" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_failed_pk_g4uud6r5kb" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_fenced" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__writeback_fenced_pk_exblcoemag" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."writeback_finish" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_finish_pk_htcvidwpy6" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__writeback_finish_key_root_step_mwy36ww7ko" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."writeback_held" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__writeback_held_pk_5tktjcet5w" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_paused" (
  "target" "slice_den"."writeback_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__writeback_paused_pk_ncs2aff76t" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."writeback_refusal" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__writeback_refusal_pk_lqictdn67w" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_requested_with" (
  "root" "slice"."__sha256" NOT NULL,
  "fingerprint" "slice"."__sha256" NOT NULL,
  "input" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_requested_with_pk_yiae7pktd3" PRIMARY KEY ("root")
);

CREATE TABLE "slice_den"."writeback_result" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."writeback_outcome" NOT NULL,
  CONSTRAINT "__writeback_result_pk_lygppaax77" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_resumed" (
  "target" "slice_den"."writeback_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__writeback_resumed_pk_qrrua45xou" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."writeback_retry" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."writeback_retry_why" NOT NULL,
  CONSTRAINT "__writeback_retry_pk_j2ien3obty" PRIMARY KEY ("root", "step", "attempt")
);

CREATE TABLE "slice_den"."writeback_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."writeback_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__writeback_root_pk_a5puwyrem6" PRIMARY KEY ("root"),
  CONSTRAINT "__writeback_root_key_root_kind_xcyyolrc7c" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."writeback_scope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_scope_pk_aywjorzcsy" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "__writeback_scope_key_scope_lessf5blgh" UNIQUE NULLS DISTINCT ("scope")
);

CREATE TABLE "slice_den"."writeback_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__writeback_served_pk_pw2fwekjjm" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."writeback_skipped" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_skipped_pk_3pijvusl26" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."writeback_start_step" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_start_step_pk_sp7hkcjz7m" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "__writeback_start_step_key_root_step_td6hftw5pk" UNIQUE NULLS DISTINCT ("root", "step")
);

CREATE TABLE "slice_den"."writeback_step" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."writeback_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__writeback_step_pk_xsrl5j4mlf" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__writeback_step_key_step_js3rfiokua" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice_den"."__assign_asked_ydsj2i3eaz" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_asked_pk_5hpdamg2sv" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__assign_asked_key_root_to_nusrq43or3" UNIQUE NULLS DISTINCT ("root", "to")
);

CREATE TABLE "slice_den"."__assign_assignment_finish_output_tgx2l6dcwa" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_finish_output_pk_djholiuras" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__assign_assignment_input_jkityquzjz" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice_den"."__assign_assignment_input_mode_qgsuyzj2rf" NOT NULL,
  "__tag_kind_assignment_q5nqvzv6jc" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__assign_assignment_input_exclude_wqrktw62ew" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" PRIMARY KEY ("root", "scope", "ordinal")
);

CREATE TABLE "slice_den"."__assign_assignment_input_mode_nearest_rphbo3zi77" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__assign_assignment_input_mode_within_ct54emb5dy" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_assignment_input_near_6teditkssg" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" double precision NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_assignment_input_near_pk_yr4pki7m7t" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "value_finite" CHECK (("value" > '-Infinity'::double precision AND "value" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_decide_input_x2ivfl6dr6" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "vector" "vector_ext"."vector"(4) NOT NULL,
  "mode" "slice_den"."__assign_decide_input_mode_uc225m6nfx" NOT NULL,
  CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__assign_decide_input_norm_vector_it3heqzuab" CHECK (("vector_ext"."vector_norm"("vector") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_decide_input_exclude_hsjt7zirht" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__assign_decide_input_mode_nearest_cl7wnjtnl6" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__assign_decide_input_mode_within_wyrtyk7xxz" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" PRIMARY KEY ("root", "step"),
  CONSTRAINT "radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_decide_output_lzpgzlkjyw" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "confidence" double precision NOT NULL,
  "stage" "slice_den"."__assign_decide_output_stage_h6m76hjspn" NOT NULL,
  CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" PRIMARY KEY ("root", "step"),
  CONSTRAINT "confidence_finite" CHECK (("confidence" > '-Infinity'::double precision AND "confidence" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_decide_output_stage_rest_zhvgamofet" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__assign_decide_output_stage_serve_t5rc4e7rkh" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" PRIMARY KEY ("root", "step"),
  CONSTRAINT "distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_decide_output_weighed_3owmsgm56c" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  "passed" boolean NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" PRIMARY KEY ("root", "step", "ordinal"),
  CONSTRAINT "distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_decide_read_nearest_rpgjzn2izt" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_read_nearest_pk_22bk6frvyf" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__assign_decide_read_nearest_rgphb72gov" (
  "digest" "slice"."__sha256" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "distance" double precision NOT NULL,
  CONSTRAINT "__assign_decide_read_nearest_row_pk_j5pwukyltc" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."__assign_decide_read_seen_imbphpples" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_read_seen_pk_wllnx7uy5j" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__assign_decide_read_seen_74cjs74p4e" (
  "digest" "slice"."__sha256" NOT NULL,
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assign_decide_read_seen_row_pk_fab2ngfdqq" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."__assign_embed_input_plsl5oyfme" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice_den"."__assign_embed_input_mode_kmqv2n54cy" NOT NULL,
  CONSTRAINT "__assign_embed_input_pk_q4ezcfvwia" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__assign_embed_input_exclude_jck2tra3om" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_embed_input_exclude_pk_5bklowmkgt" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__assign_embed_input_mode_nearest_arzebnvbjm" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_embed_input_mode_nearest_pk_wiskd5j54m" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__assign_embed_input_mode_within_ngfsonab43" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_embed_input_mode_within_pk_zldmxccjlo" PRIMARY KEY ("root", "step"),
  CONSTRAINT "radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_embed_input_near_jmllazcmpe" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" double precision NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_embed_input_near_pk_bkusmda72a" PRIMARY KEY ("root", "step", "ordinal"),
  CONSTRAINT "value_finite" CHECK (("value" > '-Infinity'::double precision AND "value" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__assign_embed_output_outjkqxuwn" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "vector" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__assign_embed_output_pk_noiv3qgtry" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__assign_embed_output_norm_vector_yuy6gaplly" CHECK (("vector_ext"."vector_norm"("vector") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."__chain_chain_run_finish_output_c5x6npov3q" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_chain_run_finish_output_pk_hj22ebjnf7" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__chain_chain_run_input_bmdsmqbrk2" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."__chain_chain_run_input_feed_tu7p4zezp4" NOT NULL,
  "pages" bigint NOT NULL,
  "__tag_kind_chain_run_ccthhdybqw" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__chain_next_hix6yqf25z" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_next_pk_qeumlilvtk" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__chain_next_key_root_to_jwrkpakwhb" UNIQUE NULLS DISTINCT ("root", "to")
);

CREATE TABLE "slice_den"."__chain_ordered_finish_output_v4b6b7jaop" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_ordered_finish_output_pk_t5k5pqxfdo" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__chain_ordered_input_tlj4ihbubo" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."__chain_ordered_input_feed_mnwz7hkicc" NOT NULL,
  "pages" bigint NOT NULL,
  "__tag_kind_ordered_ms3hwzrkhl" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__chain_page_input_kbmuk2fo2o" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."__chain_page_input_feed_3lfpnabckm" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "pages" bigint NOT NULL,
  CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__chain_page_input_after_lml64urvyw" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__chain_page_output_ar56neu7kw" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "items" bigint NOT NULL,
  "earlier" bigint NOT NULL,
  CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__chain_page_output_next_ettneiluga" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__chain_page_read_earlier_33grnly7mg" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_earlier_pk_2xyyf45r3u" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__chain_page_read_earlier_z5dqatdfnb" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_earlier_row_pk_fzp2fq7wlv" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."__chain_page_read_tree_mt76djloc5" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_tree_pk_yi4lj5ou7f" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__chain_page_read_tree_items_first_noxho2nj7m" (
  "digest" "slice"."__sha256" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_tree_first_pk_elrx4yzmnb" PRIMARY KEY ("digest", "at")
);

CREATE TABLE "slice_den"."__chain_page_read_tree_items_57d6r2rrdd" (
  "digest" "slice"."__sha256" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  "__next_items_32zkibnpeq" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_page_read_tree_items_pk_fay3dxulye" PRIMARY KEY ("digest", "at"),
  CONSTRAINT "__chain_page_read_tree_items_key_digest_at_next_zwr7ept537" UNIQUE NULLS DISTINCT ("digest", "at", "__next_items_32zkibnpeq"),
  CONSTRAINT "__chain_page_read_tree_items_key_digest_pred_at_ipnjzk4wne" UNIQUE NULLS DISTINCT ("digest", "__pred_at_xktcobhsti")
);

CREATE TABLE "slice_den"."__chain_page_read_tree_nd6esoa3d3" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  "items" "slice"."__domain_gfw43vigph" NOT NULL,
  "__digest_7nxtpg25rz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "items" > 0::bigint THEN "digest" END) STORED,
  "__pred_items_3qltx5cx27" bigint GENERATED ALWAYS AS (CASE WHEN "items" > 0::bigint THEN "items"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_page_read_tree_row_pk_krei6zvz6t" PRIMARY KEY ("digest"),
  CONSTRAINT "__chain_page_read_tree_row_key_digest_e3kzriq3cu" UNIQUE NULLS DISTINCT ("__digest_7nxtpg25rz")
);

CREATE TABLE "slice_den"."__chain_page_read_weights_fcely5x3ye" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_weights_pk_7oohwtj6x4" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__chain_page_read_weights_as4vhffas4" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_weights_row_pk_bmwffycauu" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."__clock_chime_input_nc7szz5fdz" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__clock_chime_input_pk_rx6722hrpy" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__clock_chime_output_yk3jszl3nz" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__clock_chime_output_pk_aqm3k5vyxa" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__clock_close_input_h75u27cqtv" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__clock_close_input_pk_kzcush3qdx" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__clock_close_output_eburj7fb27" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__clock_close_output_pk_ckrp5oabyy" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__clock_hourly_finish_output_4z7ppwlpey" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_hourly_finish_output_pk_6bcdc5q3dt" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__clock_hourly_input_nq4knj5mda" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_hourly_axvj7zlyzy" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__clock_hourly_input_pk_s536mhvux3" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__clock_hourly_key_ntq5bjzb5f" (
  "root" "slice"."__sha256" NOT NULL,
  "at" bigint NOT NULL,
  "member" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "member_digest" "slice"."__sha256" GENERATED ALWAYS AS ("slice"."__text_digest_2x5x4iwe4m"("member")) STORED NOT NULL,
  CONSTRAINT "__clock_hourly_key_pk_iqlcy244pv" PRIMARY KEY ("root"),
  CONSTRAINT "__clock_hourly_key_key_at_member_digest_kkthzqojax" UNIQUE NULLS DISTINCT ("at", "member_digest")
);

CREATE TABLE "slice_den"."__clock_sitting_finish_output_fwh455o2k3" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_sitting_finish_output_pk_pejmuwtji5" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__clock_sitting_input_rjgg4hnzuz" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__tag_kind_sitting_zbhu3onph5" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__clock_sitting_input_pk_le4qxvpabo" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__fan_batch_finish_output_w3ybhcpn32" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_batch_finish_output_pk_mq5omzswqd" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_batch_input_g7ltcwxihg" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__fan_dust_input_nl5ryyxwda" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_dust_input_pk_xyleoykgmc" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_dust_output_g3a5zvfwyn" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_dust_output_pk_3ve4gi5x6b" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_fan_run_finish_output_tihwjhg4ga" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_fan_run_finish_output_pk_rhhjregxru" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_fan_run_input_lbk743wucv" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "__tag_kind_fan_run_2liqlumqkj" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__fan_mop_input_dygkjxsbxg" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_mop_input_pk_jwnqekad76" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_mop_output_tpbr6xzihr" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_mop_output_pk_rcebyoc32v" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_square_input_nrma7ymfpq" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "n" bigint NOT NULL,
  CONSTRAINT "__fan_square_input_pk_uzumoizv53" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_square_output_gjyqmfzpg4" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "square" bigint NOT NULL,
  CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_sweep_finish_output_x6kmrogoe4" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_sweep_finish_output_pk_7dvx2ngckn" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_sweep_input_zh2fwcaxpj" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_sweep_4lmrlblufr" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__fan_sweep_input_pk_zzlgjjqr6f" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__fan_wanted_finish_output_fbbbpc7sk2" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_wanted_finish_output_pk_yzfwxx7lln" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__fan_wanted_input_chczog66p4" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "__tag_kind_wanted_lpgalpid4g" smallint GENERATED ALWAYS AS (2::smallint) STORED NOT NULL,
  CONSTRAINT "__fan_wanted_input_pk_dnq2nzzzkx" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__fan_wanted_key_zqopchzdok" (
  "root" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "batch_digest" "slice"."__sha256" GENERATED ALWAYS AS ("slice"."__text_digest_2x5x4iwe4m"("batch")) STORED NOT NULL,
  CONSTRAINT "__fan_wanted_key_pk_uqg7pqcckj" PRIMARY KEY ("root"),
  CONSTRAINT "__fan_wanted_key_key_batch_digest_otdiqnej2r" UNIQUE NULLS DISTINCT ("batch_digest")
);

CREATE TABLE "slice_den"."__retry_brittle_input_zxa27dfpcf" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_brittle_output_bvdj5xglgr" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_ladders_finish_output_lamvpr56cy" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_ladders_finish_output_pk_5352zkn7xu" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_ladders_input_kwlnpvmkji" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_ladders_amjml3bobr" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__retry_patient_input_jgz2ypwo6h" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_patient_input_pk_74247zb7wo" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_patient_output_4efhqtb55s" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_patient_output_pk_whtgus732k" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_polite_input_i6nfplmbrq" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_polite_input_pk_ptzd72dxff" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_polite_output_5gkkilaesu" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_polite_output_pk_2kuwfluplv" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_steadfast_input_ktw6jkjsgs" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_steadfast_output_mluqjs7euo" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_throttled_finish_output_km4aldifvp" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_throttled_finish_output_pk_o6epepnuox" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_throttled_input_khzxxl3wcp" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_throttled_uy63hl6qg7" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__retry_throttled_input_pk_zv264azw4s" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__retry_unhurried_finish_output_tvybo25flf" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_unhurried_finish_output_pk_d5mmuqfkuq" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__retry_unhurried_input_2o2io4czfn" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_unhurried_yf3vrtngno" smallint GENERATED ALWAYS AS (2::smallint) STORED NOT NULL,
  CONSTRAINT "__retry_unhurried_input_pk_g5dkiedexm" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__review_analyze_input_ihh24uynlq" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "question" bigint NOT NULL,
  CONSTRAINT "__review_analyze_input_pk_jr7qmhqwgi" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_analyze_output_q7frt4d7gx" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "score" bigint NOT NULL,
  CONSTRAINT "__review_analyze_output_pk_35aclxnkmb" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_gather_input_ctew4fh6k4" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "review" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__review_gather_input_pk_rllaxtocmq" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_gather_input_sizes_bcltwv6ebr" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" bigint NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_gather_input_sizes_pk_w5cgw65wpx" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."__review_gather_output_wu55xueycd" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "groups" bigint NOT NULL,
  CONSTRAINT "__review_gather_output_pk_fecesmjazj" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_questions_finish_output_fzoucv66df" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "count" bigint NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__review_questions_finish_output_pk_36plo53gmb" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_questions_input_mdxrdossfi" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__review_questions_input_pk_4d27veaz4g" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__review_review_run_finish_output_t6i22fh3a6" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_review_run_finish_output_pk_qwfb4ycp7r" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_review_run_input_jzp47telwo" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_review_run_npquoqpyk4" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__review_review_run_input_pk_7ommryhd6b" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__review_review_run_input_sizes_cuh2lwogrl" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" bigint NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_review_run_input_sizes_pk_bguaae726h" PRIMARY KEY ("root", "scope", "ordinal")
);

CREATE TABLE "slice_den"."__review_save_input_co47sfi2mr" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "count" bigint NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__review_save_input_pk_iaqr5cg2c2" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_save_output_lyuy6h4srf" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__review_save_output_pk_usbddkytv7" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__review_saved_5iq7m2fmyr" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_saved_pk_mrkz2ovxcx" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__review_saved_key_root_to_hfwtbsvtvv" UNIQUE NULLS DISTINCT ("root", "to")
);

CREATE TABLE "slice_den"."__review_split_ggs6ku5tr5" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_split_pk_im65kbvnho" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__review_split_key_root_to_3bsdaxl7fd" UNIQUE NULLS DISTINCT ("root", "to")
);

CREATE TABLE "slice_den"."__sync_build_input_2ax6pwgsaz" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "build" "slice"."__domain_dmf76trth4" NOT NULL,
  CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__sync_build_output_q4gdmteauj" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "build" "slice"."__domain_dmf76trth4" NOT NULL,
  CONSTRAINT "__sync_build_output_pk_rhnco3epch" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__sync_copy_input_wrlz7dd6wx" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__sync_copy_output_bgyc3dxoz3" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "run" bigint NOT NULL,
  CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__sync_gold_finish_output_bli5mgqtdu" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_gold_finish_output_pk_3z5gemduto" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__sync_gold_input_3odt2l5j2i" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "build" "slice"."__domain_dmf76trth4" NOT NULL,
  "__tag_kind_gold_phmoz6zyym" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__sync_sync_run_finish_output_h7vi6bsoxq" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_sync_run_finish_output_pk_n74f63qvg6" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__sync_sync_run_input_qo4lf3kyiy" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  "__tag_kind_sync_run_wmr74dvsia" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__writeback_deliver_input_ka7ox24nbt" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__writeback_deliver_input_pk_i7vk7dq3eb" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__writeback_deliver_output_qjzukfor3j" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__writeback_deliver_output_pk_jkhggp3cer" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__writeback_writeback_finish_output_ckitnszwtc" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_writeback_finish_output_pk_payvcqalt7" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."__writeback_writeback_input_zalrrn5ggs" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_writeback_7zc6o24iqm" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__writeback_writeback_input_pk_ejs235aju2" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice"."__live_secret" ("secret") AS SELECT "pg_catalog"."sha256"("pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()) || "pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()));

REVOKE ALL ON TABLE "slice"."__live_secret" FROM PUBLIC;

ALTER TABLE "slice"."passage" REPLICA IDENTITY FULL;

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assigned"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."built"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chimed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."concluded"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."copied"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."cursor"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."delivered"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."heard"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."item"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."order"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."passage"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."reviewed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."seen"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."settled"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."summary"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."tally"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."want"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."weight"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."audit"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_exclusive_key"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_hold"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_start_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_hold"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_start_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_exclusive_key"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_requested_with"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_asked_ydsj2i3eaz"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_assignment_finish_output_tgx2l6dcwa"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_assignment_input_jkityquzjz"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_assignment_input_exclude_wqrktw62ew"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_assignment_input_mode_nearest_rphbo3zi77"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_assignment_input_mode_within_ct54emb5dy"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_assignment_input_near_6teditkssg"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_input_x2ivfl6dr6"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_input_exclude_hsjt7zirht"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_input_mode_nearest_cl7wnjtnl6"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_input_mode_within_wyrtyk7xxz"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_output_lzpgzlkjyw"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_output_stage_rest_zhvgamofet"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_output_stage_serve_t5rc4e7rkh"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_output_weighed_3owmsgm56c"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_read_nearest_rpgjzn2izt"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_read_nearest_rgphb72gov"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_read_seen_imbphpples"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_read_seen_74cjs74p4e"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_embed_input_plsl5oyfme"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_embed_input_exclude_jck2tra3om"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_embed_input_mode_nearest_arzebnvbjm"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_embed_input_mode_within_ngfsonab43"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_embed_input_near_jmllazcmpe"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_embed_output_outjkqxuwn"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_chain_run_finish_output_c5x6npov3q"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_chain_run_input_bmdsmqbrk2"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_next_hix6yqf25z"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_ordered_finish_output_v4b6b7jaop"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_ordered_input_tlj4ihbubo"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_input_kbmuk2fo2o"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_input_after_lml64urvyw"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_output_ar56neu7kw"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_output_next_ettneiluga"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_earlier_33grnly7mg"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_earlier_z5dqatdfnb"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_tree_mt76djloc5"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_tree_items_first_noxho2nj7m"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_tree_items_57d6r2rrdd"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_tree_nd6esoa3d3"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_weights_fcely5x3ye"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_weights_as4vhffas4"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_chime_input_nc7szz5fdz"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_chime_output_yk3jszl3nz"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_close_input_h75u27cqtv"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_close_output_eburj7fb27"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_hourly_finish_output_4z7ppwlpey"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_hourly_input_nq4knj5mda"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_hourly_key_ntq5bjzb5f"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_sitting_finish_output_fwh455o2k3"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__clock_sitting_input_rjgg4hnzuz"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_batch_finish_output_w3ybhcpn32"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_batch_input_g7ltcwxihg"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_dust_input_nl5ryyxwda"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_dust_output_g3a5zvfwyn"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_fan_run_finish_output_tihwjhg4ga"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_fan_run_input_lbk743wucv"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_mop_input_dygkjxsbxg"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_mop_output_tpbr6xzihr"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_square_input_nrma7ymfpq"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_square_output_gjyqmfzpg4"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_sweep_finish_output_x6kmrogoe4"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_sweep_input_zh2fwcaxpj"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_wanted_finish_output_fbbbpc7sk2"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_wanted_input_chczog66p4"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__fan_wanted_key_zqopchzdok"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_brittle_input_zxa27dfpcf"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_brittle_output_bvdj5xglgr"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_ladders_finish_output_lamvpr56cy"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_ladders_input_kwlnpvmkji"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_patient_input_jgz2ypwo6h"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_patient_output_4efhqtb55s"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_polite_input_i6nfplmbrq"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_polite_output_5gkkilaesu"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_steadfast_input_ktw6jkjsgs"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_steadfast_output_mluqjs7euo"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_throttled_finish_output_km4aldifvp"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_throttled_input_khzxxl3wcp"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_unhurried_finish_output_tvybo25flf"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__retry_unhurried_input_2o2io4czfn"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_analyze_input_ihh24uynlq"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_analyze_output_q7frt4d7gx"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_gather_input_ctew4fh6k4"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_gather_input_sizes_bcltwv6ebr"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_gather_output_wu55xueycd"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_questions_finish_output_fzoucv66df"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_questions_input_mdxrdossfi"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_review_run_finish_output_t6i22fh3a6"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_review_run_input_jzp47telwo"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_review_run_input_sizes_cuh2lwogrl"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_save_input_co47sfi2mr"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_save_output_lyuy6h4srf"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_saved_5iq7m2fmyr"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__review_split_ggs6ku5tr5"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_build_input_2ax6pwgsaz"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_build_output_q4gdmteauj"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_copy_input_wrlz7dd6wx"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_copy_output_bgyc3dxoz3"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_gold_finish_output_bli5mgqtdu"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_gold_input_3odt2l5j2i"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_sync_run_finish_output_h7vi6bsoxq"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__sync_sync_run_input_qo4lf3kyiy"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__writeback_deliver_input_ka7ox24nbt"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__writeback_deliver_output_qjzukfor3j"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__writeback_writeback_finish_output_ckitnszwtc"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__writeback_writeback_input_zalrrn5ggs"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TABLE "slice_den"."__head_assign_claim_attempt_h744pvqs3v" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_assign_claim_attempt_pk_ukplhioyap" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_assign_claim_attempt_h744pvqs3v" FROM PUBLIC;

CREATE TABLE "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_chain_claim_attempt_pk_uil6dupsak" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" FROM PUBLIC;

CREATE TABLE "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_clock_claim_attempt_pk_qk5yhk2dpe" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" FROM PUBLIC;

CREATE TABLE "slice_den"."__head_fan_claim_attempt_u34lm72lgr" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_fan_claim_attempt_pk_fxxlbksulz" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_fan_claim_attempt_u34lm72lgr" FROM PUBLIC;

CREATE TABLE "slice_den"."__head_retry_claim_attempt_exbl6vgycp" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_retry_claim_attempt_pk_ejhdquayr7" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_retry_claim_attempt_exbl6vgycp" FROM PUBLIC;

CREATE TABLE "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_review_claim_attempt_pk_zws5xp3jki" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" FROM PUBLIC;

CREATE TABLE "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_sync_claim_attempt_pk_xgyze7x7sx" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" FROM PUBLIC;

CREATE TABLE "slice_den"."__head_writeback_claim_attempt_pk673p2jar" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "__stamper" "pg_catalog"."xid8" NOT NULL,
  CONSTRAINT "__head_writeback_claim_attempt_pk_iervt3geuj" PRIMARY KEY ("root", "step")
);

REVOKE ALL ON TABLE "slice_den"."__head_writeback_claim_attempt_pk673p2jar" FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_assign_claim_attempt_h744pvqs3v"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_assign_claim_attempt_h744pvqs3v" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_fan_claim_attempt_u34lm72lgr"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_fan_claim_attempt_u34lm72lgr" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_retry_claim_attempt_exbl6vgycp"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_retry_claim_attempt_exbl6vgycp" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_review_claim_attempt_lsmvyy7ajm"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_writeback_claim_attempt_pk673p2jar"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp" SET pg_plan_advice.advice = 'NO_GATHER(r3@r1) NO_GATHER(r4)'
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_writeback_claim_attempt_pk673p2jar" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r4"."c1", "r4"."c2", "r4"."c3", "r4"."c4" FROM "r1" AS "r4" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

ALTER TABLE "slice_den"."assign_admitted" ADD CONSTRAINT "__assign_admitted_fk_root_scope_unmbbqjvuz" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_claim"
  ADD CONSTRAINT "__assign_claim_fk_root_step_z35ulxscvt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_claim_fk_root_step_pred_attempt_bt5m6xhi43" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."assign_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_done" ADD CONSTRAINT "__assign_done_fk_root_step_jnpyqphpod" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_ended"
  ADD CONSTRAINT "__assign_ended_fk_root_step_fwsr5rmq4p" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_ended_fk_root_step_attempt_he35lvdstl" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."assign_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_exhausted"
  ADD CONSTRAINT "__assign_exhausted_fk_root_step_cspvc4i2pv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_exhausted_fk_root_step_6alordqsb5" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_failed" ADD CONSTRAINT "__assign_failed_fk_root_step_ipzrsjzgti" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_fenced"
  ADD CONSTRAINT "__assign_fenced_fk_root_step_dnqe55jtoa" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_fenced_fk_root_step_attempt_rjjyfxo25t" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."assign_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_finish"
  ADD CONSTRAINT "__assign_finish_fk_root_scope_az2daj5mvb" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_finish_fk_root_scope_f7uiptxzin" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_finish_fk_root_step_mkv6pbd4xq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_held"
  ADD CONSTRAINT "__assign_held_fk_root_step_6ut2ho42il" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_held_fk_root_step_4jy2ibkhlr" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_held_fk_root_step_attempt_agnrzcmkqy" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."assign_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_paused" ADD CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."assign_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_refusal"
  ADD CONSTRAINT "__assign_refusal_fk_root_step_hwduhrbvbd" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_refusal_fk_root_step_af3aisimwq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_requested_with" ADD CONSTRAINT "__assign_requested_with_fk_root_zx4lvtx6x5" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_result" ADD CONSTRAINT "__assign_result_fk_root_step_k4wpox452s" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_resumed" ADD CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."assign_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_retry"
  ADD CONSTRAINT "__assign_retry_fk_root_step_e2etghhjnd" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_retry_fk_root_step_attempt_374j3xrgm3" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."assign_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_scope" ADD CONSTRAINT "__assign_scope_fk_root_j4jocebgtw" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_skipped"
  ADD CONSTRAINT "__assign_skipped_fk_by_2bt5slbwgj" FOREIGN KEY ("by") REFERENCES "slice_den"."assign_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_skipped_fk_root_scope_jidurgue3e" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_skipped_fk_scope_x4sryze463" FOREIGN KEY ("scope") REFERENCES "slice_den"."assign_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_start_step"
  ADD CONSTRAINT "__assign_start_step_fk_root_scope_ixmywec4qv" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_start_step_fk_root_scope_t7vctbm6kw" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_start_step_fk_root_step_q57whinuhh" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_step"
  ADD CONSTRAINT "__assign_step_fk_root_scope_tiqkvqahkt" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_step_fk_root_scope_4j4ldav7gl" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."audit" ADD CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_admitted" ADD CONSTRAINT "__chain_admitted_fk_root_scope_pyx6o74r6r" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_claim"
  ADD CONSTRAINT "__chain_claim_fk_root_step_7edppg4aqs" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_claim_fk_root_step_pred_attempt_fmwmco64ak" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."chain_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_done" ADD CONSTRAINT "__chain_done_fk_root_step_7d3jwphqat" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_ended"
  ADD CONSTRAINT "__chain_ended_fk_root_step_f53nmrcf4o" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_ended_fk_root_step_attempt_daxikklndi" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."chain_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_exhausted"
  ADD CONSTRAINT "__chain_exhausted_fk_root_step_4l7lqt7ji4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_exhausted_fk_root_step_qen7piy3si" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_failed" ADD CONSTRAINT "__chain_failed_fk_root_step_wgrsezdykc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_fenced"
  ADD CONSTRAINT "__chain_fenced_fk_root_step_zoq4smze5v" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_fenced_fk_root_step_attempt_rjs5xdup6v" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."chain_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_finish"
  ADD CONSTRAINT "__chain_finish_fk_root_scope_id3fnylkst" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_finish_fk_root_scope_cun3ubklxj" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_finish_fk_root_step_6graxxwr3k" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_held"
  ADD CONSTRAINT "__chain_held_fk_root_step_qp5rohxglc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_held_fk_root_step_pzstggr5uz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_held_fk_root_step_attempt_itfckrv27c" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."chain_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_paused" ADD CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."chain_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_refusal"
  ADD CONSTRAINT "__chain_refusal_fk_root_step_ykkkqcajv4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_refusal_fk_root_step_nfh5xnnucb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_requested_with" ADD CONSTRAINT "__chain_requested_with_fk_root_kaou5g6ytt" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_result" ADD CONSTRAINT "__chain_result_fk_root_step_ocbnaznecu" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_resumed" ADD CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."chain_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_retry"
  ADD CONSTRAINT "__chain_retry_fk_root_step_ovrtf36jcq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_retry_fk_root_step_attempt_t2kbhcxstx" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."chain_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_scope" ADD CONSTRAINT "__chain_scope_fk_root_3oxsnvnyqm" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_skipped"
  ADD CONSTRAINT "__chain_skipped_fk_by_s5hrvg2lf3" FOREIGN KEY ("by") REFERENCES "slice_den"."chain_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_skipped_fk_root_scope_ghpfmtf7sw" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_skipped_fk_scope_2p7bml3674" FOREIGN KEY ("scope") REFERENCES "slice_den"."chain_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_start_step"
  ADD CONSTRAINT "__chain_start_step_fk_root_scope_lvxzyapkkz" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_start_step_fk_root_scope_csyj2bv7zv" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_start_step_fk_root_step_3v26ol7z45" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_step"
  ADD CONSTRAINT "__chain_step_fk_root_scope_yfe4j5xzze" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_step_fk_root_scope_2dsmwvsjfx" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_admitted" ADD CONSTRAINT "__clock_admitted_fk_root_scope_qiiqqqcffn" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_claim"
  ADD CONSTRAINT "__clock_claim_fk_root_step_hnkgjikniq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_claim_fk_root_step_pred_attempt_s6bkkwaqnz" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."clock_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_done" ADD CONSTRAINT "__clock_done_fk_root_step_yq4qhavboe" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_ended"
  ADD CONSTRAINT "__clock_ended_fk_root_step_gx5kdzotda" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_ended_fk_root_step_attempt_drvkyvybmh" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."clock_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_exhausted"
  ADD CONSTRAINT "__clock_exhausted_fk_root_step_ifbdfsiptr" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_exhausted_fk_root_step_gaqpfdbyl3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_failed" ADD CONSTRAINT "__clock_failed_fk_root_step_g4aoka6lo5" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_fenced"
  ADD CONSTRAINT "__clock_fenced_fk_root_step_cr4zsb2h6l" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_fenced_fk_root_step_attempt_kyyyl7ahsl" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."clock_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_finish"
  ADD CONSTRAINT "__clock_finish_fk_root_scope_tzo2gy4k4n" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_finish_fk_root_scope_6z7ojozft7" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_finish_fk_root_step_3vz6t66zne" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_held"
  ADD CONSTRAINT "__clock_held_fk_root_step_cumpf2bq5c" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_held_fk_root_step_4lmqwyfsx6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_held_fk_root_step_attempt_ob3nh2i5w6" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."clock_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_paused" ADD CONSTRAINT "__clock_paused_fk_target_pred_turn_7tgjovpr6x" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."clock_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_refusal"
  ADD CONSTRAINT "__clock_refusal_fk_root_step_fgakzza4gr" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_refusal_fk_root_step_aurtl3zqby" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_requested_with" ADD CONSTRAINT "__clock_requested_with_fk_root_pyuj4tglmv" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_result" ADD CONSTRAINT "__clock_result_fk_root_step_uh7cpzsyxr" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_resumed" ADD CONSTRAINT "__clock_resumed_fk_target_turn_45dwn4cwo5" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."clock_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_retry"
  ADD CONSTRAINT "__clock_retry_fk_root_step_l5mlehgaai" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_retry_fk_root_step_attempt_vut5icvrra" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."clock_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_scope" ADD CONSTRAINT "__clock_scope_fk_root_xasutriv42" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_skipped"
  ADD CONSTRAINT "__clock_skipped_fk_by_nuxpfr6rlt" FOREIGN KEY ("by") REFERENCES "slice_den"."clock_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_skipped_fk_root_scope_umaapw5huy" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_skipped_fk_scope_oi3a3bn4yj" FOREIGN KEY ("scope") REFERENCES "slice_den"."clock_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_start_step"
  ADD CONSTRAINT "__clock_start_step_fk_root_scope_m4fy3w5rcl" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_start_step_fk_root_scope_nbmml3ni7y" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_start_step_fk_root_step_ysvl2b4s4g" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_step"
  ADD CONSTRAINT "__clock_step_fk_root_scope_77guzwc2dq" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_step_fk_root_scope_k3rk7n4jq2" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_admitted" ADD CONSTRAINT "__fan_admitted_fk_root_scope_paiega74y2" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_claim"
  ADD CONSTRAINT "__fan_claim_fk_root_step_2xkxna4wne" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_root_step_attempt_pred_holds_pred_7lusubqoow" FOREIGN KEY ("root", "step", "attempt", "__pred_holds_lq7itfruzz", "__pred_holds_lq7itfruzz") REFERENCES "slice_den"."fan_hold" ("root", "step", "attempt", "at", "__next_holds_qe2ylbyjxu") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_root_step_pred_attempt_thlj3gkwmg" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."fan_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_done" ADD CONSTRAINT "__fan_done_fk_root_step_snckhrcktc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_ended"
  ADD CONSTRAINT "__fan_ended_fk_root_step_g7lfuycwwy" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_ended_fk_root_step_attempt_sludbzdnea" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."fan_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_exclusive" ADD CONSTRAINT "__fan_exclusive_fk_kind_key_pred_turn_dyvewabv75" FOREIGN KEY ("kind", "key", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."fan_released" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_exclusive_key" ADD CONSTRAINT "__fan_exclusive_key_fk_root_scope_w4wlpmkbb6" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_exhausted"
  ADD CONSTRAINT "__fan_exhausted_fk_root_step_lfol3zhscm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_exhausted_fk_root_step_txucm4khfj" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_failed" ADD CONSTRAINT "__fan_failed_fk_root_step_e3uoiynnze" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_fenced"
  ADD CONSTRAINT "__fan_fenced_fk_root_step_xby6ndghkk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_fenced_fk_root_step_attempt_kxzdzh7oiz" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."fan_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_finish"
  ADD CONSTRAINT "__fan_finish_fk_root_scope_3z53mfbjar" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_finish_fk_root_scope_4wzngp66gg" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_finish_fk_root_step_hd27i2yklh" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_held"
  ADD CONSTRAINT "__fan_held_fk_root_step_4pr6zebh4l" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_held_fk_root_step_673ozjicob" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_held_fk_root_step_attempt_bflumufwqp" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."fan_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_hold"
  ADD CONSTRAINT "__fan_hold_fk_root_step_attempt_mdkvryltnc" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."fan_claim" ("__root_krweilnoma", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_hold_fk_root_step_attempt_pred_at_at_h5rmevrkns" FOREIGN KEY ("root", "step", "attempt", "__pred_at_xktcobhsti", "at") REFERENCES "slice_den"."fan_hold" ("root", "step", "attempt", "at", "__next_holds_qe2ylbyjxu") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_paused" ADD CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."fan_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_refusal"
  ADD CONSTRAINT "__fan_refusal_fk_root_step_qseur2r4dj" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_refusal_fk_root_step_4l2iz5yiww" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_released" ADD CONSTRAINT "__fan_released_fk_kind_key_turn_3w24p2wqa2" FOREIGN KEY ("kind", "key", "turn") REFERENCES "slice_den"."fan_exclusive" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_requested_with" ADD CONSTRAINT "__fan_requested_with_fk_root_4p6mpdfivp" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_result" ADD CONSTRAINT "__fan_result_fk_root_step_mm2j7nmocm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_resumed" ADD CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."fan_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_retry"
  ADD CONSTRAINT "__fan_retry_fk_root_step_dji2iap5lk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_retry_fk_root_step_attempt_qtwk5f4wb3" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."fan_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_scope" ADD CONSTRAINT "__fan_scope_fk_root_peo7vjux2b" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_skipped"
  ADD CONSTRAINT "__fan_skipped_fk_by_ptbn5ftpw3" FOREIGN KEY ("by") REFERENCES "slice_den"."fan_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_skipped_fk_root_scope_zoezs3f2j3" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_skipped_fk_scope_5rsfnka2al" FOREIGN KEY ("scope") REFERENCES "slice_den"."fan_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_start_scope"
  ADD CONSTRAINT "__fan_start_scope_fk_root_child_p2ruy7qsg2" FOREIGN KEY ("root", "child") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_scope_fk_root_scope_q3eun6lixq" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_scope_fk_root_scope_ayer7ncuhn" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_start_step"
  ADD CONSTRAINT "__fan_start_step_fk_root_scope_ocnak7go4o" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_step_fk_root_scope_yfg5db7u23" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_step_fk_root_step_ml4otyqd5u" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_step"
  ADD CONSTRAINT "__fan_step_fk_root_scope_mnnzqu5muv" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_step_fk_root_scope_7hmxdgnve3" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_within"
  ADD CONSTRAINT "__fan_within_fk_root_parent_7jmxi4kbha" FOREIGN KEY ("root", "parent") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_within_fk_root_scope_s4ljjlq6zp" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_admitted" ADD CONSTRAINT "__retry_admitted_fk_root_scope_4whpx2yoko" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_claim"
  ADD CONSTRAINT "__retry_claim_fk_root_step_y3nttmzxe7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_claim_fk_root_step_pred_attempt_ygcziesx4q" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."retry_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_done" ADD CONSTRAINT "__retry_done_fk_root_step_d6c7pi2dpp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_ended"
  ADD CONSTRAINT "__retry_ended_fk_root_step_tet57bx36t" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_ended_fk_root_step_attempt_zmythu6lea" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."retry_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_exhausted"
  ADD CONSTRAINT "__retry_exhausted_fk_root_step_ysmlpu2xyq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_exhausted_fk_root_step_37kf6fgbfy" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_failed" ADD CONSTRAINT "__retry_failed_fk_root_step_uguij74dd4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_fenced"
  ADD CONSTRAINT "__retry_fenced_fk_root_step_ippcs3eeog" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_fenced_fk_root_step_attempt_yjqggn34wn" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."retry_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_finish"
  ADD CONSTRAINT "__retry_finish_fk_root_scope_zjjmku4ngd" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_finish_fk_root_scope_ybtoj7rtci" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_finish_fk_root_step_uxc6mv3jae" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_held"
  ADD CONSTRAINT "__retry_held_fk_root_step_n2vjs67jaj" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_held_fk_root_step_etlrrjjeex" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_held_fk_root_step_attempt_hfwaf4utod" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."retry_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_paused" ADD CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."retry_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_refusal"
  ADD CONSTRAINT "__retry_refusal_fk_root_step_vhxwkfyqu3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_refusal_fk_root_step_cxbne35gly" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_requested_with" ADD CONSTRAINT "__retry_requested_with_fk_root_xpqnsapd2c" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_result" ADD CONSTRAINT "__retry_result_fk_root_step_i63yrf2jjz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_resumed" ADD CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."retry_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_retry"
  ADD CONSTRAINT "__retry_retry_fk_root_step_f6jn5krklx" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_retry_fk_root_step_attempt_khdzeotgev" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."retry_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_scope" ADD CONSTRAINT "__retry_scope_fk_root_p6ulzqc36r" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_skipped"
  ADD CONSTRAINT "__retry_skipped_fk_by_jf24rn5sep" FOREIGN KEY ("by") REFERENCES "slice_den"."retry_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_skipped_fk_root_scope_as5s7uohkr" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_skipped_fk_scope_my57tu4oty" FOREIGN KEY ("scope") REFERENCES "slice_den"."retry_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_start_step"
  ADD CONSTRAINT "__retry_start_step_fk_root_scope_phyy3twhmr" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_start_step_fk_root_scope_e3jd5sddhk" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_start_step_fk_root_step_tjvsrtkfqg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_step"
  ADD CONSTRAINT "__retry_step_fk_root_scope_xe4735gsrg" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_step_fk_root_scope_ubjxxgucjq" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_admitted" ADD CONSTRAINT "__review_admitted_fk_root_scope_wpazxz5qvc" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_claim"
  ADD CONSTRAINT "__review_claim_fk_root_step_7f6aefekwa" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_claim_fk_root_step_attempt_pred_holds_pred_m435qghyae" FOREIGN KEY ("root", "step", "attempt", "__pred_holds_lq7itfruzz", "__pred_holds_lq7itfruzz") REFERENCES "slice_den"."review_hold" ("root", "step", "attempt", "at", "__next_holds_7j7ynyqmw6") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_claim_fk_root_step_pred_attempt_77xjl3onsd" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."review_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_done" ADD CONSTRAINT "__review_done_fk_root_step_glhq6szbww" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_ended"
  ADD CONSTRAINT "__review_ended_fk_root_step_7wr4emeec6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_ended_fk_root_step_attempt_5k7tdgg5nm" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."review_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_exhausted"
  ADD CONSTRAINT "__review_exhausted_fk_root_step_7u7yvsyo3u" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_exhausted_fk_root_step_uadodb5yiw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_failed" ADD CONSTRAINT "__review_failed_fk_root_step_fmegqiyhwt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_fenced"
  ADD CONSTRAINT "__review_fenced_fk_root_step_kdzvzqe26m" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_fenced_fk_root_step_attempt_kxthyqyqwb" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."review_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_finish"
  ADD CONSTRAINT "__review_finish_fk_root_scope_gmmfvaopci" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_finish_fk_root_scope_av5o3ybt2d" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_finish_fk_root_step_ev6ctqell2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_held"
  ADD CONSTRAINT "__review_held_fk_root_step_377oxpprpb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_held_fk_root_step_6ucwevd65f" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_held_fk_root_step_attempt_43pd26ucr5" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."review_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_hold"
  ADD CONSTRAINT "__review_hold_fk_root_step_attempt_mbgar6ii27" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."review_claim" ("__root_krweilnoma", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_hold_fk_root_step_attempt_pred_at_at_w5cftoczlu" FOREIGN KEY ("root", "step", "attempt", "__pred_at_xktcobhsti", "at") REFERENCES "slice_den"."review_hold" ("root", "step", "attempt", "at", "__next_holds_7j7ynyqmw6") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_paused" ADD CONSTRAINT "__review_paused_fk_target_pred_turn_rig5fmgcvc" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."review_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_refusal"
  ADD CONSTRAINT "__review_refusal_fk_root_step_i325iogm4w" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_refusal_fk_root_step_ksoewu53t4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_requested_with" ADD CONSTRAINT "__review_requested_with_fk_root_qr6x7qjzy6" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_result" ADD CONSTRAINT "__review_result_fk_root_step_m7ddrhxqqw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_resumed" ADD CONSTRAINT "__review_resumed_fk_target_turn_nvm252hscc" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."review_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_retry"
  ADD CONSTRAINT "__review_retry_fk_root_step_ifbhbgbjic" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_retry_fk_root_step_attempt_iuo24rnbik" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."review_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_scope" ADD CONSTRAINT "__review_scope_fk_root_rc4vyqpoku" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_skipped"
  ADD CONSTRAINT "__review_skipped_fk_by_mzoxrlpp7w" FOREIGN KEY ("by") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_skipped_fk_root_scope_o5jk25ddgb" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_skipped_fk_scope_zgzwa7kzos" FOREIGN KEY ("scope") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_start_scope"
  ADD CONSTRAINT "__review_start_scope_fk_root_child_u342utzlud" FOREIGN KEY ("root", "child") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_start_scope_fk_root_scope_ax6i5m4tah" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_start_scope_fk_root_scope_ewcgg4gkqi" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_start_step"
  ADD CONSTRAINT "__review_start_step_fk_root_scope_elajx6ojmn" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_start_step_fk_root_scope_hm4o5wnnq3" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_start_step_fk_root_step_hydxoqk6ko" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_step"
  ADD CONSTRAINT "__review_step_fk_root_scope_a6ifj3up6d" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_step_fk_root_scope_4m7aoxywg2" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_within"
  ADD CONSTRAINT "__review_within_fk_root_parent_xrlmd76tph" FOREIGN KEY ("root", "parent") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_within_fk_root_scope_2kmwa6l6ye" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_admitted" ADD CONSTRAINT "__sync_admitted_fk_root_scope_qm32lzefa4" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_claim"
  ADD CONSTRAINT "__sync_claim_fk_root_step_quvtx5ttao" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_claim_fk_root_step_pred_attempt_bol6pjm3eo" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."sync_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_done" ADD CONSTRAINT "__sync_done_fk_root_step_ftvlmvrpba" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_ended"
  ADD CONSTRAINT "__sync_ended_fk_root_step_i2lhyuwibk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_ended_fk_root_step_attempt_n3qg5glb33" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."sync_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_exclusive" ADD CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" FOREIGN KEY ("kind", "key", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."sync_released" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_exclusive_key" ADD CONSTRAINT "__sync_exclusive_key_fk_root_scope_ru5tdbmjnc" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_exhausted"
  ADD CONSTRAINT "__sync_exhausted_fk_root_step_22ldo45blt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_exhausted_fk_root_step_kmkjf7jent" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_failed" ADD CONSTRAINT "__sync_failed_fk_root_step_myvzlf5ffc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_fenced"
  ADD CONSTRAINT "__sync_fenced_fk_root_step_rx2gydw664" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_fenced_fk_root_step_attempt_hkkt227xm7" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."sync_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_finish"
  ADD CONSTRAINT "__sync_finish_fk_root_scope_n57v7sorjw" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_finish_fk_root_scope_nkwaqqjkro" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_finish_fk_root_step_gtaz64zwer" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_held"
  ADD CONSTRAINT "__sync_held_fk_root_step_ehzwf7un2t" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_held_fk_root_step_vuwropgke7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_held_fk_root_step_attempt_mcpqusift2" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."sync_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_paused" ADD CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."sync_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_refusal"
  ADD CONSTRAINT "__sync_refusal_fk_root_step_yvga4jg2h6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_refusal_fk_root_step_65sxus7ykl" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_released" ADD CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" FOREIGN KEY ("kind", "key", "turn") REFERENCES "slice_den"."sync_exclusive" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_requested_with" ADD CONSTRAINT "__sync_requested_with_fk_root_bihshryreo" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_result" ADD CONSTRAINT "__sync_result_fk_root_step_dkzpapizq3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_resumed" ADD CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."sync_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_retry"
  ADD CONSTRAINT "__sync_retry_fk_root_step_mugwrgmigc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_retry_fk_root_step_attempt_cg4q7avist" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."sync_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_scope" ADD CONSTRAINT "__sync_scope_fk_root_wx7v6qyztc" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_skipped"
  ADD CONSTRAINT "__sync_skipped_fk_by_wk5g3hkdey" FOREIGN KEY ("by") REFERENCES "slice_den"."sync_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_skipped_fk_root_scope_dct5o42l56" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_skipped_fk_scope_hufe6pzhes" FOREIGN KEY ("scope") REFERENCES "slice_den"."sync_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_start_step"
  ADD CONSTRAINT "__sync_start_step_fk_root_scope_e4yzl2gkau" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_start_step_fk_root_scope_nacgozh2kl" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_start_step_fk_root_step_btl5tfw67n" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_step"
  ADD CONSTRAINT "__sync_step_fk_root_scope_uniymuuxtn" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_step_fk_root_scope_enzxhjw2gj" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_admitted" ADD CONSTRAINT "__writeback_admitted_fk_root_scope_qqqzahnyf2" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_claim"
  ADD CONSTRAINT "__writeback_claim_fk_root_step_zg75zksbji" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_claim_fk_root_step_pred_attempt_4zvl2uw25a" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."writeback_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_done" ADD CONSTRAINT "__writeback_done_fk_root_step_bzwxzhndka" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_ended"
  ADD CONSTRAINT "__writeback_ended_fk_root_step_am67uqomrg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_ended_fk_root_step_attempt_qh4jnsspop" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."writeback_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_exhausted"
  ADD CONSTRAINT "__writeback_exhausted_fk_root_step_gfmcwvfpwb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_exhausted_fk_root_step_xwgnlixkqu" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_failed" ADD CONSTRAINT "__writeback_failed_fk_root_step_ep5ube2q2t" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_fenced"
  ADD CONSTRAINT "__writeback_fenced_fk_root_step_jryffdx4b3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_fenced_fk_root_step_attempt_scgwb3deqz" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."writeback_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_finish"
  ADD CONSTRAINT "__writeback_finish_fk_root_scope_wktu6oamh6" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_finish_fk_root_scope_2ufa2arlo5" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_finish_fk_root_step_x7bocjavzm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_held"
  ADD CONSTRAINT "__writeback_held_fk_root_step_5jfudzwxhs" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_held_fk_root_step_ujyn46mfgy" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_held_fk_root_step_attempt_7rv7r23ugx" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."writeback_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_paused" ADD CONSTRAINT "__writeback_paused_fk_target_pred_turn_rvsgo6wgpe" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."writeback_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_refusal"
  ADD CONSTRAINT "__writeback_refusal_fk_root_step_xpfkdcxaxw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_refusal_fk_root_step_sjojme5rf4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_requested_with" ADD CONSTRAINT "__writeback_requested_with_fk_root_72fgh2eqe3" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_result" ADD CONSTRAINT "__writeback_result_fk_root_step_hpxhblq2jh" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_resumed" ADD CONSTRAINT "__writeback_resumed_fk_target_turn_vfx6l6vk75" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."writeback_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_retry"
  ADD CONSTRAINT "__writeback_retry_fk_root_step_mqrj7w6oik" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_retry_fk_root_step_attempt_w6r4myovu5" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."writeback_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_scope" ADD CONSTRAINT "__writeback_scope_fk_root_ewz6khigbz" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_skipped"
  ADD CONSTRAINT "__writeback_skipped_fk_by_3dxz35zl4d" FOREIGN KEY ("by") REFERENCES "slice_den"."writeback_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_skipped_fk_root_scope_oiafhni4pk" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_skipped_fk_scope_4nuhyyemgw" FOREIGN KEY ("scope") REFERENCES "slice_den"."writeback_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_start_step"
  ADD CONSTRAINT "__writeback_start_step_fk_root_scope_rlujmxpldi" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_start_step_fk_root_scope_hro4duvhvg" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_start_step_fk_root_step_6rk46kjksz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_step"
  ADD CONSTRAINT "__writeback_step_fk_root_scope_4chp4gjey5" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_step_fk_root_scope_2ldlcdao3z" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."__assign_asked_ydsj2i3eaz"
  ADD CONSTRAINT "__assign_asked_fk_root_from_egcl4ohqo5" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."__assign_embed_output_outjkqxuwn" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_asked_fk_root_from_6wrf2w24uc" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_asked_fk_root_to_nau6tqpt7j" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."__assign_decide_input_x2ivfl6dr6" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_assignment_finish_output_tgx2l6dcwa"
  ADD CONSTRAINT "__assign_assignment_finish_output_fk_root_step_xd4lcqxnwu" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_finish_output_fk_root_step_gzyabr2afl" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_assignment_input_jkityquzjz"
  ADD CONSTRAINT "__assign_assignment_input_fk_root_scope_lcgcyjnkog" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_input_fk_scope_tag_kind_646lzaw56q" FOREIGN KEY ("scope", "__tag_kind_assignment_q5nqvzv6jc") REFERENCES "slice_den"."assign_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_assignment_input_exclude_wqrktw62ew"
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_root_scope_qsm54cc645" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."__assign_assignment_input_jkityquzjz" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_root_scope_irhbpzgmtx" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_root_scope_pred_xyfmadmy2x" FOREIGN KEY ("__root_yjobx7uyrd", "scope", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__assign_assignment_input_exclude_wqrktw62ew" ("root", "scope", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_assignment_input_mode_nearest_rphbo3zi77" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_scope_6i4bqzwxmy" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."__assign_assignment_input_mode_within_ct54emb5dy" ADD CONSTRAINT "__assign_assignment_input_mode_within_fk_root_scope_ubokbtb6tu" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."__assign_assignment_input_near_6teditkssg"
  ADD CONSTRAINT "__assign_assignment_input_near_fk_root_scope_zlksrjaoob" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."__assign_assignment_input_jkityquzjz" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_near_fk_root_scope_gyktnyg3n7" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_input_near_fk_root_scope_pred_irjyvyphrh" FOREIGN KEY ("__root_yjobx7uyrd", "scope", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__assign_assignment_input_near_6teditkssg" ("root", "scope", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_input_x2ivfl6dr6" ADD CONSTRAINT "__assign_decide_input_fk_root_step_igdcrjssd3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_input_exclude_hsjt7zirht"
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_root_step_62s7y3zxzv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__assign_decide_input_x2ivfl6dr6" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_root_step_iddq5dh4ap" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_root_step_pred_vc4il3cgp6" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__assign_decide_input_exclude_hsjt7zirht" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_input_mode_nearest_cl7wnjtnl6" ADD CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_step_5peaxfkhff" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_input_mode_within_wyrtyk7xxz" ADD CONSTRAINT "__assign_decide_input_mode_within_fk_root_step_2rdpk7bkmk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_output_lzpgzlkjyw"
  ADD CONSTRAINT "__assign_decide_output_fk_root_step_pwsuruf3ul" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__assign_decide_input_x2ivfl6dr6" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_fk_root_step_reczzzxtv7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_decide_output_fk_root_step_jjxfv3qn3e" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_output_stage_rest_zhvgamofet" ADD CONSTRAINT "__assign_decide_output_stage_rest_fk_root_step_n5oh4qicf6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_output_stage_serve_t5rc4e7rkh" ADD CONSTRAINT "__assign_decide_output_stage_serve_fk_root_step_oonulae66c" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_output_weighed_3owmsgm56c"
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_root_step_vvsbzwtvof" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__assign_decide_output_lzpgzlkjyw" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_root_step_p7abhgwln3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_root_step_pred_ii5u7bfryh" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__assign_decide_output_weighed_3owmsgm56c" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_read_nearest_rpgjzn2izt"
  ADD CONSTRAINT "__assign_decide_read_nearest_fk_digest_bpdnxpzp5m" FOREIGN KEY ("digest") REFERENCES "slice_den"."__assign_decide_read_nearest_rgphb72gov" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_nearest_fk_root_step_anuw7c2rf4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_nearest_fk_root_step_o6ms3vld7t" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_decide_read_seen_imbphpples"
  ADD CONSTRAINT "__assign_decide_read_seen_fk_digest_zjwk3f7pfz" FOREIGN KEY ("digest") REFERENCES "slice_den"."__assign_decide_read_seen_74cjs74p4e" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_seen_fk_root_step_agvsf5drbl" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_seen_fk_root_step_mv4uqnfszq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_embed_input_plsl5oyfme" ADD CONSTRAINT "__assign_embed_input_fk_root_step_rnzanixu6r" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_embed_input_exclude_jck2tra3om"
  ADD CONSTRAINT "__assign_embed_input_exclude_fk_root_step_5kxjdsp4if" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__assign_embed_input_plsl5oyfme" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_exclude_fk_root_step_ky3b4wudl7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_exclude_fk_root_step_pred_pcwizkmay4" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__assign_embed_input_exclude_jck2tra3om" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_embed_input_mode_nearest_arzebnvbjm" ADD CONSTRAINT "__assign_embed_input_mode_nearest_fk_root_step_r4t3h6xgge" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_embed_input_mode_within_ngfsonab43" ADD CONSTRAINT "__assign_embed_input_mode_within_fk_root_step_br4jvr5oin" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_embed_input_near_jmllazcmpe"
  ADD CONSTRAINT "__assign_embed_input_near_fk_root_step_ejkwdhq7b6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__assign_embed_input_plsl5oyfme" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_near_fk_root_step_zqfv3upodb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_near_fk_root_step_pred_ordinal_tmq3bjkufn" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__assign_embed_input_near_jmllazcmpe" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__assign_embed_output_outjkqxuwn"
  ADD CONSTRAINT "__assign_embed_output_fk_root_step_t2s5kgspwa" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_embed_output_fk_root_step_me4olxkaae" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__assign_embed_input_plsl5oyfme" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_output_fk_root_step_l7rws2phs3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_chain_run_finish_output_c5x6npov3q"
  ADD CONSTRAINT "__chain_chain_run_finish_output_fk_root_step_wxcmcz2uwn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_chain_run_finish_output_fk_root_step_dqanxvykwn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_chain_run_input_bmdsmqbrk2"
  ADD CONSTRAINT "__chain_chain_run_input_fk_root_scope_azcdpxczrt" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_chain_run_input_fk_scope_tag_kind_chain_run_5wb4haod5z" FOREIGN KEY ("scope", "__tag_kind_chain_run_ccthhdybqw") REFERENCES "slice_den"."chain_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_next_hix6yqf25z"
  ADD CONSTRAINT "__chain_next_fk_root_from_kgirayj3r7" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."__chain_page_output_ar56neu7kw" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_fk_root_from_cbyt22x2kb" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_fk_root_to_sgtpaqtkk5" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."__chain_page_input_kbmuk2fo2o" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_ordered_finish_output_v4b6b7jaop"
  ADD CONSTRAINT "__chain_ordered_finish_output_fk_root_step_o7qzrnwjhn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_ordered_finish_output_fk_root_step_bgpcuvizzv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_ordered_input_tlj4ihbubo"
  ADD CONSTRAINT "__chain_ordered_input_fk_root_scope_cvyakq2mmm" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_ordered_input_fk_scope_tag_kind_ordered_3oj5bnc73t" FOREIGN KEY ("scope", "__tag_kind_ordered_ms3hwzrkhl") REFERENCES "slice_den"."chain_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_input_kbmuk2fo2o" ADD CONSTRAINT "__chain_page_input_fk_root_step_4ppejtqytz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_input_after_lml64urvyw"
  ADD CONSTRAINT "__chain_page_input_after_fk_root_step_j23hgcqubg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__chain_page_input_kbmuk2fo2o" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_input_after_fk_root_step_argee2kcrw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_output_ar56neu7kw"
  ADD CONSTRAINT "__chain_page_output_fk_root_step_vpxoed5wiw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_page_output_fk_root_step_crz5lf7jcp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__chain_page_input_kbmuk2fo2o" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_fk_root_step_x4sxvbjuqf" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_output_next_ettneiluga"
  ADD CONSTRAINT "__chain_page_output_next_fk_root_step_zoq5plixab" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__chain_page_output_ar56neu7kw" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_next_fk_root_step_yitewnz5it" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_read_earlier_33grnly7mg"
  ADD CONSTRAINT "__chain_page_read_earlier_fk_digest_draxd5jrld" FOREIGN KEY ("digest") REFERENCES "slice_den"."__chain_page_read_earlier_z5dqatdfnb" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_earlier_fk_root_step_wuy63lvcqg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_earlier_fk_root_step_7lgmmjpzgv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_read_tree_mt76djloc5"
  ADD CONSTRAINT "__chain_page_read_tree_fk_digest_cz6fzlmtk4" FOREIGN KEY ("digest") REFERENCES "slice_den"."__chain_page_read_tree_nd6esoa3d3" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_tree_fk_root_step_gu4nmv4usa" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_tree_fk_root_step_5jdwehtqbt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_read_tree_items_first_noxho2nj7m" ADD CONSTRAINT "__chain_page_read_tree_first_fk_digest_at_mxnolu45np" FOREIGN KEY ("digest", "at") REFERENCES "slice_den"."__chain_page_read_tree_items_57d6r2rrdd" ("digest", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_read_tree_items_57d6r2rrdd"
  ADD CONSTRAINT "__chain_page_read_tree_items_fk_digest_myuh5xjhli" FOREIGN KEY ("digest") REFERENCES "slice_den"."__chain_page_read_tree_nd6esoa3d3" ("__digest_7nxtpg25rz") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_tree_items_fk_digest_pred_at_at_uuldtqtzh5" FOREIGN KEY ("digest", "__pred_at_xktcobhsti", "at") REFERENCES "slice_den"."__chain_page_read_tree_items_57d6r2rrdd" ("digest", "at", "__next_items_32zkibnpeq") MATCH SIMPLE;

ALTER TABLE "slice_den"."__chain_page_read_tree_nd6esoa3d3" ADD CONSTRAINT "__chain_page_read_tree_row_fk_digest_pred_items_pred_ddbsxh3gq5" FOREIGN KEY ("digest", "__pred_items_3qltx5cx27", "__pred_items_3qltx5cx27") REFERENCES "slice_den"."__chain_page_read_tree_items_57d6r2rrdd" ("digest", "at", "__next_items_32zkibnpeq") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_read_weights_fcely5x3ye"
  ADD CONSTRAINT "__chain_page_read_weights_fk_digest_73zfvhpwus" FOREIGN KEY ("digest") REFERENCES "slice_den"."__chain_page_read_weights_as4vhffas4" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_weights_fk_root_step_3bx3bwh3v6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_weights_fk_root_step_qxk4wctybp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_chime_input_nc7szz5fdz" ADD CONSTRAINT "__clock_chime_input_fk_root_step_b2ryltpz5c" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_chime_output_yk3jszl3nz"
  ADD CONSTRAINT "__clock_chime_output_fk_root_step_qixdzekdul" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__clock_chime_input_nc7szz5fdz" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_chime_output_fk_root_step_hz7ggh3lus" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_chime_output_fk_root_step_flgj3oymiz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_close_input_h75u27cqtv" ADD CONSTRAINT "__clock_close_input_fk_root_step_sqnp6phfzc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_close_output_eburj7fb27"
  ADD CONSTRAINT "__clock_close_output_fk_root_step_f7egr5rego" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__clock_close_input_h75u27cqtv" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_close_output_fk_root_step_waaqexpeeq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_close_output_fk_root_step_aeii5cry7w" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_hourly_finish_output_4z7ppwlpey"
  ADD CONSTRAINT "__clock_hourly_finish_output_fk_root_step_bouynloxnt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_hourly_finish_output_fk_root_step_jspbxqs2og" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_hourly_input_nq4knj5mda"
  ADD CONSTRAINT "__clock_hourly_input_fk_root_scope_edbqaxjsld" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_hourly_input_fk_scope_tag_kind_hourly_yqnjwt5yzr" FOREIGN KEY ("scope", "__tag_kind_hourly_axvj7zlyzy") REFERENCES "slice_den"."clock_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_sitting_finish_output_fwh455o2k3"
  ADD CONSTRAINT "__clock_sitting_finish_output_fk_root_step_3nv65ayicb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_sitting_finish_output_fk_root_step_zqtvbg4t5v" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__clock_sitting_input_rjgg4hnzuz"
  ADD CONSTRAINT "__clock_sitting_input_fk_root_scope_5hr6svgtkx" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_sitting_input_fk_scope_tag_kind_sitting_v4ep6mjxje" FOREIGN KEY ("scope", "__tag_kind_sitting_zbhu3onph5") REFERENCES "slice_den"."clock_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_batch_finish_output_w3ybhcpn32"
  ADD CONSTRAINT "__fan_batch_finish_output_fk_root_step_lvbwqkrzya" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_batch_finish_output_fk_root_step_uvhwobeihn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_batch_input_g7ltcwxihg" ADD CONSTRAINT "__fan_batch_input_fk_root_scope_sqnk42kypy" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."__fan_dust_input_nl5ryyxwda" ADD CONSTRAINT "__fan_dust_input_fk_root_step_zkgggm2l56" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_dust_output_g3a5zvfwyn"
  ADD CONSTRAINT "__fan_dust_output_fk_root_step_22ctuvlqsa" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_dust_output_fk_root_step_q6syhjm3id" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__fan_dust_input_nl5ryyxwda" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_dust_output_fk_root_step_3tchtvpkq4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_fan_run_finish_output_tihwjhg4ga"
  ADD CONSTRAINT "__fan_fan_run_finish_output_fk_root_step_eikvoft6l2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_fan_run_finish_output_fk_root_step_sxqsosyjco" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_fan_run_input_lbk743wucv"
  ADD CONSTRAINT "__fan_fan_run_input_fk_root_scope_zfasx36h3d" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_fan_run_input_fk_scope_tag_kind_fan_run_nkgxbb32ui" FOREIGN KEY ("scope", "__tag_kind_fan_run_2liqlumqkj") REFERENCES "slice_den"."fan_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_mop_input_dygkjxsbxg" ADD CONSTRAINT "__fan_mop_input_fk_root_step_7coslxahxn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_mop_output_tpbr6xzihr"
  ADD CONSTRAINT "__fan_mop_output_fk_root_step_5d3cdcf24y" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_mop_output_fk_root_step_gbh3w7dstn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__fan_mop_input_dygkjxsbxg" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_mop_output_fk_root_step_djslkqxv6t" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_square_input_nrma7ymfpq" ADD CONSTRAINT "__fan_square_input_fk_root_step_czm3ctmjss" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_square_output_gjyqmfzpg4"
  ADD CONSTRAINT "__fan_square_output_fk_root_step_yvg2qx27p2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_square_output_fk_root_step_7xh6wnyepk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__fan_square_input_nrma7ymfpq" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_square_output_fk_root_step_yfsaf7ue33" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_sweep_finish_output_x6kmrogoe4"
  ADD CONSTRAINT "__fan_sweep_finish_output_fk_root_step_fywimi72uj" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_sweep_finish_output_fk_root_step_ryftvowe6x" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_sweep_input_zh2fwcaxpj"
  ADD CONSTRAINT "__fan_sweep_input_fk_root_scope_qjyveymntd" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_sweep_input_fk_scope_tag_kind_sweep_m67ubjgrsc" FOREIGN KEY ("scope", "__tag_kind_sweep_4lmrlblufr") REFERENCES "slice_den"."fan_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_wanted_finish_output_fbbbpc7sk2"
  ADD CONSTRAINT "__fan_wanted_finish_output_fk_root_step_nowqxllejz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_wanted_finish_output_fk_root_step_5gnvgmuqtc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__fan_wanted_input_chczog66p4"
  ADD CONSTRAINT "__fan_wanted_input_fk_root_scope_bplbmnj6uf" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_wanted_input_fk_scope_tag_kind_wanted_3573mr5njd" FOREIGN KEY ("scope", "__tag_kind_wanted_lpgalpid4g") REFERENCES "slice_den"."fan_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_brittle_input_zxa27dfpcf" ADD CONSTRAINT "__retry_brittle_input_fk_root_step_hlztk5pli7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_brittle_output_bvdj5xglgr"
  ADD CONSTRAINT "__retry_brittle_output_fk_root_step_jb4luuaii6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__retry_brittle_input_zxa27dfpcf" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_brittle_output_fk_root_step_u5tr5mvcej" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_brittle_output_fk_root_step_4iw5oycmsm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_ladders_finish_output_lamvpr56cy"
  ADD CONSTRAINT "__retry_ladders_finish_output_fk_root_step_i7hxe26f2a" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_ladders_finish_output_fk_root_step_ra5qmanxwx" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_ladders_input_kwlnpvmkji"
  ADD CONSTRAINT "__retry_ladders_input_fk_root_scope_d2fufzxzci" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_ladders_input_fk_scope_tag_kind_ladders_erl4knm7ui" FOREIGN KEY ("scope", "__tag_kind_ladders_amjml3bobr") REFERENCES "slice_den"."retry_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_patient_input_jgz2ypwo6h" ADD CONSTRAINT "__retry_patient_input_fk_root_step_f4hmhtbk3n" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_patient_output_4efhqtb55s"
  ADD CONSTRAINT "__retry_patient_output_fk_root_step_fpgjlxisro" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_patient_output_fk_root_step_cpuczlpiep" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__retry_patient_input_jgz2ypwo6h" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_patient_output_fk_root_step_pohr6muvkc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_polite_input_i6nfplmbrq" ADD CONSTRAINT "__retry_polite_input_fk_root_step_3jp5lj6xax" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_polite_output_5gkkilaesu"
  ADD CONSTRAINT "__retry_polite_output_fk_root_step_gafbdn5c5n" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_polite_output_fk_root_step_nu63thii5h" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__retry_polite_input_i6nfplmbrq" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_polite_output_fk_root_step_nxdrkj3kkv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_steadfast_input_ktw6jkjsgs" ADD CONSTRAINT "__retry_steadfast_input_fk_root_step_3q67hyqyq6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_steadfast_output_mluqjs7euo"
  ADD CONSTRAINT "__retry_steadfast_output_fk_root_step_4f5g2y22yg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_steadfast_output_fk_root_step_tr34nnpddn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__retry_steadfast_input_ktw6jkjsgs" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_steadfast_output_fk_root_step_v5mp7yeltb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_throttled_finish_output_km4aldifvp"
  ADD CONSTRAINT "__retry_throttled_finish_output_fk_root_step_aygvmljkir" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_throttled_finish_output_fk_root_step_ozfnseaqrp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_throttled_input_khzxxl3wcp"
  ADD CONSTRAINT "__retry_throttled_input_fk_root_scope_yejc25rnmm" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_throttled_input_fk_scope_tag_kind_throttled_trbhgfiswb" FOREIGN KEY ("scope", "__tag_kind_throttled_uy63hl6qg7") REFERENCES "slice_den"."retry_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_unhurried_finish_output_tvybo25flf"
  ADD CONSTRAINT "__retry_unhurried_finish_output_fk_root_step_fzjhrc7zku" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_unhurried_finish_output_fk_root_step_7jes3ip3gy" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__retry_unhurried_input_2o2io4czfn"
  ADD CONSTRAINT "__retry_unhurried_input_fk_root_scope_5vujadmlj4" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_unhurried_input_fk_scope_tag_kind_unhurried_4hx7yzieur" FOREIGN KEY ("scope", "__tag_kind_unhurried_yf3vrtngno") REFERENCES "slice_den"."retry_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_analyze_input_ihh24uynlq" ADD CONSTRAINT "__review_analyze_input_fk_root_step_yub2qzymcs" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_analyze_output_q7frt4d7gx"
  ADD CONSTRAINT "__review_analyze_output_fk_root_step_h2ee2dnes4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__review_analyze_input_ihh24uynlq" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_analyze_output_fk_root_step_4na2usm64g" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_analyze_output_fk_root_step_mcuzplqybm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_gather_input_ctew4fh6k4" ADD CONSTRAINT "__review_gather_input_fk_root_step_db5vv26eez" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_gather_input_sizes_bcltwv6ebr"
  ADD CONSTRAINT "__review_gather_input_sizes_fk_root_step_zge42z5dw4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__review_gather_input_ctew4fh6k4" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_input_sizes_fk_root_step_27idztmubk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_input_sizes_fk_root_step_pred_oebvwidbtm" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__review_gather_input_sizes_bcltwv6ebr" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_gather_output_wu55xueycd"
  ADD CONSTRAINT "__review_gather_output_fk_root_step_bt3tpfiw36" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_gather_output_fk_root_step_ypsfoe6pny" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__review_gather_input_ctew4fh6k4" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_output_fk_root_step_ni7dbzmuww" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_questions_finish_output_fzoucv66df"
  ADD CONSTRAINT "__review_questions_finish_output_fk_root_step_flxzyo2ooj" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_questions_finish_output_fk_root_step_miwyapestz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_questions_input_mdxrdossfi" ADD CONSTRAINT "__review_questions_input_fk_root_scope_6uvp2sj3t7" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."__review_review_run_finish_output_t6i22fh3a6"
  ADD CONSTRAINT "__review_review_run_finish_output_fk_root_step_65iqvssdi2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_review_run_finish_output_fk_root_step_fl4bfx2c4c" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_review_run_input_jzp47telwo"
  ADD CONSTRAINT "__review_review_run_input_fk_root_scope_jojwgvs76k" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_review_run_input_fk_scope_tag_kind_review_mewu5adpnd" FOREIGN KEY ("scope", "__tag_kind_review_run_npquoqpyk4") REFERENCES "slice_den"."review_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_review_run_input_sizes_cuh2lwogrl"
  ADD CONSTRAINT "__review_review_run_input_sizes_fk_root_scope_qoiz22wckm" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."__review_review_run_input_jzp47telwo" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_review_run_input_sizes_fk_root_scope_6pgof5phxe" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_review_run_input_sizes_fk_root_scope_pred_72aqqzv6rv" FOREIGN KEY ("__root_yjobx7uyrd", "scope", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."__review_review_run_input_sizes_cuh2lwogrl" ("root", "scope", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_save_input_co47sfi2mr" ADD CONSTRAINT "__review_save_input_fk_root_step_jwraq2sbzp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_save_output_lyuy6h4srf"
  ADD CONSTRAINT "__review_save_output_fk_root_step_datnfhi7up" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_save_output_fk_root_step_vv5non4wsq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__review_save_input_co47sfi2mr" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_save_output_fk_root_step_drcr33c5uz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_saved_5iq7m2fmyr"
  ADD CONSTRAINT "__review_saved_fk_root_from_htuh7p3c55" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."__review_questions_finish_output_fzoucv66df" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_saved_fk_root_from_ku2omex6f7" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_saved_fk_root_to_o5cxc3jt3f" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."__review_save_input_co47sfi2mr" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__review_split_ggs6ku5tr5"
  ADD CONSTRAINT "__review_split_fk_root_from_i46qo7w3dg" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."__review_gather_output_wu55xueycd" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_split_fk_root_from_ubl2q2g6ns" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_split_fk_root_to_wrpn5vlkn4" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."__review_questions_input_mdxrdossfi" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_build_input_2ax6pwgsaz" ADD CONSTRAINT "__sync_build_input_fk_root_step_y7yc5ng7jk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_build_output_q4gdmteauj"
  ADD CONSTRAINT "__sync_build_output_fk_root_step_bks325utix" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__sync_build_input_2ax6pwgsaz" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_build_output_fk_root_step_rgsowc3ndi" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_build_output_fk_root_step_guomzcrnnh" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_copy_input_wrlz7dd6wx" ADD CONSTRAINT "__sync_copy_input_fk_root_step_5wme7kprty" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_copy_output_bgyc3dxoz3"
  ADD CONSTRAINT "__sync_copy_output_fk_root_step_si7qys3qgo" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__sync_copy_input_wrlz7dd6wx" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_copy_output_fk_root_step_szcmye7j7w" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_copy_output_fk_root_step_xm2lbcdbsr" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_gold_finish_output_bli5mgqtdu"
  ADD CONSTRAINT "__sync_gold_finish_output_fk_root_step_mamfz2phff" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_gold_finish_output_fk_root_step_4oqis6llqp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_gold_input_3odt2l5j2i"
  ADD CONSTRAINT "__sync_gold_input_fk_root_scope_mxp3g3bgni" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_gold_input_fk_scope_tag_kind_gold_jrvjw7qlef" FOREIGN KEY ("scope", "__tag_kind_gold_phmoz6zyym") REFERENCES "slice_den"."sync_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_sync_run_finish_output_h7vi6bsoxq"
  ADD CONSTRAINT "__sync_sync_run_finish_output_fk_root_step_c7wzop2yks" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_sync_run_finish_output_fk_root_step_wsebsn5uc2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__sync_sync_run_input_qo4lf3kyiy"
  ADD CONSTRAINT "__sync_sync_run_input_fk_root_scope_ju7hx4q2mn" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_sync_run_input_fk_scope_tag_kind_sync_run_5ldve3xhyp" FOREIGN KEY ("scope", "__tag_kind_sync_run_wmr74dvsia") REFERENCES "slice_den"."sync_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__writeback_deliver_input_ka7ox24nbt" ADD CONSTRAINT "__writeback_deliver_input_fk_root_step_kv5flpjg57" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__writeback_deliver_output_qjzukfor3j"
  ADD CONSTRAINT "__writeback_deliver_output_fk_root_step_oqndhmdkte" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."__writeback_deliver_input_ka7ox24nbt" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_deliver_output_fk_root_step_fcccly2svu" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_deliver_output_fk_root_step_uwlwbh6tz7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__writeback_writeback_finish_output_ckitnszwtc"
  ADD CONSTRAINT "__writeback_writeback_finish_output_fk_root_step_mv27ofwfme" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_writeback_finish_output_fk_root_step_holznxpvrn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__writeback_writeback_input_zalrrn5ggs"
  ADD CONSTRAINT "__writeback_writeback_input_fk_root_scope_kx6ojnouad" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_writeback_input_fk_scope_tag_kind_wy35jinrsh" FOREIGN KEY ("scope", "__tag_kind_writeback_7zc6o24iqm") REFERENCES "slice_den"."writeback_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;
