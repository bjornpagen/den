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

CREATE INDEX "__passage_ix_embedding_ujugi77ft2" ON "slice"."passage" USING hnsw ("embedding" "vector_ext"."vector_cosine_ops");

CREATE INDEX "__assign_assignment_input_ix_scope_2y6dle4van" ON "slice_den"."__assign_assignment_input_jkityquzjz" USING btree ("scope");

CREATE INDEX "__assign_assignment_input_exclude_ix_pred_ordinal_e_m7lrvwvsz6" ON "slice_den"."__assign_assignment_input_exclude_wqrktw62ew" USING btree ("__pred_ordinal_e545zctcav", "scope", "__root_yjobx7uyrd");

CREATE INDEX "__assign_assignment_input_near_ix_pred_ordinal_e_545_ccykqvswgk" ON "slice_den"."__assign_assignment_input_near_6teditkssg" USING btree ("__pred_ordinal_e545zctcav", "scope", "__root_yjobx7uyrd");

CREATE INDEX "__assign_claim_ix_pred_attempt_oey_4_tm_5_xyl_step_ardralgmql" ON "slice_den"."assign_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__assign_decide_input_exclude_ix_pred_ordinal_e_545_2e4sfci2y4" ON "slice_den"."__assign_decide_input_exclude_hsjt7zirht" USING btree ("__pred_ordinal_e545zctcav", "step", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_output_weighed_ix_pred_ordinal_e_545_szwyi27mfy" ON "slice_den"."__assign_decide_output_weighed_3owmsgm56c" USING btree ("__pred_ordinal_e545zctcav", "step", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_read_nearest_ix_digest_tm2whkfyjf" ON "slice_den"."__assign_decide_read_nearest_rpgjzn2izt" USING btree ("digest");

CREATE INDEX "__assign_decide_read_seen_ix_digest_q7rgkxywvx" ON "slice_den"."__assign_decide_read_seen_imbphpples" USING btree ("digest");

CREATE INDEX "__assign_embed_input_exclude_ix_pred_ordinal_e_545_tmwtnr6orc" ON "slice_den"."__assign_embed_input_exclude_jck2tra3om" USING btree ("__pred_ordinal_e545zctcav", "step", "__root_yjobx7uyrd");

CREATE INDEX "__assign_embed_input_near_ix_pred_ordinal_e_545_zyonbrmujo" ON "slice_den"."__assign_embed_input_near_jmllazcmpe" USING btree ("__pred_ordinal_e545zctcav", "step", "__root_yjobx7uyrd");

CREATE INDEX "__assign_paused_ix_pred_turn_qryngij_6_c_4_target_aoi6sp74el" ON "slice_den"."assign_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__assign_result_ix_outcome_root_step_wjgqvlpbde" ON "slice_den"."assign_result" USING btree ("outcome", "root", "step");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice_den"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_skipped_ix_scope_ftup4gbap6" ON "slice_den"."assign_skipped" USING btree ("scope");

CREATE INDEX "__assign_step_ix_scope_root_kind_x7xynjnrkv" ON "slice_den"."assign_step" USING btree ("scope", "root", "kind");

CREATE INDEX "__chain_chain_run_input_ix_scope_iuq7js6bfa" ON "slice_den"."__chain_chain_run_input_bmdsmqbrk2" USING btree ("scope");

CREATE INDEX "__chain_claim_ix_pred_attempt_oey_4_tm_5_xyl_step_dnks3lj6ra" ON "slice_den"."chain_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__chain_ordered_input_ix_scope_lbnwnucdyj" ON "slice_den"."__chain_ordered_input_tlj4ihbubo" USING btree ("scope");

CREATE INDEX "__chain_page_read_earlier_ix_digest_p7rrxdx4kq" ON "slice_den"."__chain_page_read_earlier_33grnly7mg" USING btree ("digest");

CREATE INDEX "__chain_page_read_tree_ix_digest_qz4flptsbe" ON "slice_den"."__chain_page_read_tree_mt76djloc5" USING btree ("digest");

CREATE INDEX "__chain_page_read_weights_ix_digest_p6eekmx2x6" ON "slice_den"."__chain_page_read_weights_fcely5x3ye" USING btree ("digest");

CREATE INDEX "__chain_paused_ix_pred_turn_qryngij_6_c_4_target_ltz6nzangf" ON "slice_den"."chain_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__chain_result_ix_outcome_root_step_axmfrho4j3" ON "slice_den"."chain_result" USING btree ("outcome", "root", "step");

CREATE INDEX "__chain_result_ix_step_4lfojblc4o" ON "slice_den"."chain_result" USING btree ("step");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice_den"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_skipped_ix_scope_jvrcbbmf2m" ON "slice_den"."chain_skipped" USING btree ("scope");

CREATE INDEX "__chain_step_ix_scope_root_kind_ru3k3ivu6x" ON "slice_den"."chain_step" USING btree ("scope", "root", "kind");

CREATE INDEX "__clock_claim_ix_pred_attempt_oey_4_tm_5_xyl_step_leqy727kyf" ON "slice_den"."clock_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__clock_hourly_input_ix_scope_hjvvwnlgos" ON "slice_den"."__clock_hourly_input_nq4knj5mda" USING btree ("scope");

CREATE INDEX "__clock_paused_ix_pred_turn_qryngij_6_c_4_target_m3753rncus" ON "slice_den"."clock_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__clock_sitting_input_ix_scope_k6vxbcvu2a" ON "slice_den"."__clock_sitting_input_rjgg4hnzuz" USING btree ("scope");

CREATE INDEX "__clock_skipped_ix_by_252vuphujb" ON "slice_den"."clock_skipped" USING btree ("by");

CREATE INDEX "__clock_skipped_ix_scope_vlmkgoc4qh" ON "slice_den"."clock_skipped" USING btree ("scope");

CREATE INDEX "__clock_step_ix_scope_root_dr2wopxg6r" ON "slice_den"."clock_step" USING btree ("scope", "root");

CREATE INDEX "__fan_claim_ix_pred_attempt_oey_4_tm_5_xyl_step_root_dofch63qek" ON "slice_den"."fan_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__fan_exclusive_ix_pred_turn_qryngij_6_c_4_kind_key_utbrcrsxai" ON "slice_den"."fan_exclusive" USING btree ("__pred_turn_qryngij6c4", "kind", "key");

CREATE INDEX "__fan_fan_run_input_ix_scope_rgmbrwdcvq" ON "slice_den"."__fan_fan_run_input_lbk743wucv" USING btree ("scope");

CREATE INDEX "__fan_hold_ix_root_step_attempt_rkm7jshnmy" ON "slice_den"."fan_hold" USING btree ("root", "step", "attempt");

CREATE INDEX "__fan_hold_ix_seat_resource_bgylsgdtyj" ON "slice_den"."fan_hold" USING btree ("seat", "resource");

CREATE INDEX "__fan_paused_ix_pred_turn_qryngij_6_c_4_target_yrplqpn2fl" ON "slice_den"."fan_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__fan_result_ix_outcome_root_step_raaoxnsivx" ON "slice_den"."fan_result" USING btree ("outcome", "root", "step");

CREATE INDEX "__fan_result_ix_step_n47cclxm64" ON "slice_den"."fan_result" USING btree ("step");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice_den"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_skipped_ix_scope_h5pzdoa32a" ON "slice_den"."fan_skipped" USING btree ("scope");

CREATE INDEX "__fan_step_ix_scope_root_kind_ey6px3al2m" ON "slice_den"."fan_step" USING btree ("scope", "root", "kind");

CREATE INDEX "__fan_sweep_input_ix_scope_zvab3un5km" ON "slice_den"."__fan_sweep_input_zh2fwcaxpj" USING btree ("scope");

CREATE INDEX "__fan_wanted_input_ix_scope_57fqk3rwec" ON "slice_den"."__fan_wanted_input_chczog66p4" USING btree ("scope");

CREATE INDEX "__fan_within_ix_parent_root_kind_soxbcmdruc" ON "slice_den"."fan_within" USING btree ("parent", "root", "kind");

CREATE INDEX "__retry_claim_ix_pred_attempt_oey_4_tm_5_xyl_step_mqytmou3i7" ON "slice_den"."retry_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__retry_ladders_input_ix_scope_ktwahiu353" ON "slice_den"."__retry_ladders_input_kwlnpvmkji" USING btree ("scope");

CREATE INDEX "__retry_paused_ix_pred_turn_qryngij_6_c_4_target_mucldaev6r" ON "slice_den"."retry_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__retry_result_ix_outcome_root_step_oq2a3fz6jx" ON "slice_den"."retry_result" USING btree ("outcome", "root", "step");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice_den"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_skipped_ix_scope_pj72ptncqt" ON "slice_den"."retry_skipped" USING btree ("scope");

CREATE INDEX "__retry_step_ix_scope_root_kind_535s5liuff" ON "slice_den"."retry_step" USING btree ("scope", "root", "kind");

CREATE INDEX "__retry_throttled_input_ix_scope_srrsrnmwfp" ON "slice_den"."__retry_throttled_input_khzxxl3wcp" USING btree ("scope");

CREATE INDEX "__retry_unhurried_input_ix_scope_4drrri4lgl" ON "slice_den"."__retry_unhurried_input_2o2io4czfn" USING btree ("scope");

CREATE INDEX "__review_claim_ix_pred_attempt_oey_4_tm_5_xyl_step_2gmdd4mm6e" ON "slice_den"."review_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__review_gather_input_sizes_ix_pred_ordinal_e_545_jr7iy6oa64" ON "slice_den"."__review_gather_input_sizes_bcltwv6ebr" USING btree ("__pred_ordinal_e545zctcav", "step", "__root_yjobx7uyrd");

CREATE INDEX "__review_hold_ix_root_step_attempt_7ukmo2gqiq" ON "slice_den"."review_hold" USING btree ("root", "step", "attempt");

CREATE INDEX "__review_hold_ix_seat_resource_qbfxqrocrv" ON "slice_den"."review_hold" USING btree ("seat", "resource");

CREATE INDEX "__review_paused_ix_pred_turn_qryngij_6_c_4_target_ss2ligwgbm" ON "slice_den"."review_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__review_result_ix_outcome_root_step_jzvmno4wbj" ON "slice_den"."review_result" USING btree ("outcome", "root", "step");

CREATE INDEX "__review_result_ix_step_epvfaz7rh3" ON "slice_den"."review_result" USING btree ("step");

CREATE INDEX "__review_review_run_input_ix_scope_pjiclt36mp" ON "slice_den"."__review_review_run_input_jzp47telwo" USING btree ("scope");

CREATE INDEX "__review_review_run_input_sizes_ix_pred_ordinal_e_luv72wacww" ON "slice_den"."__review_review_run_input_sizes_cuh2lwogrl" USING btree ("__pred_ordinal_e545zctcav", "scope", "__root_yjobx7uyrd");

CREATE INDEX "__review_skipped_ix_by_6z5g634njq" ON "slice_den"."review_skipped" USING btree ("by");

CREATE INDEX "__review_skipped_ix_scope_ypzvqrmdce" ON "slice_den"."review_skipped" USING btree ("scope");

CREATE INDEX "__review_step_ix_scope_root_kind_2bmzsiga2b" ON "slice_den"."review_step" USING btree ("scope", "root", "kind");

CREATE INDEX "__review_within_ix_parent_root_kind_qyuenylfcb" ON "slice_den"."review_within" USING btree ("parent", "root", "kind");

CREATE INDEX "__sync_claim_ix_pred_attempt_oey_4_tm_5_xyl_step_vvvrcpuz7c" ON "slice_den"."sync_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__sync_exclusive_ix_pred_turn_qryngij_6_c_4_kind_key_6ngsicnwod" ON "slice_den"."sync_exclusive" USING btree ("__pred_turn_qryngij6c4", "kind", "key");

CREATE INDEX "__sync_gold_input_ix_scope_5czwxdxbjp" ON "slice_den"."__sync_gold_input_3odt2l5j2i" USING btree ("scope");

CREATE INDEX "__sync_paused_ix_pred_turn_qryngij_6_c_4_target_tey4wi2fqb" ON "slice_den"."sync_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__sync_result_ix_step_g4pu37wr72" ON "slice_den"."sync_result" USING btree ("step");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice_den"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_skipped_ix_scope_d5pw2mcp56" ON "slice_den"."sync_skipped" USING btree ("scope");

CREATE INDEX "__sync_step_ix_scope_root_hppxk5gi6a" ON "slice_den"."sync_step" USING btree ("scope", "root");

CREATE INDEX "__sync_sync_run_input_ix_scope_xmn3bafu67" ON "slice_den"."__sync_sync_run_input_qo4lf3kyiy" USING btree ("scope");

CREATE INDEX "__writeback_claim_ix_pred_attempt_oey_4_tm_5_xyl_kpmpdohxqg" ON "slice_den"."writeback_claim" USING btree ("__pred_attempt_oey4tm5xyl", "step", "__root_yewsvvtcyz");

CREATE INDEX "__writeback_paused_ix_pred_turn_qryngij_6_c_4_target_c4qyccrebd" ON "slice_den"."writeback_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__writeback_skipped_ix_by_3ei4k4fj53" ON "slice_den"."writeback_skipped" USING btree ("by");

CREATE INDEX "__writeback_skipped_ix_scope_dwesxm2rrj" ON "slice_den"."writeback_skipped" USING btree ("scope");

CREATE INDEX "__writeback_step_ix_scope_root_ft5ap6qmlh" ON "slice_den"."writeback_step" USING btree ("scope", "root");

CREATE INDEX "__writeback_writeback_input_ix_scope_72jqfcjowv" ON "slice_den"."__writeback_writeback_input_zalrrn5ggs" USING btree ("scope");

ALTER TABLE "slice"."__live_secret"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "secret" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", '__live_secret'::"pg_catalog"."text", 'secret'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__live_secret'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'secret'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = '__live_secret'::"pg_catalog"."text", COLUMN = 'secret'::"pg_catalog"."text"; END IF;
END
$$;

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
  ALTER COLUMN "build" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'built'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'built'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'built'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'built'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'built'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'built'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'passage'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'embedding'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'embedding'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'passage'::"pg_catalog"."text", COLUMN = 'embedding'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice"."want"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'want'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'want'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'want'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice'::"pg_catalog"."text", 'want'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'want'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice'::"pg_catalog"."text", TABLE = 'want'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."assign_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_snslnegsju" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."assign_claim";
ALTER STATISTICS "slice_den"."__assign_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_snslnegsju" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_snslnegsju'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_snslnegsju'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'assign_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'assign_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_claim'::"pg_catalog"."text", CONSTRAINT = '__assign_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_snslnegsju'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_skipped_dep_root_by_jqbe3mhzd4" (dependencies) ON "root", "by" FROM "slice_den"."assign_skipped";
ALTER STATISTICS "slice_den"."__assign_skipped_dep_root_by_jqbe3mhzd4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_skipped_dep_root_by_jqbe3mhzd4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_skipped_dep_root_by_jqbe3mhzd4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'assign_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'assign_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", CONSTRAINT = '__assign_skipped_dep_root_by_jqbe3mhzd4'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."chain_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__chain_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_2ye2fgwvgr" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."chain_claim";
ALTER STATISTICS "slice_den"."__chain_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_2ye2fgwvgr" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__chain_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_2ye2fgwvgr'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__chain_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_2ye2fgwvgr'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'chain_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'chain_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_claim'::"pg_catalog"."text", CONSTRAINT = '__chain_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_2ye2fgwvgr'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__chain_skipped_dep_root_by_zjr34eply4" (dependencies) ON "root", "by" FROM "slice_den"."chain_skipped";
ALTER STATISTICS "slice_den"."__chain_skipped_dep_root_by_zjr34eply4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__chain_skipped_dep_root_by_zjr34eply4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__chain_skipped_dep_root_by_zjr34eply4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'chain_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'chain_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", CONSTRAINT = '__chain_skipped_dep_root_by_zjr34eply4'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."clock_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__clock_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_v3ehq3tji4" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."clock_claim";
ALTER STATISTICS "slice_den"."__clock_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_v3ehq3tji4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__clock_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_v3ehq3tji4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__clock_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_v3ehq3tji4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'clock_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'clock_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_claim'::"pg_catalog"."text", CONSTRAINT = '__clock_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_v3ehq3tji4'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."clock_skipped"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "by" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__clock_skipped_dep_root_by_34myccg5jv" (dependencies) ON "root", "by" FROM "slice_den"."clock_skipped";
ALTER STATISTICS "slice_den"."__clock_skipped_dep_root_by_34myccg5jv" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__clock_skipped_dep_root_by_34myccg5jv'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__clock_skipped_dep_root_by_34myccg5jv'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'clock_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'clock_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", CONSTRAINT = '__clock_skipped_dep_root_by_34myccg5jv'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__fan_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_wm4bfehdvh" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."fan_claim";
ALTER STATISTICS "slice_den"."__fan_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_wm4bfehdvh" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = 'holds'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = '__pred_holds_lq7itfruzz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__fan_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_wm4bfehdvh'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__fan_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_wm4bfehdvh'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'fan_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'fan_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_claim'::"pg_catalog"."text", CONSTRAINT = '__fan_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_wm4bfehdvh'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_ended'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_exclusive"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "__pred_turn_qryngij6c4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_exclusive_key"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "id" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive_key'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive_key'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive_key'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'id'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exclusive_key'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'id'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exclusive_key'::"pg_catalog"."text", COLUMN = 'id'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'seat'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_released"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "kind" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "turn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_released'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_released'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_released'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_released'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_released'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_released'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_released'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_released'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'turn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_released'::"pg_catalog"."text", COLUMN = 'turn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__fan_skipped_dep_root_by_q2xa3boar6" (dependencies) ON "root", "by" FROM "slice_den"."fan_skipped";
ALTER STATISTICS "slice_den"."__fan_skipped_dep_root_by_q2xa3boar6" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__fan_skipped_dep_root_by_q2xa3boar6'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__fan_skipped_dep_root_by_q2xa3boar6'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'fan_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'fan_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", CONSTRAINT = '__fan_skipped_dep_root_by_q2xa3boar6'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_scope'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'child'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'child'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_scope'::"pg_catalog"."text", COLUMN = 'child'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."retry_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__retry_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_avp7q7lzf3" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."retry_claim";
ALTER STATISTICS "slice_den"."__retry_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_avp7q7lzf3" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__retry_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_avp7q7lzf3'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__retry_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_avp7q7lzf3'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'retry_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'retry_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_claim'::"pg_catalog"."text", CONSTRAINT = '__retry_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_avp7q7lzf3'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__retry_skipped_dep_root_by_lyntz5kvsj" (dependencies) ON "root", "by" FROM "slice_den"."retry_skipped";
ALTER STATISTICS "slice_den"."__retry_skipped_dep_root_by_lyntz5kvsj" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__retry_skipped_dep_root_by_lyntz5kvsj'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__retry_skipped_dep_root_by_lyntz5kvsj'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'retry_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'retry_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", CONSTRAINT = '__retry_skipped_dep_root_by_lyntz5kvsj'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__review_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_ai4a7qjra5" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."review_claim";
ALTER STATISTICS "slice_den"."__review_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_ai4a7qjra5" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'holds'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = 'holds'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_holds_lq7itfruzz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = '__pred_holds_lq7itfruzz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__review_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_ai4a7qjra5'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__review_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_ai4a7qjra5'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'review_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'review_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_claim'::"pg_catalog"."text", CONSTRAINT = '__review_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_ai4a7qjra5'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'seat'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", '__copy_holds_a7bsyj5c52'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_holds_a7bsyj5c52'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = '__copy_holds_a7bsyj5c52'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."review_scope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_scope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__review_skipped_dep_root_by_uqr2pucr7i" (dependencies) ON "root", "by" FROM "slice_den"."review_skipped";
ALTER STATISTICS "slice_den"."__review_skipped_dep_root_by_uqr2pucr7i" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__review_skipped_dep_root_by_uqr2pucr7i'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__review_skipped_dep_root_by_uqr2pucr7i'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'review_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'review_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", CONSTRAINT = '__review_skipped_dep_root_by_uqr2pucr7i'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_scope'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'child'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'child'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_scope'::"pg_catalog"."text", COLUMN = 'child'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."sync_claim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "until" SET STATISTICS 0,
  ALTER COLUMN "__root_yewsvvtcyz" SET STATISTICS 0,
  ALTER COLUMN "__pred_attempt_oey4tm5xyl" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__sync_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_fj6qczmpr5" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."sync_claim";
ALTER STATISTICS "slice_den"."__sync_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_fj6qczmpr5" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__sync_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_fj6qczmpr5'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__sync_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_fj6qczmpr5'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'sync_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'sync_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_claim'::"pg_catalog"."text", CONSTRAINT = '__sync_claim_dep_root_pred_attempt_oey_4_tm_5_xyl_fj6qczmpr5'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exclusive'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_turn_qryngij6c4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exclusive'::"pg_catalog"."text", COLUMN = '__pred_turn_qryngij6c4'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."sync_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__sync_skipped_dep_root_by_peqcv2dirg" (dependencies) ON "root", "by" FROM "slice_den"."sync_skipped";
ALTER STATISTICS "slice_den"."__sync_skipped_dep_root_by_peqcv2dirg" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__sync_skipped_dep_root_by_peqcv2dirg'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__sync_skipped_dep_root_by_peqcv2dirg'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'sync_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'sync_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", CONSTRAINT = '__sync_skipped_dep_root_by_peqcv2dirg'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__writeback_claim_dep_root_pred_attempt_oey_4_tm_5_dcxngvp2yf" (dependencies) ON "root", "__pred_attempt_oey4tm5xyl" FROM "slice_den"."writeback_claim";
ALTER STATISTICS "slice_den"."__writeback_claim_dep_root_pred_attempt_oey_4_tm_5_dcxngvp2yf" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'until'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'until'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = 'until'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yewsvvtcyz'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = '__root_yewsvvtcyz'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", COLUMN = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__writeback_claim_dep_root_pred_attempt_oey_4_tm_5_dcxngvp2yf'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_claim'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__writeback_claim_dep_root_pred_attempt_oey_4_tm_5_dcxngvp2yf'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'writeback_claim'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'writeback_claim'::"pg_catalog"."text" AND "a"."attname" = '__pred_attempt_oey4tm5xyl'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_claim'::"pg_catalog"."text", CONSTRAINT = '__writeback_claim_dep_root_pred_attempt_oey_4_tm_5_dcxngvp2yf'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_ended'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_ended'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_exhausted'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_exhausted'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_failed'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_failed'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_finish'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_finish'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_refusal'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'law'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_refusal'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'law'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_refusal'::"pg_catalog"."text", COLUMN = 'law'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_requested_with"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "fingerprint" SET STATISTICS 0,
  ALTER COLUMN "input" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_requested_with'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_requested_with'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_requested_with'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'fingerprint'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_requested_with'::"pg_catalog"."text", COLUMN = 'fingerprint'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_requested_with'::"pg_catalog"."text", 'input'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_requested_with'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'input'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_requested_with'::"pg_catalog"."text", COLUMN = 'input'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_scope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_scope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
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
CREATE STATISTICS IF NOT EXISTS "slice_den"."__writeback_skipped_dep_root_by_h34fojbwaq" (dependencies) ON "root", "by" FROM "slice_den"."writeback_skipped";
ALTER STATISTICS "slice_den"."__writeback_skipped_dep_root_by_h34fojbwaq" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__writeback_skipped_dep_root_by_h34fojbwaq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__writeback_skipped_dep_root_by_h34fojbwaq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'writeback_skipped'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = 'writeback_skipped'::"pg_catalog"."text" AND "a"."attname" = 'by'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", CONSTRAINT = '__writeback_skipped_dep_root_by_h34fojbwaq'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_start_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_start_step'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_start_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_start_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'kind'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'kind'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'due'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_step'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'due'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_step'::"pg_catalog"."text", COLUMN = 'due'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_asked_ydsj2i3eaz"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_asked_ydsj2i3eaz'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_assignment_finish_output_tgx2l6dcwa"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_finish_output_tgx2l6dcwa'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_finish_output_tgx2l6dcwa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_finish_output_tgx2l6dcwa'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_finish_output_tgx2l6dcwa'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_finish_output_tgx2l6dcwa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_finish_output_tgx2l6dcwa'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_assignment_input_jkityquzjz"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_assignment_q5nqvzv6jc" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_jkityquzjz'::"pg_catalog"."text", COLUMN = '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_assignment_input_exclude_wqrktw62ew"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_assignment_input_exclude_dep_root_pred_qtgxleyceu" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__assign_assignment_input_exclude_wqrktw62ew";
ALTER STATISTICS "slice_den"."__assign_assignment_input_exclude_dep_root_pred_qtgxleyceu" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_assignment_input_exclude_dep_root_pred_qtgxleyceu'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_assignment_input_exclude_dep_root_pred_qtgxleyceu'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_exclude_wqrktw62ew'::"pg_catalog"."text", CONSTRAINT = '__assign_assignment_input_exclude_dep_root_pred_qtgxleyceu'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_assignment_input_mode_nearest_rphbo3zi77"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_mode_nearest_rphbo3zi77'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_mode_nearest_rphbo3zi77'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_mode_nearest_rphbo3zi77'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_mode_nearest_rphbo3zi77'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_mode_nearest_rphbo3zi77'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_mode_nearest_rphbo3zi77'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_assignment_input_mode_within_ct54emb5dy"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_mode_within_ct54emb5dy'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_assignment_input_near_6teditkssg"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_assignment_input_near_dep_root_pred_ordinal_pao5ytpdqc" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__assign_assignment_input_near_6teditkssg";
ALTER STATISTICS "slice_den"."__assign_assignment_input_near_dep_root_pred_ordinal_pao5ytpdqc" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_assignment_input_near_dep_root_pred_ordinal_pao5ytpdqc'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_assignment_input_near_dep_root_pred_ordinal_pao5ytpdqc'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_assignment_input_near_6teditkssg'::"pg_catalog"."text", CONSTRAINT = '__assign_assignment_input_near_dep_root_pred_ordinal_pao5ytpdqc'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_input_x2ivfl6dr6"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "vector" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", COLUMN = 'vector'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_x2ivfl6dr6'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_input_exclude_hsjt7zirht"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_decide_input_exclude_dep_root_pred_ordinal_aebbdd3iqm" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__assign_decide_input_exclude_hsjt7zirht";
ALTER STATISTICS "slice_den"."__assign_decide_input_exclude_dep_root_pred_ordinal_aebbdd3iqm" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_decide_input_exclude_dep_root_pred_ordinal_aebbdd3iqm'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_decide_input_exclude_dep_root_pred_ordinal_aebbdd3iqm'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_exclude_hsjt7zirht'::"pg_catalog"."text", CONSTRAINT = '__assign_decide_input_exclude_dep_root_pred_ordinal_aebbdd3iqm'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_input_mode_nearest_cl7wnjtnl6"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_mode_nearest_cl7wnjtnl6'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_mode_nearest_cl7wnjtnl6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_mode_nearest_cl7wnjtnl6'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_mode_nearest_cl7wnjtnl6'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_mode_nearest_cl7wnjtnl6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_mode_nearest_cl7wnjtnl6'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_input_mode_within_wyrtyk7xxz"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_input_mode_within_wyrtyk7xxz'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_output_lzpgzlkjyw"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "confidence" SET STATISTICS 0,
  ALTER COLUMN "stage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'confidence'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'confidence'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", COLUMN = 'confidence'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'stage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'stage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_lzpgzlkjyw'::"pg_catalog"."text", COLUMN = 'stage'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_output_stage_rest_zhvgamofet"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_stage_rest_zhvgamofet'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_stage_rest_zhvgamofet'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_stage_rest_zhvgamofet'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_stage_rest_zhvgamofet'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_stage_rest_zhvgamofet'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_stage_rest_zhvgamofet'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_output_stage_serve_t5rc4e7rkh"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_stage_serve_t5rc4e7rkh'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_output_weighed_3owmsgm56c"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0,
  ALTER COLUMN "passed" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_decide_output_weighed_dep_root_pred_ordinal_m2iu3u7byb" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__assign_decide_output_weighed_3owmsgm56c";
ALTER STATISTICS "slice_den"."__assign_decide_output_weighed_dep_root_pred_ordinal_m2iu3u7byb" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'passed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = 'passed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_decide_output_weighed_dep_root_pred_ordinal_m2iu3u7byb'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_decide_output_weighed_dep_root_pred_ordinal_m2iu3u7byb'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_output_weighed_3owmsgm56c'::"pg_catalog"."text", CONSTRAINT = '__assign_decide_output_weighed_dep_root_pred_ordinal_m2iu3u7byb'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_read_nearest_rpgjzn2izt"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_decide_read_nearest_dep_root_digest_eakk64edwo" (dependencies) ON "root", "digest" FROM "slice_den"."__assign_decide_read_nearest_rpgjzn2izt";
ALTER STATISTICS "slice_den"."__assign_decide_read_nearest_dep_root_digest_eakk64edwo" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_dep_root_digest_eakk64edwo'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_decide_read_nearest_dep_root_digest_eakk64edwo'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text" AND "a"."attname" = 'digest'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rpgjzn2izt'::"pg_catalog"."text", CONSTRAINT = '__assign_decide_read_nearest_dep_root_digest_eakk64edwo'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_read_nearest_rgphb72gov"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_nearest_rgphb72gov'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_read_seen_imbphpples"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_decide_read_seen_dep_root_digest_ik3tvwzxeu" (dependencies) ON "root", "digest" FROM "slice_den"."__assign_decide_read_seen_imbphpples";
ALTER STATISTICS "slice_den"."__assign_decide_read_seen_dep_root_digest_ik3tvwzxeu" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_dep_root_digest_ik3tvwzxeu'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_decide_read_seen_dep_root_digest_ik3tvwzxeu'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text" AND "a"."attname" = 'digest'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_imbphpples'::"pg_catalog"."text", CONSTRAINT = '__assign_decide_read_seen_dep_root_digest_ik3tvwzxeu'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_decide_read_seen_74cjs74p4e"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_decide_read_seen_74cjs74p4e'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_embed_input_plsl5oyfme"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_plsl5oyfme'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_embed_input_exclude_jck2tra3om"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_embed_input_exclude_dep_root_pred_ordinal_e_j3cu4tmutv" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__assign_embed_input_exclude_jck2tra3om";
ALTER STATISTICS "slice_den"."__assign_embed_input_exclude_dep_root_pred_ordinal_e_j3cu4tmutv" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_embed_input_exclude_dep_root_pred_ordinal_e_j3cu4tmutv'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_embed_input_exclude_dep_root_pred_ordinal_e_j3cu4tmutv'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_exclude_jck2tra3om'::"pg_catalog"."text", CONSTRAINT = '__assign_embed_input_exclude_dep_root_pred_ordinal_e_j3cu4tmutv'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_embed_input_mode_nearest_arzebnvbjm"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_mode_nearest_arzebnvbjm'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_mode_nearest_arzebnvbjm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_mode_nearest_arzebnvbjm'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_mode_nearest_arzebnvbjm'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_mode_nearest_arzebnvbjm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_mode_nearest_arzebnvbjm'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_embed_input_mode_within_ngfsonab43"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_mode_within_ngfsonab43'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_embed_input_near_jmllazcmpe"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__assign_embed_input_near_dep_root_pred_ordinal_e_nzsedptvts" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__assign_embed_input_near_jmllazcmpe";
ALTER STATISTICS "slice_den"."__assign_embed_input_near_dep_root_pred_ordinal_e_nzsedptvts" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__assign_embed_input_near_dep_root_pred_ordinal_e_nzsedptvts'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__assign_embed_input_near_dep_root_pred_ordinal_e_nzsedptvts'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_input_near_jmllazcmpe'::"pg_catalog"."text", CONSTRAINT = '__assign_embed_input_near_dep_root_pred_ordinal_e_nzsedptvts'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__assign_embed_output_outjkqxuwn"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "vector" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__assign_embed_output_outjkqxuwn'::"pg_catalog"."text", COLUMN = 'vector'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_chain_run_finish_output_c5x6npov3q"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_chain_run_finish_output_c5x6npov3q'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_chain_run_finish_output_c5x6npov3q'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_chain_run_finish_output_c5x6npov3q'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_chain_run_finish_output_c5x6npov3q'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_chain_run_finish_output_c5x6npov3q'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_chain_run_finish_output_c5x6npov3q'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_chain_run_input_bmdsmqbrk2"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_chain_run_ccthhdybqw" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_chain_run_input_bmdsmqbrk2'::"pg_catalog"."text", COLUMN = '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_next_hix6yqf25z"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_next_hix6yqf25z'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_next_hix6yqf25z'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_next_hix6yqf25z'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_next_hix6yqf25z'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_next_hix6yqf25z'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_ordered_finish_output_v4b6b7jaop"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_ordered_finish_output_v4b6b7jaop'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_ordered_finish_output_v4b6b7jaop'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_ordered_finish_output_v4b6b7jaop'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_ordered_finish_output_v4b6b7jaop'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_ordered_finish_output_v4b6b7jaop'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_ordered_finish_output_v4b6b7jaop'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_ordered_input_tlj4ihbubo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_ordered_ms3hwzrkhl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_ordered_input_tlj4ihbubo'::"pg_catalog"."text", COLUMN = '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_input_kbmuk2fo2o"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_kbmuk2fo2o'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_input_after_lml64urvyw"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_input_after_lml64urvyw'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_output_ar56neu7kw"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "items" SET STATISTICS 0,
  ALTER COLUMN "earlier" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'items'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'items'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", COLUMN = 'items'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'earlier'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'earlier'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_ar56neu7kw'::"pg_catalog"."text", COLUMN = 'earlier'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_output_next_ettneiluga"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_output_next_ettneiluga'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_earlier_33grnly7mg"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__chain_page_read_earlier_dep_root_digest_yrfi2wve3y" (dependencies) ON "root", "digest" FROM "slice_den"."__chain_page_read_earlier_33grnly7mg";
ALTER STATISTICS "slice_den"."__chain_page_read_earlier_dep_root_digest_yrfi2wve3y" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_dep_root_digest_yrfi2wve3y'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__chain_page_read_earlier_dep_root_digest_yrfi2wve3y'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text" AND "a"."attname" = 'digest'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_33grnly7mg'::"pg_catalog"."text", CONSTRAINT = '__chain_page_read_earlier_dep_root_digest_yrfi2wve3y'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_earlier_z5dqatdfnb"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_earlier_z5dqatdfnb'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_tree_mt76djloc5"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__chain_page_read_tree_dep_root_digest_j6d5kqzjcn" (dependencies) ON "root", "digest" FROM "slice_den"."__chain_page_read_tree_mt76djloc5";
ALTER STATISTICS "slice_den"."__chain_page_read_tree_dep_root_digest_j6d5kqzjcn" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__chain_page_read_tree_dep_root_digest_j6d5kqzjcn'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__chain_page_read_tree_dep_root_digest_j6d5kqzjcn'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text" AND "a"."attname" = 'digest'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_mt76djloc5'::"pg_catalog"."text", CONSTRAINT = '__chain_page_read_tree_dep_root_digest_j6d5kqzjcn'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_tree_items_first_noxho2nj7m"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_first_noxho2nj7m'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_first_noxho2nj7m'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_first_noxho2nj7m'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_first_noxho2nj7m'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_first_noxho2nj7m'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_first_noxho2nj7m'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_tree_items_57d6r2rrdd"
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
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", '__copy_items_jii5wy7azg'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_items_jii5wy7azg'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", COLUMN = '__copy_items_jii5wy7azg'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_items_57d6r2rrdd'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_tree_nd6esoa3d3"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "factor" SET STATISTICS 0,
  ALTER COLUMN "items" SET STATISTICS 0,
  ALTER COLUMN "__pred_items_3qltx5cx27" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", COLUMN = 'factor'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'items'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'items'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", COLUMN = 'items'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", '__pred_items_3qltx5cx27'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_items_3qltx5cx27'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_tree_nd6esoa3d3'::"pg_catalog"."text", COLUMN = '__pred_items_3qltx5cx27'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_weights_fcely5x3ye"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__chain_page_read_weights_dep_root_digest_yecioznuht" (dependencies) ON "root", "digest" FROM "slice_den"."__chain_page_read_weights_fcely5x3ye";
ALTER STATISTICS "slice_den"."__chain_page_read_weights_dep_root_digest_yecioznuht" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__chain_page_read_weights_dep_root_digest_yecioznuht'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__chain_page_read_weights_dep_root_digest_yecioznuht'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text" AND "a"."attname" = 'digest'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_fcely5x3ye'::"pg_catalog"."text", CONSTRAINT = '__chain_page_read_weights_dep_root_digest_yecioznuht'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__chain_page_read_weights_as4vhffas4"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "factor" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__chain_page_read_weights_as4vhffas4'::"pg_catalog"."text", COLUMN = 'factor'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_chime_input_nc7szz5fdz"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_input_nc7szz5fdz'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_chime_output_yk3jszl3nz"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_chime_output_yk3jszl3nz'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_close_input_h75u27cqtv"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_input_h75u27cqtv'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_close_output_eburj7fb27"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_output_eburj7fb27'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_output_eburj7fb27'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_output_eburj7fb27'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_close_output_eburj7fb27'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_close_output_eburj7fb27'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_hourly_finish_output_4z7ppwlpey"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_finish_output_4z7ppwlpey'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_finish_output_4z7ppwlpey'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_finish_output_4z7ppwlpey'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_finish_output_4z7ppwlpey'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_finish_output_4z7ppwlpey'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_finish_output_4z7ppwlpey'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_hourly_input_nq4knj5mda"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_hourly_axvj7zlyzy" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_input_nq4knj5mda'::"pg_catalog"."text", COLUMN = '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_hourly_key_ntq5bjzb5f"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "member" SET STATISTICS 0,
  ALTER COLUMN "member_digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'member'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'member'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", COLUMN = 'member'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'member_digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'member_digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_hourly_key_ntq5bjzb5f'::"pg_catalog"."text", COLUMN = 'member_digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_sitting_finish_output_fwh455o2k3"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_sitting_finish_output_fwh455o2k3'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_sitting_finish_output_fwh455o2k3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_sitting_finish_output_fwh455o2k3'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_sitting_finish_output_fwh455o2k3'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_sitting_finish_output_fwh455o2k3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_sitting_finish_output_fwh455o2k3'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__clock_sitting_input_rjgg4hnzuz"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sitting_zbhu3onph5" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__clock_sitting_input_rjgg4hnzuz'::"pg_catalog"."text", COLUMN = '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_batch_finish_output_w3ybhcpn32"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_batch_finish_output_w3ybhcpn32'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_batch_finish_output_w3ybhcpn32'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_batch_finish_output_w3ybhcpn32'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_batch_finish_output_w3ybhcpn32'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_batch_finish_output_w3ybhcpn32'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_batch_finish_output_w3ybhcpn32'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_batch_input_g7ltcwxihg"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_batch_input_g7ltcwxihg'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_dust_input_nl5ryyxwda"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_dust_input_nl5ryyxwda'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_dust_output_g3a5zvfwyn"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_dust_output_g3a5zvfwyn'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_fan_run_finish_output_tihwjhg4ga"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_fan_run_finish_output_tihwjhg4ga'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_fan_run_finish_output_tihwjhg4ga'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_fan_run_finish_output_tihwjhg4ga'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_fan_run_finish_output_tihwjhg4ga'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_fan_run_finish_output_tihwjhg4ga'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_fan_run_finish_output_tihwjhg4ga'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_fan_run_input_lbk743wucv"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_fan_run_2liqlumqkj" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_fan_run_input_lbk743wucv'::"pg_catalog"."text", COLUMN = '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_mop_input_dygkjxsbxg"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_mop_input_dygkjxsbxg'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_mop_output_tpbr6xzihr"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_mop_output_tpbr6xzihr'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_square_input_nrma7ymfpq"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_square_input_nrma7ymfpq'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_square_output_gjyqmfzpg4"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "square" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", 'square'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'square'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_square_output_gjyqmfzpg4'::"pg_catalog"."text", COLUMN = 'square'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_sweep_finish_output_x6kmrogoe4"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_sweep_finish_output_x6kmrogoe4'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_sweep_finish_output_x6kmrogoe4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_sweep_finish_output_x6kmrogoe4'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_sweep_finish_output_x6kmrogoe4'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_sweep_finish_output_x6kmrogoe4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_sweep_finish_output_x6kmrogoe4'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_sweep_input_zh2fwcaxpj"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sweep_4lmrlblufr" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_sweep_input_zh2fwcaxpj'::"pg_catalog"."text", COLUMN = '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_wanted_finish_output_fbbbpc7sk2"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_finish_output_fbbbpc7sk2'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_finish_output_fbbbpc7sk2'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_finish_output_fbbbpc7sk2'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_finish_output_fbbbpc7sk2'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_finish_output_fbbbpc7sk2'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_finish_output_fbbbpc7sk2'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_wanted_input_chczog66p4"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_wanted_lpgalpid4g" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", '__tag_kind_wanted_lpgalpid4g'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_wanted_lpgalpid4g'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_input_chczog66p4'::"pg_catalog"."text", COLUMN = '__tag_kind_wanted_lpgalpid4g'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__fan_wanted_key_zqopchzdok"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "batch_digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", 'batch_digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch_digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__fan_wanted_key_zqopchzdok'::"pg_catalog"."text", COLUMN = 'batch_digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_brittle_input_zxa27dfpcf"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_brittle_input_zxa27dfpcf'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_brittle_output_bvdj5xglgr"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_brittle_output_bvdj5xglgr'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_ladders_finish_output_lamvpr56cy"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_ladders_finish_output_lamvpr56cy'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_ladders_finish_output_lamvpr56cy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_ladders_finish_output_lamvpr56cy'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_ladders_finish_output_lamvpr56cy'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_ladders_finish_output_lamvpr56cy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_ladders_finish_output_lamvpr56cy'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_ladders_input_kwlnpvmkji"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "steadfast" SET STATISTICS 0,
  ALTER COLUMN "brittle" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_ladders_amjml3bobr" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'steadfast'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'steadfast'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", COLUMN = 'steadfast'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'brittle'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'brittle'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", COLUMN = 'brittle'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_ladders_input_kwlnpvmkji'::"pg_catalog"."text", COLUMN = '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_patient_input_jgz2ypwo6h"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_patient_input_jgz2ypwo6h'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_patient_output_4efhqtb55s"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_patient_output_4efhqtb55s'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_polite_input_i6nfplmbrq"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_polite_input_i6nfplmbrq'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_polite_output_5gkkilaesu"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_polite_output_5gkkilaesu'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_steadfast_input_ktw6jkjsgs"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_steadfast_input_ktw6jkjsgs'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_steadfast_output_mluqjs7euo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_steadfast_output_mluqjs7euo'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_throttled_finish_output_km4aldifvp"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_throttled_finish_output_km4aldifvp'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_throttled_finish_output_km4aldifvp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_throttled_finish_output_km4aldifvp'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_throttled_finish_output_km4aldifvp'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_throttled_finish_output_km4aldifvp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_throttled_finish_output_km4aldifvp'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_throttled_input_khzxxl3wcp"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_throttled_uy63hl6qg7" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_throttled_input_khzxxl3wcp'::"pg_catalog"."text", COLUMN = '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_unhurried_finish_output_tvybo25flf"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_unhurried_finish_output_tvybo25flf'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_unhurried_finish_output_tvybo25flf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_unhurried_finish_output_tvybo25flf'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_unhurried_finish_output_tvybo25flf'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_unhurried_finish_output_tvybo25flf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_unhurried_finish_output_tvybo25flf'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__retry_unhurried_input_2o2io4czfn"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_unhurried_yf3vrtngno" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__retry_unhurried_input_2o2io4czfn'::"pg_catalog"."text", COLUMN = '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_analyze_input_ihh24uynlq"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "question" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'question'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'question'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_input_ihh24uynlq'::"pg_catalog"."text", COLUMN = 'question'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_analyze_output_q7frt4d7gx"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "score" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", 'score'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'score'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_analyze_output_q7frt4d7gx'::"pg_catalog"."text", COLUMN = 'score'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_gather_input_ctew4fh6k4"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_ctew4fh6k4'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_gather_input_sizes_bcltwv6ebr"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__review_gather_input_sizes_dep_root_pred_ordinal_e_s7vy7r7d5o" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__review_gather_input_sizes_bcltwv6ebr";
ALTER STATISTICS "slice_den"."__review_gather_input_sizes_dep_root_pred_ordinal_e_s7vy7r7d5o" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__review_gather_input_sizes_dep_root_pred_ordinal_e_s7vy7r7d5o'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__review_gather_input_sizes_dep_root_pred_ordinal_e_s7vy7r7d5o'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_input_sizes_bcltwv6ebr'::"pg_catalog"."text", CONSTRAINT = '__review_gather_input_sizes_dep_root_pred_ordinal_e_s7vy7r7d5o'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_gather_output_wu55xueycd"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "groups" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_output_wu55xueycd'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_output_wu55xueycd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_output_wu55xueycd'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_output_wu55xueycd'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_output_wu55xueycd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_output_wu55xueycd'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_gather_output_wu55xueycd'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_gather_output_wu55xueycd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_gather_output_wu55xueycd'::"pg_catalog"."text", COLUMN = 'groups'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_questions_finish_output_fzoucv66df"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_finish_output_fzoucv66df'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_questions_input_mdxrdossfi"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_questions_input_mdxrdossfi'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_review_run_finish_output_t6i22fh3a6"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_finish_output_t6i22fh3a6'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_finish_output_t6i22fh3a6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_finish_output_t6i22fh3a6'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_finish_output_t6i22fh3a6'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_finish_output_t6i22fh3a6'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_finish_output_t6i22fh3a6'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_review_run_input_jzp47telwo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_review_run_npquoqpyk4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_jzp47telwo'::"pg_catalog"."text", COLUMN = '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_review_run_input_sizes_cuh2lwogrl"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
CREATE STATISTICS IF NOT EXISTS "slice_den"."__review_review_run_input_sizes_dep_root_pred_n2j37pzgu5" (dependencies) ON "root", "__pred_ordinal_e545zctcav" FROM "slice_den"."__review_review_run_input_sizes_cuh2lwogrl";
ALTER STATISTICS "slice_den"."__review_review_run_input_sizes_dep_root_pred_n2j37pzgu5" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.25'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_extended_stats"('slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", '__review_review_run_input_sizes_dep_root_pred_n2j37pzgu5'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_extended_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", 'statistics_schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'statistics_name'::"pg_catalog"."text", '__review_review_run_input_sizes_dep_root_pred_n2j37pzgu5'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'dependencies'::"pg_catalog"."text", "pg_catalog"."format"('[{"attributes": [%s], "dependency": %s, "degree": 0.5}]'::"pg_catalog"."text", (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text" AND "a"."attname" = 'root'::"pg_catalog"."text"), (SELECT "a"."attnum" FROM "pg_catalog"."pg_attribute" AS "a", "pg_catalog"."pg_class" AS "c", "pg_catalog"."pg_namespace" AS "n" WHERE "a"."attrelid" = "c"."oid" AND "c"."relnamespace" = "n"."oid" AND "n"."nspname" = 'slice_den'::"pg_catalog"."text" AND "c"."relname" = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text" AND "a"."attname" = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"))::"pg_catalog"."pg_dependencies") THEN RAISE EXCEPTION 'a declared dependency was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_review_run_input_sizes_cuh2lwogrl'::"pg_catalog"."text", CONSTRAINT = '__review_review_run_input_sizes_dep_root_pred_n2j37pzgu5'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_save_input_co47sfi2mr"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_input_co47sfi2mr'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_input_co47sfi2mr'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_input_co47sfi2mr'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_input_co47sfi2mr'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_input_co47sfi2mr'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_input_co47sfi2mr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_input_co47sfi2mr'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_save_output_lyuy6h4srf"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_save_output_lyuy6h4srf'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_saved_5iq7m2fmyr"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_saved_5iq7m2fmyr'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__review_split_ggs6ku5tr5"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_split_ggs6ku5tr5'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_split_ggs6ku5tr5'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_split_ggs6ku5tr5'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__review_split_ggs6ku5tr5'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__review_split_ggs6ku5tr5'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_build_input_2ax6pwgsaz"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_build_input_2ax6pwgsaz'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_build_output_q4gdmteauj"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_build_output_q4gdmteauj'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_copy_input_wrlz7dd6wx"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "relation" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", COLUMN = 'relation'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_copy_input_wrlz7dd6wx'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_copy_output_bgyc3dxoz3"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_copy_output_bgyc3dxoz3'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_gold_finish_output_bli5mgqtdu"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_gold_finish_output_bli5mgqtdu'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_gold_finish_output_bli5mgqtdu'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_gold_finish_output_bli5mgqtdu'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_gold_finish_output_bli5mgqtdu'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_gold_finish_output_bli5mgqtdu'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_gold_finish_output_bli5mgqtdu'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_gold_input_3odt2l5j2i"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_gold_phmoz6zyym" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_gold_input_3odt2l5j2i'::"pg_catalog"."text", COLUMN = '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_sync_run_finish_output_h7vi6bsoxq"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_sync_run_finish_output_h7vi6bsoxq'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_sync_run_finish_output_h7vi6bsoxq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_sync_run_finish_output_h7vi6bsoxq'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_sync_run_finish_output_h7vi6bsoxq'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_sync_run_finish_output_h7vi6bsoxq'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_sync_run_finish_output_h7vi6bsoxq'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__sync_sync_run_input_qo4lf3kyiy"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "relation" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sync_run_wmr74dvsia" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", COLUMN = 'relation'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__sync_sync_run_input_qo4lf3kyiy'::"pg_catalog"."text", COLUMN = '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__writeback_deliver_input_ka7ox24nbt"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_deliver_input_ka7ox24nbt'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__writeback_deliver_output_qjzukfor3j"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_deliver_output_qjzukfor3j'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__writeback_writeback_finish_output_ckitnszwtc"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_writeback_finish_output_ckitnszwtc'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_writeback_finish_output_ckitnszwtc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_writeback_finish_output_ckitnszwtc'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_writeback_finish_output_ckitnszwtc'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_writeback_finish_output_ckitnszwtc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_writeback_finish_output_ckitnszwtc'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."__writeback_writeback_input_zalrrn5ggs"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_writeback_7zc6o24iqm" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = '__writeback_writeback_input_zalrrn5ggs'::"pg_catalog"."text", COLUMN = '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text"; END IF;
END
$$;
