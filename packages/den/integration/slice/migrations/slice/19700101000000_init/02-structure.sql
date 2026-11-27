CREATE TABLE "slice"."assigned" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assigned_pk_72xowecbf7" PRIMARY KEY ("learner")
);

CREATE TABLE "slice"."built" (
  "build" "slice"."__domain_gfw43vigph" NOT NULL,
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

CREATE TABLE "slice_den"."assign_asked_fobgfofknpfgd" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_asked_fobgfofknpfgd_pk_zwuexn4abr" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__assign_asked_fobgfofknpfgd_key_root_to_mdnjlh3dek" UNIQUE NULLS DISTINCT ("root", "to")
);

CREATE TABLE "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_finish_output_dehjnhpeahpgb_pk_3tpsskfebg" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_pk_wnc37cjl4x" PRIMARY KEY ("root", "scope", "ordinal")
);

CREATE TABLE "slice_den"."assign_assignment_input_kijoknpmnpomn" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice_den"."assign_assignment_input_mode_pgalmghonldnf" NOT NULL,
  "__tag_kind_assignment_q5nqvzv6jc" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__assign_assignment_input_kijoknpmnpomn_pk_k6qs6m5nlk" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_nearest_jdmfgbfmpepjd_3ygubwe7ee" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_within_iahlinklmdadj_k3dzzitlnz" PRIMARY KEY ("root", "scope"),
  CONSTRAINT "assign_assignment_input_mode_within_radius_finite_njplimeeipeph" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_assignment_input_near_acilimddcfjog" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" double precision NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_pk_3b3jxdxtxb" PRIMARY KEY ("root", "scope", "ordinal"),
  CONSTRAINT "assign_assignment_input_near_value_finite_kpcjlfeibffeg" CHECK (("value" > '-Infinity'::double precision AND "value" < 'Infinity'::double precision) IS TRUE)
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

CREATE TABLE "slice_den"."assign_decide_input_exclude_bpjgmijefddch" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_pk_tl6llpszmv" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."assign_decide_input_ffhdojphbdjfc" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "vector" "vector_ext"."vector"(4) NOT NULL,
  "mode" "slice_den"."assign_decide_input_mode_beoibaghjodnf" NOT NULL,
  CONSTRAINT "__assign_decide_input_ffhdojphbdjfc_pk_coujgrn4eb" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__assign_decide_input_ffhdojphbdjfc_norm_vector_574jeenfoa" CHECK (("vector_ext"."vector_norm"("vector") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_nearest_ijgbegdphofca_pk_rubjswnurd" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_within_fgbilcoafbdcg_pk_ofuuhlrd6i" PRIMARY KEY ("root", "step"),
  CONSTRAINT "assign_decide_input_mode_within_radius_finite_mliibcfoddjpg" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_output_fkgbaoobeoima" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "confidence" double precision NOT NULL,
  "stage" "slice_den"."assign_decide_output_stage_bjoijbfcegdbp" NOT NULL,
  CONSTRAINT "__assign_decide_output_fkgbaoobeoima_pk_fytzodueb7" PRIMARY KEY ("root", "step"),
  CONSTRAINT "assign_decide_output_confidence_finite_jkfldpdgbfbba" CHECK (("confidence" > '-Infinity'::double precision AND "confidence" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_rest_gohjkdlkfnkca_pk_l7dwonp6ee" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_serve_chfjeagmkjoef_pk_tctme2k4gh" PRIMARY KEY ("root", "step"),
  CONSTRAINT "assign_decide_output_stage_serve_distance_finite_gcbpokkoipkec" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  "passed" boolean NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_pk_gd5vrg65vs" PRIMARY KEY ("root", "step", "ordinal"),
  CONSTRAINT "assign_decide_output_weighed_distance_finite_icehkmadhmajc" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_pk_hgofogcnrm" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."assign_decide_read_seen_oahojgbpphboo" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_pk_uhxwelhv6p" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."assign_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_done_pk_gzil7jvxpz" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_pk_zvylolnf22" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."assign_embed_input_kmlepfpdepkmo" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice_den"."assign_embed_input_mode_pblkjdhncepei" NOT NULL,
  CONSTRAINT "__assign_embed_input_kmlepfpdepkmo_pk_6ageqzpcpl" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__assign_embed_input_mode_nearest_bdiihcbmhfojp_pk_cqwp7cc3ts" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_embed_input_mode_within_oiehjhalkkkfi_pk_3ksbmmvu4t" PRIMARY KEY ("root", "step"),
  CONSTRAINT "assign_embed_input_mode_within_radius_finite_lgaddooipdeme" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_embed_input_near_dhffcaodkgemm" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" double precision NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_pk_t6epbwf2fm" PRIMARY KEY ("root", "step", "ordinal"),
  CONSTRAINT "assign_embed_input_near_value_finite_ahmgcoehfjngc" CHECK (("value" > '-Infinity'::double precision AND "value" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice_den"."assign_embed_output_ghdpbieopfmkd" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "vector" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_pk_5ayauadfhj" PRIMARY KEY ("root", "step"),
  CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_norm_vector_bnzkcziwkn" CHECK (("vector_ext"."vector_norm"("vector") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
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

CREATE TABLE "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_chain_run_finish_output_lhniobmdeemdb_pk_zzbczikpuw" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_chain_run_input_glnkafcnkbnnn" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."chain_chain_run_input_feed_dcnlhjpledlkf" NOT NULL,
  "pages" bigint NOT NULL,
  "__tag_kind_chain_run_ccthhdybqw" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__chain_chain_run_input_glnkafcnkbnnn_pk_alztg3akrz" PRIMARY KEY ("root", "scope")
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

CREATE TABLE "slice_den"."chain_next_bbflpfpnlejpm" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_next_bbflpfpnlejpm_pk_ghpdyk35dn" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__chain_next_bbflpfpnlejpm_key_root_to_yisnmqzugp" UNIQUE NULLS DISTINCT ("root", "to")
);

CREATE TABLE "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_ordered_finish_output_nnemphmmfdblb_pk_chmuvmc35e" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_ordered_input_pbjpmafopnahk" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."chain_ordered_input_feed_hbpmfpphpfngm" NOT NULL,
  "pages" bigint NOT NULL,
  "__tag_kind_ordered_ms3hwzrkhl" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__chain_ordered_input_pbjpmafopnahk_pk_43j3r5c3o6" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."chain_page_input_after_gdigbcabbnakb" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_page_input_after_gdigbcabbnakb_pk_xtmsbhhw4n" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_page_input_jhliinhchcgno" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "feed" "slice_den"."chain_page_input_feed_nlhfmgjplihkf" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "pages" bigint NOT NULL,
  CONSTRAINT "__chain_page_input_jhliinhchcgno_pk_mtccxzfik6" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_page_output_dniojohpmhcee" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "items" bigint NOT NULL,
  "earlier" bigint NOT NULL,
  CONSTRAINT "__chain_page_output_dniojohpmhcee_pk_bcssky66vu" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_page_output_next_pocjijjpkpono" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__chain_page_output_next_pocjijjpkpono_pk_c6mpadk5z3" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."chain_page_read_earlier_dgehlbgebidjc" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_pk_f3kwzbcmi6" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."chain_page_read_tree_items_cokakfjlndgem" (
  "digest" "slice"."__sha256" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  "__copy_items_2mdhsp2eir" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_pk_f2wweyhnbt" PRIMARY KEY ("digest", "at"),
  CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_key_wkzkgwjxor" UNIQUE NULLS DISTINCT ("digest", "__pred_at_xktcobhsti"),
  CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_check_lww3zgpudy" CHECK (("at" < "__copy_items_2mdhsp2eir") IS TRUE)
);

CREATE TABLE "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" (
  "digest" "slice"."__sha256" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_tree_items_first_ocgolceclfbii_pk_d4rydnykbr" PRIMARY KEY ("digest", "at")
);

CREATE TABLE "slice_den"."chain_page_read_tree_lakencnpkciin" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_tree_lakencnpkciin_pk_3jp64uzlas" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."chain_page_read_weights_agiabippcbobb" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__chain_page_read_weights_agiabippcbobb_pk_lgg2rkx6aa" PRIMARY KEY ("root", "step", "ordinal")
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

CREATE TABLE "slice_den"."clock_chime_input_bfjhiocgaifco" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__clock_chime_input_bfjhiocgaifco_pk_ict4u2hucx" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_chime_output_bddonoddgecmi" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__clock_chime_output_bddonoddgecmi_pk_5oymimh556" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."clock_close_input_bajjphdpmhlbc" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__clock_close_input_bajjphdpmhlbc_pk_3vzvxcu52b" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_close_output_aoheikcdnbjpp" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__clock_close_output_aoheikcdnbjpp_pk_lsp35zfxi7" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_hourly_finish_output_mgokiakijlfbi_pk_tfaztk3rrt" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_hourly_input_nknibbhbedpnl" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "hour" bigint NOT NULL,
  "bell" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_hourly_axvj7zlyzy" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__clock_hourly_input_nknibbhbedpnl_pk_edrc5sftv5" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."clock_hourly_key_cnlgnmcbbcgma" (
  "root" "slice"."__sha256" NOT NULL,
  "at" bigint NOT NULL,
  "member" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "member_digest" "slice"."__sha256" GENERATED ALWAYS AS ("slice"."__text_digest_2x5x4iwe4m"("member")) STORED NOT NULL,
  CONSTRAINT "__clock_hourly_key_cnlgnmcbbcgma_pk_5jtg5z5hg7" PRIMARY KEY ("root"),
  CONSTRAINT "__clock_hourly_key_cnlgnmcbbcgma_key_at_member_p7vwfwrkdp" UNIQUE NULLS DISTINCT ("at", "member_digest")
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

CREATE TABLE "slice_den"."clock_sitting_finish_output_aahppmdaoafco" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__clock_sitting_finish_output_aahppmdaoafco_pk_rcyafn5tdb" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."clock_sitting_input_bckcjcndffgmo" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "deadline" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "__tag_kind_sitting_zbhu3onph5" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__clock_sitting_input_bckcjcndffgmo_pk_txnxjhnoqp" PRIMARY KEY ("root", "scope")
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

CREATE TABLE "slice_den"."fan_batch_finish_output_djinnhndkglgj" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_batch_finish_output_djinnhndkglgj_pk_yuf2jtxwsr" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_batch_input_hjhhnklpfiilh" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__fan_batch_input_hjhhnklpfiilh_pk_3f46cdvt7m" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."fan_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "holds" "slice"."__domain_gfw43vigph" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  "__pred_holds_lq7itfruzz" bigint GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "holds"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_claim_pk_e7zimqppco" PRIMARY KEY ("root", "step", "attempt"),
  CONSTRAINT "__fan_claim_key_root_step_attempt_holds_zpvvoill72" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "holds")
);

CREATE TABLE "slice_den"."fan_done" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_done_pk_5u65252q52" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_dust_input_lelfhikaelkja" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_dust_input_lelfhikaelkja_pk_7ebhfuvwoi" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_dust_output_pgpcjjjdmhkim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_pk_fbuwhsiybg" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_fan_run_finish_output_kcmicfckgdcip_pk_wnlgvoqkj2" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_fan_run_input_bghibckinpfgk" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "__tag_kind_fan_run_2liqlumqkj" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__fan_fan_run_input_bghibckinpfgk_pk_3ly3t6qubv" PRIMARY KEY ("root", "scope")
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
  "__copy_holds_hfzvk7t2xc" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__fan_hold_pk_avuqdkljvb" PRIMARY KEY ("resource", "root", "step", "attempt"),
  CONSTRAINT "__fan_hold_key_root_step_attempt_at_vy3k4db54f" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "at"),
  CONSTRAINT "__fan_hold_key_root_step_attempt_pred_at_pr3hqe44bn" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "__pred_at_xktcobhsti"),
  CONSTRAINT "__fan_hold_check_fan_hold_ordered_fan_claim_holds_zint2b2ifk" CHECK (("at" < "__copy_holds_hfzvk7t2xc") IS TRUE)
);

CREATE TABLE "slice_den"."fan_mop_input_ngghbiaegmghl" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_mop_input_ngghbiaegmghl_pk_pfew5tb3ab" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_mop_output_okmfngilefbec" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__fan_mop_output_okmfngilefbec_pk_wk2mcyimwx" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."fan_square_input_ifddbjkaokoig" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "n" bigint NOT NULL,
  CONSTRAINT "__fan_square_input_ifddbjkaokoig_pk_kuqh53xx3z" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_square_output_gofcfljmlelgo" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "square" bigint NOT NULL,
  CONSTRAINT "__fan_square_output_gofcfljmlelgo_pk_spxndagxwh" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."fan_sweep_finish_output_nebomlkgaabji" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_sweep_finish_output_nebomlkgaabji_pk_ou34mhle6p" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_sweep_input_bnmfcblhkahec" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_sweep_4lmrlblufr" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__fan_sweep_input_bnmfcblhkahec_pk_tiq7siogma" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__fan_wanted_finish_output_lmjmjmcffnbda_pk_dkncit67lr" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."fan_wanted_input_nfecjpihiaope" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "__tag_kind_wanted_lpgalpid4g" smallint GENERATED ALWAYS AS (2::smallint) STORED NOT NULL,
  CONSTRAINT "__fan_wanted_input_nfecjpihiaope_pk_uy3dkbftrt" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."fan_wanted_key_ldjmcglkghhjb" (
  "root" "slice"."__sha256" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "batch_digest" "slice"."__sha256" GENERATED ALWAYS AS ("slice"."__text_digest_2x5x4iwe4m"("batch")) STORED NOT NULL,
  CONSTRAINT "__fan_wanted_key_ldjmcglkghhjb_pk_l7sqyrkhjn" PRIMARY KEY ("root"),
  CONSTRAINT "__fan_wanted_key_ldjmcglkghhjb_key_batch_digest_xh3pwd4kw5" UNIQUE NULLS DISTINCT ("batch_digest")
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

CREATE TABLE "slice_den"."retry_brittle_input_jbcpaiekdedpp" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_brittle_input_jbcpaiekdedpp_pk_ceqqpqbj6x" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_brittle_output_bajcdgadpoeak" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_pk_nycwwzjoc4" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_ladders_finish_output_pgebkobjaoiih_pk_h43obho42w" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_ladders_input_fkbbgblmfmhbi" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_ladders_amjml3bobr" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__retry_ladders_input_fkbbgblmfmhbi_pk_p42vp772df" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."retry_patient_input_ndliolfjpjnoc" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_patient_input_ndliolfjpjnoc_pk_hcegriyn3i" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_patient_output_geoaicaaojcfl" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_patient_output_geoaicaaojcfl_pk_aivxf2sigt" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_paused" (
  "target" "slice_den"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__retry_paused_pk_umm2nscqny" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."retry_polite_input_iopjdjgdhfide" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_polite_input_iopjdjgdhfide_pk_of6ihcilhh" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_polite_output_nicaghgpaemah" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_polite_output_nicaghgpaemah_pk_hf7mayw6mu" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."retry_steadfast_input_ebanfagjeadim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_steadfast_input_ebanfagjeadim_pk_6t725e3tkx" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_steadfast_output_aacklbgjpefbn" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_pk_jdxwdga2zr" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."retry_throttled_finish_output_plgallgljmddo" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_throttled_finish_output_plgallgljmddo_pk_pto4qhajx7" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_throttled_input_bfjgfamhjmgcd" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_throttled_uy63hl6qg7" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__retry_throttled_input_bfjgfamhjmgcd_pk_b5jzz74k4s" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__retry_unhurried_finish_output_oipogmdgcfehf_pk_dwhrndpy7r" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."retry_unhurried_input_mccbdnleajjif" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_unhurried_yf3vrtngno" smallint GENERATED ALWAYS AS (2::smallint) STORED NOT NULL,
  CONSTRAINT "__retry_unhurried_input_mccbdnleajjif_pk_s2jaabfvgq" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."review_admitted" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_admitted_pk_woy7ee4y4p" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."review_analyze_input_aobppbhebnkae" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "question" bigint NOT NULL,
  CONSTRAINT "__review_analyze_input_aobppbhebnkae_pk_3tlc6zf5fm" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_analyze_output_fhhkmphnmpkdm" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "score" bigint NOT NULL,
  CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_pk_g4ekrcfpqs" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_claim" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "holds" "slice"."__domain_gfw43vigph" NOT NULL,
  "__root_yewsvvtcyz" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  "__pred_attempt_oey4tm5xyl" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  "__pred_holds_lq7itfruzz" bigint GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "holds"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_claim_pk_twa72qaol7" PRIMARY KEY ("root", "step", "attempt"),
  CONSTRAINT "__review_claim_key_root_step_attempt_holds_djm3xecw7o" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "holds")
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

CREATE TABLE "slice_den"."review_gather_input_eiadkjkkdoiel" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "review" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__review_gather_input_eiadkjkkdoiel_pk_gbhb3ypdne" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" bigint NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_pk_jxjbxczykn" PRIMARY KEY ("root", "step", "ordinal")
);

CREATE TABLE "slice_den"."review_gather_output_cgnhmechbiddp" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "groups" bigint NOT NULL,
  CONSTRAINT "__review_gather_output_cgnhmechbiddp_pk_qpwnlmlqdo" PRIMARY KEY ("root", "step")
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
  "__copy_holds_a7bsyj5c52" bigint NOT NULL,
  "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_hold_pk_uhb6w3fp5v" PRIMARY KEY ("resource", "root", "step", "attempt"),
  CONSTRAINT "__review_hold_key_root_step_attempt_at_6p3v4lr6zi" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "at"),
  CONSTRAINT "__review_hold_key_root_step_attempt_pred_at_adiit7mrkk" UNIQUE NULLS DISTINCT ("root", "step", "attempt", "__pred_at_xktcobhsti"),
  CONSTRAINT "__review_hold_check_review_hold_ordered_review_claim_icnqunpnlb" CHECK (("at" < "__copy_holds_a7bsyj5c52") IS TRUE)
);

CREATE TABLE "slice_den"."review_paused" (
  "target" "slice_den"."review_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_paused_pk_eamccblv6g" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice_den"."review_questions_finish_output_kddidbknbjeof" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "count" bigint NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__review_questions_finish_output_kddidbknbjeof_pk_2cnmu5tf7m" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_questions_input_jigaomgjefjfk" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__review_questions_input_jigaomgjefjfk_pk_2ile5frqdz" PRIMARY KEY ("root", "scope")
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

CREATE TABLE "slice_den"."review_review_run_finish_output_fbgeikbjoigci" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_review_run_finish_output_fbgeikbjoigci_pk_ufirbwdncv" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_review_run_input_hpdfjnehnkdig" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_review_run_npquoqpyk4" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__review_review_run_input_hpdfjnehnkdig_pk_uu3dl3vtxh" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" bigint NOT NULL,
  "__root_yjobx7uyrd" "pg_catalog"."bytea" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  "__pred_ordinal_e545zctcav" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_pk_dtnjsveolt" PRIMARY KEY ("root", "scope", "ordinal")
);

CREATE TABLE "slice_den"."review_root" (
  "root" "slice"."__sha256" NOT NULL,
  "kind" "slice_den"."review_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__review_root_pk_btvrw2kxvs" PRIMARY KEY ("root"),
  CONSTRAINT "__review_root_key_root_kind_g7dcwn7ekf" UNIQUE NULLS DISTINCT ("root", "kind")
);

CREATE TABLE "slice_den"."review_save_input_njbdjgekhblef" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "group" bigint NOT NULL,
  "count" bigint NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__review_save_input_njbdjgekhblef_pk_6fwlixpogh" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_save_output_falmopiohdlkl" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__review_save_output_falmopiohdlkl_pk_dnqpezok2g" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."review_saved_bppbpjmhcjbaa" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_saved_bppbpjmhcjbaa_pk_q2r2gf3bdn" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__review_saved_bppbpjmhcjbaa_key_root_to_z2jurtmyzn" UNIQUE NULLS DISTINCT ("root", "to")
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

CREATE TABLE "slice_den"."review_split_fnhnebdnlfmck" (
  "root" "slice"."__sha256" NOT NULL,
  "from" "slice"."__sha256" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__review_split_fnhnebdnlfmck_pk_gxhaowqucs" PRIMARY KEY ("root", "from", "ordinal"),
  CONSTRAINT "__review_split_fnhnebdnlfmck_key_root_to_7pjeefvp6x" UNIQUE NULLS DISTINCT ("root", "to")
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

CREATE TABLE "slice_den"."sync_build_input_khidlilbdjpfi" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "build" bigint NOT NULL,
  CONSTRAINT "__sync_build_input_khidlilbdjpfi_pk_yiblgl4ug3" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_build_output_ianmlfhgbcfli" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "build" bigint NOT NULL,
  CONSTRAINT "__sync_build_output_ianmlfhgbcfli_pk_ru726tgkge" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."sync_copy_input_fijfgeannmgef" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  CONSTRAINT "__sync_copy_input_fijfgeannmgef_pk_x637sg5i4d" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_copy_output_cfficoloepjbj" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "run" bigint NOT NULL,
  CONSTRAINT "__sync_copy_output_cfficoloepjbj_pk_ezbqmrrvgu" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."sync_gold_finish_output_hkddafacepdaa" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_gold_finish_output_hkddafacepdaa_pk_ikmympt4ul" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_gold_input_edhkhlceilnoh" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "build" bigint NOT NULL,
  "__tag_kind_gold_phmoz6zyym" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__sync_gold_input_edhkhlceilnoh_pk_4ql6udln3j" PRIMARY KEY ("root", "scope")
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

CREATE TABLE "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__sync_sync_run_finish_output_inlpehpebjlbl_pk_srsl36z6ta" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."sync_sync_run_input_kmejgmkijpoho" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  "__tag_kind_sync_run_wmr74dvsia" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL,
  CONSTRAINT "__sync_sync_run_input_kmejgmkijpoho_pk_zoeaw7tohu" PRIMARY KEY ("root", "scope")
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

CREATE TABLE "slice_den"."writeback_deliver_input_libhnkibecamc" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__writeback_deliver_input_libhnkibecamc_pk_h4vvbwdrkh" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_deliver_output_ppecogpmgbpek" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_pk_kpnn2ovjgk" PRIMARY KEY ("root", "step")
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

CREATE TABLE "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" (
  "root" "slice"."__sha256" NOT NULL,
  "step" "slice"."__sha256" NOT NULL,
  CONSTRAINT "__writeback_writeback_finish_output_mhjodpondhejh_pk_2nlialojia" PRIMARY KEY ("root", "step")
);

CREATE TABLE "slice_den"."writeback_writeback_input_ljafdhfgfeocc" (
  "root" "slice"."__sha256" NOT NULL,
  "scope" "slice"."__sha256" NOT NULL,
  "attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "__tag_kind_writeback_7zc6o24iqm" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL,
  CONSTRAINT "__writeback_writeback_input_ljafdhfgfeocc_pk_oysiafmamn" PRIMARY KEY ("root", "scope")
);

CREATE TABLE "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" (
  "digest" "slice"."__sha256" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "distance" double precision NOT NULL,
  CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_row_pk_kw4c6ij55o" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" (
  "digest" "slice"."__sha256" NOT NULL,
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_row_pk_hmwq5jneqq" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_row_pk_elsmuyerwp" PRIMARY KEY ("digest")
);

CREATE TABLE "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  "items" "slice"."__domain_gfw43vigph" NOT NULL,
  "__pred_items_3qltx5cx27" bigint GENERATED ALWAYS AS (CASE WHEN "items" > 0::bigint THEN "items"::numeric - (1::bigint)::numeric END) STORED,
  CONSTRAINT "__chain_page_read_tree_lakencnpkciin_row_pk_7ub4nebjwy" PRIMARY KEY ("digest"),
  CONSTRAINT "__chain_page_read_tree_lakencnpkciin_row_key_digest_jplhxi7kvh" UNIQUE NULLS DISTINCT ("digest", "items")
);

CREATE TABLE "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" (
  "digest" "slice"."__sha256" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_weights_agiabippcbobb_row_pk_n7j4766hix" PRIMARY KEY ("digest")
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_asked_fobgfofknpfgd"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_exclude_paaebdpkimebl"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_kijoknpmnpomn"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_assignment_input_near_acilimddcfjog"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input_exclude_bpjgmijefddch"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input_ffhdojphbdjfc"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output_fkgbaoobeoima"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_decide_read_seen_oahojgbpphboo"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_kmlepfpdepkmo"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_input_near_dhffcaodkgemm"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."assign_embed_output_ghdpbieopfmkd"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_chain_run_input_glnkafcnkbnnn"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_next_bbflpfpnlejpm"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_ordered_finish_output_nnemphmmfdblb"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_ordered_input_pbjpmafopnahk"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_input_after_gdigbcabbnakb"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_input_jhliinhchcgno"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_output_dniojohpmhcee"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_output_next_pocjijjpkpono"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_earlier_dgehlbgebidjc"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_tree_items_cokakfjlndgem"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_tree_lakencnpkciin"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."chain_page_read_weights_agiabippcbobb"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_chime_input_bfjhiocgaifco"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_chime_output_bddonoddgecmi"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_close_input_bajjphdpmhlbc"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_close_output_aoheikcdnbjpp"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_hourly_finish_output_mgokiakijlfbi"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_hourly_input_nknibbhbedpnl"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_hourly_key_cnlgnmcbbcgma"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_sitting_finish_output_aahppmdaoafco"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."clock_sitting_input_bckcjcndffgmo"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_batch_finish_output_djinnhndkglgj"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_batch_input_hjhhnklpfiilh"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_dust_input_lelfhikaelkja"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_dust_output_pgpcjjjdmhkim"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_fan_run_input_bghibckinpfgk"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_mop_input_ngghbiaegmghl"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_mop_output_okmfngilefbec"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_square_input_ifddbjkaokoig"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_square_output_gofcfljmlelgo"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_sweep_finish_output_nebomlkgaabji"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_sweep_input_bnmfcblhkahec"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_wanted_input_nfecjpihiaope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_wanted_key_ldjmcglkghhjb"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."fan_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_brittle_input_jbcpaiekdedpp"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_brittle_output_bajcdgadpoeak"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_ladders_finish_output_pgebkobjaoiih"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_ladders_input_fkbbgblmfmhbi"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_patient_input_ndliolfjpjnoc"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_patient_output_geoaicaaojcfl"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_polite_input_iopjdjgdhfide"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_polite_output_nicaghgpaemah"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_steadfast_input_ebanfagjeadim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_steadfast_output_aacklbgjpefbn"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_throttled_finish_output_plgallgljmddo"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_throttled_input_bfjgfamhjmgcd"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."retry_unhurried_input_mccbdnleajjif"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_analyze_input_aobppbhebnkae"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_analyze_output_fhhkmphnmpkdm"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_gather_input_eiadkjkkdoiel"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_gather_output_cgnhmechbiddp"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_hold"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_questions_finish_output_kddidbknbjeof"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_questions_input_jigaomgjefjfk"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_review_run_finish_output_fbgeikbjoigci"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_review_run_input_hpdfjnehnkdig"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_save_input_njbdjgekhblef"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_save_output_falmopiohdlkl"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_saved_bppbpjmhcjbaa"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."review_split_fnhnebdnlfmck"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_build_input_khidlilbdjpfi"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_build_output_ianmlfhgbcfli"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_copy_input_fijfgeannmgef"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_copy_output_cfficoloepjbj"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_gold_finish_output_hkddafacepdaa"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_gold_input_edhkhlceilnoh"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."sync_sync_run_input_kmejgmkijpoho"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_deliver_input_libhnkibecamc"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_deliver_output_ppecogpmgbpek"
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
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_writeback_finish_output_mhjodpondhejh"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."writeback_writeback_input_ljafdhfgfeocc"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar"
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
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_assign_claim_attempt_h744pvqs3v" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_fan_claim_attempt_u34lm72lgr"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_fan_claim_attempt_u34lm72lgr" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_retry_claim_attempt_exbl6vgycp"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_retry_claim_attempt_exbl6vgycp" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_review_claim_attempt_lsmvyy7ajm"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("__children_1" "slice"."__sha256"[], "__children_2" "slice"."__sha256"[]) RETURNS SETOF "slice_den"."__head_writeback_claim_attempt_pk673p2jar"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RETURN QUERY WITH "r1"("c1", "c2", "c3", "c4") AS ( INSERT INTO "slice_den"."__head_writeback_claim_attempt_pk673p2jar" AS "r2" ("root", "step", "attempt", "__stamper") SELECT DISTINCT "r3"."c1", ("__children_2")["r3"."c2"], 0::bigint, "pg_catalog"."pg_current_xact_id"() FROM "pg_catalog"."unnest"("__children_1") WITH ORDINALITY AS "r3"("c1", "c2") ORDER BY "r3"."c1", ("__children_2")["r3"."c2"] ON CONFLICT ("root", "step") DO UPDATE SET "attempt" = CASE WHEN "r2"."__stamper" = "pg_catalog"."pg_current_xact_id"() THEN "r2"."attempt" ELSE "r2"."attempt" + 1::bigint END, "__stamper" = "pg_catalog"."pg_current_xact_id"() RETURNING "r2"."root" AS "c1", "r2"."step" AS "c2", "r2"."attempt" AS "c3", "r2"."__stamper" AS "c4" ) SELECT "r1"."c1", "r1"."c2", "r1"."c3", "r1"."c4" FROM "r1" ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]) FROM PUBLIC;

ALTER TABLE "slice_den"."assign_admitted" ADD CONSTRAINT "__assign_admitted_fk_root_scope_unmbbqjvuz" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_asked_fobgfofknpfgd"
  ADD CONSTRAINT "__assign_asked_fobgfofknpfgd_fk_root_from_35uqbuzjjo" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_asked_fobgfofknpfgd_fk_root_from_ksrpucwlti" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."assign_embed_output_ghdpbieopfmkd" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_asked_fobgfofknpfgd_fk_root_to_xpsfkprixb" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."assign_decide_input_ffhdojphbdjfc" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb"
  ADD CONSTRAINT "__assign_assignment_finish_output_dehjnhpeahpgb_fk_j3bzoyrvtb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_finish_output_dehjnhpeahpgb_fk_etpvd34xps" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_input_exclude_paaebdpkimebl"
  ADD CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_fk_t25jpjbxg2" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_fk_pbgkyy77xx" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_assignment_input_kijoknpmnpomn" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_fk_huhwy3lwrj" FOREIGN KEY ("__root_yjobx7uyrd", "scope", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" ("root", "scope", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_input_kijoknpmnpomn"
  ADD CONSTRAINT "__assign_assignment_input_kijoknpmnpomn_fk_root_bdcba6qkay" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_input_kijoknpmnpomn_fk_scope_tag_hey7gpaebu" FOREIGN KEY ("scope", "__tag_kind_assignment_q5nqvzv6jc") REFERENCES "slice_den"."assign_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_jdmfgbfmpepjd_cdgcr7vuyz" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" ADD CONSTRAINT "__assign_assignment_input_mode_within_iahlinklmdadj_2qq5eqnfnl" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."assign_assignment_input_near_acilimddcfjog"
  ADD CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_fk_root_yxvw5ogs6d" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_fk_root_abhxul37bo" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."assign_assignment_input_kijoknpmnpomn" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_fk_root_iy7m2e4j23" FOREIGN KEY ("__root_yjobx7uyrd", "scope", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."assign_assignment_input_near_acilimddcfjog" ("root", "scope", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_claim"
  ADD CONSTRAINT "__assign_claim_fk_root_step_z35ulxscvt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_claim_fk_root_step_pred_attempt_bt5m6xhi43" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."assign_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input_exclude_bpjgmijefddch"
  ADD CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_fk_root_hdjjv4jedq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_fk_root_xhtn6pkixs" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_decide_input_ffhdojphbdjfc" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_fk_root_n5pioavbnr" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."assign_decide_input_exclude_bpjgmijefddch" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input_ffhdojphbdjfc" ADD CONSTRAINT "__assign_decide_input_ffhdojphbdjfc_fk_root_step_dc5aytpksr" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" ADD CONSTRAINT "__assign_decide_input_mode_nearest_ijgbegdphofca_fk_xcu3pbhawz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" ADD CONSTRAINT "__assign_decide_input_mode_within_fgbilcoafbdcg_fk_4elatiofnt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_output_fkgbaoobeoima"
  ADD CONSTRAINT "__assign_decide_output_fkgbaoobeoima_fk_root_step_rngb7c4gsl" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_decide_output_fkgbaoobeoima_fk_root_step_2k5ng7smh6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_fkgbaoobeoima_fk_root_step_3qv26zke3x" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_decide_input_ffhdojphbdjfc" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" ADD CONSTRAINT "__assign_decide_output_stage_rest_gohjkdlkfnkca_fk_5nhffvarrx" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" ADD CONSTRAINT "__assign_decide_output_stage_serve_chfjeagmkjoef_fk_uy6iyqr4oj" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb"
  ADD CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_fk_root_wf2rdhtsvy" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_fk_root_bpnbtzvn3m" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_decide_output_fkgbaoobeoima" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_fk_root_ecyjf5hsks" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi"
  ADD CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_fk_digest_6eir4ph3xl" FOREIGN KEY ("digest") REFERENCES "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_fk_root_gvzoo3lxd5" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_fk_root_wpbngffwnm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_decide_read_seen_oahojgbpphboo"
  ADD CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_fk_digest_qqd5rjiap2" FOREIGN KEY ("digest") REFERENCES "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_fk_root_step_i3t2je4ud6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_fk_root_step_rvhg25udcl" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_done" ADD CONSTRAINT "__assign_done_fk_root_step_jnpyqphpod" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj"
  ADD CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_fk_root_vl5pmkbzlv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_fk_root_mad3jtgvb3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_embed_input_kmlepfpdepkmo" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_fk_root_j6kft7kxym" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_kmlepfpdepkmo" ADD CONSTRAINT "__assign_embed_input_kmlepfpdepkmo_fk_root_step_d3pnfjciyv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" ADD CONSTRAINT "__assign_embed_input_mode_nearest_bdiihcbmhfojp_fk_tdszs7ethi" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" ADD CONSTRAINT "__assign_embed_input_mode_within_oiehjhalkkkfi_fk_quiawspd5m" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_input_near_dhffcaodkgemm"
  ADD CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_fk_root_step_g3tjla4bwp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_fk_root_step_r37njts5tt" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_embed_input_kmlepfpdepkmo" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_fk_root_step_in4vutxgdi" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."assign_embed_input_near_dhffcaodkgemm" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."assign_embed_output_ghdpbieopfmkd"
  ADD CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_fk_root_step_kifvgvihp4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_fk_root_step_qyxicekhha" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_fk_root_step_ptwq3bxxbz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."assign_embed_input_kmlepfpdepkmo" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb"
  ADD CONSTRAINT "__chain_chain_run_finish_output_lhniobmdeemdb_fk_byyc7fcoc7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_chain_run_finish_output_lhniobmdeemdb_fk_hx3pepn2ki" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_chain_run_input_glnkafcnkbnnn"
  ADD CONSTRAINT "__chain_chain_run_input_glnkafcnkbnnn_fk_root_scope_ofevnrxiou" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_chain_run_input_glnkafcnkbnnn_fk_scope_tag_khrz236c3q" FOREIGN KEY ("scope", "__tag_kind_chain_run_ccthhdybqw") REFERENCES "slice_den"."chain_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."chain_next_bbflpfpnlejpm"
  ADD CONSTRAINT "__chain_next_bbflpfpnlejpm_fk_root_from_ttb3r2e3wo" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_bbflpfpnlejpm_fk_root_from_s23iaz7k4t" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."chain_page_output_dniojohpmhcee" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_bbflpfpnlejpm_fk_root_to_25czrorqdi" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."chain_page_input_jhliinhchcgno" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_ordered_finish_output_nnemphmmfdblb"
  ADD CONSTRAINT "__chain_ordered_finish_output_nnemphmmfdblb_fk_root_prd5vpo6nw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_ordered_finish_output_nnemphmmfdblb_fk_root_glxwffdxca" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_ordered_input_pbjpmafopnahk"
  ADD CONSTRAINT "__chain_ordered_input_pbjpmafopnahk_fk_root_scope_4wbbqttwrc" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."chain_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_ordered_input_pbjpmafopnahk_fk_scope_tag_2cg2jugtjz" FOREIGN KEY ("scope", "__tag_kind_ordered_ms3hwzrkhl") REFERENCES "slice_den"."chain_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_input_after_gdigbcabbnakb"
  ADD CONSTRAINT "__chain_page_input_after_gdigbcabbnakb_fk_root_step_2a5gepmdde" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_input_after_gdigbcabbnakb_fk_root_step_ucbqoyoryv" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_page_input_jhliinhchcgno" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_input_jhliinhchcgno" ADD CONSTRAINT "__chain_page_input_jhliinhchcgno_fk_root_step_brqgvf5ues" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_output_dniojohpmhcee"
  ADD CONSTRAINT "__chain_page_output_dniojohpmhcee_fk_root_step_e6oabafyfi" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_page_output_dniojohpmhcee_fk_root_step_ix6wkewdmc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_dniojohpmhcee_fk_root_step_fyaqgoqxlm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_page_input_jhliinhchcgno" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_output_next_pocjijjpkpono"
  ADD CONSTRAINT "__chain_page_output_next_pocjijjpkpono_fk_root_step_jkq5323gej" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_next_pocjijjpkpono_fk_root_step_hfgxjmvswz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_page_output_dniojohpmhcee" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_earlier_dgehlbgebidjc"
  ADD CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_fk_digest_fliospbzhi" FOREIGN KEY ("digest") REFERENCES "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_fk_root_step_bqcbnwxoj3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_fk_root_step_bkqwbd5ush" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_tree_items_cokakfjlndgem"
  ADD CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_fk_digest_4modrznro7" FOREIGN KEY ("digest", "__copy_items_2mdhsp2eir") REFERENCES "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" ("digest", "items") MATCH SIMPLE ON UPDATE CASCADE,
  ADD CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_fk_digest_pbqepdotso" FOREIGN KEY ("digest", "__pred_at_xktcobhsti") REFERENCES "slice_den"."chain_page_read_tree_items_cokakfjlndgem" ("digest", "at") MATCH SIMPLE;

ALTER TABLE "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" ADD CONSTRAINT "__chain_page_read_tree_items_first_ocgolceclfbii_fk_mgphk6o3je" FOREIGN KEY ("digest", "at") REFERENCES "slice_den"."chain_page_read_tree_items_cokakfjlndgem" ("digest", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_tree_lakencnpkciin"
  ADD CONSTRAINT "__chain_page_read_tree_lakencnpkciin_fk_digest_ldmoxivlxi" FOREIGN KEY ("digest") REFERENCES "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_tree_lakencnpkciin_fk_root_step_frbz4lpc64" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_tree_lakencnpkciin_fk_root_step_o4fqqo6wla" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."chain_page_read_weights_agiabippcbobb"
  ADD CONSTRAINT "__chain_page_read_weights_agiabippcbobb_fk_digest_ftgcofflar" FOREIGN KEY ("digest") REFERENCES "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" ("digest") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_weights_agiabippcbobb_fk_root_step_rv2po42axm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_read_weights_agiabippcbobb_fk_root_step_qutwvqfwtk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."chain_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."clock_chime_input_bfjhiocgaifco" ADD CONSTRAINT "__clock_chime_input_bfjhiocgaifco_fk_root_step_rw6melas6n" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_chime_output_bddonoddgecmi"
  ADD CONSTRAINT "__clock_chime_output_bddonoddgecmi_fk_root_step_w4ercimpde" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_chime_output_bddonoddgecmi_fk_root_step_ehiybcrd66" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_chime_output_bddonoddgecmi_fk_root_step_akiu5mtl5b" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_chime_input_bfjhiocgaifco" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_claim"
  ADD CONSTRAINT "__clock_claim_fk_root_step_hnkgjikniq" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_claim_fk_root_step_pred_attempt_s6bkkwaqnz" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."clock_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_close_input_bajjphdpmhlbc" ADD CONSTRAINT "__clock_close_input_bajjphdpmhlbc_fk_root_step_p545f5xf2t" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_close_output_aoheikcdnbjpp"
  ADD CONSTRAINT "__clock_close_output_aoheikcdnbjpp_fk_root_step_5v6cfjvcfn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_close_output_aoheikcdnbjpp_fk_root_step_rs2wlcsyjf" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__clock_close_output_aoheikcdnbjpp_fk_root_step_nrqhnj225k" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_close_input_bajjphdpmhlbc" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."clock_hourly_finish_output_mgokiakijlfbi"
  ADD CONSTRAINT "__clock_hourly_finish_output_mgokiakijlfbi_fk_root_6ekvrq7ufc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_hourly_finish_output_mgokiakijlfbi_fk_root_rcsiczixsr" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_hourly_input_nknibbhbedpnl"
  ADD CONSTRAINT "__clock_hourly_input_nknibbhbedpnl_fk_root_scope_q3vtb26evr" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_hourly_input_nknibbhbedpnl_fk_scope_tag_kind_uvs7k5nmzl" FOREIGN KEY ("scope", "__tag_kind_hourly_axvj7zlyzy") REFERENCES "slice_den"."clock_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."clock_sitting_finish_output_aahppmdaoafco"
  ADD CONSTRAINT "__clock_sitting_finish_output_aahppmdaoafco_fk_root_xbwfmykyln" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_sitting_finish_output_aahppmdaoafco_fk_root_tyh3x5vbe2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."clock_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."clock_sitting_input_bckcjcndffgmo"
  ADD CONSTRAINT "__clock_sitting_input_bckcjcndffgmo_fk_root_scope_famaduuyyq" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."clock_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__clock_sitting_input_bckcjcndffgmo_fk_scope_tag_aynkte3ofn" FOREIGN KEY ("scope", "__tag_kind_sitting_zbhu3onph5") REFERENCES "slice_den"."clock_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."fan_batch_finish_output_djinnhndkglgj"
  ADD CONSTRAINT "__fan_batch_finish_output_djinnhndkglgj_fk_root_step_wtpatcsbbc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_batch_finish_output_djinnhndkglgj_fk_root_step_4dfjcha3ug" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_batch_input_hjhhnklpfiilh" ADD CONSTRAINT "__fan_batch_input_hjhhnklpfiilh_fk_root_scope_daf7lh3cft" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_claim"
  ADD CONSTRAINT "__fan_claim_fk_root_step_2xkxna4wne" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_root_step_attempt_pred_holds_6ej2el2klx" FOREIGN KEY ("root", "step", "attempt", "__pred_holds_lq7itfruzz") REFERENCES "slice_den"."fan_hold" ("root", "step", "attempt", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_root_step_pred_attempt_thlj3gkwmg" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."fan_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_done" ADD CONSTRAINT "__fan_done_fk_root_step_snckhrcktc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_dust_input_lelfhikaelkja" ADD CONSTRAINT "__fan_dust_input_lelfhikaelkja_fk_root_step_ij3vde62k2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_dust_output_pgpcjjjdmhkim"
  ADD CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_fk_root_step_reqrpfthlf" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_fk_root_step_ig6drxonbd" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_fk_root_step_feq4d25qhc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_dust_input_lelfhikaelkja" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_ended"
  ADD CONSTRAINT "__fan_ended_fk_root_step_g7lfuycwwy" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_ended_fk_root_step_attempt_sludbzdnea" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."fan_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_exclusive" ADD CONSTRAINT "__fan_exclusive_fk_kind_key_pred_turn_dyvewabv75" FOREIGN KEY ("kind", "key", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."fan_released" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_exclusive_key" ADD CONSTRAINT "__fan_exclusive_key_fk_root_scope_w4wlpmkbb6" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_exhausted"
  ADD CONSTRAINT "__fan_exhausted_fk_root_step_lfol3zhscm" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_exhausted_fk_root_step_txucm4khfj" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_failed" ADD CONSTRAINT "__fan_failed_fk_root_step_e3uoiynnze" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip"
  ADD CONSTRAINT "__fan_fan_run_finish_output_kcmicfckgdcip_fk_root_p5prfna6ey" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_fan_run_finish_output_kcmicfckgdcip_fk_root_3kvjuutpt3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_fan_run_input_bghibckinpfgk"
  ADD CONSTRAINT "__fan_fan_run_input_bghibckinpfgk_fk_root_scope_epacvxotoj" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_fan_run_input_bghibckinpfgk_fk_scope_tag_kind_6mn6hzbxps" FOREIGN KEY ("scope", "__tag_kind_fan_run_2liqlumqkj") REFERENCES "slice_den"."fan_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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
  ADD CONSTRAINT "__fan_hold_fk_root_step_attempt_copy_holds_hnnbabpski" FOREIGN KEY ("root", "step", "attempt", "__copy_holds_hfzvk7t2xc") REFERENCES "slice_den"."fan_claim" ("root", "step", "attempt", "holds") MATCH SIMPLE ON UPDATE CASCADE,
  ADD CONSTRAINT "__fan_hold_fk_root_step_attempt_pred_at_lene3l2wo7" FOREIGN KEY ("root", "step", "attempt", "__pred_at_xktcobhsti") REFERENCES "slice_den"."fan_hold" ("root", "step", "attempt", "at") MATCH SIMPLE;

ALTER TABLE "slice_den"."fan_mop_input_ngghbiaegmghl" ADD CONSTRAINT "__fan_mop_input_ngghbiaegmghl_fk_root_step_5tt7fxp6mw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_mop_output_okmfngilefbec"
  ADD CONSTRAINT "__fan_mop_output_okmfngilefbec_fk_root_step_od5s5f26ry" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_mop_output_okmfngilefbec_fk_root_step_muit6plxnd" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_mop_output_okmfngilefbec_fk_root_step_4zdvoczmj3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_mop_input_ngghbiaegmghl" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."fan_square_input_ifddbjkaokoig" ADD CONSTRAINT "__fan_square_input_ifddbjkaokoig_fk_root_step_6hz2vcplr3" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_square_output_gofcfljmlelgo"
  ADD CONSTRAINT "__fan_square_output_gofcfljmlelgo_fk_root_step_vosc66fdyu" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_square_output_gofcfljmlelgo_fk_root_step_s4wnsqlied" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_square_output_gofcfljmlelgo_fk_root_step_6bae22x6wh" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_square_input_ifddbjkaokoig" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."fan_sweep_finish_output_nebomlkgaabji"
  ADD CONSTRAINT "__fan_sweep_finish_output_nebomlkgaabji_fk_root_step_psgd5sq3q2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_sweep_finish_output_nebomlkgaabji_fk_root_step_phqkivzlcs" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_sweep_input_bnmfcblhkahec"
  ADD CONSTRAINT "__fan_sweep_input_bnmfcblhkahec_fk_root_scope_nu6n3ulq77" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_sweep_input_bnmfcblhkahec_fk_scope_tag_kind_56crixfthm" FOREIGN KEY ("scope", "__tag_kind_sweep_4lmrlblufr") REFERENCES "slice_den"."fan_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda"
  ADD CONSTRAINT "__fan_wanted_finish_output_lmjmjmcffnbda_fk_root_dlmd5n5s6x" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_wanted_finish_output_lmjmjmcffnbda_fk_root_v27dfd5fwc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."fan_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_wanted_input_nfecjpihiaope"
  ADD CONSTRAINT "__fan_wanted_input_nfecjpihiaope_fk_root_scope_szs26jwm6f" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_wanted_input_nfecjpihiaope_fk_scope_tag_kind_ovipsq45eq" FOREIGN KEY ("scope", "__tag_kind_wanted_lpgalpid4g") REFERENCES "slice_den"."fan_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."fan_within"
  ADD CONSTRAINT "__fan_within_fk_root_parent_7jmxi4kbha" FOREIGN KEY ("root", "parent") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_within_fk_root_scope_s4ljjlq6zp" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."fan_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_admitted" ADD CONSTRAINT "__retry_admitted_fk_root_scope_4whpx2yoko" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_brittle_input_jbcpaiekdedpp" ADD CONSTRAINT "__retry_brittle_input_jbcpaiekdedpp_fk_root_step_5iwkaevmim" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_brittle_output_bajcdgadpoeak"
  ADD CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_fk_root_step_7isjgtifrp" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_fk_root_step_hmorypfg7m" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_fk_root_step_neill3zaoz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_brittle_input_jbcpaiekdedpp" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."retry_ladders_finish_output_pgebkobjaoiih"
  ADD CONSTRAINT "__retry_ladders_finish_output_pgebkobjaoiih_fk_root_bdk6uwjijf" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_ladders_finish_output_pgebkobjaoiih_fk_root_cc4naafs7e" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_ladders_input_fkbbgblmfmhbi"
  ADD CONSTRAINT "__retry_ladders_input_fkbbgblmfmhbi_fk_root_scope_dscc4f5g5a" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_ladders_input_fkbbgblmfmhbi_fk_scope_tag_apshlwxk2o" FOREIGN KEY ("scope", "__tag_kind_ladders_amjml3bobr") REFERENCES "slice_den"."retry_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_patient_input_ndliolfjpjnoc" ADD CONSTRAINT "__retry_patient_input_ndliolfjpjnoc_fk_root_step_jf5nfrekgb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_patient_output_geoaicaaojcfl"
  ADD CONSTRAINT "__retry_patient_output_geoaicaaojcfl_fk_root_step_ccbbldop3y" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_patient_output_geoaicaaojcfl_fk_root_step_ivmvt2iaor" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_patient_output_geoaicaaojcfl_fk_root_step_q6e5xa7rlk" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_patient_input_ndliolfjpjnoc" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_paused" ADD CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."retry_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_polite_input_iopjdjgdhfide" ADD CONSTRAINT "__retry_polite_input_iopjdjgdhfide_fk_root_step_64wntnyk6c" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_polite_output_nicaghgpaemah"
  ADD CONSTRAINT "__retry_polite_output_nicaghgpaemah_fk_root_step_ybzxoswu4a" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_polite_output_nicaghgpaemah_fk_root_step_7wa4wfc3aw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_polite_output_nicaghgpaemah_fk_root_step_bzkwxwrb7g" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_polite_input_iopjdjgdhfide" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."retry_steadfast_input_ebanfagjeadim" ADD CONSTRAINT "__retry_steadfast_input_ebanfagjeadim_fk_root_step_vwjvy2iwcu" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_steadfast_output_aacklbgjpefbn"
  ADD CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_fk_root_step_gqicojr7ng" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_fk_root_step_slw4tov7rg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_fk_root_step_4ttuaowh4k" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_steadfast_input_ebanfagjeadim" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_step"
  ADD CONSTRAINT "__retry_step_fk_root_scope_xe4735gsrg" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_admitted" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_step_fk_root_scope_ubjxxgucjq" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."retry_throttled_finish_output_plgallgljmddo"
  ADD CONSTRAINT "__retry_throttled_finish_output_plgallgljmddo_fk_b5kwbg7uj2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_throttled_finish_output_plgallgljmddo_fk_avm4tyqim5" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_throttled_input_bfjgfamhjmgcd"
  ADD CONSTRAINT "__retry_throttled_input_bfjgfamhjmgcd_fk_root_scope_m3tdeepprg" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_throttled_input_bfjgfamhjmgcd_fk_scope_tag_csfxidqzuk" FOREIGN KEY ("scope", "__tag_kind_throttled_uy63hl6qg7") REFERENCES "slice_den"."retry_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf"
  ADD CONSTRAINT "__retry_unhurried_finish_output_oipogmdgcfehf_fk_dfsja4cue6" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_unhurried_finish_output_oipogmdgcfehf_fk_uoatrndcct" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."retry_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."retry_unhurried_input_mccbdnleajjif"
  ADD CONSTRAINT "__retry_unhurried_input_mccbdnleajjif_fk_root_scope_ctlpwsurlj" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."retry_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_unhurried_input_mccbdnleajjif_fk_scope_tag_famxuo3ceu" FOREIGN KEY ("scope", "__tag_kind_unhurried_yf3vrtngno") REFERENCES "slice_den"."retry_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_admitted" ADD CONSTRAINT "__review_admitted_fk_root_scope_wpazxz5qvc" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_analyze_input_aobppbhebnkae" ADD CONSTRAINT "__review_analyze_input_aobppbhebnkae_fk_root_step_gneu6his5j" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_analyze_output_fhhkmphnmpkdm"
  ADD CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_fk_root_step_jyd5erlgdd" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_fk_root_step_ok3biiie2r" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_fk_root_step_jnyfn76tag" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_analyze_input_aobppbhebnkae" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_claim"
  ADD CONSTRAINT "__review_claim_fk_root_step_7f6aefekwa" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_claim_fk_root_step_attempt_pred_holds_4fz52sncza" FOREIGN KEY ("root", "step", "attempt", "__pred_holds_lq7itfruzz") REFERENCES "slice_den"."review_hold" ("root", "step", "attempt", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
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

ALTER TABLE "slice_den"."review_gather_input_eiadkjkkdoiel" ADD CONSTRAINT "__review_gather_input_eiadkjkkdoiel_fk_root_step_bdemvpwpeg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp"
  ADD CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_fk_root_u3aopm7o27" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_fk_root_4q6x3ysvil" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_gather_input_eiadkjkkdoiel" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_fk_root_f5jkb5stoq" FOREIGN KEY ("__root_yjobx7uyrd", "step", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" ("root", "step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_gather_output_cgnhmechbiddp"
  ADD CONSTRAINT "__review_gather_output_cgnhmechbiddp_fk_root_step_vw4wqiivq7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_gather_output_cgnhmechbiddp_fk_root_step_iek5saifzo" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_gather_output_cgnhmechbiddp_fk_root_step_ak2wnwtozd" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_gather_input_eiadkjkkdoiel" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_held"
  ADD CONSTRAINT "__review_held_fk_root_step_377oxpprpb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_result" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_held_fk_root_step_6ucwevd65f" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_held_fk_root_step_attempt_43pd26ucr5" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."review_claim" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_hold"
  ADD CONSTRAINT "__review_hold_fk_root_step_attempt_copy_holds_4jxl3l2dff" FOREIGN KEY ("root", "step", "attempt", "__copy_holds_a7bsyj5c52") REFERENCES "slice_den"."review_claim" ("root", "step", "attempt", "holds") MATCH SIMPLE ON UPDATE CASCADE,
  ADD CONSTRAINT "__review_hold_fk_root_step_attempt_pred_at_sqpugy4xri" FOREIGN KEY ("root", "step", "attempt", "__pred_at_xktcobhsti") REFERENCES "slice_den"."review_hold" ("root", "step", "attempt", "at") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_paused" ADD CONSTRAINT "__review_paused_fk_target_pred_turn_rig5fmgcvc" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice_den"."review_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_questions_finish_output_kddidbknbjeof"
  ADD CONSTRAINT "__review_questions_finish_output_kddidbknbjeof_fk_lj2oliae65" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_questions_finish_output_kddidbknbjeof_fk_k6l25pt4vl" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_questions_input_jigaomgjefjfk" ADD CONSTRAINT "__review_questions_input_jigaomgjefjfk_fk_root_scope_5vetrkt5au" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_refusal"
  ADD CONSTRAINT "__review_refusal_fk_root_step_i325iogm4w" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_failed" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_refusal_fk_root_step_ksoewu53t4" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_requested_with" ADD CONSTRAINT "__review_requested_with_fk_root_qr6x7qjzy6" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_result" ADD CONSTRAINT "__review_result_fk_root_step_m7ddrhxqqw" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_resumed" ADD CONSTRAINT "__review_resumed_fk_target_turn_nvm252hscc" FOREIGN KEY ("target", "turn") REFERENCES "slice_den"."review_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_retry"
  ADD CONSTRAINT "__review_retry_fk_root_step_ifbhbgbjic" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_retry_fk_root_step_attempt_iuo24rnbik" FOREIGN KEY ("root", "step", "attempt") REFERENCES "slice_den"."review_ended" ("root", "step", "attempt") MATCH SIMPLE;

ALTER TABLE "slice_den"."review_review_run_finish_output_fbgeikbjoigci"
  ADD CONSTRAINT "__review_review_run_finish_output_fbgeikbjoigci_fk_xwrsmhid4t" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_review_run_finish_output_fbgeikbjoigci_fk_zykulei24p" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_review_run_input_hpdfjnehnkdig"
  ADD CONSTRAINT "__review_review_run_input_hpdfjnehnkdig_fk_root_qm52msb2il" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_review_run_input_hpdfjnehnkdig_fk_scope_tag_wmatfzkrvr" FOREIGN KEY ("scope", "__tag_kind_review_run_npquoqpyk4") REFERENCES "slice_den"."review_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd"
  ADD CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_fk_4pm52sixq4" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_fk_ogfrxt4co7" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_review_run_input_hpdfjnehnkdig" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_fk_cvaggknojz" FOREIGN KEY ("__root_yjobx7uyrd", "scope", "__pred_ordinal_e545zctcav") REFERENCES "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" ("root", "scope", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_save_input_njbdjgekhblef" ADD CONSTRAINT "__review_save_input_njbdjgekhblef_fk_root_step_hph2jxpy5e" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_save_output_falmopiohdlkl"
  ADD CONSTRAINT "__review_save_output_falmopiohdlkl_fk_root_step_uhq3buuxmn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__review_save_output_falmopiohdlkl_fk_root_step_dcn5fzeh3x" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_save_output_falmopiohdlkl_fk_root_step_z3szm3mfag" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."review_save_input_njbdjgekhblef" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_saved_bppbpjmhcjbaa"
  ADD CONSTRAINT "__review_saved_bppbpjmhcjbaa_fk_root_from_ugh7rl3qr3" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_saved_bppbpjmhcjbaa_fk_root_from_cft6j2vfjj" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."review_questions_finish_output_kddidbknbjeof" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_saved_bppbpjmhcjbaa_fk_root_to_d3vv6faeie" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."review_save_input_njbdjgekhblef" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_scope" ADD CONSTRAINT "__review_scope_fk_root_rc4vyqpoku" FOREIGN KEY ("root") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_skipped"
  ADD CONSTRAINT "__review_skipped_fk_by_mzoxrlpp7w" FOREIGN KEY ("by") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_skipped_fk_root_scope_o5jk25ddgb" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."review_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__review_skipped_fk_scope_zgzwa7kzos" FOREIGN KEY ("scope") REFERENCES "slice_den"."review_root" ("root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."review_split_fnhnebdnlfmck"
  ADD CONSTRAINT "__review_split_fnhnebdnlfmck_fk_root_from_fs3vq6s7ng" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."review_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_split_fnhnebdnlfmck_fk_root_from_r4ebrn52i6" FOREIGN KEY ("root", "from") REFERENCES "slice_den"."review_gather_output_cgnhmechbiddp" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__review_split_fnhnebdnlfmck_fk_root_to_r4y6o4qwyg" FOREIGN KEY ("root", "to") REFERENCES "slice_den"."review_questions_input_jigaomgjefjfk" ("root", "scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."sync_build_input_khidlilbdjpfi" ADD CONSTRAINT "__sync_build_input_khidlilbdjpfi_fk_root_step_tarspcft2d" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_build_output_ianmlfhgbcfli"
  ADD CONSTRAINT "__sync_build_output_ianmlfhgbcfli_fk_root_step_4zzwcwh744" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_build_output_ianmlfhgbcfli_fk_root_step_jr7bqlhkwb" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_build_output_ianmlfhgbcfli_fk_root_step_zi6kl54fmz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_build_input_khidlilbdjpfi" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_claim"
  ADD CONSTRAINT "__sync_claim_fk_root_step_quvtx5ttao" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_claim_fk_root_step_pred_attempt_bol6pjm3eo" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."sync_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_copy_input_fijfgeannmgef" ADD CONSTRAINT "__sync_copy_input_fijfgeannmgef_fk_root_step_xujiegk6xs" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_copy_output_cfficoloepjbj"
  ADD CONSTRAINT "__sync_copy_output_cfficoloepjbj_fk_root_step_pfqc66yuqd" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_copy_output_cfficoloepjbj_fk_root_step_c4yylopuhc" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_copy_output_cfficoloepjbj_fk_root_step_p5mfu6k6a2" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_copy_input_fijfgeannmgef" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."sync_gold_finish_output_hkddafacepdaa"
  ADD CONSTRAINT "__sync_gold_finish_output_hkddafacepdaa_fk_root_step_krjzposexg" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_gold_finish_output_hkddafacepdaa_fk_root_step_x4gplol7ba" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_gold_input_edhkhlceilnoh"
  ADD CONSTRAINT "__sync_gold_input_edhkhlceilnoh_fk_root_scope_pjza23hjnq" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_gold_input_edhkhlceilnoh_fk_scope_tag_kind_6fzo4gn2rc" FOREIGN KEY ("scope", "__tag_kind_gold_phmoz6zyym") REFERENCES "slice_den"."sync_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl"
  ADD CONSTRAINT "__sync_sync_run_finish_output_inlpehpebjlbl_fk_root_hro44mmtkn" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_sync_run_finish_output_inlpehpebjlbl_fk_root_6ofbne5u3n" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."sync_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."sync_sync_run_input_kmejgmkijpoho"
  ADD CONSTRAINT "__sync_sync_run_input_kmejgmkijpoho_fk_root_scope_ehrwdj4d7o" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."sync_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_sync_run_input_kmejgmkijpoho_fk_scope_tag_shnsvcdl5x" FOREIGN KEY ("scope", "__tag_kind_sync_run_wmr74dvsia") REFERENCES "slice_den"."sync_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_admitted" ADD CONSTRAINT "__writeback_admitted_fk_root_scope_qqqzahnyf2" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE;

ALTER TABLE "slice_den"."writeback_claim"
  ADD CONSTRAINT "__writeback_claim_fk_root_step_zg75zksbji" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_claim_fk_root_step_pred_attempt_4zvl2uw25a" FOREIGN KEY ("__root_yewsvvtcyz", "step", "__pred_attempt_oey4tm5xyl") REFERENCES "slice_den"."writeback_ended" ("root", "step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_deliver_input_libhnkibecamc" ADD CONSTRAINT "__writeback_deliver_input_libhnkibecamc_fk_root_step_zfg2qgn7ou" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_deliver_output_ppecogpmgbpek"
  ADD CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_fk_root_rshc5kjhke" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_fk_root_4wnfijqcac" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_fk_root_i4igavu5eo" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_deliver_input_libhnkibecamc" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

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

ALTER TABLE "slice_den"."writeback_writeback_finish_output_mhjodpondhejh"
  ADD CONSTRAINT "__writeback_writeback_finish_output_mhjodpondhejh_fk_7orqppjowz" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_done" ("root", "step") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_writeback_finish_output_mhjodpondhejh_fk_6mtpysqho7" FOREIGN KEY ("root", "step") REFERENCES "slice_den"."writeback_step" ("root", "step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."writeback_writeback_input_ljafdhfgfeocc"
  ADD CONSTRAINT "__writeback_writeback_input_ljafdhfgfeocc_fk_root_52sfglnunj" FOREIGN KEY ("root", "scope") REFERENCES "slice_den"."writeback_scope" ("root", "scope") MATCH SIMPLE,
  ADD CONSTRAINT "__writeback_writeback_input_ljafdhfgfeocc_fk_scope_c6ffzcrmj7" FOREIGN KEY ("scope", "__tag_kind_writeback_7zc6o24iqm") REFERENCES "slice_den"."writeback_root" ("root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" ADD CONSTRAINT "__chain_page_read_tree_lakencnpkciin_row_fk_digest_xoi5z4ltkv" FOREIGN KEY ("digest", "__pred_items_3qltx5cx27") REFERENCES "slice_den"."chain_page_read_tree_items_cokakfjlndgem" ("digest", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;
