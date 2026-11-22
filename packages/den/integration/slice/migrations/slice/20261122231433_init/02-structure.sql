CREATE TABLE "slice"."assigned" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assigned_pk_72xowecbf7" PRIMARY KEY ("learner")
);

CREATE TABLE "slice"."built" (
  "build" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__built_pk_5tj25hcq6k" PRIMARY KEY ("build")
);

CREATE TABLE "slice"."chimed" (
  "hour" bigint NOT NULL,
  "bell" "slice"."bell" NOT NULL,
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

CREATE TABLE "slice"."weight" (
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__weight_pk_p77rl634io" PRIMARY KEY ("feed", "factor")
);

CREATE TABLE "slice_den"."assign_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."assign_asked" (
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_asked_pk_5hpdamg2sv" PRIMARY KEY ("from", "ordinal", "root"),
  CONSTRAINT "__assign_asked_key_to_root_7prfl6pubf" UNIQUE NULLS DISTINCT ("to", "root")
);

CREATE TABLE "slice_den"."assign_assignment_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_finish_output_pk_djholiuras" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_assignment_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice_den"."assign_assignment_input_mode" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."assign_assignment_input_exclude" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__scope_u6ypqf2r2z" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "scope" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" PRIMARY KEY ("scope", "ordinal", "root")
);

CREATE TABLE "slice_den"."assign_assignment_input_mode_nearest" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."assign_assignment_input_mode_within" (
  "scope" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "assign_assignment_input_mode_within_radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_assignment_input_near" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" double precision NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__scope_u6ypqf2r2z" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "scope" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_assignment_input_near_pk_yr4pki7m7t" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "assign_assignment_input_near_value_finite" CHECK (("value" > '-Infinity'::double precision AND "value" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_claim_pk_gy4yhzk2me" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice_den"."assign_decide_input" (
  "step" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "vector" "vector_ext"."vector"(4) NOT NULL,
  "mode" "slice_den"."assign_decide_input_mode" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" PRIMARY KEY ("step", "root"),
  CONSTRAINT "__assign_decide_input_norm_vector_it3heqzuab" CHECK (("vector_ext"."vector_norm"("vector") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_input_exclude" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_mjpuijzth4" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."assign_decide_input_mode_nearest" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_decide_input_mode_within" (
  "step" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" PRIMARY KEY ("step", "root"),
  CONSTRAINT "assign_decide_input_mode_within_radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_output" (
  "step" "slice"."__sha256" NOT NULL,
  "confidence" double precision NOT NULL,
  "stage" "slice_den"."assign_decide_output_stage" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" PRIMARY KEY ("step", "root"),
  CONSTRAINT "assign_decide_output_confidence_finite" CHECK (("confidence" > '-Infinity'::double precision AND "confidence" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_output_stage_rest" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_decide_output_stage_serve" (
  "step" "slice"."__sha256" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" PRIMARY KEY ("step", "root"),
  CONSTRAINT "assign_decide_output_stage_serve_distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_output_weighed" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  "passed" boolean NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_mjpuijzth4" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" PRIMARY KEY ("step", "ordinal", "root"),
  CONSTRAINT "assign_decide_output_weighed_distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_read_nearest" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_read_nearest_pk_22bk6frvyf" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."assign_decide_read_nearest_row" (
  "digest" "slice"."__sha256" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "distance" double precision NOT NULL,
  CONSTRAINT "__assign_decide_read_nearest_row_pk_j5pwukyltc" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."assign_decide_read_seen" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_read_seen_pk_wllnx7uy5j" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."assign_decide_read_seen_row" (
  "digest" "slice"."__sha256" NOT NULL,
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assign_decide_read_seen_row_pk_fab2ngfdqq" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."assign_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_done_pk_gzil7jvxpz" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_embed_input" (
  "step" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice_den"."assign_embed_input_mode" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_embed_input_pk_q4ezcfvwia" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_embed_input_exclude" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_mjpuijzth4" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_embed_input_exclude_pk_5bklowmkgt" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."assign_embed_input_mode_nearest" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_embed_input_mode_nearest_pk_wiskd5j54m" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_embed_input_mode_within" (
  "step" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_embed_input_mode_within_pk_zldmxccjlo" PRIMARY KEY ("step", "root"),
  CONSTRAINT "assign_embed_input_mode_within_radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_embed_input_near" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" double precision NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_mjpuijzth4" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_embed_input_near_pk_bkusmda72a" PRIMARY KEY ("step", "ordinal", "root"),
  CONSTRAINT "assign_embed_input_near_value_finite" CHECK (("value" > '-Infinity'::double precision AND "value" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_embed_output" (
  "step" "slice"."__sha256" NOT NULL,
  "vector" "vector_ext"."vector"(4) NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_embed_output_pk_noiv3qgtry" PRIMARY KEY ("step", "root"),
  CONSTRAINT "__assign_embed_output_norm_vector_yuy6gaplly" CHECK (("vector_ext"."vector_norm"("vector") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_ended_pk_nriwwbcneu" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."assign_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_failed_pk_ygxslcya4o" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_fenced_pk_y6jyfviepa" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."assign_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__assign_finish_key_step_root_4woj5zibbd" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."assign_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_held_pk_by245z7t45" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_paused" (
  "target" "slice_den"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_paused_pk_ulo4grv4e2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."assign_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."assign_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_result_pk_i2yxmpkyzr" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."assign_resumed" (
  "target" "slice_den"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."assign_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."assign_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."assign_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."assign_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__assign_root_pk_b23qqyryx4" PRIMARY KEY ("scope"),
  CONSTRAINT "__assign_root_key_scope_77r36z7vhn" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."assign_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_scope_pk_xytntbncid" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."assign_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__assign_served_pk_gahaxyiegw" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."assign_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_skipped_pk_5qhgbueof7" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."assign_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__assign_start_step_key_step_root_k27j2tutjj" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."assign_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."assign_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_step_pk_2oc4ehvfzd" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."audit" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "note" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__audit_pk_dcvpvv5cjz" PRIMARY KEY ("step")
);

CREATE TABLE "slice_den"."chain_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."chain_chain_run_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_chain_run_finish_output_pk_hj22ebjnf7" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_chain_run_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."chain_chain_run_input_feed" NOT NULL,
  "pages" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."chain_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_claim_pk_nrr2rn3gui" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice_den"."chain_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_done_pk_tyyx2hmu3r" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_ended_pk_wusc7vjjx6" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."chain_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."chain_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_finish_pk_ebe75jmnzy" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__chain_finish_key_step_root_5aj26igjty" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."chain_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_held_pk_73idl7oo5c" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_next" (
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_next_pk_qeumlilvtk" PRIMARY KEY ("from", "ordinal", "root"),
  CONSTRAINT "__chain_next_key_to_root_qxqaughmvp" UNIQUE NULLS DISTINCT ("to", "root")
);

CREATE TABLE "slice_den"."chain_ordered_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_ordered_finish_output_pk_t5k5pqxfdo" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_ordered_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."chain_ordered_input_feed" NOT NULL,
  "pages" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."chain_page_input" (
  "step" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."chain_page_input_feed" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "pages" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_page_input_after" (
  "step" "slice"."__sha256" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_page_output" (
  "step" "slice"."__sha256" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "items" bigint NOT NULL,
  "earlier" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_page_output_next" (
  "step" "slice"."__sha256" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_page_read_earlier" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_earlier_pk_2xyyf45r3u" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."chain_page_read_earlier_row" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_earlier_row_pk_fzp2fq7wlv" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."chain_page_read_tree" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_tree_pk_yi4lj5ou7f" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."chain_page_read_tree_items" (
  "digest" "slice"."__sha256" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  "__copy_items_jii5wy7azg" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_page_read_tree_items_pk_fay3dxulye" PRIMARY KEY ("digest", "at"),
  CONSTRAINT "__chain_page_read_tree_items_key_digest_pred_at_ipnjzk4wne" UNIQUE NULLS DISTINCT ("digest", "__pred_at_xktcobhsti"),
  CONSTRAINT "__chain_page_read_tree_items_check_chain_page_read_yoect27eee" CHECK (("at" < "__copy_items_jii5wy7azg") IS TRUE)
);

CREATE TABLE "slice_den"."chain_page_read_tree_row" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  "items" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_items_3qltx5cx27" bigint GENERATED ALWAYS AS (CASE WHEN "items" > 0::bigint THEN "items"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_page_read_tree_row_pk_krei6zvz6t" PRIMARY KEY ("digest"),
  CONSTRAINT "__chain_page_read_tree_row_key_digest_items_s2jrbtqovl" UNIQUE NULLS DISTINCT ("digest", "items")
);

CREATE TABLE "slice_den"."chain_page_read_weights" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_weights_pk_7oohwtj6x4" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."chain_page_read_weights_row" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_weights_row_pk_bmwffycauu" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."chain_page_tree_first" (
  "digest" "slice"."__sha256" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_tree_first_pk_zmjcrvbs5g" PRIMARY KEY ("digest", "at")
);

CREATE TABLE "slice_den"."chain_paused" (
  "target" "slice_den"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_paused_pk_oorovhvyps" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."chain_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."chain_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_result_pk_btw3jzlkgl" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."chain_resumed" (
  "target" "slice_den"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."chain_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."chain_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_retry_pk_522nodru3s" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."chain_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."chain_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__chain_root_pk_wqfycdg3x5" PRIMARY KEY ("scope"),
  CONSTRAINT "__chain_root_key_scope_prbadyie6j" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."chain_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_scope_pk_fxzt444lf6" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."chain_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_served_pk_wzbdafznld" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."chain_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."chain_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_start_step_pk_dgda7shxb4" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__chain_start_step_key_step_root_sgonmabfyw" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."chain_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."chain_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_step_pk_u6x5wnvfbv" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_admitted_pk_a7wwsyakra" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."clock_chime_input" (
  "step" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "slice_den"."clock_chime_input_bell" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_chime_input_pk_rx6722hrpy" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_chime_output" (
  "step" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "slice_den"."clock_chime_output_bell" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_chime_output_pk_aqm3k5vyxa" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__clock_claim_pk_ihqmnokjqm" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice_den"."clock_close_input" (
  "step" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_close_input_pk_kzcush3qdx" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_close_output" (
  "step" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_close_output_pk_ckrp5oabyy" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_done_pk_f4vl6frrax" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_ended_pk_pqp6yh3qgg" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."clock_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_exhausted_pk_4m2tieyrky" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_failed_pk_6twuzcs6kf" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_fenced_pk_mzppv2rrab" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."clock_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_finish_pk_eqj7fcnrnq" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__clock_finish_key_step_root_qqome46md2" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."clock_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_held_pk_qqxrvee2gy" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_hourly_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_hourly_finish_output_pk_6bcdc5q3dt" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_hourly_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "slice_den"."clock_hourly_input_bell" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_hourly_input_pk_s536mhvux3" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."clock_paused" (
  "target" "slice_den"."clock_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__clock_paused_pk_fsld2lekav" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."clock_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_refusal_pk_dslb6cgxa3" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."clock_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_result_pk_yptcdjm6pu" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_resumed" (
  "target" "slice_den"."clock_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__clock_resumed_pk_iqjwv5tioc" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."clock_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."clock_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_retry_pk_4kyiqeoeqd" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."clock_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."clock_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__clock_root_pk_rnmiw3efr2" PRIMARY KEY ("scope"),
  CONSTRAINT "__clock_root_key_scope_cpqrcv6qzu" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."clock_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_scope_pk_dux445xz6c" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."clock_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__clock_served_pk_t5lm3cvd5b" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."clock_sitting_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_sitting_finish_output_pk_pejmuwtji5" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."clock_sitting_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_sitting_input_pk_le4qxvpabo" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."clock_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_skipped_pk_2whj2jo6zo" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."clock_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_start_step_pk_qgw6bnuo54" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__clock_start_step_key_step_root_oseon2uqng" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."clock_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."clock_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_step_pk_jjmk3diqpl" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."fan_batch_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_batch_finish_output_pk_mq5omzswqd" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_batch_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."fan_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "holds" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  "__pred_holds_lq7itfruzz" bigint GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "holds"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_claim_pk_e7zimqppco" PRIMARY KEY ("step", "root", "attempt"),
  CONSTRAINT "__fan_claim_key_step_root_attempt_holds_iqkydblyix" UNIQUE NULLS DISTINCT ("step", "root", "attempt", "holds")
);

CREATE TABLE "slice_den"."fan_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_done_pk_5u65252q52" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_dust_input" (
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_dust_input_pk_xyleoykgmc" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_dust_output" (
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_dust_output_pk_3ve4gi5x6b" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_ended_pk_23aeteyyv7" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."fan_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_failed_pk_z4etp5dmax" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_fan_run_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_fan_run_finish_output_pk_rhhjregxru" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_fan_run_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."fan_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_fenced_pk_6tkvirerez" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."fan_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_finish_pk_6mb33urjra" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__fan_finish_key_step_root_xshxj2rwb2" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."fan_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_held_pk_4ic6tjvac4" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_hold" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "resource" "slice_den"."fan_resource" NOT NULL,
  "seat" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__copy_holds_c6hi2i2kfb" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_hold_pk_avuqdkljvb" PRIMARY KEY ("step", "root", "attempt", "at"),
  CONSTRAINT "__fan_hold_key_step_root_attempt_pred_at_kgbxki2ddu" UNIQUE NULLS DISTINCT ("step", "root", "attempt", "__pred_at_xktcobhsti"),
  CONSTRAINT "__fan_hold_check_fan_hold_ordered_fan_claim_holds_bb3ww7vxet" CHECK (("at" < "__copy_holds_c6hi2i2kfb") IS TRUE)
);

CREATE TABLE "slice_den"."fan_mop_input" (
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_mop_input_pk_jwnqekad76" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_mop_output" (
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_mop_output_pk_rcebyoc32v" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_paused" (
  "target" "slice_den"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."fan_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_refusal_pk_7va55wo2wj" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."fan_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_result_pk_yeear352sx" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_resumed" (
  "target" "slice_den"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."fan_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."fan_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_retry_pk_7xubce4v66" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."fan_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."fan_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__fan_root_pk_jesu7xtefn" PRIMARY KEY ("scope"),
  CONSTRAINT "__fan_root_key_scope_i3qel4nyj5" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."fan_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_scope_pk_7bvjfihnef" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."fan_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_served_pk_hcfoxxhdsr" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."fan_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_skipped_pk_22erbmfzer" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."fan_square_input" (
  "step" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "n" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_square_input_pk_uzumoizv53" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_square_output" (
  "step" "slice"."__sha256" NOT NULL,
  "square" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_start_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__fan_start_scope_key_child_root_twylnvawre" UNIQUE NULLS DISTINCT ("child", "root")
);

CREATE TABLE "slice_den"."fan_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_start_step_pk_7e247xk4mz" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__fan_start_step_key_step_root_h32wwrpq3c" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."fan_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."fan_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_step_pk_2f4tcxnofk" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_sweep_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_sweep_finish_output_pk_7dvx2ngckn" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."fan_sweep_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_sweep_input_pk_zzlgjjqr6f" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."fan_within" (
  "scope" "slice"."__sha256" NOT NULL,
  "parent" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."fan_child_kind" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_within_pk_g5tswgjfa6" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."retry_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_admitted_pk_qyp7cminjx" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."retry_brittle_input" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_brittle_output" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__retry_claim_pk_aayzt5ni6z" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice_den"."retry_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_done_pk_vtkpce7rkq" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_ended_pk_hq35r7u2t2" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."retry_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_exhausted_pk_v56c23krid" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_failed_pk_mygc4onczp" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_fenced_pk_umzicmiruo" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."retry_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__retry_finish_key_step_root_a7vhiwagne" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."retry_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_held_pk_nvgeylmjp2" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_ladders_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_ladders_finish_output_pk_5352zkn7xu" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_ladders_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."retry_patient_input" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_patient_input_pk_74247zb7wo" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_patient_output" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_patient_output_pk_whtgus732k" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_paused" (
  "target" "slice_den"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__retry_paused_pk_umm2nscqny" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."retry_polite_input" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_polite_input_pk_ptzd72dxff" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_polite_output" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_polite_output_pk_2kuwfluplv" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_refusal_pk_nifndsd6pp" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."retry_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_result_pk_5fegihvmml" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_resumed" (
  "target" "slice_den"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."retry_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."retry_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_retry_pk_slrwn4rt5d" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."retry_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."retry_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__retry_root_pk_qi2iw36jky" PRIMARY KEY ("scope"),
  CONSTRAINT "__retry_root_key_scope_yc7em5k35u" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."retry_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_scope_pk_fgji2phvxy" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."retry_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_served_pk_wgxtug7z34" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."retry_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_skipped_pk_au5z33ql7a" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."retry_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_start_step_pk_mp77csmi26" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__retry_start_step_key_step_root_fudt2vk7zs" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."retry_steadfast_input" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_steadfast_output" (
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."retry_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_step_pk_opjqidwhzg" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_throttled_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_throttled_finish_output_pk_o6epepnuox" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_throttled_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_throttled_input_pk_zv264azw4s" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."retry_unhurried_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_unhurried_finish_output_pk_d5mmuqfkuq" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."retry_unhurried_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_unhurried_input_pk_g5dkiedexm" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."review_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_admitted_pk_woy7ee4y4p" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."review_analyze_input" (
  "step" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "question" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_analyze_input_pk_jr7qmhqwgi" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_analyze_output" (
  "step" "slice"."__sha256" NOT NULL,
  "score" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_analyze_output_pk_35aclxnkmb" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "holds" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  "__pred_holds_lq7itfruzz" bigint GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "holds"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_claim_pk_twa72qaol7" PRIMARY KEY ("step", "root", "attempt"),
  CONSTRAINT "__review_claim_key_step_root_attempt_holds_25ppgtp6nm" UNIQUE NULLS DISTINCT ("step", "root", "attempt", "holds")
);

CREATE TABLE "slice_den"."review_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_done_pk_ve6inioidy" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_ended_pk_2hihcuxln2" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."review_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_exhausted_pk_5bmktauwd3" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_failed_pk_7iszsjaybr" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_fenced_pk_chaexdbnzu" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."review_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_finish_pk_ovczbakxjz" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__review_finish_key_step_root_tcsouam46b" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."review_gather_input" (
  "step" "slice"."__sha256" NOT NULL,
  "review" "slice"."__text_t4rwovzmqj" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_gather_input_pk_rllaxtocmq" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_gather_input_sizes" (
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_mjpuijzth4" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_gather_input_sizes_pk_w5cgw65wpx" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice_den"."review_gather_output" (
  "step" "slice"."__sha256" NOT NULL,
  "groups" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_gather_output_pk_fecesmjazj" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_held_pk_cwyo7jovuu" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_hold" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "resource" "slice_den"."review_resource" NOT NULL,
  "seat" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__copy_holds_j7qe5qdydj" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_hold_pk_uhb6w3fp5v" PRIMARY KEY ("step", "root", "attempt", "at"),
  CONSTRAINT "__review_hold_key_step_root_attempt_pred_at_kuzm5unl2b" UNIQUE NULLS DISTINCT ("step", "root", "attempt", "__pred_at_xktcobhsti"),
  CONSTRAINT "__review_hold_check_review_hold_ordered_review_claim_2wbcergshn" CHECK (("at" < "__copy_holds_j7qe5qdydj") IS TRUE)
);

CREATE TABLE "slice_den"."review_paused" (
  "target" "slice_den"."review_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_paused_pk_eamccblv6g" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."review_questions_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "count" bigint NOT NULL,
  "total" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_questions_finish_output_pk_36plo53gmb" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_questions_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "size" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_questions_input_pk_4d27veaz4g" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."review_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_refusal_pk_ajyglinn6r" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."review_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_result_pk_o5x5griurk" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_resumed" (
  "target" "slice_den"."review_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__review_resumed_pk_jqgqbkvl65" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."review_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."review_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_retry_pk_is3m5sa5tx" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."review_review_run_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_review_run_finish_output_pk_qwfb4ycp7r" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_review_run_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_review_run_input_pk_7ommryhd6b" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."review_review_run_input_sizes" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__scope_u6ypqf2r2z" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "scope" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_review_run_input_sizes_pk_bguaae726h" PRIMARY KEY ("scope", "ordinal", "root")
);

CREATE TABLE "slice_den"."review_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."review_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__review_root_pk_btvrw2kxvs" PRIMARY KEY ("scope"),
  CONSTRAINT "__review_root_key_scope_db6eo7ifjm" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."review_save_input" (
  "step" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "count" bigint NOT NULL,
  "total" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_save_input_pk_iaqr5cg2c2" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_save_output" (
  "step" "slice"."__sha256" NOT NULL,
  "total" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_save_output_pk_usbddkytv7" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_saved" (
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_saved_pk_mrkz2ovxcx" PRIMARY KEY ("from", "ordinal", "root"),
  CONSTRAINT "__review_saved_key_to_root_ah3zbczbbn" UNIQUE NULLS DISTINCT ("to", "root")
);

CREATE TABLE "slice_den"."review_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_scope_pk_grsivyyp7b" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."review_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__review_served_pk_bkbrtbk3k7" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."review_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_skipped_pk_ymsn25w74u" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."review_split" (
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_split_pk_im65kbvnho" PRIMARY KEY ("from", "ordinal", "root"),
  CONSTRAINT "__review_split_key_to_root_d3l6kwiq3j" UNIQUE NULLS DISTINCT ("to", "root")
);

CREATE TABLE "slice_den"."review_start_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_start_scope_pk_qlm2r5uhqp" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__review_start_scope_key_child_root_vwlxhagth3" UNIQUE NULLS DISTINCT ("child", "root")
);

CREATE TABLE "slice_den"."review_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_start_step_pk_w5suwqqg4p" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__review_start_step_key_step_root_lnw5ylpuoc" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."review_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."review_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_step_pk_gfbmnzqbc3" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."review_within" (
  "scope" "slice"."__sha256" NOT NULL,
  "parent" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."review_child_kind" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_within_pk_ohgogpkz4s" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."sync_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_admitted_pk_ral53o3fpi" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."sync_build_input" (
  "step" "slice"."__sha256" NOT NULL,
  "build" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_build_output" (
  "step" "slice"."__sha256" NOT NULL,
  "build" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_build_output_pk_rhnco3epch" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__sync_claim_pk_s2tqnziq4u" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice_den"."sync_copy_input" (
  "step" "slice"."__sha256" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_copy_output" (
  "step" "slice"."__sha256" NOT NULL,
  "run" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_done_pk_nllomjb7og" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_ended_pk_uxijjz7koz" PRIMARY KEY ("step", "attempt", "root")
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
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "id" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."sync_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_failed_pk_gqykngewxb" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."sync_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_finish_pk_hn7tmx25xc" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__sync_finish_key_step_root_kpt2idultt" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."sync_gold_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_gold_finish_output_pk_3z5gemduto" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_gold_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "build" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."sync_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_held_pk_wsme4moka4" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_paused" (
  "target" "slice_den"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__sync_paused_pk_tstk2okngj" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."sync_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_refusal_pk_mbmfornc5c" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_released" (
  "kind" "slice_den"."sync_root_kind" NOT NULL,
  "key" "slice"."__sha256" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_released_pk_k7qaw2iram" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice_den"."sync_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."sync_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_result_pk_jmwy2p3mqf" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_resumed" (
  "target" "slice_den"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."sync_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."sync_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_retry_pk_6q52red7iw" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."sync_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."sync_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__sync_root_pk_daktpubfe2" PRIMARY KEY ("scope"),
  CONSTRAINT "__sync_root_key_scope_lxj4sb3mcx" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."sync_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_scope_pk_bg72sm6p4z" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."sync_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__sync_served_pk_ed5gkrpyzv" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."sync_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_skipped_pk_yutjqacvws" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."sync_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__sync_start_step_key_step_root_rkceslwobo" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."sync_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."sync_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_step_pk_wfgcxdvbwo" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_sync_run_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_sync_run_finish_output_pk_n74f63qvg6" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."sync_sync_run_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."writeback_admitted" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_admitted_pk_eplj3gsbzy" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."writeback_claim" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  "__step_ouvkclqzzd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__writeback_claim_pk_j7bglnjq7b" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice_den"."writeback_deliver_input" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_deliver_input_pk_i7vk7dq3eb" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_deliver_output" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_deliver_output_pk_jkhggp3cer" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_done" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_done_pk_x32l3wxb3c" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_ended" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_ended_pk_atnezxtfz6" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."writeback_exhausted" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_exhausted_pk_sqddw6eedo" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_failed" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_failed_pk_g4uud6r5kb" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_fenced" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_fenced_pk_exblcoemag" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."writeback_finish" (
  "scope" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_finish_pk_htcvidwpy6" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__writeback_finish_key_step_root_cz7xuvvbbm" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."writeback_held" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_held_pk_5tktjcet5w" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_paused" (
  "target" "slice_den"."writeback_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__writeback_paused_pk_ncs2aff76t" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."writeback_refusal" (
  "step" "slice"."__sha256" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_refusal_pk_lqictdn67w" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_result" (
  "step" "slice"."__sha256" NOT NULL,
  "outcome" "slice_den"."writeback_outcome" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_result_pk_lygppaax77" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_resumed" (
  "target" "slice_den"."writeback_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__writeback_resumed_pk_qrrua45xou" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."writeback_retry" (
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "why" "slice_den"."writeback_retry_why" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_retry_pk_j2ien3obty" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice_den"."writeback_root" (
  "scope" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."writeback_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  "__scope_jdl7uajdrr" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  CONSTRAINT "__writeback_root_pk_a5puwyrem6" PRIMARY KEY ("scope"),
  CONSTRAINT "__writeback_root_key_scope_epb6awnxkj" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr")
);

CREATE TABLE "slice_den"."writeback_scope" (
  "scope" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_scope_pk_aywjorzcsy" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."writeback_served" (
  "environment" "slice"."__domain_e5fpjchj5r" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "deployment" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__writeback_served_pk_pw2fwekjjm" PRIMARY KEY ("environment", "at")
);

CREATE TABLE "slice_den"."writeback_skipped" (
  "scope" "slice"."__sha256" NOT NULL,
  "by" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_skipped_pk_3pijvusl26" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice_den"."writeback_start_step" (
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_start_step_pk_sp7hkcjz7m" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__writeback_start_step_key_step_root_dqjb67a3dj" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice_den"."writeback_step" (
  "step" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."writeback_kind" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_step_pk_xsrl5j4mlf" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_writeback_finish_output" (
  "step" "slice"."__sha256" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_writeback_finish_output_pk_payvcqalt7" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice_den"."writeback_writeback_input" (
  "scope" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_writeback_input_pk_ejs235aju2" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."__live_secret" ("secret") AS SELECT "pg_catalog"."sha256"("pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()) || "pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()));

REVOKE ALL ON TABLE "slice"."__live_secret" FROM PUBLIC;

ALTER TABLE "slice"."passage" REPLICA IDENTITY FULL;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_assign_root_rwboli77cc"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."assign_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__assign_admitted_in_assign_root_56frawwv2n'::"pg_catalog"."text", 'k["AssignAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."assign_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_assign_root_rwboli77cc"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_chain_root_wgndggnfwf"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."chain_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__chain_admitted_in_chain_root_dumegkr74f'::"pg_catalog"."text", 'k["ChainAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."chain_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_chain_root_wgndggnfwf"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_clock_root_bawnkhmkww"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."clock_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__clock_admitted_in_clock_root_oaqmbannn3'::"pg_catalog"."text", 'k["ClockAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."clock_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_clock_root_bawnkhmkww"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_fan_root_4vwfxofrxw"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."fan_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__fan_admitted_in_fan_root_27wekwjj25'::"pg_catalog"."text", 'k["FanAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."fan_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_fan_root_4vwfxofrxw"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_retry_root_54bybhkxg6"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."retry_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__retry_admitted_in_retry_root_unbzuajlb3'::"pg_catalog"."text", 'k["RetryAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."retry_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_retry_root_54bybhkxg6"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_review_root_j3blgclwnl"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."review_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__review_admitted_in_review_root_zeh4lvqxub'::"pg_catalog"."text", 'k["ReviewAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."review_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_review_root_j3blgclwnl"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_sync_root_6ita6q5wxi"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."sync_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__sync_admitted_in_sync_root_epwog5czvj'::"pg_catalog"."text", 'k["SyncAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."sync_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_sync_root_6ita6q5wxi"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__hold_writeback_root_msmvpm3j7g"("keys_1" "slice"."__sha256"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."writeback_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__writeback_admitted_in_writeback_root_5iucxnbatt'::"pg_catalog"."text", 'k["WritebackAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."writeback_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__hold_writeback_root_msmvpm3j7g"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_assign_root_hwbj4sewrx"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."assign_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."assign_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."assign_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."assign_asked" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."assign_assignment_finish_output" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."assign_assignment_input" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."assign_assignment_input_exclude" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."assign_assignment_input_mode_nearest" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."assign_assignment_input_mode_within" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."assign_assignment_input_near" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."assign_claim" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."assign_decide_input" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."assign_decide_input_exclude" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."assign_decide_input_mode_nearest" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."assign_decide_input_mode_within" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."assign_decide_output" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."assign_decide_output_stage_rest" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."assign_decide_output_stage_serve" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."assign_decide_output_weighed" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."assign_decide_read_nearest" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."assign_decide_read_seen" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."assign_done" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( DELETE FROM "slice_den"."assign_embed_input" AS "r66" USING "r1" AS "r67" WHERE "r66"."root" = "r67"."c1" RETURNING 1 AS "c1" ), "r68" AS ( DELETE FROM "slice_den"."assign_embed_input_exclude" AS "r69" USING "r1" AS "r70" WHERE "r69"."root" = "r70"."c1" RETURNING 1 AS "c1" ), "r71" AS ( DELETE FROM "slice_den"."assign_embed_input_mode_nearest" AS "r72" USING "r1" AS "r73" WHERE "r72"."root" = "r73"."c1" RETURNING 1 AS "c1" ), "r74" AS ( DELETE FROM "slice_den"."assign_embed_input_mode_within" AS "r75" USING "r1" AS "r76" WHERE "r75"."root" = "r76"."c1" RETURNING 1 AS "c1" ), "r77" AS ( DELETE FROM "slice_den"."assign_embed_input_near" AS "r78" USING "r1" AS "r79" WHERE "r78"."root" = "r79"."c1" RETURNING 1 AS "c1" ), "r80" AS ( DELETE FROM "slice_den"."assign_embed_output" AS "r81" USING "r1" AS "r82" WHERE "r81"."root" = "r82"."c1" RETURNING 1 AS "c1" ), "r83" AS ( DELETE FROM "slice_den"."assign_ended" AS "r84" USING "r1" AS "r85" WHERE "r84"."root" = "r85"."c1" RETURNING 1 AS "c1" ), "r86" AS ( DELETE FROM "slice_den"."assign_exhausted" AS "r87" USING "r1" AS "r88" WHERE "r87"."root" = "r88"."c1" RETURNING 1 AS "c1" ), "r89" AS ( DELETE FROM "slice_den"."assign_failed" AS "r90" USING "r1" AS "r91" WHERE "r90"."root" = "r91"."c1" RETURNING 1 AS "c1" ), "r92" AS ( DELETE FROM "slice_den"."assign_fenced" AS "r93" USING "r1" AS "r94" WHERE "r93"."root" = "r94"."c1" RETURNING 1 AS "c1" ), "r95" AS ( DELETE FROM "slice_den"."assign_finish" AS "r96" USING "r1" AS "r97" WHERE "r96"."root" = "r97"."c1" RETURNING 1 AS "c1" ), "r98" AS ( DELETE FROM "slice_den"."assign_held" AS "r99" USING "r1" AS "r100" WHERE "r99"."root" = "r100"."c1" RETURNING 1 AS "c1" ), "r101" AS ( DELETE FROM "slice_den"."assign_refusal" AS "r102" USING "r1" AS "r103" WHERE "r102"."root" = "r103"."c1" RETURNING 1 AS "c1" ), "r104" AS ( DELETE FROM "slice_den"."assign_result" AS "r105" USING "r1" AS "r106" WHERE "r105"."root" = "r106"."c1" RETURNING 1 AS "c1" ), "r107" AS ( DELETE FROM "slice_den"."assign_retry" AS "r108" USING "r1" AS "r109" WHERE "r108"."root" = "r109"."c1" RETURNING 1 AS "c1" ), "r110" AS ( DELETE FROM "slice_den"."assign_scope" AS "r111" USING "r1" AS "r112" WHERE "r111"."root" = "r112"."c1" RETURNING 1 AS "c1" ), "r113" AS ( DELETE FROM "slice_den"."assign_skipped" AS "r114" USING "r1" AS "r115" WHERE "r114"."root" = "r115"."c1" RETURNING 1 AS "c1" ), "r116" AS ( DELETE FROM "slice_den"."assign_start_step" AS "r117" USING "r1" AS "r118" WHERE "r117"."root" = "r118"."c1" RETURNING 1 AS "c1" ), "r119" AS ( DELETE FROM "slice_den"."assign_step" AS "r120" USING "r1" AS "r121" WHERE "r120"."root" = "r121"."c1" RETURNING 1 AS "c1" ), "r171"("c1") AS MATERIALIZED ( SELECT DISTINCT "r172"."c1" AS "c1" FROM (SELECT "r169"."digest" AS "c1" FROM "slice_den"."assign_decide_read_seen" AS "r169" JOIN "r1" AS "r170" ON "r169"."root" = "r170"."c1") AS "r172"("c1") ), "r173"("c1") AS MATERIALIZED ( SELECT "r174"."c1" AS "c1" FROM "r171" AS "r174" WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."assign_decide_read_seen" AS "r175" WHERE "r175"."digest" = "r174"."c1" AND NOT EXISTS (SELECT 1 FROM "r1" AS "r176" WHERE "r175"."root" = "r176"."c1")) ), "r177" AS ( DELETE FROM "slice_den"."assign_decide_read_seen_row" AS "r178" USING "r173" AS "r179" WHERE "r178"."digest" = "r179"."c1" RETURNING 1 AS "c1" ), "r182"("c1") AS MATERIALIZED ( SELECT DISTINCT "r183"."c1" AS "c1" FROM (SELECT "r180"."digest" AS "c1" FROM "slice_den"."assign_decide_read_nearest" AS "r180" JOIN "r1" AS "r181" ON "r180"."root" = "r181"."c1") AS "r183"("c1") ), "r184"("c1") AS MATERIALIZED ( SELECT "r185"."c1" AS "c1" FROM "r182" AS "r185" WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."assign_decide_read_nearest" AS "r186" WHERE "r186"."digest" = "r185"."c1" AND NOT EXISTS (SELECT 1 FROM "r1" AS "r187" WHERE "r186"."root" = "r187"."c1")) ), "r188" AS ( DELETE FROM "slice_den"."assign_decide_read_nearest_row" AS "r189" USING "r184" AS "r190" WHERE "r189"."digest" = "r190"."c1" RETURNING 1 AS "c1" ), "r122" AS ( UPDATE "slice_den"."assign_root" AS "r123" SET "retired" = true FROM "r1" AS "r124" WHERE "r123"."scope" = "r124"."c1" RETURNING 1 AS "c1" ) SELECT "r126"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r125"."c2" ORDER BY "r125"."c1") AS "c1", "r125"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r122" AS "r127" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r128" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r129" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r130" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r131" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r132" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r133" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r134" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r135" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r136" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r137" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r138" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r139" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r140" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r141" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r142" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r143" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r144" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r145" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r146" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r147" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r148" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r149" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r150" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r151" UNION ALL SELECT 25 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r152" UNION ALL SELECT 26 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r80" AS "r153" UNION ALL SELECT 27 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r83" AS "r154" UNION ALL SELECT 28 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r86" AS "r155" UNION ALL SELECT 29 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r89" AS "r156" UNION ALL SELECT 30 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r92" AS "r157" UNION ALL SELECT 31 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r95" AS "r158" UNION ALL SELECT 32 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r98" AS "r159" UNION ALL SELECT 33 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r101" AS "r160" UNION ALL SELECT 34 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r104" AS "r161" UNION ALL SELECT 35 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r107" AS "r162" UNION ALL SELECT 36 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r110" AS "r163" UNION ALL SELECT 37 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r113" AS "r164" UNION ALL SELECT 38 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r116" AS "r165" UNION ALL SELECT 39 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r119" AS "r166" UNION ALL SELECT 40 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r177" AS "r167" UNION ALL SELECT 41 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r188" AS "r168") AS "r125"("c1", "c2", "c3") GROUP BY "r125"."c3") AS "r126"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_assign_root_hwbj4sewrx"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_chain_root_ji6nmac7of"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."chain_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."chain_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."chain_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."chain_chain_run_finish_output" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."chain_chain_run_input" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."chain_claim" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."chain_done" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."chain_ended" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."chain_exhausted" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."chain_failed" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."chain_fenced" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."chain_finish" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."chain_held" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."chain_next" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."chain_ordered_finish_output" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."chain_ordered_input" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."chain_page_input" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."chain_page_input_after" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."chain_page_output" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."chain_page_output_next" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."chain_page_read_earlier" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."chain_page_read_tree" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( DELETE FROM "slice_den"."chain_page_read_weights" AS "r66" USING "r1" AS "r67" WHERE "r66"."root" = "r67"."c1" RETURNING 1 AS "c1" ), "r68" AS ( DELETE FROM "slice_den"."chain_refusal" AS "r69" USING "r1" AS "r70" WHERE "r69"."root" = "r70"."c1" RETURNING 1 AS "c1" ), "r71" AS ( DELETE FROM "slice_den"."chain_result" AS "r72" USING "r1" AS "r73" WHERE "r72"."root" = "r73"."c1" RETURNING 1 AS "c1" ), "r74" AS ( DELETE FROM "slice_den"."chain_retry" AS "r75" USING "r1" AS "r76" WHERE "r75"."root" = "r76"."c1" RETURNING 1 AS "c1" ), "r77" AS ( DELETE FROM "slice_den"."chain_scope" AS "r78" USING "r1" AS "r79" WHERE "r78"."root" = "r79"."c1" RETURNING 1 AS "c1" ), "r80" AS ( DELETE FROM "slice_den"."chain_skipped" AS "r81" USING "r1" AS "r82" WHERE "r81"."root" = "r82"."c1" RETURNING 1 AS "c1" ), "r83" AS ( DELETE FROM "slice_den"."chain_start_step" AS "r84" USING "r1" AS "r85" WHERE "r84"."root" = "r85"."c1" RETURNING 1 AS "c1" ), "r86" AS ( DELETE FROM "slice_den"."chain_step" AS "r87" USING "r1" AS "r88" WHERE "r87"."root" = "r88"."c1" RETURNING 1 AS "c1" ), "r130"("c1") AS MATERIALIZED ( SELECT DISTINCT "r131"."c1" AS "c1" FROM (SELECT "r128"."digest" AS "c1" FROM "slice_den"."chain_page_read_tree" AS "r128" JOIN "r1" AS "r129" ON "r128"."root" = "r129"."c1") AS "r131"("c1") ), "r132"("c1") AS MATERIALIZED ( SELECT "r133"."c1" AS "c1" FROM "r130" AS "r133" WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."chain_page_read_tree" AS "r134" WHERE "r134"."digest" = "r133"."c1" AND NOT EXISTS (SELECT 1 FROM "r1" AS "r135" WHERE "r134"."root" = "r135"."c1")) ), "r136" AS ( DELETE FROM "slice_den"."chain_page_read_tree_row" AS "r137" USING "r132" AS "r138" WHERE "r137"."digest" = "r138"."c1" RETURNING 1 AS "c1" ), "r139" AS ( DELETE FROM "slice_den"."chain_page_read_tree_items" AS "r140" USING "r132" AS "r141" WHERE "r140"."digest" = "r141"."c1" RETURNING 1 AS "c1" ), "r142" AS ( DELETE FROM "slice_den"."chain_page_tree_first" AS "r143" USING "r132" AS "r144" WHERE "r143"."digest" = "r144"."c1" RETURNING 1 AS "c1" ), "r147"("c1") AS MATERIALIZED ( SELECT DISTINCT "r148"."c1" AS "c1" FROM (SELECT "r145"."digest" AS "c1" FROM "slice_den"."chain_page_read_weights" AS "r145" JOIN "r1" AS "r146" ON "r145"."root" = "r146"."c1") AS "r148"("c1") ), "r149"("c1") AS MATERIALIZED ( SELECT "r150"."c1" AS "c1" FROM "r147" AS "r150" WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."chain_page_read_weights" AS "r151" WHERE "r151"."digest" = "r150"."c1" AND NOT EXISTS (SELECT 1 FROM "r1" AS "r152" WHERE "r151"."root" = "r152"."c1")) ), "r153" AS ( DELETE FROM "slice_den"."chain_page_read_weights_row" AS "r154" USING "r149" AS "r155" WHERE "r154"."digest" = "r155"."c1" RETURNING 1 AS "c1" ), "r158"("c1") AS MATERIALIZED ( SELECT DISTINCT "r159"."c1" AS "c1" FROM (SELECT "r156"."digest" AS "c1" FROM "slice_den"."chain_page_read_earlier" AS "r156" JOIN "r1" AS "r157" ON "r156"."root" = "r157"."c1") AS "r159"("c1") ), "r160"("c1") AS MATERIALIZED ( SELECT "r161"."c1" AS "c1" FROM "r158" AS "r161" WHERE NOT EXISTS (SELECT 1 FROM "slice_den"."chain_page_read_earlier" AS "r162" WHERE "r162"."digest" = "r161"."c1" AND NOT EXISTS (SELECT 1 FROM "r1" AS "r163" WHERE "r162"."root" = "r163"."c1")) ), "r164" AS ( DELETE FROM "slice_den"."chain_page_read_earlier_row" AS "r165" USING "r160" AS "r166" WHERE "r165"."digest" = "r166"."c1" RETURNING 1 AS "c1" ), "r89" AS ( UPDATE "slice_den"."chain_root" AS "r90" SET "retired" = true FROM "r1" AS "r91" WHERE "r90"."scope" = "r91"."c1" RETURNING 1 AS "c1" ) SELECT "r93"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r92"."c2" ORDER BY "r92"."c1") AS "c1", "r92"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r89" AS "r94" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r95" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r96" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r97" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r98" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r99" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r100" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r101" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r102" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r103" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r104" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r105" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r106" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r107" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r108" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r109" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r110" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r111" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r112" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r113" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r114" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r115" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r116" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r117" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r118" UNION ALL SELECT 25 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r119" UNION ALL SELECT 26 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r80" AS "r120" UNION ALL SELECT 27 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r83" AS "r121" UNION ALL SELECT 28 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r86" AS "r122" UNION ALL SELECT 29 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r136" AS "r123" UNION ALL SELECT 30 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r139" AS "r124" UNION ALL SELECT 31 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r142" AS "r125" UNION ALL SELECT 32 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r153" AS "r126" UNION ALL SELECT 33 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r164" AS "r127") AS "r92"("c1", "c2", "c3") GROUP BY "r92"."c3") AS "r93"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_chain_root_ji6nmac7of"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_clock_root_6pfo6eeroe"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."clock_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."clock_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."clock_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."clock_chime_input" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."clock_chime_output" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."clock_claim" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."clock_close_input" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."clock_close_output" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."clock_done" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."clock_ended" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."clock_exhausted" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."clock_failed" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."clock_fenced" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."clock_finish" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."clock_held" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."clock_hourly_finish_output" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."clock_hourly_input" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."clock_refusal" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."clock_result" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."clock_retry" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."clock_scope" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."clock_sitting_finish_output" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( DELETE FROM "slice_den"."clock_sitting_input" AS "r66" USING "r1" AS "r67" WHERE "r66"."root" = "r67"."c1" RETURNING 1 AS "c1" ), "r68" AS ( DELETE FROM "slice_den"."clock_skipped" AS "r69" USING "r1" AS "r70" WHERE "r69"."root" = "r70"."c1" RETURNING 1 AS "c1" ), "r71" AS ( DELETE FROM "slice_den"."clock_start_step" AS "r72" USING "r1" AS "r73" WHERE "r72"."root" = "r73"."c1" RETURNING 1 AS "c1" ), "r74" AS ( DELETE FROM "slice_den"."clock_step" AS "r75" USING "r1" AS "r76" WHERE "r75"."root" = "r76"."c1" RETURNING 1 AS "c1" ), "r77" AS ( UPDATE "slice_den"."clock_root" AS "r78" SET "retired" = true FROM "r1" AS "r79" WHERE "r78"."scope" = "r79"."c1" RETURNING 1 AS "c1" ) SELECT "r81"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r80"."c2" ORDER BY "r80"."c1") AS "c1", "r80"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r82" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r83" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r84" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r85" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r86" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r87" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r88" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r89" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r90" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r91" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r92" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r93" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r94" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r95" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r96" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r97" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r98" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r99" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r100" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r101" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r102" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r103" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r104" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r105" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r106") AS "r80"("c1", "c2", "c3") GROUP BY "r80"."c3") AS "r81"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_clock_root_6pfo6eeroe"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_fan_root_niesya7vcd"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."fan_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."fan_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."fan_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."fan_batch_finish_output" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."fan_batch_input" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."fan_claim" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."fan_done" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."fan_dust_input" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."fan_dust_output" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."fan_ended" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."fan_exhausted" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."fan_failed" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."fan_fan_run_finish_output" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."fan_fan_run_input" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."fan_fenced" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."fan_finish" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."fan_held" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."fan_hold" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."fan_mop_input" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."fan_mop_output" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."fan_refusal" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."fan_result" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( DELETE FROM "slice_den"."fan_retry" AS "r66" USING "r1" AS "r67" WHERE "r66"."root" = "r67"."c1" RETURNING 1 AS "c1" ), "r68" AS ( DELETE FROM "slice_den"."fan_scope" AS "r69" USING "r1" AS "r70" WHERE "r69"."root" = "r70"."c1" RETURNING 1 AS "c1" ), "r71" AS ( DELETE FROM "slice_den"."fan_skipped" AS "r72" USING "r1" AS "r73" WHERE "r72"."root" = "r73"."c1" RETURNING 1 AS "c1" ), "r74" AS ( DELETE FROM "slice_den"."fan_square_input" AS "r75" USING "r1" AS "r76" WHERE "r75"."root" = "r76"."c1" RETURNING 1 AS "c1" ), "r77" AS ( DELETE FROM "slice_den"."fan_square_output" AS "r78" USING "r1" AS "r79" WHERE "r78"."root" = "r79"."c1" RETURNING 1 AS "c1" ), "r80" AS ( DELETE FROM "slice_den"."fan_start_scope" AS "r81" USING "r1" AS "r82" WHERE "r81"."root" = "r82"."c1" RETURNING 1 AS "c1" ), "r83" AS ( DELETE FROM "slice_den"."fan_start_step" AS "r84" USING "r1" AS "r85" WHERE "r84"."root" = "r85"."c1" RETURNING 1 AS "c1" ), "r86" AS ( DELETE FROM "slice_den"."fan_step" AS "r87" USING "r1" AS "r88" WHERE "r87"."root" = "r88"."c1" RETURNING 1 AS "c1" ), "r89" AS ( DELETE FROM "slice_den"."fan_sweep_finish_output" AS "r90" USING "r1" AS "r91" WHERE "r90"."root" = "r91"."c1" RETURNING 1 AS "c1" ), "r92" AS ( DELETE FROM "slice_den"."fan_sweep_input" AS "r93" USING "r1" AS "r94" WHERE "r93"."root" = "r94"."c1" RETURNING 1 AS "c1" ), "r95" AS ( DELETE FROM "slice_den"."fan_within" AS "r96" USING "r1" AS "r97" WHERE "r96"."root" = "r97"."c1" RETURNING 1 AS "c1" ), "r98" AS ( UPDATE "slice_den"."fan_root" AS "r99" SET "retired" = true FROM "r1" AS "r100" WHERE "r99"."scope" = "r100"."c1" RETURNING 1 AS "c1" ) SELECT "r102"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r101"."c2" ORDER BY "r101"."c1") AS "c1", "r101"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r98" AS "r103" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r104" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r105" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r106" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r107" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r108" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r109" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r110" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r111" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r112" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r113" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r114" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r115" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r116" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r117" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r118" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r119" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r120" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r121" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r122" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r123" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r124" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r125" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r126" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r127" UNION ALL SELECT 25 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r128" UNION ALL SELECT 26 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r80" AS "r129" UNION ALL SELECT 27 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r83" AS "r130" UNION ALL SELECT 28 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r86" AS "r131" UNION ALL SELECT 29 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r89" AS "r132" UNION ALL SELECT 30 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r92" AS "r133" UNION ALL SELECT 31 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r95" AS "r134") AS "r101"("c1", "c2", "c3") GROUP BY "r101"."c3") AS "r102"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_fan_root_niesya7vcd"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_retry_root_kays5vv5ic"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."retry_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."retry_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."retry_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."retry_brittle_input" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."retry_brittle_output" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."retry_claim" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."retry_done" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."retry_ended" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."retry_exhausted" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."retry_failed" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."retry_fenced" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."retry_finish" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."retry_held" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."retry_ladders_finish_output" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."retry_ladders_input" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."retry_patient_input" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."retry_patient_output" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."retry_polite_input" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."retry_polite_output" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."retry_refusal" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."retry_result" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."retry_retry" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( DELETE FROM "slice_den"."retry_scope" AS "r66" USING "r1" AS "r67" WHERE "r66"."root" = "r67"."c1" RETURNING 1 AS "c1" ), "r68" AS ( DELETE FROM "slice_den"."retry_skipped" AS "r69" USING "r1" AS "r70" WHERE "r69"."root" = "r70"."c1" RETURNING 1 AS "c1" ), "r71" AS ( DELETE FROM "slice_den"."retry_start_step" AS "r72" USING "r1" AS "r73" WHERE "r72"."root" = "r73"."c1" RETURNING 1 AS "c1" ), "r74" AS ( DELETE FROM "slice_den"."retry_steadfast_input" AS "r75" USING "r1" AS "r76" WHERE "r75"."root" = "r76"."c1" RETURNING 1 AS "c1" ), "r77" AS ( DELETE FROM "slice_den"."retry_steadfast_output" AS "r78" USING "r1" AS "r79" WHERE "r78"."root" = "r79"."c1" RETURNING 1 AS "c1" ), "r80" AS ( DELETE FROM "slice_den"."retry_step" AS "r81" USING "r1" AS "r82" WHERE "r81"."root" = "r82"."c1" RETURNING 1 AS "c1" ), "r83" AS ( DELETE FROM "slice_den"."retry_throttled_finish_output" AS "r84" USING "r1" AS "r85" WHERE "r84"."root" = "r85"."c1" RETURNING 1 AS "c1" ), "r86" AS ( DELETE FROM "slice_den"."retry_throttled_input" AS "r87" USING "r1" AS "r88" WHERE "r87"."root" = "r88"."c1" RETURNING 1 AS "c1" ), "r89" AS ( DELETE FROM "slice_den"."retry_unhurried_finish_output" AS "r90" USING "r1" AS "r91" WHERE "r90"."root" = "r91"."c1" RETURNING 1 AS "c1" ), "r92" AS ( DELETE FROM "slice_den"."retry_unhurried_input" AS "r93" USING "r1" AS "r94" WHERE "r93"."root" = "r94"."c1" RETURNING 1 AS "c1" ), "r95" AS ( UPDATE "slice_den"."retry_root" AS "r96" SET "retired" = true FROM "r1" AS "r97" WHERE "r96"."scope" = "r97"."c1" RETURNING 1 AS "c1" ) SELECT "r99"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r98"."c2" ORDER BY "r98"."c1") AS "c1", "r98"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r95" AS "r100" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r101" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r102" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r103" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r104" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r105" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r106" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r107" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r108" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r109" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r110" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r111" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r112" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r113" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r114" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r115" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r116" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r117" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r118" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r119" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r120" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r121" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r122" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r123" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r124" UNION ALL SELECT 25 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r125" UNION ALL SELECT 26 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r80" AS "r126" UNION ALL SELECT 27 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r83" AS "r127" UNION ALL SELECT 28 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r86" AS "r128" UNION ALL SELECT 29 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r89" AS "r129" UNION ALL SELECT 30 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r92" AS "r130") AS "r98"("c1", "c2", "c3") GROUP BY "r98"."c3") AS "r99"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_retry_root_kays5vv5ic"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_review_root_itykotyltd"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."review_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."review_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."review_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."review_analyze_input" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."review_analyze_output" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."review_claim" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."review_done" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."review_ended" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."review_exhausted" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."review_failed" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."review_fenced" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."review_finish" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."review_gather_input" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."review_gather_input_sizes" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."review_gather_output" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."review_held" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."review_hold" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."review_questions_finish_output" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."review_questions_input" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."review_refusal" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."review_result" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."review_retry" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( DELETE FROM "slice_den"."review_review_run_finish_output" AS "r66" USING "r1" AS "r67" WHERE "r66"."root" = "r67"."c1" RETURNING 1 AS "c1" ), "r68" AS ( DELETE FROM "slice_den"."review_review_run_input" AS "r69" USING "r1" AS "r70" WHERE "r69"."root" = "r70"."c1" RETURNING 1 AS "c1" ), "r71" AS ( DELETE FROM "slice_den"."review_review_run_input_sizes" AS "r72" USING "r1" AS "r73" WHERE "r72"."root" = "r73"."c1" RETURNING 1 AS "c1" ), "r74" AS ( DELETE FROM "slice_den"."review_save_input" AS "r75" USING "r1" AS "r76" WHERE "r75"."root" = "r76"."c1" RETURNING 1 AS "c1" ), "r77" AS ( DELETE FROM "slice_den"."review_save_output" AS "r78" USING "r1" AS "r79" WHERE "r78"."root" = "r79"."c1" RETURNING 1 AS "c1" ), "r80" AS ( DELETE FROM "slice_den"."review_saved" AS "r81" USING "r1" AS "r82" WHERE "r81"."root" = "r82"."c1" RETURNING 1 AS "c1" ), "r83" AS ( DELETE FROM "slice_den"."review_scope" AS "r84" USING "r1" AS "r85" WHERE "r84"."root" = "r85"."c1" RETURNING 1 AS "c1" ), "r86" AS ( DELETE FROM "slice_den"."review_skipped" AS "r87" USING "r1" AS "r88" WHERE "r87"."root" = "r88"."c1" RETURNING 1 AS "c1" ), "r89" AS ( DELETE FROM "slice_den"."review_split" AS "r90" USING "r1" AS "r91" WHERE "r90"."root" = "r91"."c1" RETURNING 1 AS "c1" ), "r92" AS ( DELETE FROM "slice_den"."review_start_scope" AS "r93" USING "r1" AS "r94" WHERE "r93"."root" = "r94"."c1" RETURNING 1 AS "c1" ), "r95" AS ( DELETE FROM "slice_den"."review_start_step" AS "r96" USING "r1" AS "r97" WHERE "r96"."root" = "r97"."c1" RETURNING 1 AS "c1" ), "r98" AS ( DELETE FROM "slice_den"."review_step" AS "r99" USING "r1" AS "r100" WHERE "r99"."root" = "r100"."c1" RETURNING 1 AS "c1" ), "r101" AS ( DELETE FROM "slice_den"."review_within" AS "r102" USING "r1" AS "r103" WHERE "r102"."root" = "r103"."c1" RETURNING 1 AS "c1" ), "r104" AS ( UPDATE "slice_den"."review_root" AS "r105" SET "retired" = true FROM "r1" AS "r106" WHERE "r105"."scope" = "r106"."c1" RETURNING 1 AS "c1" ) SELECT "r108"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r107"."c2" ORDER BY "r107"."c1") AS "c1", "r107"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r104" AS "r109" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r110" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r111" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r112" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r113" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r114" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r115" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r116" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r117" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r118" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r119" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r120" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r121" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r122" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r123" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r124" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r125" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r126" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r127" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r128" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r129" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r130" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r131" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r132" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r133" UNION ALL SELECT 25 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r134" UNION ALL SELECT 26 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r80" AS "r135" UNION ALL SELECT 27 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r83" AS "r136" UNION ALL SELECT 28 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r86" AS "r137" UNION ALL SELECT 29 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r89" AS "r138" UNION ALL SELECT 30 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r92" AS "r139" UNION ALL SELECT 31 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r95" AS "r140" UNION ALL SELECT 32 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r98" AS "r141" UNION ALL SELECT 33 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r101" AS "r142") AS "r107"("c1", "c2", "c3") GROUP BY "r107"."c3") AS "r108"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_review_root_itykotyltd"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_sync_root_ygktrpeohu"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."sync_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."sync_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."sync_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."sync_build_input" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."sync_build_output" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."sync_claim" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."sync_copy_input" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."sync_copy_output" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."sync_done" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."sync_ended" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."sync_exclusive_key" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."sync_exhausted" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."sync_failed" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."sync_fenced" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."sync_finish" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."sync_gold_finish_output" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."sync_gold_input" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."sync_held" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."sync_refusal" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."sync_result" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."sync_retry" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."sync_scope" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( DELETE FROM "slice_den"."sync_skipped" AS "r66" USING "r1" AS "r67" WHERE "r66"."root" = "r67"."c1" RETURNING 1 AS "c1" ), "r68" AS ( DELETE FROM "slice_den"."sync_start_step" AS "r69" USING "r1" AS "r70" WHERE "r69"."root" = "r70"."c1" RETURNING 1 AS "c1" ), "r71" AS ( DELETE FROM "slice_den"."sync_step" AS "r72" USING "r1" AS "r73" WHERE "r72"."root" = "r73"."c1" RETURNING 1 AS "c1" ), "r74" AS ( DELETE FROM "slice_den"."sync_sync_run_finish_output" AS "r75" USING "r1" AS "r76" WHERE "r75"."root" = "r76"."c1" RETURNING 1 AS "c1" ), "r77" AS ( DELETE FROM "slice_den"."sync_sync_run_input" AS "r78" USING "r1" AS "r79" WHERE "r78"."root" = "r79"."c1" RETURNING 1 AS "c1" ), "r80" AS ( UPDATE "slice_den"."sync_root" AS "r81" SET "retired" = true FROM "r1" AS "r82" WHERE "r81"."scope" = "r82"."c1" RETURNING 1 AS "c1" ) SELECT "r84"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r83"."c2" ORDER BY "r83"."c1") AS "c1", "r83"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r80" AS "r85" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r86" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r87" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r88" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r89" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r90" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r91" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r92" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r93" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r94" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r95" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r96" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r97" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r98" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r99" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r100" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r101" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r102" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r103" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r104" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r105" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r106" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r107" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r108" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r109" UNION ALL SELECT 25 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r110") AS "r83"("c1", "c2", "c3") GROUP BY "r83"."c3") AS "r84"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_sync_root_ygktrpeohu"("slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__retire_writeback_root_oprw3k6une"("keys_1" "slice"."__sha256"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice_den"."writeback_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY WITH "r1"("c1") AS MATERIALIZED ( SELECT "r2"."scope" AS "c1" FROM "slice_den"."writeback_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired" ), "r5" AS ( DELETE FROM "slice_den"."writeback_admitted" AS "r6" USING "r1" AS "r7" WHERE "r6"."root" = "r7"."c1" RETURNING 1 AS "c1" ), "r8" AS ( DELETE FROM "slice_den"."writeback_claim" AS "r9" USING "r1" AS "r10" WHERE "r9"."root" = "r10"."c1" RETURNING 1 AS "c1" ), "r11" AS ( DELETE FROM "slice_den"."writeback_deliver_input" AS "r12" USING "r1" AS "r13" WHERE "r12"."root" = "r13"."c1" RETURNING 1 AS "c1" ), "r14" AS ( DELETE FROM "slice_den"."writeback_deliver_output" AS "r15" USING "r1" AS "r16" WHERE "r15"."root" = "r16"."c1" RETURNING 1 AS "c1" ), "r17" AS ( DELETE FROM "slice_den"."writeback_done" AS "r18" USING "r1" AS "r19" WHERE "r18"."root" = "r19"."c1" RETURNING 1 AS "c1" ), "r20" AS ( DELETE FROM "slice_den"."writeback_ended" AS "r21" USING "r1" AS "r22" WHERE "r21"."root" = "r22"."c1" RETURNING 1 AS "c1" ), "r23" AS ( DELETE FROM "slice_den"."writeback_exhausted" AS "r24" USING "r1" AS "r25" WHERE "r24"."root" = "r25"."c1" RETURNING 1 AS "c1" ), "r26" AS ( DELETE FROM "slice_den"."writeback_failed" AS "r27" USING "r1" AS "r28" WHERE "r27"."root" = "r28"."c1" RETURNING 1 AS "c1" ), "r29" AS ( DELETE FROM "slice_den"."writeback_fenced" AS "r30" USING "r1" AS "r31" WHERE "r30"."root" = "r31"."c1" RETURNING 1 AS "c1" ), "r32" AS ( DELETE FROM "slice_den"."writeback_finish" AS "r33" USING "r1" AS "r34" WHERE "r33"."root" = "r34"."c1" RETURNING 1 AS "c1" ), "r35" AS ( DELETE FROM "slice_den"."writeback_held" AS "r36" USING "r1" AS "r37" WHERE "r36"."root" = "r37"."c1" RETURNING 1 AS "c1" ), "r38" AS ( DELETE FROM "slice_den"."writeback_refusal" AS "r39" USING "r1" AS "r40" WHERE "r39"."root" = "r40"."c1" RETURNING 1 AS "c1" ), "r41" AS ( DELETE FROM "slice_den"."writeback_result" AS "r42" USING "r1" AS "r43" WHERE "r42"."root" = "r43"."c1" RETURNING 1 AS "c1" ), "r44" AS ( DELETE FROM "slice_den"."writeback_retry" AS "r45" USING "r1" AS "r46" WHERE "r45"."root" = "r46"."c1" RETURNING 1 AS "c1" ), "r47" AS ( DELETE FROM "slice_den"."writeback_scope" AS "r48" USING "r1" AS "r49" WHERE "r48"."root" = "r49"."c1" RETURNING 1 AS "c1" ), "r50" AS ( DELETE FROM "slice_den"."writeback_skipped" AS "r51" USING "r1" AS "r52" WHERE "r51"."root" = "r52"."c1" RETURNING 1 AS "c1" ), "r53" AS ( DELETE FROM "slice_den"."writeback_start_step" AS "r54" USING "r1" AS "r55" WHERE "r54"."root" = "r55"."c1" RETURNING 1 AS "c1" ), "r56" AS ( DELETE FROM "slice_den"."writeback_step" AS "r57" USING "r1" AS "r58" WHERE "r57"."root" = "r58"."c1" RETURNING 1 AS "c1" ), "r59" AS ( DELETE FROM "slice_den"."writeback_writeback_finish_output" AS "r60" USING "r1" AS "r61" WHERE "r60"."root" = "r61"."c1" RETURNING 1 AS "c1" ), "r62" AS ( DELETE FROM "slice_den"."writeback_writeback_input" AS "r63" USING "r1" AS "r64" WHERE "r63"."root" = "r64"."c1" RETURNING 1 AS "c1" ), "r65" AS ( UPDATE "slice_den"."writeback_root" AS "r66" SET "retired" = true FROM "r1" AS "r67" WHERE "r66"."scope" = "r67"."c1" RETURNING 1 AS "c1" ) SELECT "r69"."c1" AS "c1" FROM (SELECT "pg_catalog"."array_agg"("r68"."c2" ORDER BY "r68"."c1") AS "c1", "r68"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r70" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r71" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r72" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r73" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r74" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r75" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r76" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r77" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r78" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r79" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r80" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r81" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r82" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r83" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r84" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r85" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r86" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r87" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r88" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r89" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r90") AS "r68"("c1", "c2", "c3") GROUP BY "r68"."c3") AS "r69"("c1", "c2") LIMIT 1::bigint ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__retire_writeback_root_oprw3k6une"("slice"."__sha256"[]) FROM PUBLIC;

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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."weight"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_asked"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_exclude"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_mode_nearest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_mode_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_near"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input_exclude"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input_mode_nearest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input_mode_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output_stage_rest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output_stage_serve"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output_weighed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_read_nearest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_read_nearest_row"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_read_seen"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_read_seen_row"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_exclude"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_mode_nearest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_mode_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_near"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_output"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_chain_run_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_chain_run_input"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_next"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_ordered_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_ordered_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_input_after"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_output_next"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_earlier"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_earlier_row"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_tree"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_tree_items"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_tree_row"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_weights"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_weights_row"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_tree_first"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_refusal"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_chime_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_chime_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_close_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_close_output"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_hourly_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_hourly_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_refusal"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_sitting_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_sitting_input"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_batch_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_batch_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_dust_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_dust_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_fan_run_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_fan_run_input"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_mop_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_mop_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_refusal"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_square_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_square_output"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_sweep_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_sweep_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_brittle_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_brittle_output"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_ladders_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_ladders_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_patient_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_patient_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_polite_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_polite_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_refusal"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_steadfast_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_steadfast_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_throttled_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_throttled_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_unhurried_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_unhurried_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_analyze_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_analyze_output"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_gather_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_gather_input_sizes"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_gather_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_hold"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_questions_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_questions_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_review_run_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_review_run_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_review_run_input_sizes"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_save_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_save_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_saved"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_split"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_build_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_build_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_copy_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_copy_output"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_gold_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_gold_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_refusal"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_sync_run_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_sync_run_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_deliver_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_deliver_output"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_writeback_finish_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_writeback_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

ALTER TABLE "slice_den"."assign_admitted"
  ADD CONSTRAINT "__assign_admitted_fk_root_a4ab52rbpf" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_admitted_fk_scope_root_axpol5zgcd" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."assign_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_asked"
  ADD CONSTRAINT "__assign_asked_fk_from_root_jbwoju3nkb" FOREIGN KEY ("from", "root") REFERENCES "slice_den"."assign_embed_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_asked_fk_root_zheeongpsu" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_asked_fk_to_root_kg4yqbs5ps" FOREIGN KEY ("to", "root") REFERENCES "slice_den"."assign_decide_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_finish_output"
  ADD CONSTRAINT "__assign_assignment_finish_output_fk_root_cxywb372kl" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_finish_output_fk_step_root_btb6cwfo73" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_fk_root_7vcxtkof42" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_input_exclude"
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_root_kuvjl3s6t5" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_root_z5moccsgvx" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."assign_assignment_input" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_yyclsqsijg" FOREIGN KEY ("__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."assign_assignment_input_exclude" ("scope", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_input_mode_nearest" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_t23ef5vjhv" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_input_mode_within" ADD CONSTRAINT "__assign_assignment_input_mode_within_fk_root_jimtsl3pcm" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_input_near"
  ADD CONSTRAINT "__assign_assignment_input_near_fk_root_6cdqioe6mu" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_near_fk_scope_root_lyuzgkqxtu" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."assign_assignment_input" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_near_fk_scope_pred_ordinal_m5mnmsqnzk" FOREIGN KEY ("__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."assign_assignment_input_near" ("scope", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_claim"
  ADD CONSTRAINT "__assign_claim_fk_root_tccogfd3gj" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_claim_fk_step_root_i4wvemd6lc" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_claim_fk_step_pred_attempt_root_qq7m4vgq5c" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."assign_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_fk_root_2ru7zbrfcg" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input_exclude"
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_root_ms4jvh65c5" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_root_in6yyrl43w" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_decide_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_ud7okz5qbt" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."assign_decide_input_exclude" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input_mode_nearest" ADD CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_vgxth6ulqd" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input_mode_within" ADD CONSTRAINT "__assign_decide_input_mode_within_fk_root_5fhvbm7o2j" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_output"
  ADD CONSTRAINT "__assign_decide_output_fk_root_keez6pmczm" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_fk_step_root_oxey3s55bw" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_decide_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_fk_step_root_b4qrx4ukam" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_decide_output_stage_rest" ADD CONSTRAINT "__assign_decide_output_stage_rest_fk_root_emwjzdjgvs" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_output_stage_serve" ADD CONSTRAINT "__assign_decide_output_stage_serve_fk_root_nv2zgv5hrt" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_output_weighed"
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_root_tymno4wjr4" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_root_nkudthcgg2" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_decide_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_6nj2mzauma" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."assign_decide_output_weighed" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_read_nearest"
  ADD CONSTRAINT "__assign_decide_read_nearest_fk_digest_bpdnxpzp5m" FOREIGN KEY ("digest") REFERENCES "slice_den"."assign_decide_read_nearest_row" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_nearest_fk_root_ycz25zxkwm" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_nearest_fk_step_root_6zy7kdf72j" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_read_seen"
  ADD CONSTRAINT "__assign_decide_read_seen_fk_digest_zjwk3f7pfz" FOREIGN KEY ("digest") REFERENCES "slice_den"."assign_decide_read_seen_row" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_seen_fk_root_mmjkzkootc" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_seen_fk_step_root_digi5lcvpw" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_done" ADD CONSTRAINT "__assign_done_fk_root_bm6oxygwbu" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input" ADD CONSTRAINT "__assign_embed_input_fk_root_cwfcfjex6q" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_exclude"
  ADD CONSTRAINT "__assign_embed_input_exclude_fk_root_ukjqxbt7ap" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_exclude_fk_step_root_wl7z42ozbz" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_embed_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_exclude_fk_step_pred_ordinal_uyhiasutyq" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."assign_embed_input_exclude" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_mode_nearest" ADD CONSTRAINT "__assign_embed_input_mode_nearest_fk_root_4znytbmmeu" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_mode_within" ADD CONSTRAINT "__assign_embed_input_mode_within_fk_root_sntsbzyy4j" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_near"
  ADD CONSTRAINT "__assign_embed_input_near_fk_root_tre2sdwjfz" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_near_fk_step_root_rjswhmogx2" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_embed_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_near_fk_step_pred_ordinal_root_4z756q6ieo" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."assign_embed_input_near" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_output"
  ADD CONSTRAINT "__assign_embed_output_fk_root_2s3kxqf4fq" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_output_fk_step_root_amg3l6sdib" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_embed_output_fk_step_root_yoz2l6kzsz" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_embed_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_ended"
  ADD CONSTRAINT "__assign_ended_fk_root_snn64so4y5" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_ended_fk_step_attempt_root_6glu7zitw6" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_exhausted"
  ADD CONSTRAINT "__assign_exhausted_fk_root_vljhubi73b" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_exhausted_fk_step_root_juabgscovy" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_failed" ADD CONSTRAINT "__assign_failed_fk_root_oyplqvhznf" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_fenced"
  ADD CONSTRAINT "__assign_fenced_fk_root_53vovdvcd2" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_fenced_fk_step_attempt_root_ibfrwtujam" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."assign_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_finish"
  ADD CONSTRAINT "__assign_finish_fk_root_6bbfqqziln" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_finish_fk_scope_root_fasrssafod" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."assign_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_finish_fk_step_root_uqhlnaqgqc" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_held"
  ADD CONSTRAINT "__assign_held_fk_root_ugjqx6ie3f" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_held_fk_step_attempt_root_5ffh4ch5vo" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_held_fk_step_root_yvbigkwvhi" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_paused" ADD CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."assign_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_refusal"
  ADD CONSTRAINT "__assign_refusal_fk_root_ikkkxnypbg" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_refusal_fk_step_root_4pwostl6w4" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_result"
  ADD CONSTRAINT "__assign_result_fk_root_mbig2yym5s" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_result_fk_step_root_ie57r22uco" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_resumed" ADD CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."assign_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_retry"
  ADD CONSTRAINT "__assign_retry_fk_root_g7cxz6uouh" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_retry_fk_step_attempt_root_gsye2j667t" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."assign_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_scope" ADD CONSTRAINT "__assign_scope_fk_root_aqbd5fs63t" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_skipped"
  ADD CONSTRAINT "__assign_skipped_fk_by_yi4ixsfumz" FOREIGN KEY ("by") REFERENCES "slice_den"."assign_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_skipped_fk_root_uyud3yb6zy" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_skipped_fk_scope_6ks53lak4r" FOREIGN KEY ("scope") REFERENCES "slice_den"."assign_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_start_step"
  ADD CONSTRAINT "__assign_start_step_fk_root_me4zj64243" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_start_step_fk_scope_root_grairzt42v" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."assign_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_start_step_fk_step_root_2bw3dd6v6d" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_step"
  ADD CONSTRAINT "__assign_step_fk_root_qky3m5h2ys" FOREIGN KEY ("root") REFERENCES "slice_den"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_step_fk_scope_root_rr5jplc2ua" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."assign_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."audit" ADD CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_admitted"
  ADD CONSTRAINT "__chain_admitted_fk_root_abvywhprzd" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_admitted_fk_scope_root_ee5yuzxero" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."chain_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_chain_run_finish_output"
  ADD CONSTRAINT "__chain_chain_run_finish_output_fk_root_4rmekbji4d" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_chain_run_finish_output_fk_step_root_xr4ypwejog" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_chain_run_input" ADD CONSTRAINT "__chain_chain_run_input_fk_root_eyhkir2ten" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_claim"
  ADD CONSTRAINT "__chain_claim_fk_root_e4z56epu62" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_claim_fk_step_root_dz35k5kajb" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_claim_fk_step_pred_attempt_root_mekmccmxkt" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."chain_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_done" ADD CONSTRAINT "__chain_done_fk_root_p5unbx53ay" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_ended"
  ADD CONSTRAINT "__chain_ended_fk_root_mzyjkgh7kn" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_ended_fk_step_attempt_root_hqs5hboik5" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_exhausted"
  ADD CONSTRAINT "__chain_exhausted_fk_root_az7it7tady" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_exhausted_fk_step_root_x7otp3oe7t" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_failed" ADD CONSTRAINT "__chain_failed_fk_root_ku7hd36hr4" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_fenced"
  ADD CONSTRAINT "__chain_fenced_fk_root_dpd2zsy45p" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_fenced_fk_step_attempt_root_wtvf2kpo3y" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."chain_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_finish"
  ADD CONSTRAINT "__chain_finish_fk_root_b4s3b6gb4a" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_finish_fk_scope_root_bm7lzlvp35" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."chain_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_finish_fk_step_root_7gwsgngr6z" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_held"
  ADD CONSTRAINT "__chain_held_fk_root_7gjoucbs6t" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_held_fk_step_attempt_root_aqmobtk3xc" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_held_fk_step_root_mrcpyhmlko" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_next"
  ADD CONSTRAINT "__chain_next_fk_from_root_fp74n4ao6b" FOREIGN KEY ("from", "root") REFERENCES "slice_den"."chain_page_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_fk_root_ymhq5qkp7g" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_fk_to_root_juwf5tsgbs" FOREIGN KEY ("to", "root") REFERENCES "slice_den"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_ordered_finish_output"
  ADD CONSTRAINT "__chain_ordered_finish_output_fk_root_dbbcetmlpl" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_ordered_finish_output_fk_step_root_jvdqnoziiv" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_ordered_input" ADD CONSTRAINT "__chain_ordered_input_fk_root_yo2fvi6v6v" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_input" ADD CONSTRAINT "__chain_page_input_fk_root_s74r6jkeai" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_input_after"
  ADD CONSTRAINT "__chain_page_input_after_fk_root_uksq5ttkd4" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_input_after_fk_step_root_pqhheaahab" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_output"
  ADD CONSTRAINT "__chain_page_output_fk_root_ez5wgbipj5" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_fk_step_root_nesuhzkml5" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_page_output_fk_step_root_gyxfrq7ubp" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_output_next"
  ADD CONSTRAINT "__chain_page_output_next_fk_root_x6esxudkux" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_next_fk_step_root_srapg45mao" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_page_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_earlier"
  ADD CONSTRAINT "__chain_page_read_earlier_fk_digest_draxd5jrld" FOREIGN KEY ("digest") REFERENCES "slice_den"."chain_page_read_earlier_row" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_earlier_fk_root_skex2y53oj" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_earlier_fk_step_root_heb6lu6om7" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_tree"
  ADD CONSTRAINT "__chain_page_read_tree_fk_digest_cz6fzlmtk4" FOREIGN KEY ("digest") REFERENCES "slice_den"."chain_page_read_tree_row" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_tree_fk_root_rjrvetlv52" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_tree_fk_step_root_ryeeje5uel" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_tree_items"
  ADD CONSTRAINT "__chain_page_read_tree_items_fk_digest_copy_items_sicbcwc4zb" FOREIGN KEY ("digest", "__copy_items_jii5wy7azg") REFERENCES "slice_den"."chain_page_read_tree_row" ("digest", "items") MATCH SIMPLE ON UPDATE CASCADE,
  ADD CONSTRAINT "__chain_page_read_tree_items_fk_digest_pred_at_r7gpc2igze" FOREIGN KEY ("digest", "__pred_at_xktcobhsti") REFERENCES "slice_den"."chain_page_read_tree_items" ("digest", "at") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_page_read_tree_row" ADD CONSTRAINT "__chain_page_read_tree_row_fk_digest_pred_items_7rh66dc67t" FOREIGN KEY ("digest", "__pred_items_3qltx5cx27") REFERENCES "slice_den"."chain_page_read_tree_items" ("digest", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_weights"
  ADD CONSTRAINT "__chain_page_read_weights_fk_digest_73zfvhpwus" FOREIGN KEY ("digest") REFERENCES "slice_den"."chain_page_read_weights_row" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_weights_fk_root_iuoy4px74k" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_weights_fk_step_root_kdopovc7p6" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_tree_first" ADD CONSTRAINT "__chain_page_tree_first_fk_digest_at_thwgbmxhwl" FOREIGN KEY ("digest", "at") REFERENCES "slice_den"."chain_page_read_tree_items" ("digest", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_paused" ADD CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."chain_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_refusal"
  ADD CONSTRAINT "__chain_refusal_fk_root_np3fiq6hlf" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_refusal_fk_step_root_2xohwjf6ov" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_result"
  ADD CONSTRAINT "__chain_result_fk_root_cqy7fgz6gd" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_result_fk_step_root_rytllwqxot" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_resumed" ADD CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."chain_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_retry"
  ADD CONSTRAINT "__chain_retry_fk_root_mrtnq2ndso" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_retry_fk_step_attempt_root_mwa5szmjq5" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."chain_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_scope" ADD CONSTRAINT "__chain_scope_fk_root_5dnilqnmua" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_skipped"
  ADD CONSTRAINT "__chain_skipped_fk_by_zwz72yquyv" FOREIGN KEY ("by") REFERENCES "slice_den"."chain_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_skipped_fk_root_yi73nwhhy4" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_skipped_fk_scope_ozicxyda6o" FOREIGN KEY ("scope") REFERENCES "slice_den"."chain_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_start_step"
  ADD CONSTRAINT "__chain_start_step_fk_root_gh44bcwmwg" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_start_step_fk_scope_root_eab47owgce" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."chain_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_start_step_fk_step_root_llhvckjbu2" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_step"
  ADD CONSTRAINT "__chain_step_fk_root_n4wedmpzhn" FOREIGN KEY ("root") REFERENCES "slice_den"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_step_fk_scope_root_jmx7nw7i4f" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."chain_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_admitted"
  ADD CONSTRAINT "__clock_admitted_fk_root_7dydra2fa6" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_admitted_fk_scope_root_iq667y6auq" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."clock_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_chime_input" ADD CONSTRAINT "__clock_chime_input_fk_root_plvhx4qyi5" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_chime_output"
  ADD CONSTRAINT "__clock_chime_output_fk_root_75doh4g3jb" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_chime_output_fk_step_root_x3amhltgq6" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_chime_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_chime_output_fk_step_root_3wm3i6ov6f" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_claim"
  ADD CONSTRAINT "__clock_claim_fk_root_hmpra5qlcp" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_claim_fk_step_root_vptogyiqam" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_claim_fk_step_pred_attempt_root_qvfbouzl5p" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."clock_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_close_input" ADD CONSTRAINT "__clock_close_input_fk_root_txagvl3rnl" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_close_output"
  ADD CONSTRAINT "__clock_close_output_fk_root_5jk2orzbti" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_close_output_fk_step_root_fooxwxkcx3" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_close_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_close_output_fk_step_root_accrzxyiql" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_done" ADD CONSTRAINT "__clock_done_fk_root_soqskjsjao" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_ended"
  ADD CONSTRAINT "__clock_ended_fk_root_g3cnl7xafr" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_ended_fk_step_attempt_root_dimjqmfaqh" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."clock_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_exhausted"
  ADD CONSTRAINT "__clock_exhausted_fk_root_xskm7prc74" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_exhausted_fk_step_root_ydvibsvd3a" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_failed" ADD CONSTRAINT "__clock_failed_fk_root_tkhs7qqr4z" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_fenced"
  ADD CONSTRAINT "__clock_fenced_fk_root_t4ntcqjpyp" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_fenced_fk_step_attempt_root_6wai42b7gk" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."clock_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_finish"
  ADD CONSTRAINT "__clock_finish_fk_root_pmnnbogxf6" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_finish_fk_scope_root_ncra3pc2vm" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."clock_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_finish_fk_step_root_kr2hfecrdl" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_held"
  ADD CONSTRAINT "__clock_held_fk_root_u3vxrlyseh" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_held_fk_step_attempt_root_rggju54zr5" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."clock_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_held_fk_step_root_oboys6ct6s" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_hourly_finish_output"
  ADD CONSTRAINT "__clock_hourly_finish_output_fk_root_wn7gvu3f26" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_hourly_finish_output_fk_step_root_xwntxefqc6" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_hourly_input" ADD CONSTRAINT "__clock_hourly_input_fk_root_ixovd5y6h4" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_paused" ADD CONSTRAINT "__clock_paused_fk_target_pred_turn_7tgjovpr6x" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."clock_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_refusal"
  ADD CONSTRAINT "__clock_refusal_fk_root_ekomnyuzgo" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_refusal_fk_step_root_cwz55xrfvz" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_result"
  ADD CONSTRAINT "__clock_result_fk_root_mlw7uyvsd5" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_result_fk_step_root_ywzn6yx56v" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_resumed" ADD CONSTRAINT "__clock_resumed_fk_target_turn_45dwn4cwo5" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."clock_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_retry"
  ADD CONSTRAINT "__clock_retry_fk_root_zrptzgm66d" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_retry_fk_step_attempt_root_rbqzkwnwmy" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."clock_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_scope" ADD CONSTRAINT "__clock_scope_fk_root_2os4agb6vo" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_sitting_finish_output"
  ADD CONSTRAINT "__clock_sitting_finish_output_fk_root_5s5nbif4nr" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_sitting_finish_output_fk_step_root_mkypttatse" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."clock_sitting_input" ADD CONSTRAINT "__clock_sitting_input_fk_root_pedoscj3vp" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_skipped"
  ADD CONSTRAINT "__clock_skipped_fk_by_joxrltqt4a" FOREIGN KEY ("by") REFERENCES "slice_den"."clock_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_skipped_fk_root_w4ixxvhwt2" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_skipped_fk_scope_e5ndey7rqw" FOREIGN KEY ("scope") REFERENCES "slice_den"."clock_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_start_step"
  ADD CONSTRAINT "__clock_start_step_fk_root_s7u7hg3lzj" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_start_step_fk_scope_root_oqopxtg4cc" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."clock_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_start_step_fk_step_root_7tv5nylxvh" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."clock_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_step"
  ADD CONSTRAINT "__clock_step_fk_root_pi7kop6duk" FOREIGN KEY ("root") REFERENCES "slice_den"."clock_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_step_fk_scope_root_ivit5j6zqd" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."clock_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_admitted"
  ADD CONSTRAINT "__fan_admitted_fk_root_ui6p5vdrhk" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_admitted_fk_scope_root_zj52ntgcx6" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."fan_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_batch_finish_output"
  ADD CONSTRAINT "__fan_batch_finish_output_fk_root_dpzlswayvb" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_batch_finish_output_fk_step_root_hhniyvx63e" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_batch_input" ADD CONSTRAINT "__fan_batch_input_fk_root_d4g2u2spvl" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_claim"
  ADD CONSTRAINT "__fan_claim_fk_root_t3hwth6mh7" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_step_root_6jsjsejmab" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_step_root_attempt_pred_holds_jqx7ma7cam" FOREIGN KEY ("step", "root", "attempt", "__pred_holds_lq7itfruzz") REFERENCES "slice_den"."fan_hold" ("step", "root", "attempt", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_step_pred_attempt_root_lvu6wwhaq3" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."fan_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_done" ADD CONSTRAINT "__fan_done_fk_root_cfizuozacw" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_dust_input" ADD CONSTRAINT "__fan_dust_input_fk_root_3733wzdt23" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_dust_output"
  ADD CONSTRAINT "__fan_dust_output_fk_root_6dquh32eog" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_dust_output_fk_step_root_qzoffoc32g" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_dust_output_fk_step_root_nxpsu4ielv" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_dust_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_ended"
  ADD CONSTRAINT "__fan_ended_fk_root_uaaz527dex" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_ended_fk_step_attempt_root_guai42fujd" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_exhausted"
  ADD CONSTRAINT "__fan_exhausted_fk_root_mlbxyrjdjk" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_exhausted_fk_step_root_jyggt4fgpd" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_failed" ADD CONSTRAINT "__fan_failed_fk_root_3gq7ifprza" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_fan_run_finish_output"
  ADD CONSTRAINT "__fan_fan_run_finish_output_fk_root_ttt7pw4dnn" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_fan_run_finish_output_fk_step_root_yjy4xmcplw" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_fan_run_input" ADD CONSTRAINT "__fan_fan_run_input_fk_root_oztqak3s27" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_fenced"
  ADD CONSTRAINT "__fan_fenced_fk_root_2vu32qtss5" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_fenced_fk_step_attempt_root_resahyn2ym" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."fan_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_finish"
  ADD CONSTRAINT "__fan_finish_fk_root_evgrt3slao" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_finish_fk_scope_root_xpvycdjjiy" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."fan_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_finish_fk_step_root_bpqxxtu4ab" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_held"
  ADD CONSTRAINT "__fan_held_fk_root_cnpqjrp534" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_held_fk_step_attempt_root_c33imj7zo6" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_held_fk_step_root_ob2yj5i5h3" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_hold"
  ADD CONSTRAINT "__fan_hold_fk_root_4at7ny23la" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_hold_fk_step_root_attempt_copy_holds_jzk5g7klso" FOREIGN KEY ("step", "root", "attempt", "__copy_holds_c6hi2i2kfb") REFERENCES "slice_den"."fan_claim" ("step", "root", "attempt", "holds") MATCH SIMPLE ON UPDATE CASCADE,
  ADD CONSTRAINT "__fan_hold_fk_step_root_attempt_pred_at_p4adu554h3" FOREIGN KEY ("step", "root", "attempt", "__pred_at_xktcobhsti") REFERENCES "slice_den"."fan_hold" ("step", "root", "attempt", "at") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_mop_input" ADD CONSTRAINT "__fan_mop_input_fk_root_iflswncgct" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_mop_output"
  ADD CONSTRAINT "__fan_mop_output_fk_root_2oyshrk7i2" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_mop_output_fk_step_root_dsgqll32vr" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_mop_output_fk_step_root_j2cwqnpbda" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_mop_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_paused" ADD CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."fan_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_refusal"
  ADD CONSTRAINT "__fan_refusal_fk_root_zep5evjd2e" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_refusal_fk_step_root_5qjei2ie7w" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_result"
  ADD CONSTRAINT "__fan_result_fk_root_m233bhejob" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_result_fk_step_root_kkph4igmst" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_resumed" ADD CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."fan_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_retry"
  ADD CONSTRAINT "__fan_retry_fk_root_hoqgudhhyh" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_retry_fk_step_attempt_root_jw7ijf5nre" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."fan_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_scope" ADD CONSTRAINT "__fan_scope_fk_root_3c5fvemkr6" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_skipped"
  ADD CONSTRAINT "__fan_skipped_fk_by_o76cwxye2w" FOREIGN KEY ("by") REFERENCES "slice_den"."fan_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_skipped_fk_root_j6gpqvvx57" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_skipped_fk_scope_eomkgfbxwj" FOREIGN KEY ("scope") REFERENCES "slice_den"."fan_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_square_input" ADD CONSTRAINT "__fan_square_input_fk_root_gpj7rrapja" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_square_output"
  ADD CONSTRAINT "__fan_square_output_fk_root_dpyr2dahw3" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_square_output_fk_step_root_ibp6l2tkc5" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_square_output_fk_step_root_kilcbg5jn4" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_square_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_start_scope"
  ADD CONSTRAINT "__fan_start_scope_fk_child_root_dn65r3vwqt" FOREIGN KEY ("child", "root") REFERENCES "slice_den"."fan_scope" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_scope_fk_root_24pfkxnibn" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_start_scope_fk_scope_root_clsa2be3m7" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."fan_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_start_step"
  ADD CONSTRAINT "__fan_start_step_fk_root_4rwp7q56wg" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_start_step_fk_scope_root_vh2ut5ssmk" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."fan_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_step_fk_step_root_din6bp4kp3" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_step"
  ADD CONSTRAINT "__fan_step_fk_root_eueisdyp32" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_step_fk_scope_root_dyjpxhnjhz" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."fan_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_sweep_finish_output"
  ADD CONSTRAINT "__fan_sweep_finish_output_fk_root_wuiuxdlyfz" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_sweep_finish_output_fk_step_root_hvu6m73esm" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."fan_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_sweep_input" ADD CONSTRAINT "__fan_sweep_input_fk_root_uobuoei5yy" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_within"
  ADD CONSTRAINT "__fan_within_fk_parent_root_uep5w6udoh" FOREIGN KEY ("parent", "root") REFERENCES "slice_den"."fan_scope" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_within_fk_root_k7476egnhf" FOREIGN KEY ("root") REFERENCES "slice_den"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_within_fk_scope_root_ej3crstjip" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."fan_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_admitted"
  ADD CONSTRAINT "__retry_admitted_fk_root_n65ucxnw7g" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_admitted_fk_scope_root_kufu5v4g3v" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."retry_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_brittle_input" ADD CONSTRAINT "__retry_brittle_input_fk_root_3kdpo5sepg" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_brittle_output"
  ADD CONSTRAINT "__retry_brittle_output_fk_root_baznemh4df" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_brittle_output_fk_step_root_o5pt3hukix" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_brittle_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_brittle_output_fk_step_root_jnbgyogqxn" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_claim"
  ADD CONSTRAINT "__retry_claim_fk_root_ilxn6ulsuq" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_claim_fk_step_root_zffmzj357l" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_claim_fk_step_pred_attempt_root_pnatu7db5m" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."retry_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_done" ADD CONSTRAINT "__retry_done_fk_root_eegigvha5p" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_ended"
  ADD CONSTRAINT "__retry_ended_fk_root_h23o2xvf4e" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_ended_fk_step_attempt_root_25duapnk22" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_exhausted"
  ADD CONSTRAINT "__retry_exhausted_fk_root_fetyfw4rhv" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_exhausted_fk_step_root_pj2owyq2rw" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_failed" ADD CONSTRAINT "__retry_failed_fk_root_uy6ypbkhl7" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_fenced"
  ADD CONSTRAINT "__retry_fenced_fk_root_q2hes57bil" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_fenced_fk_step_attempt_root_laqomvgkpu" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."retry_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_finish"
  ADD CONSTRAINT "__retry_finish_fk_root_iv6szs7lco" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_finish_fk_scope_root_odh4hpe5hc" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."retry_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_finish_fk_step_root_o54jpsxlmy" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_held"
  ADD CONSTRAINT "__retry_held_fk_root_3v46rzikqg" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_held_fk_step_attempt_root_cnveo6n2ex" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_held_fk_step_root_m5b3t566ya" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_ladders_finish_output"
  ADD CONSTRAINT "__retry_ladders_finish_output_fk_root_gmq3iutwdv" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_ladders_finish_output_fk_step_root_l5sosf3h23" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_ladders_input" ADD CONSTRAINT "__retry_ladders_input_fk_root_cnlwmpha3w" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_patient_input" ADD CONSTRAINT "__retry_patient_input_fk_root_x4fak4nifc" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_patient_output"
  ADD CONSTRAINT "__retry_patient_output_fk_root_36wgu5rnaa" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_patient_output_fk_step_root_waswby3piq" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_patient_output_fk_step_root_buctg5fpry" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_patient_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_paused" ADD CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."retry_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_polite_input" ADD CONSTRAINT "__retry_polite_input_fk_root_5mkc2d4wg5" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_polite_output"
  ADD CONSTRAINT "__retry_polite_output_fk_root_hgdssuqq43" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_polite_output_fk_step_root_n3pnixozej" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_polite_output_fk_step_root_dzlpbomecj" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_polite_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_refusal"
  ADD CONSTRAINT "__retry_refusal_fk_root_jr53wy3j5v" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_refusal_fk_step_root_sqt67v76ib" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_result"
  ADD CONSTRAINT "__retry_result_fk_root_zoskj252jz" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_result_fk_step_root_ulmjckkvmq" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_resumed" ADD CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."retry_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_retry"
  ADD CONSTRAINT "__retry_retry_fk_root_gfdc3bi7a3" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_retry_fk_step_attempt_root_xrpolbmg32" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."retry_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_scope" ADD CONSTRAINT "__retry_scope_fk_root_veata66enh" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_skipped"
  ADD CONSTRAINT "__retry_skipped_fk_by_iokgypc6cl" FOREIGN KEY ("by") REFERENCES "slice_den"."retry_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_skipped_fk_root_rfxaxqegr7" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_skipped_fk_scope_q4224gzqrl" FOREIGN KEY ("scope") REFERENCES "slice_den"."retry_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_start_step"
  ADD CONSTRAINT "__retry_start_step_fk_root_lgh6lskept" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_start_step_fk_scope_root_va3ypig5rc" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."retry_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_start_step_fk_step_root_wftarsumzh" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_steadfast_input" ADD CONSTRAINT "__retry_steadfast_input_fk_root_4xkwhc353t" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_steadfast_output"
  ADD CONSTRAINT "__retry_steadfast_output_fk_root_ypuiq33fkv" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_steadfast_output_fk_step_root_3x6tbszpyw" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_steadfast_output_fk_step_root_y3we3qusrs" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_steadfast_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_step"
  ADD CONSTRAINT "__retry_step_fk_root_zww4hkltkz" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_step_fk_scope_root_xl7rht6tyq" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."retry_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_throttled_finish_output"
  ADD CONSTRAINT "__retry_throttled_finish_output_fk_root_aoghadcbu7" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_throttled_finish_output_fk_step_root_7s3twuagha" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_throttled_input" ADD CONSTRAINT "__retry_throttled_input_fk_root_gx2jscz4sq" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_unhurried_finish_output"
  ADD CONSTRAINT "__retry_unhurried_finish_output_fk_root_jiiefymglf" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_unhurried_finish_output_fk_step_root_65bjp55xj7" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."retry_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_unhurried_input" ADD CONSTRAINT "__retry_unhurried_input_fk_root_eff4ilou6c" FOREIGN KEY ("root") REFERENCES "slice_den"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_admitted"
  ADD CONSTRAINT "__review_admitted_fk_root_5a2j3m7nju" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_admitted_fk_scope_root_bzpl734wrx" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."review_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_analyze_input" ADD CONSTRAINT "__review_analyze_input_fk_root_73upzaj4eg" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_analyze_output"
  ADD CONSTRAINT "__review_analyze_output_fk_root_qlfzwtt6d2" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_analyze_output_fk_step_root_axdif7cyxp" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_analyze_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_analyze_output_fk_step_root_arcu4coozk" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_claim"
  ADD CONSTRAINT "__review_claim_fk_root_z2utn3xauo" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_claim_fk_step_root_yqgzabonm6" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_claim_fk_step_root_attempt_pred_holds_arudmqwanl" FOREIGN KEY ("step", "root", "attempt", "__pred_holds_lq7itfruzz") REFERENCES "slice_den"."review_hold" ("step", "root", "attempt", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_claim_fk_step_pred_attempt_root_jwqvbkxdcf" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."review_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_done" ADD CONSTRAINT "__review_done_fk_root_f374tjslpg" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_ended"
  ADD CONSTRAINT "__review_ended_fk_root_o6manlpvtk" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_ended_fk_step_attempt_root_a7ck6js3qb" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."review_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_exhausted"
  ADD CONSTRAINT "__review_exhausted_fk_root_odke37pg7n" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_exhausted_fk_step_root_74mlwghlwh" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_failed" ADD CONSTRAINT "__review_failed_fk_root_vohwwobyj7" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_fenced"
  ADD CONSTRAINT "__review_fenced_fk_root_clolofwycr" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_fenced_fk_step_attempt_root_zpc4oiatc2" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."review_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_finish"
  ADD CONSTRAINT "__review_finish_fk_root_yivqae7o2r" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_finish_fk_scope_root_wjpg56iirx" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."review_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__review_finish_fk_step_root_assajgbrsg" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_gather_input" ADD CONSTRAINT "__review_gather_input_fk_root_m5n5ulcugs" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_gather_input_sizes"
  ADD CONSTRAINT "__review_gather_input_sizes_fk_root_4jycj2gg73" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_input_sizes_fk_step_root_xkxj3c72dv" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_gather_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_input_sizes_fk_step_pred_ordinal_h3lguuktus" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."review_gather_input_sizes" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_gather_output"
  ADD CONSTRAINT "__review_gather_output_fk_root_pfl7uynvxk" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_output_fk_step_root_kfxlxydhp2" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__review_gather_output_fk_step_root_sijekb5wr7" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_gather_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_held"
  ADD CONSTRAINT "__review_held_fk_root_cq4jfaijwu" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_held_fk_step_attempt_root_63jdmcjpmk" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."review_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_held_fk_step_root_463posmneo" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_hold"
  ADD CONSTRAINT "__review_hold_fk_root_smobn52snr" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_hold_fk_step_root_attempt_copy_holds_syccyd3g3d" FOREIGN KEY ("step", "root", "attempt", "__copy_holds_j7qe5qdydj") REFERENCES "slice_den"."review_claim" ("step", "root", "attempt", "holds") MATCH SIMPLE ON UPDATE CASCADE,
  ADD CONSTRAINT "__review_hold_fk_step_root_attempt_pred_at_6m6hmj5lir" FOREIGN KEY ("step", "root", "attempt", "__pred_at_xktcobhsti") REFERENCES "slice_den"."review_hold" ("step", "root", "attempt", "at") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_paused" ADD CONSTRAINT "__review_paused_fk_target_pred_turn_rig5fmgcvc" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."review_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_questions_finish_output"
  ADD CONSTRAINT "__review_questions_finish_output_fk_root_lhkngtysmk" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_questions_finish_output_fk_step_root_hw7trgc4tp" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_questions_input" ADD CONSTRAINT "__review_questions_input_fk_root_smgug66jwc" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_refusal"
  ADD CONSTRAINT "__review_refusal_fk_root_qvufijkx4k" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_refusal_fk_step_root_dhnaknctqw" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_result"
  ADD CONSTRAINT "__review_result_fk_root_go4w3a44a2" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_result_fk_step_root_nfnufhm5fh" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_resumed" ADD CONSTRAINT "__review_resumed_fk_target_turn_nvm252hscc" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."review_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_retry"
  ADD CONSTRAINT "__review_retry_fk_root_szjiq4sdny" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_retry_fk_step_attempt_root_fuuiurkjt7" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."review_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_review_run_finish_output"
  ADD CONSTRAINT "__review_review_run_finish_output_fk_root_ttnfn2lndg" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_review_run_finish_output_fk_step_root_2c63nc4bm4" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_review_run_input" ADD CONSTRAINT "__review_review_run_input_fk_root_nkwzzml3bh" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_review_run_input_sizes"
  ADD CONSTRAINT "__review_review_run_input_sizes_fk_root_otll5lik2n" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_review_run_input_sizes_fk_scope_root_qld3u5js7a" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."review_review_run_input" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_review_run_input_sizes_fk_scope_pred_2ecx6mfelf" FOREIGN KEY ("__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav", "root") REFERENCES "slice_den"."review_review_run_input_sizes" ("scope", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_save_input" ADD CONSTRAINT "__review_save_input_fk_root_75g3g3e6l3" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_save_output"
  ADD CONSTRAINT "__review_save_output_fk_root_v6vey436ah" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_save_output_fk_step_root_5hdksxptvu" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__review_save_output_fk_step_root_jzs34zo56u" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_save_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_saved"
  ADD CONSTRAINT "__review_saved_fk_from_root_sm7hkqib23" FOREIGN KEY ("from", "root") REFERENCES "slice_den"."review_questions_finish_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_saved_fk_root_4xrfr45gdd" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_saved_fk_to_root_owp4kjzfm6" FOREIGN KEY ("to", "root") REFERENCES "slice_den"."review_save_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_scope" ADD CONSTRAINT "__review_scope_fk_root_xio6pw6voh" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_skipped"
  ADD CONSTRAINT "__review_skipped_fk_by_ry2tc7ng2c" FOREIGN KEY ("by") REFERENCES "slice_den"."review_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_skipped_fk_root_pp4l3yk33h" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_skipped_fk_scope_fduacpn4ws" FOREIGN KEY ("scope") REFERENCES "slice_den"."review_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_split"
  ADD CONSTRAINT "__review_split_fk_from_root_ep5f5t573x" FOREIGN KEY ("from", "root") REFERENCES "slice_den"."review_gather_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_split_fk_root_7vz6jy3jnt" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_split_fk_to_root_ilwolhg4sy" FOREIGN KEY ("to", "root") REFERENCES "slice_den"."review_questions_input" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_start_scope"
  ADD CONSTRAINT "__review_start_scope_fk_child_root_ntci6w5prg" FOREIGN KEY ("child", "root") REFERENCES "slice_den"."review_scope" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__review_start_scope_fk_root_ijnygpifkq" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_start_scope_fk_scope_root_4dnwn3qe7t" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."review_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_start_step"
  ADD CONSTRAINT "__review_start_step_fk_root_qixpuodpgi" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_start_step_fk_scope_root_ex5wrmacrb" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."review_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__review_start_step_fk_step_root_e5z3u72syf" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."review_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_step"
  ADD CONSTRAINT "__review_step_fk_root_s325zhfm22" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_step_fk_scope_root_eb2a3dvk6c" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."review_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_within"
  ADD CONSTRAINT "__review_within_fk_parent_root_4wk35gfdq4" FOREIGN KEY ("parent", "root") REFERENCES "slice_den"."review_scope" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__review_within_fk_root_ksa5lhbp2j" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_within_fk_scope_root_e63iwx6wm2" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."review_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_admitted"
  ADD CONSTRAINT "__sync_admitted_fk_root_pazobscutb" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_admitted_fk_scope_root_ieiyxemub7" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."sync_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_build_input" ADD CONSTRAINT "__sync_build_input_fk_root_qlycqp6gk2" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_build_output"
  ADD CONSTRAINT "__sync_build_output_fk_root_grwezm3fcr" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_build_output_fk_step_root_o3zx5hom3t" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_build_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_build_output_fk_step_root_aksn6onpma" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_claim"
  ADD CONSTRAINT "__sync_claim_fk_root_4qbs7pxn2t" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_claim_fk_step_root_gvtcn764xc" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_claim_fk_step_pred_attempt_root_aeg32ogl5b" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."sync_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_copy_input" ADD CONSTRAINT "__sync_copy_input_fk_root_d7u63yuxxs" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_copy_output"
  ADD CONSTRAINT "__sync_copy_output_fk_root_x2xt2l75vg" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_copy_output_fk_step_root_65fyg7xb6t" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_copy_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_copy_output_fk_step_root_gfjlcri22w" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_done" ADD CONSTRAINT "__sync_done_fk_root_kbt6t66k7r" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_ended"
  ADD CONSTRAINT "__sync_ended_fk_root_6yfa76vqgo" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_ended_fk_step_attempt_root_43aj3jw3bk" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_exclusive" ADD CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" FOREIGN KEY ("kind", "key", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."sync_released" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_exclusive_key"
  ADD CONSTRAINT "__sync_exclusive_key_fk_root_jfvgxfgxk7" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_exclusive_key_fk_scope_root_cl36evoxyb" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."sync_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_exhausted"
  ADD CONSTRAINT "__sync_exhausted_fk_root_w5rujdfs5u" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_exhausted_fk_step_root_vd7jhdnvet" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_failed" ADD CONSTRAINT "__sync_failed_fk_root_utdobwjqln" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_fenced"
  ADD CONSTRAINT "__sync_fenced_fk_root_pft7kt3u6c" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_fenced_fk_step_attempt_root_ddezsoici7" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."sync_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_finish"
  ADD CONSTRAINT "__sync_finish_fk_root_jesvnqpmqt" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_finish_fk_scope_root_bjgk4nxo7e" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."sync_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_finish_fk_step_root_mmscezhzyq" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_gold_finish_output"
  ADD CONSTRAINT "__sync_gold_finish_output_fk_root_w6bne6fmx4" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_gold_finish_output_fk_step_root_2qkffyqtvq" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_gold_input" ADD CONSTRAINT "__sync_gold_input_fk_root_dearji3wtq" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_held"
  ADD CONSTRAINT "__sync_held_fk_root_62s5pmsoqa" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_held_fk_step_attempt_root_46zydmfnyy" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_held_fk_step_root_waydyqivsc" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_paused" ADD CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."sync_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_refusal"
  ADD CONSTRAINT "__sync_refusal_fk_root_3f2zmczqcu" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_refusal_fk_step_root_igzyfxl4o3" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_released" ADD CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" FOREIGN KEY ("kind", "key", "turn") REFERENCES "slice_den"."sync_exclusive" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_result"
  ADD CONSTRAINT "__sync_result_fk_root_vnymla3qhz" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_result_fk_step_root_x2umddyh22" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_resumed" ADD CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."sync_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_retry"
  ADD CONSTRAINT "__sync_retry_fk_root_wl34w4vs2m" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_retry_fk_step_attempt_root_wr6wrg43i4" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."sync_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_scope" ADD CONSTRAINT "__sync_scope_fk_root_whqzszw2jj" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_skipped"
  ADD CONSTRAINT "__sync_skipped_fk_by_zsxc5osgwh" FOREIGN KEY ("by") REFERENCES "slice_den"."sync_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_skipped_fk_root_33hfwafoud" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_skipped_fk_scope_33qsksdlcc" FOREIGN KEY ("scope") REFERENCES "slice_den"."sync_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_start_step"
  ADD CONSTRAINT "__sync_start_step_fk_root_2jg4xkdldt" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_start_step_fk_scope_root_vedcbu54xe" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."sync_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_start_step_fk_step_root_jas4o3xkqs" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_step"
  ADD CONSTRAINT "__sync_step_fk_root_rmc4nivt3i" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_step_fk_scope_root_sfdyvsar2y" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."sync_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_sync_run_finish_output"
  ADD CONSTRAINT "__sync_sync_run_finish_output_fk_root_khqmodw54k" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_sync_run_finish_output_fk_step_root_n3vgglnveu" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."sync_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."sync_sync_run_input" ADD CONSTRAINT "__sync_sync_run_input_fk_root_ifd4bfberz" FOREIGN KEY ("root") REFERENCES "slice_den"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_admitted"
  ADD CONSTRAINT "__writeback_admitted_fk_root_zzhx3ymsmx" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_admitted_fk_scope_root_bgkzavlmet" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."writeback_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_claim"
  ADD CONSTRAINT "__writeback_claim_fk_root_7agc267qm7" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_claim_fk_step_root_vh7k4u5nuz" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_claim_fk_step_pred_attempt_root_qpbpmxuik3" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl", "root") REFERENCES "slice_den"."writeback_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_deliver_input" ADD CONSTRAINT "__writeback_deliver_input_fk_root_khq2esrmmb" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_deliver_output"
  ADD CONSTRAINT "__writeback_deliver_output_fk_root_e4xa5oep52" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_deliver_output_fk_step_root_3p47hjlrfd" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_deliver_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_deliver_output_fk_step_root_trjdigghf7" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_done" ADD CONSTRAINT "__writeback_done_fk_root_3lnpe5h2ex" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_ended"
  ADD CONSTRAINT "__writeback_ended_fk_root_h7zxc3wrem" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_ended_fk_step_attempt_root_laqrk2e3dt" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."writeback_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_exhausted"
  ADD CONSTRAINT "__writeback_exhausted_fk_root_m3qvioeeek" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_exhausted_fk_step_root_cwhwzf2upp" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_failed" ADD CONSTRAINT "__writeback_failed_fk_root_ddkqjmy3le" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_fenced"
  ADD CONSTRAINT "__writeback_fenced_fk_root_cishzkxig6" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_fenced_fk_step_attempt_root_7uikhcfpkf" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."writeback_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_finish"
  ADD CONSTRAINT "__writeback_finish_fk_root_4suiathayz" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_finish_fk_scope_root_rp7v2vj6l6" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."writeback_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_finish_fk_step_root_7ny2yumuvy" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_held"
  ADD CONSTRAINT "__writeback_held_fk_root_dady3frmfj" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_held_fk_step_attempt_root_2i7p4i2alp" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."writeback_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_held_fk_step_root_7yahu5vvit" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_paused" ADD CONSTRAINT "__writeback_paused_fk_target_pred_turn_rvsgo6wgpe" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."writeback_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_refusal"
  ADD CONSTRAINT "__writeback_refusal_fk_root_hbzez4kebv" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_refusal_fk_step_root_xf2b5o76fl" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_result"
  ADD CONSTRAINT "__writeback_result_fk_root_2ds3etg4pt" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_result_fk_step_root_52vlcqzy4o" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_resumed" ADD CONSTRAINT "__writeback_resumed_fk_target_turn_vfx6l6vk75" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."writeback_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_retry"
  ADD CONSTRAINT "__writeback_retry_fk_root_7expqnzkek" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_retry_fk_step_attempt_root_5cwcgqo5s7" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice_den"."writeback_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_scope" ADD CONSTRAINT "__writeback_scope_fk_root_7hgmsmhohr" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_skipped"
  ADD CONSTRAINT "__writeback_skipped_fk_by_dm2bpfflyw" FOREIGN KEY ("by") REFERENCES "slice_den"."writeback_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_skipped_fk_root_a3d7uviq7u" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_skipped_fk_scope_veikkumie6" FOREIGN KEY ("scope") REFERENCES "slice_den"."writeback_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_start_step"
  ADD CONSTRAINT "__writeback_start_step_fk_root_r7w5ogs6pb" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_start_step_fk_scope_root_dnvan4vxav" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."writeback_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_start_step_fk_step_root_zuw7g6khi3" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_step"
  ADD CONSTRAINT "__writeback_step_fk_root_ikezfkedwk" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_step_fk_scope_root_htnuvc75ao" FOREIGN KEY ("scope", "root") REFERENCES "slice_den"."writeback_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_writeback_finish_output"
  ADD CONSTRAINT "__writeback_writeback_finish_output_fk_root_jvtr4eenzd" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_writeback_finish_output_fk_step_root_fygai72drs" FOREIGN KEY ("step", "root") REFERENCES "slice_den"."writeback_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_writeback_input" ADD CONSTRAINT "__writeback_writeback_input_fk_root_mwnbphwqvk" FOREIGN KEY ("root") REFERENCES "slice_den"."writeback_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;
