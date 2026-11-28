CREATE INDEX "__passage_ix_embedding_ujugi77ft2" ON "slice"."passage" USING hnsw ("embedding" "vector_ext"."vector_cosine_ops");

CREATE INDEX "__assign_assignment_input_ix_scope_2y6dle4van" ON "slice_den"."__assign_assignment_input_jkityquzjz" USING btree ("scope");

CREATE INDEX "__assign_assignment_input_exclude_ix_scope_pred_fkj5fuiwuy" ON "slice_den"."__assign_assignment_input_exclude_wqrktw62ew" USING btree ("scope", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_assignment_input_near_ix_scope_pred_ordinal_bta37gplsn" ON "slice_den"."__assign_assignment_input_near_6teditkssg" USING btree ("scope", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_claim_ix_root_step_until_bengwfhtac" ON "slice_den"."assign_claim" USING btree ("root", "step", "until");

CREATE INDEX "__assign_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_m6yuaw7627" ON "slice_den"."assign_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__assign_decide_input_exclude_ix_step_pred_ordinal_e_jpvevw4qhx" ON "slice_den"."__assign_decide_input_exclude_hsjt7zirht" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_output_weighed_ix_step_pred_ordinal_j6qawg5c6t" ON "slice_den"."__assign_decide_output_weighed_3owmsgm56c" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_read_nearest_ix_digest_tm2whkfyjf" ON "slice_den"."__assign_decide_read_nearest_rpgjzn2izt" USING btree ("digest");

CREATE INDEX "__assign_decide_read_seen_ix_digest_q7rgkxywvx" ON "slice_den"."__assign_decide_read_seen_imbphpples" USING btree ("digest");

CREATE INDEX "__assign_embed_input_exclude_ix_step_pred_ordinal_e_g4pvuyld2j" ON "slice_den"."__assign_embed_input_exclude_jck2tra3om" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_embed_input_near_ix_step_pred_ordinal_e_545_zato3md6gx" ON "slice_den"."__assign_embed_input_near_jmllazcmpe" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" ON "slice_den"."assign_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__assign_result_ix_root_outcome_vfu6fjnep4" ON "slice_den"."assign_result" USING btree ("root", "outcome");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice_den"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_skipped_ix_scope_ftup4gbap6" ON "slice_den"."assign_skipped" USING btree ("scope");

CREATE INDEX "__assign_step_ix_root_scope_kind_drsz5mwtr4" ON "slice_den"."assign_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__chain_chain_run_input_ix_scope_iuq7js6bfa" ON "slice_den"."__chain_chain_run_input_bmdsmqbrk2" USING btree ("scope");

CREATE INDEX "__chain_claim_ix_root_step_until_3ztxtou3r3" ON "slice_den"."chain_claim" USING btree ("root", "step", "until");

CREATE INDEX "__chain_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_sic5xhruts" ON "slice_den"."chain_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__chain_ordered_input_ix_scope_lbnwnucdyj" ON "slice_den"."__chain_ordered_input_tlj4ihbubo" USING btree ("scope");

CREATE INDEX "__chain_page_read_earlier_ix_digest_p7rrxdx4kq" ON "slice_den"."__chain_page_read_earlier_33grnly7mg" USING btree ("digest");

CREATE INDEX "__chain_page_read_tree_ix_digest_qz4flptsbe" ON "slice_den"."__chain_page_read_tree_mt76djloc5" USING btree ("digest");

CREATE INDEX "__chain_page_read_weights_ix_digest_p6eekmx2x6" ON "slice_den"."__chain_page_read_weights_fcely5x3ye" USING btree ("digest");

CREATE INDEX "__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" ON "slice_den"."chain_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__chain_result_ix_root_outcome_b3ed6hz2xc" ON "slice_den"."chain_result" USING btree ("root", "outcome");

CREATE INDEX "__chain_result_ix_step_4lfojblc4o" ON "slice_den"."chain_result" USING btree ("step");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice_den"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_skipped_ix_scope_jvrcbbmf2m" ON "slice_den"."chain_skipped" USING btree ("scope");

CREATE INDEX "__chain_step_ix_root_scope_kind_7y3wfct5o4" ON "slice_den"."chain_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__clock_claim_ix_root_step_until_vgh4hs4hyb" ON "slice_den"."clock_claim" USING btree ("root", "step", "until");

CREATE INDEX "__clock_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_76aawvjtpr" ON "slice_den"."clock_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__clock_hourly_input_ix_scope_hjvvwnlgos" ON "slice_den"."__clock_hourly_input_nq4knj5mda" USING btree ("scope");

CREATE INDEX "__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" ON "slice_den"."clock_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__clock_sitting_input_ix_scope_k6vxbcvu2a" ON "slice_den"."__clock_sitting_input_rjgg4hnzuz" USING btree ("scope");

CREATE INDEX "__clock_skipped_ix_by_252vuphujb" ON "slice_den"."clock_skipped" USING btree ("by");

CREATE INDEX "__clock_skipped_ix_scope_vlmkgoc4qh" ON "slice_den"."clock_skipped" USING btree ("scope");

CREATE INDEX "__clock_step_ix_root_scope_xautpoatwk" ON "slice_den"."clock_step" USING btree ("root", "scope");

CREATE INDEX "__fan_claim_ix_root_step_until_eoimsdmnc3" ON "slice_den"."fan_claim" USING btree ("root", "step", "until");

CREATE INDEX "__fan_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_root_eihagatfae" ON "slice_den"."fan_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__fan_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_vboqjsyskn" ON "slice_den"."fan_exclusive" USING btree ("kind", "key", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_fan_run_input_ix_scope_rgmbrwdcvq" ON "slice_den"."__fan_fan_run_input_lbk743wucv" USING btree ("scope");

CREATE INDEX "__fan_hold_ix_resource_seat_s7bnw22355" ON "slice_den"."fan_hold" USING btree ("resource", "seat");

CREATE INDEX "__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" ON "slice_den"."fan_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_result_ix_root_outcome_wy67z6qjlg" ON "slice_den"."fan_result" USING btree ("root", "outcome");

CREATE INDEX "__fan_result_ix_step_n47cclxm64" ON "slice_den"."fan_result" USING btree ("step");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice_den"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_skipped_ix_scope_h5pzdoa32a" ON "slice_den"."fan_skipped" USING btree ("scope");

CREATE INDEX "__fan_step_ix_root_scope_kind_u5r7xvxvzl" ON "slice_den"."fan_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__fan_sweep_input_ix_scope_zvab3un5km" ON "slice_den"."__fan_sweep_input_zh2fwcaxpj" USING btree ("scope");

CREATE INDEX "__fan_wanted_input_ix_scope_57fqk3rwec" ON "slice_den"."__fan_wanted_input_chczog66p4" USING btree ("scope");

CREATE INDEX "__fan_within_ix_root_parent_kind_3fui4hg5uo" ON "slice_den"."fan_within" USING btree ("root", "parent", "kind");

CREATE INDEX "__retry_claim_ix_root_step_until_g7grjg6are" ON "slice_den"."retry_claim" USING btree ("root", "step", "until");

CREATE INDEX "__retry_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_66l375ycrl" ON "slice_den"."retry_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__retry_ladders_input_ix_scope_ktwahiu353" ON "slice_den"."__retry_ladders_input_kwlnpvmkji" USING btree ("scope");

CREATE INDEX "__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" ON "slice_den"."retry_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__retry_result_ix_root_outcome_mokpa5tbiz" ON "slice_den"."retry_result" USING btree ("root", "outcome");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice_den"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_skipped_ix_scope_pj72ptncqt" ON "slice_den"."retry_skipped" USING btree ("scope");

CREATE INDEX "__retry_step_ix_root_scope_kind_2fjaoxcf4e" ON "slice_den"."retry_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__retry_throttled_input_ix_scope_srrsrnmwfp" ON "slice_den"."__retry_throttled_input_khzxxl3wcp" USING btree ("scope");

CREATE INDEX "__retry_unhurried_input_ix_scope_4drrri4lgl" ON "slice_den"."__retry_unhurried_input_2o2io4czfn" USING btree ("scope");

CREATE INDEX "__review_claim_ix_root_step_until_i35ihac4eg" ON "slice_den"."review_claim" USING btree ("root", "step", "until");

CREATE INDEX "__review_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_guo6f4ktdf" ON "slice_den"."review_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__review_gather_input_sizes_ix_step_pred_ordinal_e_7dlth35tuv" ON "slice_den"."__review_gather_input_sizes_bcltwv6ebr" USING btree ("step", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__review_hold_ix_resource_seat_3p66dnxzad" ON "slice_den"."review_hold" USING btree ("resource", "seat");

CREATE INDEX "__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" ON "slice_den"."review_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__review_result_ix_root_outcome_um2qpg5dbg" ON "slice_den"."review_result" USING btree ("root", "outcome");

CREATE INDEX "__review_result_ix_step_epvfaz7rh3" ON "slice_den"."review_result" USING btree ("step");

CREATE INDEX "__review_review_run_input_ix_scope_pjiclt36mp" ON "slice_den"."__review_review_run_input_jzp47telwo" USING btree ("scope");

CREATE INDEX "__review_review_run_input_sizes_ix_scope_pred_pgudijocqy" ON "slice_den"."__review_review_run_input_sizes_cuh2lwogrl" USING btree ("scope", "__pred_ordinal_e545zctcav", "__root_yjobx7uyrd");

CREATE INDEX "__review_skipped_ix_by_6z5g634njq" ON "slice_den"."review_skipped" USING btree ("by");

CREATE INDEX "__review_skipped_ix_scope_ypzvqrmdce" ON "slice_den"."review_skipped" USING btree ("scope");

CREATE INDEX "__review_step_ix_root_scope_kind_y6rly7sw5c" ON "slice_den"."review_step" USING btree ("root", "scope", "kind");

CREATE INDEX "__review_within_ix_root_parent_kind_olszbr3xpq" ON "slice_den"."review_within" USING btree ("root", "parent", "kind");

CREATE INDEX "__sync_claim_ix_root_step_until_dyjqsqcxg7" ON "slice_den"."sync_claim" USING btree ("root", "step", "until");

CREATE INDEX "__sync_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_2krihntk52" ON "slice_den"."sync_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" ON "slice_den"."sync_exclusive" USING btree ("kind", "key", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_gold_input_ix_scope_5czwxdxbjp" ON "slice_den"."__sync_gold_input_3odt2l5j2i" USING btree ("scope");

CREATE INDEX "__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" ON "slice_den"."sync_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_result_ix_step_g4pu37wr72" ON "slice_den"."sync_result" USING btree ("step");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice_den"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_skipped_ix_scope_d5pw2mcp56" ON "slice_den"."sync_skipped" USING btree ("scope");

CREATE INDEX "__sync_step_ix_root_scope_l4sfn7gzd3" ON "slice_den"."sync_step" USING btree ("root", "scope");

CREATE INDEX "__sync_sync_run_input_ix_scope_xmn3bafu67" ON "slice_den"."__sync_sync_run_input_qo4lf3kyiy" USING btree ("scope");

CREATE INDEX "__writeback_claim_ix_root_step_until_zqzgmv43ml" ON "slice_den"."writeback_claim" USING btree ("root", "step", "until");

CREATE INDEX "__writeback_claim_ix_step_pred_attempt_oey_4_tm_5_6cvrydc2i4" ON "slice_den"."writeback_claim" USING btree ("step", "__pred_attempt_oey4tm5xyl", "__root_yewsvvtcyz");

CREATE INDEX "__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" ON "slice_den"."writeback_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__writeback_skipped_ix_by_3ei4k4fj53" ON "slice_den"."writeback_skipped" USING btree ("by");

CREATE INDEX "__writeback_skipped_ix_scope_dwesxm2rrj" ON "slice_den"."writeback_skipped" USING btree ("scope");

CREATE INDEX "__writeback_step_ix_root_scope_oebhktgfcr" ON "slice_den"."writeback_step" USING btree ("root", "scope");

CREATE INDEX "__writeback_writeback_input_ix_scope_72jqfcjowv" ON "slice_den"."__writeback_writeback_input_zalrrn5ggs" USING btree ("scope");
