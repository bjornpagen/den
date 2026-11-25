ALTER TABLE "slice"."__ledger"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "folder" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "file" SET STATISTICS 0,
  ALTER COLUMN "source" SET STATISTICS 0,
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "files" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'folder'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'folder'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__ledger'::"pg_catalog"."text", COLUMN = 'folder'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__ledger'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'file'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'file'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__ledger'::"pg_catalog"."text", COLUMN = 'file'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'source'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'source'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__ledger'::"pg_catalog"."text", COLUMN = 'source'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__ledger'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'files'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'files'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__ledger'::"pg_catalog"."text", COLUMN = 'files'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__ledger'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__ledger'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."__drift_proofs"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "object" SET STATISTICS 0,
  ALTER COLUMN "ddl" SET STATISTICS 0,
  ALTER COLUMN "description" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__drift_proofs'::"pg_catalog"."text", 'object'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__drift_proofs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'object'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__drift_proofs'::"pg_catalog"."text", COLUMN = 'object'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__drift_proofs'::"pg_catalog"."text", 'ddl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__drift_proofs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ddl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__drift_proofs'::"pg_catalog"."text", COLUMN = 'ddl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__drift_proofs'::"pg_catalog"."text", 'description'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__drift_proofs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'description'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__drift_proofs'::"pg_catalog"."text", COLUMN = 'description'::"pg_catalog"."text"; END IF;
END
$$;

CREATE INDEX "__passage_ix_topic_lzh6djzwn4" ON "slice"."passage" USING btree ("topic");

CREATE INDEX "__passage_ix_embedding_ujugi77ft2" ON "slice"."passage" USING hnsw ("embedding" "vector_ext"."vector_cosine_ops");

CREATE INDEX "__assign_admitted_ix_scope_sav4gw3eqi" ON "slice_den"."assign_admitted" USING btree ("scope");

CREATE INDEX "__assign_assignment_input_ix_scope_root_si4jmetdvt" ON "slice_den"."assign_assignment_input" USING btree ("scope", "root");

CREATE INDEX "__assign_assignment_input_exclude_ix_scope_root_zqfaf4s3ix" ON "slice_den"."assign_assignment_input_exclude" USING btree ("scope", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_assignment_input_mode_nearest_ix_scope_root_p7dpsia4cd" ON "slice_den"."assign_assignment_input_mode_nearest" USING btree ("scope", "root");

CREATE INDEX "__assign_assignment_input_mode_within_ix_scope_root_bqasesgaf7" ON "slice_den"."assign_assignment_input_mode_within" USING btree ("scope", "root");

CREATE INDEX "__assign_assignment_input_near_ix_scope_root_yjobx_7_e5r373gcrk" ON "slice_den"."assign_assignment_input_near" USING btree ("scope", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_claim_ix_step_root_yewsvvtcyz_pred_attempt_wh3x4tgtcq" ON "slice_den"."assign_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__assign_decide_input_ix_step_root_b573uqwoo7" ON "slice_den"."assign_decide_input" USING btree ("step", "root");

CREATE INDEX "__assign_decide_input_exclude_ix_step_root_yjobx_7_gsddib7qpt" ON "slice_den"."assign_decide_input_exclude" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_input_mode_nearest_ix_step_root_3kk3dg4j53" ON "slice_den"."assign_decide_input_mode_nearest" USING btree ("step", "root");

CREATE INDEX "__assign_decide_input_mode_within_ix_step_root_txf3tbu422" ON "slice_den"."assign_decide_input_mode_within" USING btree ("step", "root");

CREATE INDEX "__assign_decide_output_ix_step_root_xj4kp626lu" ON "slice_den"."assign_decide_output" USING btree ("step", "root");

CREATE INDEX "__assign_decide_output_stage_rest_ix_step_root_qqyxhk427n" ON "slice_den"."assign_decide_output_stage_rest" USING btree ("step", "root");

CREATE INDEX "__assign_decide_output_stage_serve_ix_step_root_qyudonuazu" ON "slice_den"."assign_decide_output_stage_serve" USING btree ("step", "root");

CREATE INDEX "__assign_decide_output_weighed_ix_step_root_yjobx_7_cs5ragvjo3" ON "slice_den"."assign_decide_output_weighed" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_read_nearest_ix_digest_tm2whkfyjf" ON "slice_den"."assign_decide_read_nearest" USING btree ("digest");

CREATE INDEX "__assign_decide_read_seen_ix_digest_q7rgkxywvx" ON "slice_den"."assign_decide_read_seen" USING btree ("digest");

CREATE INDEX "__assign_embed_input_ix_step_root_bmzodxatow" ON "slice_den"."assign_embed_input" USING btree ("step", "root");

CREATE INDEX "__assign_embed_input_exclude_ix_step_root_yjobx_7_xcibpzqvn6" ON "slice_den"."assign_embed_input_exclude" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_embed_input_mode_nearest_ix_step_root_ramcyjzsmj" ON "slice_den"."assign_embed_input_mode_nearest" USING btree ("step", "root");

CREATE INDEX "__assign_embed_input_mode_within_ix_step_root_7b4wxziea2" ON "slice_den"."assign_embed_input_mode_within" USING btree ("step", "root");

CREATE INDEX "__assign_embed_input_near_ix_step_root_yjobx_7_uyrd_eh47bqlhw3" ON "slice_den"."assign_embed_input_near" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_fenced_ix_step_eztmdy3mzv" ON "slice_den"."assign_fenced" USING btree ("step");

CREATE INDEX "__assign_finish_ix_scope_step_53o4eorqpr" ON "slice_den"."assign_finish" USING btree ("scope", "step");

CREATE INDEX "__assign_held_ix_step_irvbrtgz2r" ON "slice_den"."assign_held" USING btree ("step");

CREATE INDEX "__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" ON "slice_den"."assign_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__assign_result_ix_step_outcome_root_35vmqe5lxj" ON "slice_den"."assign_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__assign_retry_ix_step_efjk6uhsq4" ON "slice_den"."assign_retry" USING btree ("step");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice_den"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_skipped_ix_scope_ftup4gbap6" ON "slice_den"."assign_skipped" USING btree ("scope");

CREATE INDEX "__assign_step_ix_root_scope_64vujnvoiu" ON "slice_den"."assign_step" USING btree ("root", "scope");

CREATE INDEX "__assign_step_ix_scope_kind_step_xn2zxx73po" ON "slice_den"."assign_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__assign_step_ix_step_root_cy4ylv4gbw" ON "slice_den"."assign_step" USING btree ("step", "root");

CREATE INDEX "__chain_admitted_ix_scope_v57a4nivm3" ON "slice_den"."chain_admitted" USING btree ("scope");

CREATE INDEX "__chain_chain_run_input_ix_scope_iuq7js6bfa" ON "slice_den"."chain_chain_run_input" USING btree ("scope");

CREATE INDEX "__chain_claim_ix_step_root_yewsvvtcyz_pred_attempt_z55hhc5lhz" ON "slice_den"."chain_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__chain_fenced_ix_step_h437d2nbx3" ON "slice_den"."chain_fenced" USING btree ("step");

CREATE INDEX "__chain_finish_ix_scope_step_om6bljb56e" ON "slice_den"."chain_finish" USING btree ("scope", "step");

CREATE INDEX "__chain_finish_ix_step_gfuhyfoe3p" ON "slice_den"."chain_finish" USING btree ("step");

CREATE INDEX "__chain_held_ix_step_4lrvrd3gs5" ON "slice_den"."chain_held" USING btree ("step");

CREATE INDEX "__chain_ordered_input_ix_scope_lbnwnucdyj" ON "slice_den"."chain_ordered_input" USING btree ("scope");

CREATE INDEX "__chain_page_input_ix_step_root_wr66hlqeaw" ON "slice_den"."chain_page_input" USING btree ("step", "root");

CREATE INDEX "__chain_page_input_after_ix_step_qdsmrr4vxs" ON "slice_den"."chain_page_input_after" USING btree ("step");

CREATE INDEX "__chain_page_output_ix_step_hu6e3cftif" ON "slice_den"."chain_page_output" USING btree ("step");

CREATE INDEX "__chain_page_output_next_ix_step_r3v3ug5ybb" ON "slice_den"."chain_page_output_next" USING btree ("step");

CREATE INDEX "__chain_page_read_earlier_ix_digest_p7rrxdx4kq" ON "slice_den"."chain_page_read_earlier" USING btree ("digest");

CREATE INDEX "__chain_page_read_tree_ix_digest_qz4flptsbe" ON "slice_den"."chain_page_read_tree" USING btree ("digest");

CREATE INDEX "__chain_page_read_weights_ix_digest_p6eekmx2x6" ON "slice_den"."chain_page_read_weights" USING btree ("digest");

CREATE INDEX "__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" ON "slice_den"."chain_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__chain_result_ix_step_outcome_root_ipaxj3wl7z" ON "slice_den"."chain_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__chain_retry_ix_step_jpeyuc4c4h" ON "slice_den"."chain_retry" USING btree ("step");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice_den"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_skipped_ix_scope_jvrcbbmf2m" ON "slice_den"."chain_skipped" USING btree ("scope");

CREATE INDEX "__chain_step_ix_root_scope_srrhrbyetn" ON "slice_den"."chain_step" USING btree ("root", "scope");

CREATE INDEX "__chain_step_ix_scope_kind_step_tsdjtgaey5" ON "slice_den"."chain_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__chain_step_ix_step_kind_root_2pdoze4bhr" ON "slice_den"."chain_step" USING btree ("step", "kind", "root");

CREATE INDEX "__clock_admitted_ix_scope_kljsbnk7gu" ON "slice_den"."clock_admitted" USING btree ("scope");

CREATE INDEX "__clock_chime_input_ix_step_root_vzyzntggzq" ON "slice_den"."clock_chime_input" USING btree ("step", "root");

CREATE INDEX "__clock_claim_ix_step_root_yewsvvtcyz_pred_attempt_xukg6gzvx7" ON "slice_den"."clock_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__clock_close_input_ix_step_root_iuvhjb65sf" ON "slice_den"."clock_close_input" USING btree ("step", "root");

CREATE INDEX "__clock_fenced_ix_step_6fkdtadk6s" ON "slice_den"."clock_fenced" USING btree ("step");

CREATE INDEX "__clock_finish_ix_scope_step_q2cyoxfrgy" ON "slice_den"."clock_finish" USING btree ("scope", "step");

CREATE INDEX "__clock_held_ix_step_254uki72j6" ON "slice_den"."clock_held" USING btree ("step");

CREATE INDEX "__clock_hourly_input_ix_scope_hjvvwnlgos" ON "slice_den"."clock_hourly_input" USING btree ("scope");

CREATE INDEX "__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" ON "slice_den"."clock_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__clock_result_ix_step_root_v3qa4me2e6" ON "slice_den"."clock_result" USING btree ("step", "root");

CREATE INDEX "__clock_retry_ix_step_evme3lajlk" ON "slice_den"."clock_retry" USING btree ("step");

CREATE INDEX "__clock_sitting_input_ix_scope_k6vxbcvu2a" ON "slice_den"."clock_sitting_input" USING btree ("scope");

CREATE INDEX "__clock_skipped_ix_by_252vuphujb" ON "slice_den"."clock_skipped" USING btree ("by");

CREATE INDEX "__clock_skipped_ix_scope_vlmkgoc4qh" ON "slice_den"."clock_skipped" USING btree ("scope");

CREATE INDEX "__clock_step_ix_scope_root_dr2wopxg6r" ON "slice_den"."clock_step" USING btree ("scope", "root");

CREATE INDEX "__clock_step_ix_step_root_snqq7fyo4q" ON "slice_den"."clock_step" USING btree ("step", "root");

CREATE INDEX "__fan_admitted_ix_scope_6tfnemhvcg" ON "slice_den"."fan_admitted" USING btree ("scope");

CREATE INDEX "__fan_batch_finish_output_ix_step_ocxqquufa6" ON "slice_den"."fan_batch_finish_output" USING btree ("step");

CREATE INDEX "__fan_batch_input_ix_scope_root_v4z44ipfis" ON "slice_den"."fan_batch_input" USING btree ("scope", "root");

CREATE INDEX "__fan_claim_ix_step_root_yewsvvtcyz_pred_attempt_oey_nttbgx6ow2" ON "slice_den"."fan_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__fan_dust_input_ix_step_root_w75lqylbvv" ON "slice_den"."fan_dust_input" USING btree ("step", "root");

CREATE INDEX "__fan_fan_run_input_ix_scope_rgmbrwdcvq" ON "slice_den"."fan_fan_run_input" USING btree ("scope");

CREATE INDEX "__fan_fenced_ix_step_xiphniebnv" ON "slice_den"."fan_fenced" USING btree ("step");

CREATE INDEX "__fan_finish_ix_scope_step_gv7mbzp7pp" ON "slice_den"."fan_finish" USING btree ("scope", "step");

CREATE INDEX "__fan_finish_ix_step_jjs336jpbb" ON "slice_den"."fan_finish" USING btree ("step");

CREATE INDEX "__fan_held_ix_step_rtiyqqxotz" ON "slice_den"."fan_held" USING btree ("step");

CREATE INDEX "__fan_hold_ix_resource_seat_s7bnw22355" ON "slice_den"."fan_hold" USING btree ("resource", "seat");

CREATE INDEX "__fan_mop_input_ix_step_root_m3lg7oxuam" ON "slice_den"."fan_mop_input" USING btree ("step", "root");

CREATE INDEX "__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" ON "slice_den"."fan_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_result_ix_step_outcome_root_udaij7stvj" ON "slice_den"."fan_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__fan_retry_ix_step_4v6a7logoe" ON "slice_den"."fan_retry" USING btree ("step");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice_den"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_skipped_ix_scope_h5pzdoa32a" ON "slice_den"."fan_skipped" USING btree ("scope");

CREATE INDEX "__fan_square_input_ix_step_root_jod5ra6yqo" ON "slice_den"."fan_square_input" USING btree ("step", "root");

CREATE INDEX "__fan_square_output_ix_step_teolwx3lfw" ON "slice_den"."fan_square_output" USING btree ("step");

CREATE INDEX "__fan_step_ix_root_scope_aw525h7gua" ON "slice_den"."fan_step" USING btree ("root", "scope");

CREATE INDEX "__fan_step_ix_scope_kind_step_5arz2gb4sb" ON "slice_den"."fan_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__fan_step_ix_step_root_nf2nqwhde2" ON "slice_den"."fan_step" USING btree ("step", "root");

CREATE INDEX "__fan_sweep_input_ix_scope_zvab3un5km" ON "slice_den"."fan_sweep_input" USING btree ("scope");

CREATE INDEX "__fan_within_ix_parent_kind_scope_5ywepfmzj2" ON "slice_den"."fan_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__fan_within_ix_parent_root_eiovyuswcz" ON "slice_den"."fan_within" USING btree ("parent", "root");

CREATE INDEX "__fan_within_ix_scope_root_vht7afdsvu" ON "slice_den"."fan_within" USING btree ("scope", "root");

CREATE INDEX "__retry_admitted_ix_scope_yqb7r5kcts" ON "slice_den"."retry_admitted" USING btree ("scope");

CREATE INDEX "__retry_brittle_input_ix_step_root_6ur6u2dkec" ON "slice_den"."retry_brittle_input" USING btree ("step", "root");

CREATE INDEX "__retry_brittle_output_ix_step_ddjioko4ap" ON "slice_den"."retry_brittle_output" USING btree ("step");

CREATE INDEX "__retry_claim_ix_step_root_yewsvvtcyz_pred_attempt_acklz4su4p" ON "slice_den"."retry_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__retry_fenced_ix_step_taohzqvdeo" ON "slice_den"."retry_fenced" USING btree ("step");

CREATE INDEX "__retry_finish_ix_scope_step_6tswescc6v" ON "slice_den"."retry_finish" USING btree ("scope", "step");

CREATE INDEX "__retry_held_ix_step_l7f7ax5pel" ON "slice_den"."retry_held" USING btree ("step");

CREATE INDEX "__retry_ladders_input_ix_scope_ktwahiu353" ON "slice_den"."retry_ladders_input" USING btree ("scope");

CREATE INDEX "__retry_patient_input_ix_step_root_2ufb6ex62j" ON "slice_den"."retry_patient_input" USING btree ("step", "root");

CREATE INDEX "__retry_patient_output_ix_step_4nlbxubrgc" ON "slice_den"."retry_patient_output" USING btree ("step");

CREATE INDEX "__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" ON "slice_den"."retry_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__retry_polite_input_ix_step_root_yequmlbu4w" ON "slice_den"."retry_polite_input" USING btree ("step", "root");

CREATE INDEX "__retry_polite_output_ix_step_cagfkplnyp" ON "slice_den"."retry_polite_output" USING btree ("step");

CREATE INDEX "__retry_result_ix_step_outcome_root_5x6caywnin" ON "slice_den"."retry_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__retry_retry_ix_step_4y7ukujr4x" ON "slice_den"."retry_retry" USING btree ("step");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice_den"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_skipped_ix_scope_pj72ptncqt" ON "slice_den"."retry_skipped" USING btree ("scope");

CREATE INDEX "__retry_steadfast_input_ix_step_root_kko5yn5mfi" ON "slice_den"."retry_steadfast_input" USING btree ("step", "root");

CREATE INDEX "__retry_steadfast_output_ix_step_xu5p4zs52x" ON "slice_den"."retry_steadfast_output" USING btree ("step");

CREATE INDEX "__retry_step_ix_root_scope_ogbhay3han" ON "slice_den"."retry_step" USING btree ("root", "scope");

CREATE INDEX "__retry_step_ix_scope_kind_step_m6ufaqcqmk" ON "slice_den"."retry_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__retry_step_ix_step_root_v4tguvl2xo" ON "slice_den"."retry_step" USING btree ("step", "root");

CREATE INDEX "__retry_throttled_input_ix_scope_srrsrnmwfp" ON "slice_den"."retry_throttled_input" USING btree ("scope");

CREATE INDEX "__retry_unhurried_input_ix_scope_4drrri4lgl" ON "slice_den"."retry_unhurried_input" USING btree ("scope");

CREATE INDEX "__review_admitted_ix_scope_uaz2e2unre" ON "slice_den"."review_admitted" USING btree ("scope");

CREATE INDEX "__review_analyze_input_ix_step_root_s5vaywecrt" ON "slice_den"."review_analyze_input" USING btree ("step", "root");

CREATE INDEX "__review_analyze_output_ix_step_t5p7no2i5e" ON "slice_den"."review_analyze_output" USING btree ("step");

CREATE INDEX "__review_claim_ix_step_root_yewsvvtcyz_pred_attempt_53g43drm5l" ON "slice_den"."review_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__review_fenced_ix_step_k2afeb3irz" ON "slice_den"."review_fenced" USING btree ("step");

CREATE INDEX "__review_finish_ix_scope_step_4k6s2nqgyy" ON "slice_den"."review_finish" USING btree ("scope", "step");

CREATE INDEX "__review_finish_ix_step_luhj6362cj" ON "slice_den"."review_finish" USING btree ("step");

CREATE INDEX "__review_gather_input_ix_review_f2zafhsmtj" ON "slice_den"."review_gather_input" USING btree ("review");

CREATE INDEX "__review_gather_input_ix_step_root_sq3sceot7a" ON "slice_den"."review_gather_input" USING btree ("step", "root");

CREATE INDEX "__review_gather_input_sizes_ix_step_root_yjobx_7_7uihmnh7ih" ON "slice_den"."review_gather_input_sizes" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_held_ix_step_xvtsgiwapv" ON "slice_den"."review_held" USING btree ("step");

CREATE INDEX "__review_hold_ix_resource_seat_3p66dnxzad" ON "slice_den"."review_hold" USING btree ("resource", "seat");

CREATE INDEX "__review_hold_ix_step_daijcrisdf" ON "slice_den"."review_hold" USING btree ("step");

CREATE INDEX "__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" ON "slice_den"."review_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__review_questions_finish_output_ix_step_snk4x6oh75" ON "slice_den"."review_questions_finish_output" USING btree ("step");

CREATE INDEX "__review_questions_input_ix_scope_root_4mssyhumwi" ON "slice_den"."review_questions_input" USING btree ("scope", "root");

CREATE INDEX "__review_result_ix_step_outcome_root_lbrp6nyb6i" ON "slice_den"."review_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__review_retry_ix_step_c7roln6cyz" ON "slice_den"."review_retry" USING btree ("step");

CREATE INDEX "__review_review_run_input_ix_scope_pjiclt36mp" ON "slice_den"."review_review_run_input" USING btree ("scope");

CREATE INDEX "__review_review_run_input_sizes_ix_scope_root_yjobx_q27b4rjhuv" ON "slice_den"."review_review_run_input_sizes" USING btree ("scope", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_save_input_ix_step_root_vn5k5ydivm" ON "slice_den"."review_save_input" USING btree ("step", "root");

CREATE INDEX "__review_save_output_ix_step_uj4wo4gdyl" ON "slice_den"."review_save_output" USING btree ("step");

CREATE INDEX "__review_skipped_ix_by_6z5g634njq" ON "slice_den"."review_skipped" USING btree ("by");

CREATE INDEX "__review_skipped_ix_scope_ypzvqrmdce" ON "slice_den"."review_skipped" USING btree ("scope");

CREATE INDEX "__review_step_ix_root_scope_jvmzqg2kjy" ON "slice_den"."review_step" USING btree ("root", "scope");

CREATE INDEX "__review_step_ix_scope_kind_step_udhxex4i5c" ON "slice_den"."review_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__review_step_ix_step_root_eyzhr3fgx6" ON "slice_den"."review_step" USING btree ("step", "root");

CREATE INDEX "__review_within_ix_parent_kind_scope_dtilr5xomp" ON "slice_den"."review_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__review_within_ix_parent_root_ajpsgwldly" ON "slice_den"."review_within" USING btree ("parent", "root");

CREATE INDEX "__review_within_ix_scope_root_de6bpnvbbw" ON "slice_den"."review_within" USING btree ("scope", "root");

CREATE INDEX "__sync_admitted_ix_scope_iqmg6cfxd7" ON "slice_den"."sync_admitted" USING btree ("scope");

CREATE INDEX "__sync_build_input_ix_step_root_n7cbt5ywes" ON "slice_den"."sync_build_input" USING btree ("step", "root");

CREATE INDEX "__sync_claim_ix_step_root_yewsvvtcyz_pred_attempt_fiq4h65yco" ON "slice_den"."sync_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__sync_copy_input_ix_step_root_pzhfu7yan4" ON "slice_den"."sync_copy_input" USING btree ("step", "root");

CREATE INDEX "__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" ON "slice_den"."sync_exclusive" USING btree ("kind", "key", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_exclusive_key_ix_scope_odlg62uodv" ON "slice_den"."sync_exclusive_key" USING btree ("scope");

CREATE INDEX "__sync_fenced_ix_step_z7k6qcdgfq" ON "slice_den"."sync_fenced" USING btree ("step");

CREATE INDEX "__sync_finish_ix_scope_step_owsw7m5w74" ON "slice_den"."sync_finish" USING btree ("scope", "step");

CREATE INDEX "__sync_finish_ix_step_uwcksqapnl" ON "slice_den"."sync_finish" USING btree ("step");

CREATE INDEX "__sync_gold_input_ix_scope_5czwxdxbjp" ON "slice_den"."sync_gold_input" USING btree ("scope");

CREATE INDEX "__sync_held_ix_step_hqbgboxgaj" ON "slice_den"."sync_held" USING btree ("step");

CREATE INDEX "__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" ON "slice_den"."sync_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_result_ix_step_root_mbhvrwajkq" ON "slice_den"."sync_result" USING btree ("step", "root");

CREATE INDEX "__sync_retry_ix_step_nqiv6tlf2k" ON "slice_den"."sync_retry" USING btree ("step");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice_den"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_skipped_ix_scope_d5pw2mcp56" ON "slice_den"."sync_skipped" USING btree ("scope");

CREATE INDEX "__sync_step_ix_scope_root_hppxk5gi6a" ON "slice_den"."sync_step" USING btree ("scope", "root");

CREATE INDEX "__sync_step_ix_step_root_q3nsi64opx" ON "slice_den"."sync_step" USING btree ("step", "root");

CREATE INDEX "__sync_sync_run_input_ix_scope_xmn3bafu67" ON "slice_den"."sync_sync_run_input" USING btree ("scope");

CREATE INDEX "__writeback_admitted_ix_scope_54lp3ihfk7" ON "slice_den"."writeback_admitted" USING btree ("scope");

CREATE INDEX "__writeback_claim_ix_step_root_yewsvvtcyz_pred_tplitkeoq2" ON "slice_den"."writeback_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__writeback_deliver_input_ix_step_root_vaxq6pgpkm" ON "slice_den"."writeback_deliver_input" USING btree ("step", "root");

CREATE INDEX "__writeback_fenced_ix_step_iwrqegcnk6" ON "slice_den"."writeback_fenced" USING btree ("step");

CREATE INDEX "__writeback_finish_ix_scope_step_6ooh2ahmws" ON "slice_den"."writeback_finish" USING btree ("scope", "step");

CREATE INDEX "__writeback_held_ix_step_itsn6ncq5e" ON "slice_den"."writeback_held" USING btree ("step");

CREATE INDEX "__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" ON "slice_den"."writeback_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__writeback_result_ix_step_root_u43itfyxzx" ON "slice_den"."writeback_result" USING btree ("step", "root");

CREATE INDEX "__writeback_retry_ix_step_xokcsjqehk" ON "slice_den"."writeback_retry" USING btree ("step");

CREATE INDEX "__writeback_skipped_ix_by_3ei4k4fj53" ON "slice_den"."writeback_skipped" USING btree ("by");

CREATE INDEX "__writeback_skipped_ix_scope_dwesxm2rrj" ON "slice_den"."writeback_skipped" USING btree ("scope");

CREATE INDEX "__writeback_step_ix_scope_root_ft5ap6qmlh" ON "slice_den"."writeback_step" USING btree ("scope", "root");

CREATE INDEX "__writeback_step_ix_step_root_q3li3ogpqx" ON "slice_den"."writeback_step" USING btree ("step", "root");

CREATE INDEX "__writeback_writeback_input_ix_scope_72jqfcjowv" ON "slice_den"."writeback_writeback_input" USING btree ("scope");

ALTER TABLE "slice"."assigned"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'assigned'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assigned'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'assigned'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'assigned'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assigned'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'assigned'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."built"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "build" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'built'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'built'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'built'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."chimed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'chimed'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chimed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'chimed'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'chimed'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chimed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'chimed'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."concluded"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "served" SET STATISTICS 0,
  ALTER COLUMN "weighed" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'concluded'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'concluded'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'concluded'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'concluded'::"pg_catalog"."text", 'served'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'concluded'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'served'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'concluded'::"pg_catalog"."text", COLUMN = 'served'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'concluded'::"pg_catalog"."text", 'weighed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'concluded'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'weighed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'concluded'::"pg_catalog"."text", COLUMN = 'weighed'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."copied"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "relation" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'copied'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'copied'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'copied'::"pg_catalog"."text", COLUMN = 'relation'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'copied'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'copied'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'copied'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."cursor"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "position" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'cursor'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'cursor'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'cursor'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'cursor'::"pg_catalog"."text", 'position'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'cursor'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'position'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'cursor'::"pg_catalog"."text", COLUMN = 'position'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."delivered"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'delivered'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'delivered'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'delivered'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."heard"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "answered" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'heard'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'heard'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'heard'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'heard'::"pg_catalog"."text", 'answered'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'heard'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'answered'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'heard'::"pg_catalog"."text", COLUMN = 'answered'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."item"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'item'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'item'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'item'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'item'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'item'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'item'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'item'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'item'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'item'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."order"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "order" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'order'::"pg_catalog"."text", 'order'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'order'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'order'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'order'::"pg_catalog"."text", COLUMN = 'order'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'order'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'order'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'order'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."passage"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "embedding" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'passage'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'passage'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'embedding'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'embedding'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'passage'::"pg_catalog"."text", COLUMN = 'embedding'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."reviewed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'reviewed'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'reviewed'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'reviewed'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'reviewed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'reviewed'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."seen"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'seen'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'seen'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'seen'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'seen'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'seen'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'seen'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."settled"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "batch" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'settled'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'settled'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'settled'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."summary"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "groups" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'summary'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'summary'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'summary'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'summary'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'summary'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'summary'::"pg_catalog"."text", COLUMN = 'groups'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'summary'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'summary'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'summary'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."tally"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'tally'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'tally'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'tally'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'tally'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'tally'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'tally'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'tally'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'tally'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'tally'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice"."weight"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "factor" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'weight'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'weight'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'weight'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'weight'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'weight'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'weight'::"pg_catalog"."text", COLUMN = 'factor'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_asked"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_assignment_q5nqvzv6jc" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input'::"pg_catalog"."text", COLUMN = '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_exclude"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_mode_nearest"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_nearest'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_nearest'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_mode_within"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_within'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_within'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_within'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_within'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_within'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_within'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_near"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "vector" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input'::"pg_catalog"."text", COLUMN = 'vector'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_input_exclude"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_input_mode_nearest"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_nearest'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_nearest'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_nearest'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_nearest'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_input_mode_within"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_within'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_within'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_within'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_within'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_within'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_within'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "confidence" SET STATISTICS 0,
  ALTER COLUMN "stage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'confidence'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'confidence'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output'::"pg_catalog"."text", COLUMN = 'confidence'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'stage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'stage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output'::"pg_catalog"."text", COLUMN = 'stage'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output_stage_rest"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_rest'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_rest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_rest'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_rest'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_rest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_rest'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output_stage_serve"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output_weighed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0,
  ALTER COLUMN "passed" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'passed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = 'passed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_nearest"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_nearest_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_row'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_row'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_row'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_seen"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_seen_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_row'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_row'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_row'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_row'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_exclude"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_mode_nearest"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_nearest'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_nearest'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_nearest'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_nearest'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_nearest'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_mode_within"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_within'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_within'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_within'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_within'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_within'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_within'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_near"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "vector" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_output'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_output'::"pg_catalog"."text", COLUMN = 'vector'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."audit"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "note" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'audit'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'audit'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'audit'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'audit'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'audit'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'audit'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'audit'::"pg_catalog"."text", 'note'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'audit'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'note'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'audit'::"pg_catalog"."text", COLUMN = 'note'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_chain_run_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_chain_run_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_chain_run_ccthhdybqw" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input'::"pg_catalog"."text", COLUMN = '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_next"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_ordered_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_ordered_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_ordered_ms3hwzrkhl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input'::"pg_catalog"."text", COLUMN = '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_input_after"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_after'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_after'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_after'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_after'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_after'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_after'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_after'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_after'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_after'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "items" SET STATISTICS 0,
  ALTER COLUMN "earlier" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'items'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'items'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output'::"pg_catalog"."text", COLUMN = 'items'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'earlier'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'earlier'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output'::"pg_catalog"."text", COLUMN = 'earlier'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_output_next"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_next'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_next'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_next'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_next'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_next'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_next'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_next'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_next'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_next'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_earlier"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_earlier_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_row'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_row'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_row'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_tree"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_tree_items"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0,
  ALTER COLUMN "__copy_items_jii5wy7azg" SET STATISTICS 0,
  ALTER COLUMN "__pred_at_xktcobhsti" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", '__copy_items_jii5wy7azg'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_items_jii5wy7azg'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items'::"pg_catalog"."text", COLUMN = '__copy_items_jii5wy7azg'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_tree_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "factor" SET STATISTICS 0,
  ALTER COLUMN "items" SET STATISTICS 0,
  ALTER COLUMN "__pred_items_3qltx5cx27" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_row'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_row'::"pg_catalog"."text", COLUMN = 'factor'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'items'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'items'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_row'::"pg_catalog"."text", COLUMN = 'items'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", '__pred_items_3qltx5cx27'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_items_3qltx5cx27'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_row'::"pg_catalog"."text", COLUMN = '__pred_items_3qltx5cx27'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_weights"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_weights_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "factor" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_row'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_row'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_row'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_row'::"pg_catalog"."text", COLUMN = 'factor'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_tree_first"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_tree_first'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_tree_first'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_tree_first'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_tree_first'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_tree_first'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_tree_first'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_chime_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_chime_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_close_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_close_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_hourly_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_hourly_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_hourly_axvj7zlyzy" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input'::"pg_catalog"."text", COLUMN = '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_sitting_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_sitting_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sitting_zbhu3onph5" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input'::"pg_catalog"."text", COLUMN = '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_batch_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_batch_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "holds" SET STATISTICS 0,
  ALTER COLUMN "__pred_holds_lq7itfruzz" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'holds'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = '__pred_holds_lq7itfruzz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_dust_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_input'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_input'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_dust_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_output'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_output'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_fan_run_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_fan_run_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_fan_run_2liqlumqkj" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input'::"pg_catalog"."text", COLUMN = '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_hold"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "resource" SET STATISTICS 0,
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "seat" SET STATISTICS 0,
  ALTER COLUMN "__copy_holds_hfzvk7t2xc" SET STATISTICS 0,
  ALTER COLUMN "__pred_at_xktcobhsti" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'resource'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'resource'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'resource'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'seat'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_mop_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_input'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_input'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_mop_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_output'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_output'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_square_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_square_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "square" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_output'::"pg_catalog"."text", 'square'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'square'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_output'::"pg_catalog"."text", COLUMN = 'square'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_start_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "child" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_scope'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'child'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'child'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_scope'::"pg_catalog"."text", COLUMN = 'child'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_sweep_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_sweep_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sweep_4lmrlblufr" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input'::"pg_catalog"."text", COLUMN = '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_within"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "parent" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_within'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_within'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'parent'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'parent'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_within'::"pg_catalog"."text", COLUMN = 'parent'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_within'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_brittle_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_input'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_input'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_brittle_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_output'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_output'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_ladders_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_ladders_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "steadfast" SET STATISTICS 0,
  ALTER COLUMN "brittle" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_ladders_amjml3bobr" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'steadfast'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'steadfast'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input'::"pg_catalog"."text", COLUMN = 'steadfast'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'brittle'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'brittle'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input'::"pg_catalog"."text", COLUMN = 'brittle'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input'::"pg_catalog"."text", COLUMN = '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_patient_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_input'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_input'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_patient_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_output'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_output'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_polite_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_input'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_input'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_polite_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_output'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_output'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_steadfast_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_input'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_input'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_steadfast_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_output'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_output'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_throttled_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_throttled_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_throttled_uy63hl6qg7" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input'::"pg_catalog"."text", COLUMN = '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_unhurried_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_unhurried_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_unhurried_yf3vrtngno" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input'::"pg_catalog"."text", COLUMN = '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_analyze_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "question" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'question'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'question'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input'::"pg_catalog"."text", COLUMN = 'question'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_analyze_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "score" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_output'::"pg_catalog"."text", 'score'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'score'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_output'::"pg_catalog"."text", COLUMN = 'score'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "holds" SET STATISTICS 0,
  ALTER COLUMN "__pred_holds_lq7itfruzz" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'holds'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = '__pred_holds_lq7itfruzz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_gather_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_gather_input_sizes"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_gather_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "groups" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_output'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_output'::"pg_catalog"."text", COLUMN = 'groups'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_hold"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "resource" SET STATISTICS 0,
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "seat" SET STATISTICS 0,
  ALTER COLUMN "__copy_holds_a7bsyj5c52" SET STATISTICS 0,
  ALTER COLUMN "__pred_at_xktcobhsti" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'resource'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'resource'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'resource'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'seat'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", '__copy_holds_a7bsyj5c52'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_holds_a7bsyj5c52'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = '__copy_holds_a7bsyj5c52'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_questions_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_questions_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_review_run_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_review_run_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_review_run_npquoqpyk4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input'::"pg_catalog"."text", COLUMN = '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_review_run_input_sizes"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_save_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_save_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_output'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_output'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_saved"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_split"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_start_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "child" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_scope'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'child'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'child'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_scope'::"pg_catalog"."text", COLUMN = 'child'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_within"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "parent" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_within'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_within'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'parent'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'parent'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_within'::"pg_catalog"."text", COLUMN = 'parent'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_within'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_within'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_build_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_input'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_input'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_build_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_output'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_output'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_copy_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "relation" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input'::"pg_catalog"."text", COLUMN = 'relation'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_copy_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_output'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_output'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_exclusive"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_exclusive_key"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "id" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive_key'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive_key'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive_key'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'id'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'id'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive_key'::"pg_catalog"."text", COLUMN = 'id'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_gold_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_gold_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_gold_phmoz6zyym" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input'::"pg_catalog"."text", COLUMN = '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_released"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_released'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_released'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_released'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_released'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_released'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_released'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_released'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_released'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_released'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_sync_run_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_sync_run_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "relation" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sync_run_wmr74dvsia" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input'::"pg_catalog"."text", COLUMN = 'relation'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input'::"pg_catalog"."text", COLUMN = '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_admitted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_admitted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_admitted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_admitted'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_admitted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_admitted'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_deliver_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_input'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_input'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_input'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_input'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_deliver_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_output'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_output'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_done"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_done'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_done'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_done'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_ended"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_ended'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_ended'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_ended'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_exhausted"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_exhausted'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_exhausted'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_exhausted'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_failed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_failed'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_failed'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_failed'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_fenced"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_fenced'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_fenced'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_fenced'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_fenced'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_fenced'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_fenced'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_fenced'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_finish"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_finish'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_finish'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_finish'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_finish'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_finish'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_held"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_held'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_held'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_held'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_held'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_held'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_held'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_held'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_paused"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_paused'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_paused'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_paused'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_paused'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_paused'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_paused'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_paused'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_refusal"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "law" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_refusal'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_result"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "outcome" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_result'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_result'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_result'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_result'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_result'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_result'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'outcome'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_result'::"pg_catalog"."text", COLUMN = 'outcome'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_resumed"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "target" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_resumed'::"pg_catalog"."text", 'target'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'target'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_resumed'::"pg_catalog"."text", COLUMN = 'target'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_resumed'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_resumed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_resumed'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_retry"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "why" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_retry'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_retry'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_retry'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_retry'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'why'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_retry'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'why'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_retry'::"pg_catalog"."text", COLUMN = 'why'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_root"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_root'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_root'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_root'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_root'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_root'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_served"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "environment" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "deployment" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_served'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'environment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_served'::"pg_catalog"."text", COLUMN = 'environment'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_served'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_served'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_served'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_served'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deployment'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_served'::"pg_catalog"."text", COLUMN = 'deployment'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_start_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_start_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_step"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "due" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_writeback_finish_output"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_finish_output'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_finish_output'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_finish_output'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_finish_output'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_finish_output'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_writeback_input"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_writeback_7zc6o24iqm" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input'::"pg_catalog"."text", COLUMN = '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text"; END IF;
END
$$;
