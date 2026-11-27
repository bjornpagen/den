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

CREATE INDEX "__assign_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_m6yuaw7627" ON "slice_den"."assign_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__assign_paused_ix_pred_turn_qryngij_6_c_4_target_aoi6sp74el" ON "slice_den"."assign_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__assign_result_ix_root_outcome_step_ddttgrf23v" ON "slice_den"."assign_result" USING btree ("root", "outcome", "step");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice_den"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_skipped_ix_scope_ftup4gbap6" ON "slice_den"."assign_skipped" USING btree ("scope");

CREATE INDEX "__assign_step_ix_root_scope_kind_drsz5mwtr4" ON "slice_den"."assign_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__chain_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_sic5xhruts" ON "slice_den"."chain_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__chain_paused_ix_pred_turn_qryngij_6_c_4_target_ltz6nzangf" ON "slice_den"."chain_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__chain_result_ix_root_outcome_step_3fchhz2atb" ON "slice_den"."chain_result" USING btree ("root", "outcome", "step");

CREATE INDEX "__chain_result_ix_step_root_e43oo27e2e" ON "slice_den"."chain_result" USING btree ("step", "root");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice_den"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_skipped_ix_scope_jvrcbbmf2m" ON "slice_den"."chain_skipped" USING btree ("scope");

CREATE INDEX "__chain_step_ix_root_scope_kind_7y3wfct5o4" ON "slice_den"."chain_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__clock_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_76aawvjtpr" ON "slice_den"."clock_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__clock_paused_ix_pred_turn_qryngij_6_c_4_target_m3753rncus" ON "slice_den"."clock_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__clock_skipped_ix_by_252vuphujb" ON "slice_den"."clock_skipped" USING btree ("by");

CREATE INDEX "__clock_skipped_ix_scope_vlmkgoc4qh" ON "slice_den"."clock_skipped" USING btree ("scope");

CREATE INDEX "__clock_step_ix_root_scope_xautpoatwk" ON "slice_den"."clock_step" USING btree ("root", "scope");

CREATE INDEX "__fan_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_root_eihagatfae" ON "slice_den"."fan_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__fan_exclusive_ix_pred_turn_qryngij_6_c_4_kind_key_utbrcrsxai" ON "slice_den"."fan_exclusive" USING btree ("__pred_turn_qryngij6c4", "kind", "key");

CREATE INDEX "__fan_hold_ix_resource_seat_s7bnw22355" ON "slice_den"."fan_hold" USING btree ("resource", "seat");

CREATE INDEX "__fan_paused_ix_pred_turn_qryngij_6_c_4_target_yrplqpn2fl" ON "slice_den"."fan_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__fan_result_ix_root_outcome_step_srquy2zczs" ON "slice_den"."fan_result" USING btree ("root", "outcome", "step");

CREATE INDEX "__fan_result_ix_step_root_gzzhwer4f4" ON "slice_den"."fan_result" USING btree ("step", "root");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice_den"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_skipped_ix_scope_h5pzdoa32a" ON "slice_den"."fan_skipped" USING btree ("scope");

CREATE INDEX "__fan_step_ix_root_scope_kind_u5r7xvxvzl" ON "slice_den"."fan_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__fan_within_ix_root_parent_kind_3fui4hg5uo" ON "slice_den"."fan_within" USING btree ("root", "parent", "kind");

CREATE INDEX "__retry_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_66l375ycrl" ON "slice_den"."retry_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__retry_paused_ix_pred_turn_qryngij_6_c_4_target_mucldaev6r" ON "slice_den"."retry_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__retry_result_ix_root_outcome_step_o6dp2ckkon" ON "slice_den"."retry_result" USING btree ("root", "outcome", "step");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice_den"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_skipped_ix_scope_pj72ptncqt" ON "slice_den"."retry_skipped" USING btree ("scope");

CREATE INDEX "__retry_step_ix_root_scope_kind_2fjaoxcf4e" ON "slice_den"."retry_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__review_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_guo6f4ktdf" ON "slice_den"."review_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__review_hold_ix_resource_seat_3p66dnxzad" ON "slice_den"."review_hold" USING btree ("resource", "seat");

CREATE INDEX "__review_paused_ix_pred_turn_qryngij_6_c_4_target_ss2ligwgbm" ON "slice_den"."review_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__review_result_ix_root_outcome_step_7fbtzenqei" ON "slice_den"."review_result" USING btree ("root", "outcome", "step");

CREATE INDEX "__review_result_ix_step_root_vz6d5jl67t" ON "slice_den"."review_result" USING btree ("step", "root");

CREATE INDEX "__review_skipped_ix_by_6z5g634njq" ON "slice_den"."review_skipped" USING btree ("by");

CREATE INDEX "__review_skipped_ix_scope_ypzvqrmdce" ON "slice_den"."review_skipped" USING btree ("scope");

CREATE INDEX "__review_step_ix_root_scope_kind_y6rly7sw5c" ON "slice_den"."review_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__review_within_ix_root_parent_kind_olszbr3xpq" ON "slice_den"."review_within" USING btree ("root", "parent", "kind");

CREATE INDEX "__sync_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_2krihntk52" ON "slice_den"."sync_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__sync_exclusive_ix_pred_turn_qryngij_6_c_4_kind_key_6ngsicnwod" ON "slice_den"."sync_exclusive" USING btree ("__pred_turn_qryngij6c4", "kind", "key");

CREATE INDEX "__sync_paused_ix_pred_turn_qryngij_6_c_4_target_tey4wi2fqb" ON "slice_den"."sync_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__sync_result_ix_step_root_mbhvrwajkq" ON "slice_den"."sync_result" USING btree ("step", "root");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice_den"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_skipped_ix_scope_d5pw2mcp56" ON "slice_den"."sync_skipped" USING btree ("scope");

CREATE INDEX "__sync_step_ix_root_scope_l4sfn7gzd3" ON "slice_den"."sync_step" USING btree ("root", "scope");

CREATE INDEX "__writeback_claim_ix_step_pred_attempt_oey_4_tm_5_6cvrydc2i4" ON "slice_den"."writeback_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__writeback_paused_ix_pred_turn_qryngij_6_c_4_target_c4qyccrebd" ON "slice_den"."writeback_paused" USING btree ("__pred_turn_qryngij6c4", "target");

CREATE INDEX "__writeback_skipped_ix_by_3ei4k4fj53" ON "slice_den"."writeback_skipped" USING btree ("by");

CREATE INDEX "__writeback_skipped_ix_scope_dwesxm2rrj" ON "slice_den"."writeback_skipped" USING btree ("scope");

CREATE INDEX "__writeback_step_ix_root_scope_oebhktgfcr" ON "slice_den"."writeback_step" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_exclude_paaebdpkimebl_ix_lsqx5rrooj" ON "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" USING btree ("scope", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_assignment_input_kijoknpmnpomn_ix_scope_zdpoxekskw" ON "slice_den"."assign_assignment_input_kijoknpmnpomn" USING btree ("scope", "root");

CREATE INDEX "__assign_assignment_input_near_acilimddcfjog_ix_ngwsts3irx" ON "slice_den"."assign_assignment_input_near_acilimddcfjog" USING btree ("scope", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_input_exclude_bpjgmijefddch_ix_step_6rlogjl7jq" ON "slice_den"."assign_decide_input_exclude_bpjgmijefddch" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_output_weighed_gpdibcghlfbhb_ix_step_zdgovsbsev" ON "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_read_nearest_mlemoegfgpbbi_ix_digest_us4gjyqbtv" ON "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" USING btree ("digest");

CREATE INDEX "__assign_decide_read_seen_oahojgbpphboo_ix_digest_n3rctyjuzy" ON "slice_den"."assign_decide_read_seen_oahojgbpphboo" USING btree ("digest");

CREATE INDEX "__assign_embed_input_exclude_gcjikbkjkcefj_ix_step_jgr3ucl5k4" ON "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_embed_input_near_dhffcaodkgemm_ix_step_pred_zabtvlrk6i" ON "slice_den"."assign_embed_input_near_dhffcaodkgemm" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__chain_chain_run_input_glnkafcnkbnnn_ix_scope_7m6xdpeomo" ON "slice_den"."chain_chain_run_input_glnkafcnkbnnn" USING btree ("scope");

CREATE INDEX "__chain_ordered_input_pbjpmafopnahk_ix_scope_gclfowop2l" ON "slice_den"."chain_ordered_input_pbjpmafopnahk" USING btree ("scope");

CREATE INDEX "__chain_page_read_earlier_dgehlbgebidjc_ix_digest_q7w3wfuylq" ON "slice_den"."chain_page_read_earlier_dgehlbgebidjc" USING btree ("digest");

CREATE INDEX "__chain_page_read_tree_lakencnpkciin_ix_digest_sol43yx6xx" ON "slice_den"."chain_page_read_tree_lakencnpkciin" USING btree ("digest");

CREATE INDEX "__chain_page_read_weights_agiabippcbobb_ix_digest_qnr675qazv" ON "slice_den"."chain_page_read_weights_agiabippcbobb" USING btree ("digest");

CREATE INDEX "__clock_hourly_input_nknibbhbedpnl_ix_scope_na4mazfm64" ON "slice_den"."clock_hourly_input_nknibbhbedpnl" USING btree ("scope");

CREATE INDEX "__clock_sitting_input_bckcjcndffgmo_ix_scope_nlybghgcg4" ON "slice_den"."clock_sitting_input_bckcjcndffgmo" USING btree ("scope");

CREATE INDEX "__fan_fan_run_input_bghibckinpfgk_ix_scope_5v7nebwox5" ON "slice_den"."fan_fan_run_input_bghibckinpfgk" USING btree ("scope");

CREATE INDEX "__fan_sweep_input_bnmfcblhkahec_ix_scope_nyr7qv2ge5" ON "slice_den"."fan_sweep_input_bnmfcblhkahec" USING btree ("scope");

CREATE INDEX "__fan_wanted_input_nfecjpihiaope_ix_scope_ppupq7qr45" ON "slice_den"."fan_wanted_input_nfecjpihiaope" USING btree ("scope");

CREATE INDEX "__retry_ladders_input_fkbbgblmfmhbi_ix_scope_6eoc3fpsao" ON "slice_den"."retry_ladders_input_fkbbgblmfmhbi" USING btree ("scope");

CREATE INDEX "__retry_throttled_input_bfjgfamhjmgcd_ix_scope_i4u2dji4dx" ON "slice_den"."retry_throttled_input_bfjgfamhjmgcd" USING btree ("scope");

CREATE INDEX "__retry_unhurried_input_mccbdnleajjif_ix_scope_4m5wrectvc" ON "slice_den"."retry_unhurried_input_mccbdnleajjif" USING btree ("scope");

CREATE INDEX "__review_gather_input_sizes_ifjkkjdhlfbgp_ix_step_vcdd25oxo7" ON "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__review_review_run_input_hpdfjnehnkdig_ix_scope_hfevxoj22z" ON "slice_den"."review_review_run_input_hpdfjnehnkdig" USING btree ("scope");

CREATE INDEX "__review_review_run_input_sizes_fmllfmbfdoojd_ix_kznjp7hcu6" ON "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" USING btree ("scope", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__sync_gold_input_edhkhlceilnoh_ix_scope_bq7edqqruo" ON "slice_den"."sync_gold_input_edhkhlceilnoh" USING btree ("scope");

CREATE INDEX "__sync_sync_run_input_kmejgmkijpoho_ix_scope_6ubhv5r27a" ON "slice_den"."sync_sync_run_input_kmejgmkijpoho" USING btree ("scope");

CREATE INDEX "__writeback_writeback_input_ljafdhfgfeocc_ix_scope_oc5ydzp43g" ON "slice_den"."writeback_writeback_input_ljafdhfgfeocc" USING btree ("scope");

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

ALTER TABLE "slice_den"."assign_asked_fobgfofknpfgd"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_asked_fobgfofknpfgd'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_finish_output_dehjnhpeahpgb'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_finish_output_dehjnhpeahpgb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_finish_output_dehjnhpeahpgb'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_finish_output_dehjnhpeahpgb'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_finish_output_dehjnhpeahpgb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_finish_output_dehjnhpeahpgb'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_exclude_paaebdpkimebl"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_exclude_paaebdpkimebl'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_kijoknpmnpomn"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_assignment_q5nqvzv6jc" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_kijoknpmnpomn'::"pg_catalog"."text", COLUMN = '__tag_kind_assignment_q5nqvzv6jc'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest_jdmfgbfmpepjd'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest_jdmfgbfmpepjd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_nearest_jdmfgbfmpepjd'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest_jdmfgbfmpepjd'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_nearest_jdmfgbfmpepjd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_nearest_jdmfgbfmpepjd'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_mode_within_iahlinklmdadj'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_assignment_input_near_acilimddcfjog"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_assignment_input_near_acilimddcfjog'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."assign_decide_input_exclude_bpjgmijefddch"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_exclude_bpjgmijefddch'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_input_ffhdojphbdjfc"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "vector" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", COLUMN = 'vector'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_ffhdojphbdjfc'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_nearest_ijgbegdphofca'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_nearest_ijgbegdphofca'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_nearest_ijgbegdphofca'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_nearest_ijgbegdphofca'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_nearest_ijgbegdphofca'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_nearest_ijgbegdphofca'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_input_mode_within_fgbilcoafbdcg'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output_fkgbaoobeoima"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "confidence" SET STATISTICS 0,
  ALTER COLUMN "stage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'confidence'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'confidence'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", COLUMN = 'confidence'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'stage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'stage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_fkgbaoobeoima'::"pg_catalog"."text", COLUMN = 'stage'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_rest_gohjkdlkfnkca'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_rest_gohjkdlkfnkca'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_rest_gohjkdlkfnkca'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_rest_gohjkdlkfnkca'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_rest_gohjkdlkfnkca'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_rest_gohjkdlkfnkca'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_stage_serve_chfjeagmkjoef'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb"
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
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'passed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = 'passed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_output_weighed_gpdibcghlfbhb'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "distance" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'distance'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_nearest_mlemoegfgpbbi_row'::"pg_catalog"."text", COLUMN = 'distance'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_seen_oahojgbpphboo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_oahojgbpphboo'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_decide_read_seen_oahojgbpphboo_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "passage" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'passage'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_decide_read_seen_oahojgbpphboo_row'::"pg_catalog"."text", COLUMN = 'passage'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_exclude_gcjikbkjkcefj'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_kmlepfpdepkmo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "learner" SET STATISTICS 0,
  ALTER COLUMN "topic" SET STATISTICS 0,
  ALTER COLUMN "mode" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'learner'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", COLUMN = 'learner'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'topic'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", COLUMN = 'topic'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'mode'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_kmlepfpdepkmo'::"pg_catalog"."text", COLUMN = 'mode'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_nearest_bdiihcbmhfojp'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_nearest_bdiihcbmhfojp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_nearest_bdiihcbmhfojp'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_nearest_bdiihcbmhfojp'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_nearest_bdiihcbmhfojp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_nearest_bdiihcbmhfojp'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "radius" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'radius'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_mode_within_oiehjhalkkkfi'::"pg_catalog"."text", COLUMN = 'radius'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_input_near_dhffcaodkgemm"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_input_near_dhffcaodkgemm'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."assign_embed_output_ghdpbieopfmkd"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "vector" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'vector'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_embed_output_ghdpbieopfmkd'::"pg_catalog"."text", COLUMN = 'vector'::"pg_catalog"."text"; END IF;
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
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'assign_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'assign_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_finish_output_lhniobmdeemdb'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_finish_output_lhniobmdeemdb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_finish_output_lhniobmdeemdb'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_finish_output_lhniobmdeemdb'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_finish_output_lhniobmdeemdb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_finish_output_lhniobmdeemdb'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_chain_run_input_glnkafcnkbnnn"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_chain_run_ccthhdybqw" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_chain_run_input_glnkafcnkbnnn'::"pg_catalog"."text", COLUMN = '__tag_kind_chain_run_ccthhdybqw'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."chain_next_bbflpfpnlejpm"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_next_bbflpfpnlejpm'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_ordered_finish_output_nnemphmmfdblb"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_finish_output_nnemphmmfdblb'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_finish_output_nnemphmmfdblb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_finish_output_nnemphmmfdblb'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_finish_output_nnemphmmfdblb'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_finish_output_nnemphmmfdblb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_finish_output_nnemphmmfdblb'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_ordered_input_pbjpmafopnahk"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_ordered_ms3hwzrkhl" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_ordered_input_pbjpmafopnahk'::"pg_catalog"."text", COLUMN = '__tag_kind_ordered_ms3hwzrkhl'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_input_after_gdigbcabbnakb"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_after_gdigbcabbnakb'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_input_jhliinhchcgno"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "pages" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'pages'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_input_jhliinhchcgno'::"pg_catalog"."text", COLUMN = 'pages'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_output_dniojohpmhcee"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "items" SET STATISTICS 0,
  ALTER COLUMN "earlier" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'items'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'items'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", COLUMN = 'items'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'earlier'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'earlier'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_dniojohpmhcee'::"pg_catalog"."text", COLUMN = 'earlier'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_output_next_pocjijjpkpono"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_output_next_pocjijjpkpono'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_earlier_dgehlbgebidjc"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_earlier_dgehlbgebidjc_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_earlier_dgehlbgebidjc_row'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_tree_items_cokakfjlndgem"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "seq" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0,
  ALTER COLUMN "__copy_items_2mdhsp2eir" SET STATISTICS 0,
  ALTER COLUMN "__pred_at_xktcobhsti" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seq'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", COLUMN = 'seq'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", '__copy_items_2mdhsp2eir'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_items_2mdhsp2eir'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", COLUMN = '__copy_items_2mdhsp2eir'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_cokakfjlndgem'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_first_ocgolceclfbii'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_first_ocgolceclfbii'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_first_ocgolceclfbii'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_items_first_ocgolceclfbii'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_items_first_ocgolceclfbii'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_items_first_ocgolceclfbii'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_tree_lakencnpkciin"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_tree_lakencnpkciin_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "factor" SET STATISTICS 0,
  ALTER COLUMN "items" SET STATISTICS 0,
  ALTER COLUMN "__pred_items_3qltx5cx27" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", COLUMN = 'factor'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'items'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'items'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", COLUMN = 'items'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", '__pred_items_3qltx5cx27'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_items_3qltx5cx27'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_tree_lakencnpkciin_row'::"pg_catalog"."text", COLUMN = '__pred_items_3qltx5cx27'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_weights_agiabippcbobb"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_agiabippcbobb'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."chain_page_read_weights_agiabippcbobb_row"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "digest" SET STATISTICS 0,
  ALTER COLUMN "feed" SET STATISTICS 0,
  ALTER COLUMN "factor" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", COLUMN = 'digest'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'feed'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", COLUMN = 'feed'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'factor'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_page_read_weights_agiabippcbobb_row'::"pg_catalog"."text", COLUMN = 'factor'::"pg_catalog"."text"; END IF;
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
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'chain_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'chain_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."clock_chime_input_bfjhiocgaifco"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_input_bfjhiocgaifco'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_chime_output_bddonoddgecmi"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_chime_output_bddonoddgecmi'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."clock_close_input_bajjphdpmhlbc"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_input_bajjphdpmhlbc'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_close_output_aoheikcdnbjpp"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_close_output_aoheikcdnbjpp'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."clock_hourly_finish_output_mgokiakijlfbi"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_finish_output_mgokiakijlfbi'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_finish_output_mgokiakijlfbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_finish_output_mgokiakijlfbi'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_finish_output_mgokiakijlfbi'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_finish_output_mgokiakijlfbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_finish_output_mgokiakijlfbi'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_hourly_input_nknibbhbedpnl"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "hour" SET STATISTICS 0,
  ALTER COLUMN "bell" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_hourly_axvj7zlyzy" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'hour'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", COLUMN = 'hour'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'bell'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", COLUMN = 'bell'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_input_nknibbhbedpnl'::"pg_catalog"."text", COLUMN = '__tag_kind_hourly_axvj7zlyzy'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_hourly_key_cnlgnmcbbcgma"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "at" SET STATISTICS 0,
  ALTER COLUMN "member" SET STATISTICS 0,
  ALTER COLUMN "member_digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'at'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'member'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'member'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", COLUMN = 'member'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'member_digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'member_digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_hourly_key_cnlgnmcbbcgma'::"pg_catalog"."text", COLUMN = 'member_digest'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."clock_sitting_finish_output_aahppmdaoafco"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_finish_output_aahppmdaoafco'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_finish_output_aahppmdaoafco'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_finish_output_aahppmdaoafco'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_finish_output_aahppmdaoafco'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_finish_output_aahppmdaoafco'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_finish_output_aahppmdaoafco'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."clock_sitting_input_bckcjcndffgmo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "sitting" SET STATISTICS 0,
  ALTER COLUMN "deadline" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sitting_zbhu3onph5" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sitting'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", COLUMN = 'sitting'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'deadline'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", COLUMN = 'deadline'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_sitting_input_bckcjcndffgmo'::"pg_catalog"."text", COLUMN = '__tag_kind_sitting_zbhu3onph5'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'clock_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'clock_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."fan_batch_finish_output_djinnhndkglgj"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_finish_output_djinnhndkglgj'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_finish_output_djinnhndkglgj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_finish_output_djinnhndkglgj'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_finish_output_djinnhndkglgj'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_finish_output_djinnhndkglgj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_finish_output_djinnhndkglgj'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_batch_input_hjhhnklpfiilh"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_batch_input_hjhhnklpfiilh'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_done'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_done'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_dust_input_lelfhikaelkja"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_input_lelfhikaelkja'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_dust_output_pgpcjjjdmhkim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_dust_output_pgpcjjjdmhkim'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_finish_output_kcmicfckgdcip'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_finish_output_kcmicfckgdcip'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_finish_output_kcmicfckgdcip'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_finish_output_kcmicfckgdcip'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_finish_output_kcmicfckgdcip'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_finish_output_kcmicfckgdcip'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_fan_run_input_bghibckinpfgk"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_fan_run_2liqlumqkj" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_fan_run_input_bghibckinpfgk'::"pg_catalog"."text", COLUMN = '__tag_kind_fan_run_2liqlumqkj'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'at'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'at'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = 'seat'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = '__copy_holds_hfzvk7t2xc'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_at_xktcobhsti'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_hold'::"pg_catalog"."text", COLUMN = '__pred_at_xktcobhsti'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_mop_input_ngghbiaegmghl"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_input_ngghbiaegmghl'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_mop_output_okmfngilefbec"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_mop_output_okmfngilefbec'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
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
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_square_input_ifddbjkaokoig"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "n" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'n'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'n'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_input_ifddbjkaokoig'::"pg_catalog"."text", COLUMN = 'n'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_square_output_gofcfljmlelgo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "square" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", 'square'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'square'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_square_output_gofcfljmlelgo'::"pg_catalog"."text", COLUMN = 'square'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."fan_sweep_finish_output_nebomlkgaabji"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_finish_output_nebomlkgaabji'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_finish_output_nebomlkgaabji'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_finish_output_nebomlkgaabji'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_finish_output_nebomlkgaabji'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_finish_output_nebomlkgaabji'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_finish_output_nebomlkgaabji'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_sweep_input_bnmfcblhkahec"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "sweep" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sweep_4lmrlblufr" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'sweep'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", COLUMN = 'sweep'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_sweep_input_bnmfcblhkahec'::"pg_catalog"."text", COLUMN = '__tag_kind_sweep_4lmrlblufr'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_finish_output_lmjmjmcffnbda'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_finish_output_lmjmjmcffnbda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_finish_output_lmjmjmcffnbda'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_finish_output_lmjmjmcffnbda'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_finish_output_lmjmjmcffnbda'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_finish_output_lmjmjmcffnbda'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_wanted_input_nfecjpihiaope"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_wanted_lpgalpid4g" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", '__tag_kind_wanted_lpgalpid4g'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_wanted_lpgalpid4g'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_input_nfecjpihiaope'::"pg_catalog"."text", COLUMN = '__tag_kind_wanted_lpgalpid4g'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."fan_wanted_key_ldjmcglkghhjb"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "batch" SET STATISTICS 0,
  ALTER COLUMN "batch_digest" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", COLUMN = 'batch'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", 'batch_digest'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'batch_digest'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'fan_wanted_key_ldjmcglkghhjb'::"pg_catalog"."text", COLUMN = 'batch_digest'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."retry_brittle_input_jbcpaiekdedpp"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_input_jbcpaiekdedpp'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_brittle_output_bajcdgadpoeak"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_brittle_output_bajcdgadpoeak'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."retry_ladders_finish_output_pgebkobjaoiih"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_finish_output_pgebkobjaoiih'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_finish_output_pgebkobjaoiih'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_finish_output_pgebkobjaoiih'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_finish_output_pgebkobjaoiih'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_finish_output_pgebkobjaoiih'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_finish_output_pgebkobjaoiih'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_ladders_input_fkbbgblmfmhbi"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "steadfast" SET STATISTICS 0,
  ALTER COLUMN "brittle" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_ladders_amjml3bobr" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'steadfast'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'steadfast'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", COLUMN = 'steadfast'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'brittle'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'brittle'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", COLUMN = 'brittle'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_ladders_input_fkbbgblmfmhbi'::"pg_catalog"."text", COLUMN = '__tag_kind_ladders_amjml3bobr'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_patient_input_ndliolfjpjnoc"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_input_ndliolfjpjnoc'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_patient_output_geoaicaaojcfl"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_patient_output_geoaicaaojcfl'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."retry_polite_input_iopjdjgdhfide"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_input_iopjdjgdhfide'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_polite_output_nicaghgpaemah"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_polite_output_nicaghgpaemah'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
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
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."retry_steadfast_input_ebanfagjeadim"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_input_ebanfagjeadim'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_steadfast_output_aacklbgjpefbn"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_steadfast_output_aacklbgjpefbn'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."retry_throttled_finish_output_plgallgljmddo"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_finish_output_plgallgljmddo'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_finish_output_plgallgljmddo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_finish_output_plgallgljmddo'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_finish_output_plgallgljmddo'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_finish_output_plgallgljmddo'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_finish_output_plgallgljmddo'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_throttled_input_bfjgfamhjmgcd"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_throttled_uy63hl6qg7" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_throttled_input_bfjgfamhjmgcd'::"pg_catalog"."text", COLUMN = '__tag_kind_throttled_uy63hl6qg7'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_finish_output_oipogmdgcfehf'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_finish_output_oipogmdgcfehf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_finish_output_oipogmdgcfehf'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_finish_output_oipogmdgcfehf'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_finish_output_oipogmdgcfehf'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_finish_output_oipogmdgcfehf'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."retry_unhurried_input_mccbdnleajjif"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "key" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_unhurried_yf3vrtngno" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", 'key'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'key'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", COLUMN = 'key'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'retry_unhurried_input_mccbdnleajjif'::"pg_catalog"."text", COLUMN = '__tag_kind_unhurried_yf3vrtngno'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."review_analyze_input_aobppbhebnkae"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "question" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'question'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'question'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_input_aobppbhebnkae'::"pg_catalog"."text", COLUMN = 'question'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_analyze_output_fhhkmphnmpkdm"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "score" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", 'score'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'score'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_analyze_output_fhhkmphnmpkdm'::"pg_catalog"."text", COLUMN = 'score'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."review_gather_input_eiadkjkkdoiel"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_eiadkjkkdoiel'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_input_sizes_ifjkkjdhlfbgp'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_gather_output_cgnhmechbiddp"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "groups" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'groups'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_gather_output_cgnhmechbiddp'::"pg_catalog"."text", COLUMN = 'groups'::"pg_catalog"."text"; END IF;
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
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_hold'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'seat'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_hold'::"pg_catalog"."text", COLUMN = 'seat'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."review_questions_finish_output_kddidbknbjeof"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_finish_output_kddidbknbjeof'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_questions_input_jigaomgjefjfk"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "size" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'size'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'size'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_questions_input_jigaomgjefjfk'::"pg_catalog"."text", COLUMN = 'size'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."review_review_run_finish_output_fbgeikbjoigci"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_finish_output_fbgeikbjoigci'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_finish_output_fbgeikbjoigci'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_finish_output_fbgeikbjoigci'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_finish_output_fbgeikbjoigci'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_finish_output_fbgeikbjoigci'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_finish_output_fbgeikbjoigci'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_review_run_input_hpdfjnehnkdig"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_review_run_npquoqpyk4" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_hpdfjnehnkdig'::"pg_catalog"."text", COLUMN = '__tag_kind_review_run_npquoqpyk4'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "value" SET STATISTICS 0,
  ALTER COLUMN "__root_yjobx7uyrd" SET STATISTICS 0,
  ALTER COLUMN "__pred_ordinal_e545zctcav" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'value'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'value'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", COLUMN = 'value'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__root_yjobx7uyrd'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", COLUMN = '__root_yjobx7uyrd'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__pred_ordinal_e545zctcav'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_review_run_input_sizes_fmllfmbfdoojd'::"pg_catalog"."text", COLUMN = '__pred_ordinal_e545zctcav'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."review_save_input_njbdjgekhblef"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "review" SET STATISTICS 0,
  ALTER COLUMN "group" SET STATISTICS 0,
  ALTER COLUMN "count" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'review'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'review'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", COLUMN = 'review'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'group'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'group'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", COLUMN = 'group'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'count'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'count'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", COLUMN = 'count'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_input_njbdjgekhblef'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_save_output_falmopiohdlkl"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "total" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", 'total'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'total'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_save_output_falmopiohdlkl'::"pg_catalog"."text", COLUMN = 'total'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_saved_bppbpjmhcjbaa"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_saved_bppbpjmhcjbaa'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
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
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."review_split_fnhnebdnlfmck"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "from" SET STATISTICS 0,
  ALTER COLUMN "ordinal" SET STATISTICS 0,
  ALTER COLUMN "to" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'from'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'from'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", COLUMN = 'from'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'ordinal'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", COLUMN = 'ordinal'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'to'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'to'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'review_split_fnhnebdnlfmck'::"pg_catalog"."text", COLUMN = 'to'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."sync_build_input_khidlilbdjpfi"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_input_khidlilbdjpfi'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_build_output_ianmlfhgbcfli"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_build_output_ianmlfhgbcfli'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."sync_copy_input_fijfgeannmgef"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "relation" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", COLUMN = 'relation'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_input_fijfgeannmgef'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_copy_output_cfficoloepjbj"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_copy_output_cfficoloepjbj'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."sync_gold_finish_output_hkddafacepdaa"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_finish_output_hkddafacepdaa'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_finish_output_hkddafacepdaa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_finish_output_hkddafacepdaa'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_finish_output_hkddafacepdaa'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_finish_output_hkddafacepdaa'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_finish_output_hkddafacepdaa'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_gold_input_edhkhlceilnoh"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "build" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_gold_phmoz6zyym" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", 'build'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'build'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", COLUMN = 'build'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_gold_input_edhkhlceilnoh'::"pg_catalog"."text", COLUMN = '__tag_kind_gold_phmoz6zyym'::"pg_catalog"."text"; END IF;
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
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_finish_output_inlpehpebjlbl'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_finish_output_inlpehpebjlbl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_finish_output_inlpehpebjlbl'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_finish_output_inlpehpebjlbl'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_finish_output_inlpehpebjlbl'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_finish_output_inlpehpebjlbl'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."sync_sync_run_input_kmejgmkijpoho"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "relation" SET STATISTICS 0,
  ALTER COLUMN "run" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_sync_run_wmr74dvsia" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'relation'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", COLUMN = 'relation'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'run'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'run'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", COLUMN = 'run'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'sync_sync_run_input_kmejgmkijpoho'::"pg_catalog"."text", COLUMN = '__tag_kind_sync_run_wmr74dvsia'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."writeback_deliver_input_libhnkibecamc"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_input_libhnkibecamc'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_deliver_output_ppecogpmgbpek"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_deliver_output_ppecogpmgbpek'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
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
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'by'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_skipped'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'by'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_skipped'::"pg_catalog"."text", COLUMN = 'by'::"pg_catalog"."text"; END IF;
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

ALTER TABLE "slice_den"."writeback_writeback_finish_output_mhjodpondhejh"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "step" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_finish_output_mhjodpondhejh'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_finish_output_mhjodpondhejh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_finish_output_mhjodpondhejh'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_finish_output_mhjodpondhejh'::"pg_catalog"."text", 'step'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_finish_output_mhjodpondhejh'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'step'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_finish_output_mhjodpondhejh'::"pg_catalog"."text", COLUMN = 'step'::"pg_catalog"."text"; END IF;
END
$$;

ALTER TABLE "slice_den"."writeback_writeback_input_ljafdhfgfeocc"
  SET (autovacuum_analyze_threshold = 2147483647, autovacuum_analyze_scale_factor = 100),
  ALTER COLUMN "root" SET STATISTICS 0,
  ALTER COLUMN "scope" SET STATISTICS 0,
  ALTER COLUMN "attempt" SET STATISTICS 0,
  ALTER COLUMN "__tag_kind_writeback_7zc6o24iqm" SET STATISTICS 0;
DO $$
BEGIN
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", 'root'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'root'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", COLUMN = 'root'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'scope'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('-0.5'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", COLUMN = 'scope'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", 'attempt'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('2'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", COLUMN = 'attempt'::"pg_catalog"."text"; END IF;
  PERFORM "pg_catalog"."pg_clear_attribute_stats"('slice_den'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text", false);
  IF NOT "pg_catalog"."pg_restore_attribute_stats"('schemaname'::"pg_catalog"."text", 'slice_den'::"pg_catalog"."text", 'relname'::"pg_catalog"."text", 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", 'attname'::"pg_catalog"."text", '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text", 'inherited'::"pg_catalog"."text", false, 'n_distinct'::"pg_catalog"."text", ('1'::"pg_catalog"."text")::real) THEN RAISE EXCEPTION 'a declared statistic was not restored' USING ERRCODE = 'internal_error'::"pg_catalog"."text", SCHEMA = 'slice_den'::"pg_catalog"."text", TABLE = 'writeback_writeback_input_ljafdhfgfeocc'::"pg_catalog"."text", COLUMN = '__tag_kind_writeback_7zc6o24iqm'::"pg_catalog"."text"; END IF;
END
$$;
