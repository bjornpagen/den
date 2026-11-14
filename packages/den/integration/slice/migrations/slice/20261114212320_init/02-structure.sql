CREATE TABLE "slice"."audit" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "note" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__audit_pk_dcvpvv5cjz" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."built" (
  "build" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__built_pk_5tj25hcq6k" PRIMARY KEY ("build")
);

CREATE TABLE "slice"."chain_admitted" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" PRIMARY KEY ("scope")
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

CREATE TABLE "slice"."chain_done" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_done_pk_tyyx2hmu3r" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_due" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__chain_due_pk_d5xdvmzepr" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_exhausted" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempts" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_failed" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."chain_fenced" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" PRIMARY KEY ("step", "attempt")
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

CREATE TABLE "slice"."chain_ordered_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "feed" "slice"."chain_ordered_input_feed" NOT NULL,
  "pages" bigint NOT NULL,
  CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" PRIMARY KEY ("scope")
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

CREATE TABLE "slice"."chain_page_read" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_page_read_pk_yets7gftg6" PRIMARY KEY ("step", "ordinal")
);

CREATE TABLE "slice"."chain_paused" (
  "target" "slice"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_paused_pk_oorovhvyps" PRIMARY KEY ("target", "turn")
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

CREATE TABLE "slice"."chain_resumed" (
  "target" "slice"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."chain_retry" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  CONSTRAINT "__chain_retry_pk_522nodru3s" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."chain_root" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__chain_root_pk_wqfycdg3x5" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."chain_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."chain_join" NOT NULL,
  CONSTRAINT "__chain_scope_pk_fxzt444lf6" PRIMARY KEY ("scope"),
  CONSTRAINT "__chain_scope_key_scope_kind_f3gtwiklfd" UNIQUE NULLS DISTINCT ("scope", "kind")
);

CREATE TABLE "slice"."chain_skipped" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "by" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" PRIMARY KEY ("scope")
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

CREATE TABLE "slice"."fan_admitted" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" PRIMARY KEY ("scope")
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

CREATE TABLE "slice"."fan_done" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_done_pk_5u65252q52" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_due" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__fan_due_pk_yc6ppd3zm6" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_exhausted" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempts" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_failed" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_failed_pk_z4etp5dmax" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_fan_run_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."fan_fenced" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_fenced_pk_6tkvirerez" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."fan_finish" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_finish_pk_6mb33urjra" PRIMARY KEY ("scope"),
  CONSTRAINT "__fan_finish_key_step_v72sacijwp" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."fan_freed" (
  "resource" "slice"."fan_resource" NOT NULL,
  "seat" "slice"."__domain_gfw43vigph" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_freed_pk_r3csmayfa7" PRIMARY KEY ("resource", "seat", "turn")
);

CREATE TABLE "slice"."fan_held" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_held_pk_4ic6tjvac4" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."fan_hold" (
  "resource" "slice"."fan_resource" NOT NULL,
  "seat" "slice"."__domain_gfw43vigph" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "holder" "slice"."__domain_jotafzuj2i" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__fan_hold_pk_avuqdkljvb" PRIMARY KEY ("resource", "seat", "turn"),
  CONSTRAINT "seat_below_count" CHECK (("seat" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "resource" + 1, 1)::integer, 0) - 1 + 1]) IS TRUE)
);

CREATE TABLE "slice"."fan_paused" (
  "target" "slice"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" PRIMARY KEY ("target", "turn")
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

CREATE TABLE "slice"."fan_resumed" (
  "target" "slice"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."fan_retry" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  CONSTRAINT "__fan_retry_pk_7xubce4v66" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."fan_root" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__fan_root_pk_jesu7xtefn" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."fan_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."fan_join" NOT NULL,
  CONSTRAINT "__fan_scope_pk_7bvjfihnef" PRIMARY KEY ("scope"),
  CONSTRAINT "__fan_scope_key_scope_kind_epdwnzjh52" UNIQUE NULLS DISTINCT ("scope", "kind")
);

CREATE TABLE "slice"."fan_skipped" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "by" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__fan_skipped_pk_22erbmfzer" PRIMARY KEY ("scope")
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

CREATE TABLE "slice"."order" (
  "order" "slice"."__text_t4rwovzmqj" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  CONSTRAINT "__order_pk_qodq3est7o" PRIMARY KEY ("order")
);

CREATE TABLE "slice"."retry_admitted" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_admitted_pk_qyp7cminjx" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."retry_brittle_input" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_brittle_output" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_claim" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "holder" "slice"."__domain_jotafzuj2i" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__retry_claim_pk_aayzt5ni6z" PRIMARY KEY ("step", "attempt"),
  CONSTRAINT "attempt_from_one" CHECK (("attempt" >= 1::bigint) IS TRUE)
);

CREATE TABLE "slice"."retry_done" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_done_pk_vtkpce7rkq" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_due" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__retry_due_pk_lerzzlnz7o" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_exhausted" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempts" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_exhausted_pk_v56c23krid" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_failed" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_failed_pk_mygc4onczp" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_fenced" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_fenced_pk_umzicmiruo" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."retry_finish" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" PRIMARY KEY ("scope"),
  CONSTRAINT "__retry_finish_key_step_lifwe43hve" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."retry_held" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_held_pk_nvgeylmjp2" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_ladders_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."retry_paused" (
  "target" "slice"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_paused_pk_umm2nscqny" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."retry_refusal" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_refusal_pk_nifndsd6pp" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_result" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "outcome" "slice"."retry_outcome" NOT NULL,
  CONSTRAINT "__retry_result_pk_5fegihvmml" PRIMARY KEY ("step"),
  CONSTRAINT "__retry_result_key_step_outcome_vx2zehdpf7" UNIQUE NULLS DISTINCT ("step", "outcome")
);

CREATE TABLE "slice"."retry_resumed" (
  "target" "slice"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."retry_retry" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  CONSTRAINT "__retry_retry_pk_slrwn4rt5d" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."retry_root" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__retry_root_pk_qi2iw36jky" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."retry_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."retry_join" NOT NULL,
  CONSTRAINT "__retry_scope_pk_fgji2phvxy" PRIMARY KEY ("scope"),
  CONSTRAINT "__retry_scope_key_scope_kind_u77uvbp4xb" UNIQUE NULLS DISTINCT ("scope", "kind")
);

CREATE TABLE "slice"."retry_skipped" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "by" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_skipped_pk_au5z33ql7a" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."retry_start_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_start_scope_pk_wsif6notdn" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__retry_start_scope_key_child_6csfbzabat" UNIQUE NULLS DISTINCT ("child")
);

CREATE TABLE "slice"."retry_start_step" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_start_step_pk_mp77csmi26" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__retry_start_step_key_step_bbqb64zg6p" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."retry_steadfast_input" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_steadfast_output" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."retry_step" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."retry_kind" NOT NULL,
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_step_pk_opjqidwhzg" PRIMARY KEY ("step"),
  CONSTRAINT "__retry_step_key_step_kind_aacvsq3pqx" UNIQUE NULLS DISTINCT ("step", "kind")
);

CREATE TABLE "slice"."retry_within" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "parent" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__retry_within_pk_t64odgwbuc" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."settled" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__settled_pk_yitdz6z3ts" PRIMARY KEY ("batch")
);

CREATE TABLE "slice"."sync_admitted" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_admitted_pk_ral53o3fpi" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."sync_build_input" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "build" bigint NOT NULL,
  CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_build_output" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "build" bigint NOT NULL,
  CONSTRAINT "__sync_build_output_pk_rhnco3epch" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_claim" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "holder" "slice"."__domain_jotafzuj2i" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__sync_claim_pk_s2tqnziq4u" PRIMARY KEY ("step", "attempt"),
  CONSTRAINT "attempt_from_one" CHECK (("attempt" >= 1::bigint) IS TRUE)
);

CREATE TABLE "slice"."sync_copy_input" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_copy_output" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "run" bigint NOT NULL,
  CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_done" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_done_pk_nllomjb7og" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_due" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__sync_due_pk_hkeoswqthe" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_exclusive" (
  "kind" "slice"."sync_join" NOT NULL,
  "key" "slice"."__domain_jotafzuj2i" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_exclusive_pk_joiibnjuvf" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice"."sync_exclusive_key" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "id" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."sync_exhausted" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempts" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_failed" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_failed_pk_gqykngewxb" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_fenced" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."sync_finish" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_finish_pk_hn7tmx25xc" PRIMARY KEY ("scope"),
  CONSTRAINT "__sync_finish_key_step_wzmqfzha66" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."sync_gold_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "build" bigint NOT NULL,
  CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."sync_held" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_held_pk_wsme4moka4" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_paused" (
  "target" "slice"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_paused_pk_tstk2okngj" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."sync_refusal" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__sync_refusal_pk_mbmfornc5c" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."sync_released" (
  "kind" "slice"."sync_join" NOT NULL,
  "key" "slice"."__domain_jotafzuj2i" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_released_pk_k7qaw2iram" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice"."sync_result" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "outcome" "slice"."sync_outcome" NOT NULL,
  CONSTRAINT "__sync_result_pk_jmwy2p3mqf" PRIMARY KEY ("step"),
  CONSTRAINT "__sync_result_key_step_outcome_wyar5y72qb" UNIQUE NULLS DISTINCT ("step", "outcome")
);

CREATE TABLE "slice"."sync_resumed" (
  "target" "slice"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."sync_retry" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  CONSTRAINT "__sync_retry_pk_6q52red7iw" PRIMARY KEY ("step", "attempt")
);

CREATE TABLE "slice"."sync_root" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  CONSTRAINT "__sync_root_pk_daktpubfe2" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."sync_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."sync_join" NOT NULL,
  CONSTRAINT "__sync_scope_pk_bg72sm6p4z" PRIMARY KEY ("scope"),
  CONSTRAINT "__sync_scope_key_scope_kind_unp3injvzz" UNIQUE NULLS DISTINCT ("scope", "kind")
);

CREATE TABLE "slice"."sync_skipped" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "by" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_skipped_pk_yutjqacvws" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."sync_start_scope" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_start_scope_pk_zsezuom4ll" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__sync_start_scope_key_child_5un3xf76pf" UNIQUE NULLS DISTINCT ("child")
);

CREATE TABLE "slice"."sync_start_step" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" PRIMARY KEY ("scope", "ordinal"),
  CONSTRAINT "__sync_start_step_key_step_qq4dgpmkqz" UNIQUE NULLS DISTINCT ("step")
);

CREATE TABLE "slice"."sync_step" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "kind" "slice"."sync_kind" NOT NULL,
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_step_pk_wfgcxdvbwo" PRIMARY KEY ("step"),
  CONSTRAINT "__sync_step_key_step_kind_wiu4mx45lf" UNIQUE NULLS DISTINCT ("step", "kind")
);

CREATE TABLE "slice"."sync_sync_run_input" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."sync_within" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "parent" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__sync_within_pk_xcfutikja2" PRIMARY KEY ("scope")
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

CREATE TABLE "slice"."__live_secret" ("secret") AS SELECT "pg_catalog"."sha256"("pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()) || "pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()));

REVOKE ALL ON TABLE "slice"."__live_secret" FROM PUBLIC;

ALTER TABLE "slice"."chain_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."chain_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."fan_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."fan_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."retry_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."retry_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."sync_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."sync_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."chain_chain_run_input" ADD COLUMN "__tag_kind_chain_run_ufow3vhuwb" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_claim"
  ADD COLUMN "__step_fxyms236d4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_xnnzpydhox" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."chain_done" ADD COLUMN "__tag_outcome_done_uhpvxcbhg2" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_failed" ADD COLUMN "__tag_outcome_failed_lrxbpw73ih" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_ordered_input" ADD COLUMN "__tag_kind_ordered_bcobbqxaja" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_page_input" ADD COLUMN "__tag_kind_page_wmj4dlxrkf" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."chain_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."fan_batch_input" ADD COLUMN "__tag_kind_batch_fkqwrqkogg" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_claim"
  ADD COLUMN "__step_fxyms236d4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_xnnzpydhox" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."fan_done" ADD COLUMN "__tag_outcome_done_tulqbccryg" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_failed" ADD COLUMN "__tag_outcome_failed_3kga3qw77n" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_fan_run_input" ADD COLUMN "__tag_kind_fan_run_eorldhk2ce" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."fan_hold" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."fan_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."fan_square_input" ADD COLUMN "__tag_kind_square_q3stoybx3v" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."retry_brittle_input" ADD COLUMN "__tag_kind_brittle_wzfwqdkbkg" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."retry_claim"
  ADD COLUMN "__step_fxyms236d4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_xnnzpydhox" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."retry_done" ADD COLUMN "__tag_outcome_done_k5wikz4kly" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."retry_failed" ADD COLUMN "__tag_outcome_failed_446fx3eezg" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."retry_ladders_input" ADD COLUMN "__tag_kind_ladders_gimfs6gp4j" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."retry_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."retry_steadfast_input" ADD COLUMN "__tag_kind_steadfast_4rudtmco65" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."sync_build_input" ADD COLUMN "__tag_kind_build_pslevsssox" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."sync_claim"
  ADD COLUMN "__step_fxyms236d4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_xnnzpydhox" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 2::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."sync_copy_input" ADD COLUMN "__tag_kind_copy_wfaj52nfh7" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."sync_done" ADD COLUMN "__tag_outcome_done_pkvv6jrgpq" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."sync_exclusive" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."sync_failed" ADD COLUMN "__tag_outcome_failed_26do6twsnf" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."sync_gold_input" ADD COLUMN "__tag_kind_gold_7mgmvxjg34" smallint GENERATED ALWAYS AS (1::smallint) STORED NOT NULL;

ALTER TABLE "slice"."sync_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."sync_sync_run_input" ADD COLUMN "__tag_kind_sync_run_wcjtzgltvo" smallint GENERATED ALWAYS AS (0::smallint) STORED NOT NULL;

ALTER TABLE "slice"."audit" ADD CONSTRAINT "__audit_fk_step_zgfyapbfme" FOREIGN KEY ("step") REFERENCES "slice"."chain_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_admitted" ADD CONSTRAINT "__chain_admitted_fk_scope_ayutazf7v2" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_chain_run_input" ADD CONSTRAINT "__chain_chain_run_input_fk_scope_tag_kind_chain_run_m37i2umurb" FOREIGN KEY ("scope", "__tag_kind_chain_run_ufow3vhuwb") REFERENCES "slice"."chain_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."chain_claim"
  ADD CONSTRAINT "__chain_claim_fk_step_tlgqnv6mzi" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_claim_fk_step_pred_attempt_eaxsvkfnat" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox") REFERENCES "slice"."chain_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_done" ADD CONSTRAINT "__chain_done_fk_step_tag_outcome_done_chiiliaypx" FOREIGN KEY ("step", "__tag_outcome_done_uhpvxcbhg2") REFERENCES "slice"."chain_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."chain_due" ADD CONSTRAINT "__chain_due_fk_step_dcq52t54ph" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_exhausted" ADD CONSTRAINT "__chain_exhausted_fk_step_fa2jqgxojj" FOREIGN KEY ("step") REFERENCES "slice"."chain_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."chain_failed" ADD CONSTRAINT "__chain_failed_fk_step_tag_outcome_failed_2enwrjafnc" FOREIGN KEY ("step", "__tag_outcome_failed_lrxbpw73ih") REFERENCES "slice"."chain_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."chain_fenced" ADD CONSTRAINT "__chain_fenced_fk_step_attempt_tr357gwkw2" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."chain_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_finish"
  ADD CONSTRAINT "__chain_finish_fk_scope_cfnzgc3ln5" FOREIGN KEY ("scope") REFERENCES "slice"."chain_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_finish_fk_step_djulfbbhyv" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_held"
  ADD CONSTRAINT "__chain_held_fk_step_gn4a3vhis4" FOREIGN KEY ("step") REFERENCES "slice"."chain_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_held_fk_step_attempt_ha67r6xn73" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."chain_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_next"
  ADD CONSTRAINT "__chain_next_fk_from_y5is7epime" FOREIGN KEY ("from") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_fk_to_4dtheiiigt" FOREIGN KEY ("to") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_ordered_input" ADD CONSTRAINT "__chain_ordered_input_fk_scope_tag_kind_ordered_hubpibwkd5" FOREIGN KEY ("scope", "__tag_kind_ordered_bcobbqxaja") REFERENCES "slice"."chain_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."chain_page_input" ADD CONSTRAINT "__chain_page_input_fk_step_tag_kind_page_iu55gzqbo5" FOREIGN KEY ("step", "__tag_kind_page_wmj4dlxrkf") REFERENCES "slice"."chain_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_input_after" ADD CONSTRAINT "__chain_page_input_after_fk_step_lfprg2mtrc" FOREIGN KEY ("step") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_output"
  ADD CONSTRAINT "__chain_page_output_fk_step_ski2uzorzn" FOREIGN KEY ("step") REFERENCES "slice"."chain_done" ("step") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_page_output_fk_step_g37yommeoy" FOREIGN KEY ("step") REFERENCES "slice"."chain_page_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_output_next" ADD CONSTRAINT "__chain_page_output_next_fk_step_azw5pfnnsa" FOREIGN KEY ("step") REFERENCES "slice"."chain_page_output" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_read" ADD CONSTRAINT "__chain_page_read_fk_step_wj2fe2lazd" FOREIGN KEY ("step") REFERENCES "slice"."chain_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_paused" ADD CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."chain_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_refusal" ADD CONSTRAINT "__chain_refusal_fk_step_bac3stmrn3" FOREIGN KEY ("step") REFERENCES "slice"."chain_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."chain_result" ADD CONSTRAINT "__chain_result_fk_step_dbmjl746t7" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_resumed" ADD CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" FOREIGN KEY ("target", "turn") REFERENCES "slice"."chain_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_retry" ADD CONSTRAINT "__chain_retry_fk_step_attempt_ezek5vymkn" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."chain_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_root" ADD CONSTRAINT "__chain_root_fk_scope_g7gu2qhyp2" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_skipped"
  ADD CONSTRAINT "__chain_skipped_fk_by_6rnf2fiiiy" FOREIGN KEY ("by") REFERENCES "slice"."chain_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_skipped_fk_scope_ozicxyda6o" FOREIGN KEY ("scope") REFERENCES "slice"."chain_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_start_scope"
  ADD CONSTRAINT "__chain_start_scope_fk_child_bz3czs5on4" FOREIGN KEY ("child") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_start_scope_fk_scope_j7b72gqt5h" FOREIGN KEY ("scope") REFERENCES "slice"."chain_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."chain_start_step"
  ADD CONSTRAINT "__chain_start_step_fk_scope_fo4zcmg3hw" FOREIGN KEY ("scope") REFERENCES "slice"."chain_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_start_step_fk_step_yqr6ccimjq" FOREIGN KEY ("step") REFERENCES "slice"."chain_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_step" ADD CONSTRAINT "__chain_step_fk_scope_gig4dsmris" FOREIGN KEY ("scope") REFERENCES "slice"."chain_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."chain_within"
  ADD CONSTRAINT "__chain_within_fk_parent_n3pon4mlxe" FOREIGN KEY ("parent") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_within_fk_scope_gzdy7afflv" FOREIGN KEY ("scope") REFERENCES "slice"."chain_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_admitted" ADD CONSTRAINT "__fan_admitted_fk_scope_zsdeiuzwyh" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_batch_input" ADD CONSTRAINT "__fan_batch_input_fk_scope_tag_kind_batch_b6gxzmmqsm" FOREIGN KEY ("scope", "__tag_kind_batch_fkqwrqkogg") REFERENCES "slice"."fan_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."fan_claim"
  ADD CONSTRAINT "__fan_claim_fk_step_ihp5bkdfc7" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_step_pred_attempt_r5pt5cwztz" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox") REFERENCES "slice"."fan_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_done" ADD CONSTRAINT "__fan_done_fk_step_tag_outcome_done_jagqpg3plp" FOREIGN KEY ("step", "__tag_outcome_done_tulqbccryg") REFERENCES "slice"."fan_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."fan_due" ADD CONSTRAINT "__fan_due_fk_step_ddpvumwcis" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_exhausted" ADD CONSTRAINT "__fan_exhausted_fk_step_j42evr2xp3" FOREIGN KEY ("step") REFERENCES "slice"."fan_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."fan_failed" ADD CONSTRAINT "__fan_failed_fk_step_tag_outcome_failed_isdm7nl2mt" FOREIGN KEY ("step", "__tag_outcome_failed_3kga3qw77n") REFERENCES "slice"."fan_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."fan_fan_run_input" ADD CONSTRAINT "__fan_fan_run_input_fk_scope_tag_kind_fan_run_tihneov63d" FOREIGN KEY ("scope", "__tag_kind_fan_run_eorldhk2ce") REFERENCES "slice"."fan_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."fan_fenced" ADD CONSTRAINT "__fan_fenced_fk_step_attempt_ykbq3jv4ri" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."fan_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_finish"
  ADD CONSTRAINT "__fan_finish_fk_scope_7bafbqarll" FOREIGN KEY ("scope") REFERENCES "slice"."fan_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_finish_fk_step_f3he376omz" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_freed" ADD CONSTRAINT "__fan_freed_fk_resource_seat_turn_5lyzcw65au" FOREIGN KEY ("resource", "seat", "turn") REFERENCES "slice"."fan_hold" ("resource", "seat", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_held"
  ADD CONSTRAINT "__fan_held_fk_step_6tkjkyjp3h" FOREIGN KEY ("step") REFERENCES "slice"."fan_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_held_fk_step_attempt_zol2no7gql" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."fan_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_hold" ADD CONSTRAINT "__fan_hold_fk_resource_seat_pred_turn_vfz6ol7e57" FOREIGN KEY ("resource", "seat", "__pred_turn_qryngij6c4") REFERENCES "slice"."fan_freed" ("resource", "seat", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_paused" ADD CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."fan_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_refusal" ADD CONSTRAINT "__fan_refusal_fk_step_otwlhohyvs" FOREIGN KEY ("step") REFERENCES "slice"."fan_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."fan_result" ADD CONSTRAINT "__fan_result_fk_step_kzt2ms65pp" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_resumed" ADD CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" FOREIGN KEY ("target", "turn") REFERENCES "slice"."fan_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_retry" ADD CONSTRAINT "__fan_retry_fk_step_attempt_ch6qjnmtkt" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."fan_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_root" ADD CONSTRAINT "__fan_root_fk_scope_7k4byqnauw" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_skipped"
  ADD CONSTRAINT "__fan_skipped_fk_by_ofiy7h4yez" FOREIGN KEY ("by") REFERENCES "slice"."fan_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_skipped_fk_scope_eomkgfbxwj" FOREIGN KEY ("scope") REFERENCES "slice"."fan_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_square_input" ADD CONSTRAINT "__fan_square_input_fk_step_tag_kind_square_dshd7bwrky" FOREIGN KEY ("step", "__tag_kind_square_q3stoybx3v") REFERENCES "slice"."fan_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_square_output"
  ADD CONSTRAINT "__fan_square_output_fk_step_ho2zf7mac5" FOREIGN KEY ("step") REFERENCES "slice"."fan_done" ("step") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_square_output_fk_step_prwr7wqv35" FOREIGN KEY ("step") REFERENCES "slice"."fan_square_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_start_scope"
  ADD CONSTRAINT "__fan_start_scope_fk_child_ngma7ay7kq" FOREIGN KEY ("child") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_start_scope_fk_scope_ewnvx2xo4c" FOREIGN KEY ("scope") REFERENCES "slice"."fan_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."fan_start_step"
  ADD CONSTRAINT "__fan_start_step_fk_scope_jcmkodvipd" FOREIGN KEY ("scope") REFERENCES "slice"."fan_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_step_fk_step_vjwo5huhik" FOREIGN KEY ("step") REFERENCES "slice"."fan_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_step" ADD CONSTRAINT "__fan_step_fk_scope_p7ymxnnzil" FOREIGN KEY ("scope") REFERENCES "slice"."fan_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."fan_within"
  ADD CONSTRAINT "__fan_within_fk_parent_koa6wzyqvq" FOREIGN KEY ("parent") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_within_fk_scope_5a7dtldf3w" FOREIGN KEY ("scope") REFERENCES "slice"."fan_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_admitted" ADD CONSTRAINT "__retry_admitted_fk_scope_o3jg25sttd" FOREIGN KEY ("scope") REFERENCES "slice"."retry_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_brittle_input" ADD CONSTRAINT "__retry_brittle_input_fk_step_tag_kind_brittle_kchbox44ml" FOREIGN KEY ("step", "__tag_kind_brittle_wzfwqdkbkg") REFERENCES "slice"."retry_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_brittle_output"
  ADD CONSTRAINT "__retry_brittle_output_fk_step_yzpan63y25" FOREIGN KEY ("step") REFERENCES "slice"."retry_brittle_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_brittle_output_fk_step_2duuaxh72x" FOREIGN KEY ("step") REFERENCES "slice"."retry_done" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."retry_claim"
  ADD CONSTRAINT "__retry_claim_fk_step_t3456bndar" FOREIGN KEY ("step") REFERENCES "slice"."retry_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_claim_fk_step_pred_attempt_eub2tikpeh" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox") REFERENCES "slice"."retry_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_done" ADD CONSTRAINT "__retry_done_fk_step_tag_outcome_done_fmzgo4pn2r" FOREIGN KEY ("step", "__tag_outcome_done_k5wikz4kly") REFERENCES "slice"."retry_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."retry_due" ADD CONSTRAINT "__retry_due_fk_step_sm2v4p4wn5" FOREIGN KEY ("step") REFERENCES "slice"."retry_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_exhausted" ADD CONSTRAINT "__retry_exhausted_fk_step_sanifiwunj" FOREIGN KEY ("step") REFERENCES "slice"."retry_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."retry_failed" ADD CONSTRAINT "__retry_failed_fk_step_tag_outcome_failed_3iz2aprkti" FOREIGN KEY ("step", "__tag_outcome_failed_446fx3eezg") REFERENCES "slice"."retry_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."retry_fenced" ADD CONSTRAINT "__retry_fenced_fk_step_attempt_5lvusmnjjt" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."retry_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_finish"
  ADD CONSTRAINT "__retry_finish_fk_scope_fwo5tjrgbx" FOREIGN KEY ("scope") REFERENCES "slice"."retry_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_finish_fk_step_rjhqbqx2wh" FOREIGN KEY ("step") REFERENCES "slice"."retry_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_held"
  ADD CONSTRAINT "__retry_held_fk_step_rlbcm6phjy" FOREIGN KEY ("step") REFERENCES "slice"."retry_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_held_fk_step_attempt_g534cnd4ee" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."retry_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_ladders_input" ADD CONSTRAINT "__retry_ladders_input_fk_scope_tag_kind_ladders_vn6lnz3pry" FOREIGN KEY ("scope", "__tag_kind_ladders_gimfs6gp4j") REFERENCES "slice"."retry_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."retry_paused" ADD CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."retry_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_refusal" ADD CONSTRAINT "__retry_refusal_fk_step_lcou3dggjh" FOREIGN KEY ("step") REFERENCES "slice"."retry_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."retry_result" ADD CONSTRAINT "__retry_result_fk_step_6eyc56xk3a" FOREIGN KEY ("step") REFERENCES "slice"."retry_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_resumed" ADD CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" FOREIGN KEY ("target", "turn") REFERENCES "slice"."retry_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_retry" ADD CONSTRAINT "__retry_retry_fk_step_attempt_ykromtpll2" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."retry_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_root" ADD CONSTRAINT "__retry_root_fk_scope_sq2qa4m6ld" FOREIGN KEY ("scope") REFERENCES "slice"."retry_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_skipped"
  ADD CONSTRAINT "__retry_skipped_fk_by_xhx6i6337v" FOREIGN KEY ("by") REFERENCES "slice"."retry_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_skipped_fk_scope_q4224gzqrl" FOREIGN KEY ("scope") REFERENCES "slice"."retry_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_start_scope"
  ADD CONSTRAINT "__retry_start_scope_fk_child_ive3vl5wpv" FOREIGN KEY ("child") REFERENCES "slice"."retry_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_start_scope_fk_scope_bmkrykqxr3" FOREIGN KEY ("scope") REFERENCES "slice"."retry_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."retry_start_step"
  ADD CONSTRAINT "__retry_start_step_fk_scope_aijgs4np4p" FOREIGN KEY ("scope") REFERENCES "slice"."retry_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_start_step_fk_step_lj6wlrxxh4" FOREIGN KEY ("step") REFERENCES "slice"."retry_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_steadfast_input" ADD CONSTRAINT "__retry_steadfast_input_fk_step_tag_kind_steadfast_u2z775muth" FOREIGN KEY ("step", "__tag_kind_steadfast_4rudtmco65") REFERENCES "slice"."retry_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_steadfast_output"
  ADD CONSTRAINT "__retry_steadfast_output_fk_step_gzrgos6ptu" FOREIGN KEY ("step") REFERENCES "slice"."retry_done" ("step") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_steadfast_output_fk_step_ifxk5bkk6h" FOREIGN KEY ("step") REFERENCES "slice"."retry_steadfast_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_step" ADD CONSTRAINT "__retry_step_fk_scope_ouksmumzap" FOREIGN KEY ("scope") REFERENCES "slice"."retry_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."retry_within"
  ADD CONSTRAINT "__retry_within_fk_parent_d2h4ezdtjn" FOREIGN KEY ("parent") REFERENCES "slice"."retry_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_within_fk_scope_zng7hmvot6" FOREIGN KEY ("scope") REFERENCES "slice"."retry_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_admitted" ADD CONSTRAINT "__sync_admitted_fk_scope_jli7ioqs7e" FOREIGN KEY ("scope") REFERENCES "slice"."sync_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_build_input" ADD CONSTRAINT "__sync_build_input_fk_step_tag_kind_build_2rrvrdqk3o" FOREIGN KEY ("step", "__tag_kind_build_pslevsssox") REFERENCES "slice"."sync_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_build_output"
  ADD CONSTRAINT "__sync_build_output_fk_step_4psndc3t3d" FOREIGN KEY ("step") REFERENCES "slice"."sync_build_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_build_output_fk_step_i3x7e6uuln" FOREIGN KEY ("step") REFERENCES "slice"."sync_done" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."sync_claim"
  ADD CONSTRAINT "__sync_claim_fk_step_l27dgy3dwh" FOREIGN KEY ("step") REFERENCES "slice"."sync_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_claim_fk_step_pred_attempt_4du2uws4ru" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox") REFERENCES "slice"."sync_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_copy_input" ADD CONSTRAINT "__sync_copy_input_fk_step_tag_kind_copy_uakhf373ei" FOREIGN KEY ("step", "__tag_kind_copy_wfaj52nfh7") REFERENCES "slice"."sync_step" ("step", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_copy_output"
  ADD CONSTRAINT "__sync_copy_output_fk_step_ydkxdq3bkd" FOREIGN KEY ("step") REFERENCES "slice"."sync_copy_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_copy_output_fk_step_vgu5ci7zsn" FOREIGN KEY ("step") REFERENCES "slice"."sync_done" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."sync_done" ADD CONSTRAINT "__sync_done_fk_step_tag_outcome_done_axqxsievib" FOREIGN KEY ("step", "__tag_outcome_done_pkvv6jrgpq") REFERENCES "slice"."sync_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."sync_due" ADD CONSTRAINT "__sync_due_fk_step_o5af5jr33h" FOREIGN KEY ("step") REFERENCES "slice"."sync_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_exclusive" ADD CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" FOREIGN KEY ("kind", "key", "__pred_turn_qryngij6c4") REFERENCES "slice"."sync_released" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_exclusive_key" ADD CONSTRAINT "__sync_exclusive_key_fk_scope_cy4cbhycir" FOREIGN KEY ("scope") REFERENCES "slice"."sync_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_exhausted" ADD CONSTRAINT "__sync_exhausted_fk_step_qdkuopifxf" FOREIGN KEY ("step") REFERENCES "slice"."sync_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."sync_failed" ADD CONSTRAINT "__sync_failed_fk_step_tag_outcome_failed_w7buaawyeg" FOREIGN KEY ("step", "__tag_outcome_failed_26do6twsnf") REFERENCES "slice"."sync_result" ("step", "outcome") MATCH SIMPLE;

ALTER TABLE "slice"."sync_fenced" ADD CONSTRAINT "__sync_fenced_fk_step_attempt_ypmzavzbgy" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."sync_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_finish"
  ADD CONSTRAINT "__sync_finish_fk_scope_bv3hsrlx5y" FOREIGN KEY ("scope") REFERENCES "slice"."sync_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_finish_fk_step_vhog6r5pu5" FOREIGN KEY ("step") REFERENCES "slice"."sync_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_gold_input" ADD CONSTRAINT "__sync_gold_input_fk_scope_tag_kind_gold_m6g42g4z2p" FOREIGN KEY ("scope", "__tag_kind_gold_7mgmvxjg34") REFERENCES "slice"."sync_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."sync_held"
  ADD CONSTRAINT "__sync_held_fk_step_cko2wzco3r" FOREIGN KEY ("step") REFERENCES "slice"."sync_result" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_held_fk_step_attempt_r37vvfdble" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."sync_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_paused" ADD CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."sync_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_refusal" ADD CONSTRAINT "__sync_refusal_fk_step_pkbm4yq2hj" FOREIGN KEY ("step") REFERENCES "slice"."sync_failed" ("step") MATCH SIMPLE;

ALTER TABLE "slice"."sync_released" ADD CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" FOREIGN KEY ("kind", "key", "turn") REFERENCES "slice"."sync_exclusive" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_result" ADD CONSTRAINT "__sync_result_fk_step_4ueb5frgri" FOREIGN KEY ("step") REFERENCES "slice"."sync_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_resumed" ADD CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" FOREIGN KEY ("target", "turn") REFERENCES "slice"."sync_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_retry" ADD CONSTRAINT "__sync_retry_fk_step_attempt_dbfp7g6nwv" FOREIGN KEY ("step", "attempt") REFERENCES "slice"."sync_claim" ("step", "attempt") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_root" ADD CONSTRAINT "__sync_root_fk_scope_ku5xrga5hw" FOREIGN KEY ("scope") REFERENCES "slice"."sync_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_skipped"
  ADD CONSTRAINT "__sync_skipped_fk_by_shlpjbklec" FOREIGN KEY ("by") REFERENCES "slice"."sync_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_skipped_fk_scope_33qsksdlcc" FOREIGN KEY ("scope") REFERENCES "slice"."sync_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_start_scope"
  ADD CONSTRAINT "__sync_start_scope_fk_child_khciqf3gvg" FOREIGN KEY ("child") REFERENCES "slice"."sync_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_start_scope_fk_scope_f3rtdt5nag" FOREIGN KEY ("scope") REFERENCES "slice"."sync_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."sync_start_step"
  ADD CONSTRAINT "__sync_start_step_fk_scope_m2ya6p5z52" FOREIGN KEY ("scope") REFERENCES "slice"."sync_admitted" ("scope") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_start_step_fk_step_xlobk7ohaz" FOREIGN KEY ("step") REFERENCES "slice"."sync_step" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_step" ADD CONSTRAINT "__sync_step_fk_scope_ficxssqmik" FOREIGN KEY ("scope") REFERENCES "slice"."sync_admitted" ("scope") MATCH SIMPLE;

ALTER TABLE "slice"."sync_sync_run_input" ADD CONSTRAINT "__sync_sync_run_input_fk_scope_tag_kind_sync_run_axve4fqawx" FOREIGN KEY ("scope", "__tag_kind_sync_run_wcjtzgltvo") REFERENCES "slice"."sync_scope" ("scope", "kind") MATCH SIMPLE;

ALTER TABLE "slice"."sync_within"
  ADD CONSTRAINT "__sync_within_fk_parent_gy7kgf4tam" FOREIGN KEY ("parent") REFERENCES "slice"."sync_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_within_fk_scope_rkiw3n47nn" FOREIGN KEY ("scope") REFERENCES "slice"."sync_scope" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;
