CREATE INDEX "__passage_ix_topic_lzh6djzwn4" ON "slice"."passage" USING btree ("topic");

CREATE INDEX "__passage_ix_embedding_ujugi77ft2" ON "slice"."passage" USING hnsw ("embedding" "vector_ext"."vector_cosine_ops");

CREATE INDEX "__assign_admitted_ix_scope_sav4gw3eqi" ON "slice_den"."assign_admitted" USING btree ("scope");

CREATE INDEX "__assign_assignment_input_ix_scope_2y6dle4van" ON "slice_den"."assign_assignment_input" USING btree ("scope");

CREATE INDEX "__assign_assignment_input_exclude_ix_scope_root_zqfaf4s3ix" ON "slice_den"."assign_assignment_input_exclude" USING btree ("scope", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_assignment_input_mode_nearest_ix_scope_gn4q7eavbe" ON "slice_den"."assign_assignment_input_mode_nearest" USING btree ("scope");

CREATE INDEX "__assign_assignment_input_mode_within_ix_scope_q2mjbrplex" ON "slice_den"."assign_assignment_input_mode_within" USING btree ("scope");

CREATE INDEX "__assign_assignment_input_near_ix_scope_root_yjobx_7_e5r373gcrk" ON "slice_den"."assign_assignment_input_near" USING btree ("scope", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_claim_ix_step_root_yewsvvtcyz_pred_attempt_wh3x4tgtcq" ON "slice_den"."assign_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__assign_decide_input_ix_step_7w3huqaeqn" ON "slice_den"."assign_decide_input" USING btree ("step");

CREATE INDEX "__assign_decide_input_exclude_ix_step_root_yjobx_7_gsddib7qpt" ON "slice_den"."assign_decide_input_exclude" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_input_mode_nearest_ix_step_itwjeiecyz" ON "slice_den"."assign_decide_input_mode_nearest" USING btree ("step");

CREATE INDEX "__assign_decide_input_mode_within_ix_step_tc4cp7rclk" ON "slice_den"."assign_decide_input_mode_within" USING btree ("step");

CREATE INDEX "__assign_decide_output_ix_step_juo2hefebc" ON "slice_den"."assign_decide_output" USING btree ("step");

CREATE INDEX "__assign_decide_output_stage_rest_ix_step_vakpifv3l6" ON "slice_den"."assign_decide_output_stage_rest" USING btree ("step");

CREATE INDEX "__assign_decide_output_stage_serve_ix_step_urdhiwnbyx" ON "slice_den"."assign_decide_output_stage_serve" USING btree ("step");

CREATE INDEX "__assign_decide_output_weighed_ix_step_root_yjobx_7_cs5ragvjo3" ON "slice_den"."assign_decide_output_weighed" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_read_nearest_ix_digest_tm2whkfyjf" ON "slice_den"."assign_decide_read_nearest" USING btree ("digest");

CREATE INDEX "__assign_decide_read_seen_ix_digest_q7rgkxywvx" ON "slice_den"."assign_decide_read_seen" USING btree ("digest");

CREATE INDEX "__assign_embed_input_ix_step_2mqdwwie2j" ON "slice_den"."assign_embed_input" USING btree ("step");

CREATE INDEX "__assign_embed_input_exclude_ix_step_root_yjobx_7_xcibpzqvn6" ON "slice_den"."assign_embed_input_exclude" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_embed_input_mode_nearest_ix_step_evq7u7vwca" ON "slice_den"."assign_embed_input_mode_nearest" USING btree ("step");

CREATE INDEX "__assign_embed_input_mode_within_ix_step_fj2sbjjydw" ON "slice_den"."assign_embed_input_mode_within" USING btree ("step");

CREATE INDEX "__assign_embed_input_near_ix_step_root_yjobx_7_uyrd_eh47bqlhw3" ON "slice_den"."assign_embed_input_near" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_fenced_ix_step_eztmdy3mzv" ON "slice_den"."assign_fenced" USING btree ("step");

CREATE INDEX "__assign_finish_ix_scope_step_53o4eorqpr" ON "slice_den"."assign_finish" USING btree ("scope", "step");

CREATE INDEX "__assign_held_ix_step_irvbrtgz2r" ON "slice_den"."assign_held" USING btree ("step");

CREATE INDEX "__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" ON "slice_den"."assign_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__assign_result_ix_step_outcome_wy23amggai" ON "slice_den"."assign_result" USING btree ("step", "outcome");

CREATE INDEX "__assign_retry_ix_step_efjk6uhsq4" ON "slice_den"."assign_retry" USING btree ("step");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice_den"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_skipped_ix_scope_ftup4gbap6" ON "slice_den"."assign_skipped" USING btree ("scope");

CREATE INDEX "__assign_step_ix_root_scope_64vujnvoiu" ON "slice_den"."assign_step" USING btree ("root", "scope");

CREATE INDEX "__assign_step_ix_scope_kind_step_xn2zxx73po" ON "slice_den"."assign_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__assign_step_ix_step_okrxjnochy" ON "slice_den"."assign_step" USING btree ("step");

CREATE INDEX "__chain_admitted_ix_scope_v57a4nivm3" ON "slice_den"."chain_admitted" USING btree ("scope");

CREATE INDEX "__chain_chain_run_input_ix_scope_iuq7js6bfa" ON "slice_den"."chain_chain_run_input" USING btree ("scope");

CREATE INDEX "__chain_claim_ix_step_root_yewsvvtcyz_pred_attempt_z55hhc5lhz" ON "slice_den"."chain_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__chain_fenced_ix_step_h437d2nbx3" ON "slice_den"."chain_fenced" USING btree ("step");

CREATE INDEX "__chain_finish_ix_scope_step_om6bljb56e" ON "slice_den"."chain_finish" USING btree ("scope", "step");

CREATE INDEX "__chain_finish_ix_step_gfuhyfoe3p" ON "slice_den"."chain_finish" USING btree ("step");

CREATE INDEX "__chain_held_ix_step_4lrvrd3gs5" ON "slice_den"."chain_held" USING btree ("step");

CREATE INDEX "__chain_ordered_input_ix_scope_lbnwnucdyj" ON "slice_den"."chain_ordered_input" USING btree ("scope");

CREATE INDEX "__chain_page_input_ix_step_wectxwiagg" ON "slice_den"."chain_page_input" USING btree ("step");

CREATE INDEX "__chain_page_input_after_ix_step_qdsmrr4vxs" ON "slice_den"."chain_page_input_after" USING btree ("step");

CREATE INDEX "__chain_page_output_ix_step_hu6e3cftif" ON "slice_den"."chain_page_output" USING btree ("step");

CREATE INDEX "__chain_page_output_next_ix_step_r3v3ug5ybb" ON "slice_den"."chain_page_output_next" USING btree ("step");

CREATE INDEX "__chain_page_read_earlier_ix_digest_p7rrxdx4kq" ON "slice_den"."chain_page_read_earlier" USING btree ("digest");

CREATE INDEX "__chain_page_read_tree_ix_digest_qz4flptsbe" ON "slice_den"."chain_page_read_tree" USING btree ("digest");

CREATE INDEX "__chain_page_read_weights_ix_digest_p6eekmx2x6" ON "slice_den"."chain_page_read_weights" USING btree ("digest");

CREATE INDEX "__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" ON "slice_den"."chain_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__chain_result_ix_step_outcome_iy6vl5dwav" ON "slice_den"."chain_result" USING btree ("step", "outcome");

CREATE INDEX "__chain_retry_ix_step_jpeyuc4c4h" ON "slice_den"."chain_retry" USING btree ("step");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice_den"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_skipped_ix_scope_jvrcbbmf2m" ON "slice_den"."chain_skipped" USING btree ("scope");

CREATE INDEX "__chain_step_ix_root_scope_srrhrbyetn" ON "slice_den"."chain_step" USING btree ("root", "scope");

CREATE INDEX "__chain_step_ix_scope_kind_step_tsdjtgaey5" ON "slice_den"."chain_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__chain_step_ix_step_kind_notdrhvcc6" ON "slice_den"."chain_step" USING btree ("step", "kind");

CREATE INDEX "__clock_admitted_ix_scope_kljsbnk7gu" ON "slice_den"."clock_admitted" USING btree ("scope");

CREATE INDEX "__clock_chime_input_ix_step_m4pmphj63r" ON "slice_den"."clock_chime_input" USING btree ("step");

CREATE INDEX "__clock_claim_ix_step_root_yewsvvtcyz_pred_attempt_xukg6gzvx7" ON "slice_den"."clock_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__clock_close_input_ix_step_4i5jwczvxc" ON "slice_den"."clock_close_input" USING btree ("step");

CREATE INDEX "__clock_fenced_ix_step_6fkdtadk6s" ON "slice_den"."clock_fenced" USING btree ("step");

CREATE INDEX "__clock_finish_ix_scope_step_q2cyoxfrgy" ON "slice_den"."clock_finish" USING btree ("scope", "step");

CREATE INDEX "__clock_held_ix_step_254uki72j6" ON "slice_den"."clock_held" USING btree ("step");

CREATE INDEX "__clock_hourly_input_ix_scope_hjvvwnlgos" ON "slice_den"."clock_hourly_input" USING btree ("scope");

CREATE INDEX "__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" ON "slice_den"."clock_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__clock_result_ix_step_ylykgl4y6z" ON "slice_den"."clock_result" USING btree ("step");

CREATE INDEX "__clock_retry_ix_step_evme3lajlk" ON "slice_den"."clock_retry" USING btree ("step");

CREATE INDEX "__clock_sitting_input_ix_scope_k6vxbcvu2a" ON "slice_den"."clock_sitting_input" USING btree ("scope");

CREATE INDEX "__clock_skipped_ix_by_252vuphujb" ON "slice_den"."clock_skipped" USING btree ("by");

CREATE INDEX "__clock_skipped_ix_scope_vlmkgoc4qh" ON "slice_den"."clock_skipped" USING btree ("scope");

CREATE INDEX "__clock_step_ix_scope_root_dr2wopxg6r" ON "slice_den"."clock_step" USING btree ("scope", "root");

CREATE INDEX "__clock_step_ix_step_2ezw77ryfu" ON "slice_den"."clock_step" USING btree ("step");

CREATE INDEX "__fan_admitted_ix_scope_6tfnemhvcg" ON "slice_den"."fan_admitted" USING btree ("scope");

CREATE INDEX "__fan_batch_finish_output_ix_step_ocxqquufa6" ON "slice_den"."fan_batch_finish_output" USING btree ("step");

CREATE INDEX "__fan_batch_input_ix_scope_uue57ib3i3" ON "slice_den"."fan_batch_input" USING btree ("scope");

CREATE INDEX "__fan_claim_ix_step_root_yewsvvtcyz_pred_attempt_oey_nttbgx6ow2" ON "slice_den"."fan_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__fan_dust_input_ix_step_wtzptjqqcf" ON "slice_den"."fan_dust_input" USING btree ("step");

CREATE INDEX "__fan_fan_run_input_ix_scope_rgmbrwdcvq" ON "slice_den"."fan_fan_run_input" USING btree ("scope");

CREATE INDEX "__fan_fenced_ix_step_xiphniebnv" ON "slice_den"."fan_fenced" USING btree ("step");

CREATE INDEX "__fan_finish_ix_scope_step_gv7mbzp7pp" ON "slice_den"."fan_finish" USING btree ("scope", "step");

CREATE INDEX "__fan_finish_ix_step_jjs336jpbb" ON "slice_den"."fan_finish" USING btree ("step");

CREATE INDEX "__fan_held_ix_step_rtiyqqxotz" ON "slice_den"."fan_held" USING btree ("step");

CREATE INDEX "__fan_hold_ix_resource_seat_s7bnw22355" ON "slice_den"."fan_hold" USING btree ("resource", "seat");

CREATE INDEX "__fan_mop_input_ix_step_3j2uuzsjb2" ON "slice_den"."fan_mop_input" USING btree ("step");

CREATE INDEX "__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" ON "slice_den"."fan_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_result_ix_step_outcome_qq4mnml3gg" ON "slice_den"."fan_result" USING btree ("step", "outcome");

CREATE INDEX "__fan_retry_ix_step_4v6a7logoe" ON "slice_den"."fan_retry" USING btree ("step");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice_den"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_skipped_ix_scope_h5pzdoa32a" ON "slice_den"."fan_skipped" USING btree ("scope");

CREATE INDEX "__fan_square_input_ix_step_sguugobzen" ON "slice_den"."fan_square_input" USING btree ("step");

CREATE INDEX "__fan_square_output_ix_step_teolwx3lfw" ON "slice_den"."fan_square_output" USING btree ("step");

CREATE INDEX "__fan_step_ix_root_scope_aw525h7gua" ON "slice_den"."fan_step" USING btree ("root", "scope");

CREATE INDEX "__fan_step_ix_scope_kind_step_5arz2gb4sb" ON "slice_den"."fan_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__fan_step_ix_step_bzs2lzxr5o" ON "slice_den"."fan_step" USING btree ("step");

CREATE INDEX "__fan_sweep_input_ix_scope_zvab3un5km" ON "slice_den"."fan_sweep_input" USING btree ("scope");

CREATE INDEX "__fan_within_ix_parent_kind_scope_5ywepfmzj2" ON "slice_den"."fan_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__fan_within_ix_parent_root_eiovyuswcz" ON "slice_den"."fan_within" USING btree ("parent", "root");

CREATE INDEX "__fan_within_ix_scope_z3zzz5fzdu" ON "slice_den"."fan_within" USING btree ("scope");

CREATE INDEX "__retry_admitted_ix_scope_yqb7r5kcts" ON "slice_den"."retry_admitted" USING btree ("scope");

CREATE INDEX "__retry_brittle_input_ix_step_deob5xrs4n" ON "slice_den"."retry_brittle_input" USING btree ("step");

CREATE INDEX "__retry_brittle_output_ix_step_ddjioko4ap" ON "slice_den"."retry_brittle_output" USING btree ("step");

CREATE INDEX "__retry_claim_ix_step_root_yewsvvtcyz_pred_attempt_acklz4su4p" ON "slice_den"."retry_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__retry_fenced_ix_step_taohzqvdeo" ON "slice_den"."retry_fenced" USING btree ("step");

CREATE INDEX "__retry_finish_ix_scope_step_6tswescc6v" ON "slice_den"."retry_finish" USING btree ("scope", "step");

CREATE INDEX "__retry_held_ix_step_l7f7ax5pel" ON "slice_den"."retry_held" USING btree ("step");

CREATE INDEX "__retry_ladders_input_ix_scope_ktwahiu353" ON "slice_den"."retry_ladders_input" USING btree ("scope");

CREATE INDEX "__retry_patient_input_ix_step_p72liuz32m" ON "slice_den"."retry_patient_input" USING btree ("step");

CREATE INDEX "__retry_patient_output_ix_step_4nlbxubrgc" ON "slice_den"."retry_patient_output" USING btree ("step");

CREATE INDEX "__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" ON "slice_den"."retry_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__retry_polite_input_ix_step_6kinca7vu4" ON "slice_den"."retry_polite_input" USING btree ("step");

CREATE INDEX "__retry_polite_output_ix_step_cagfkplnyp" ON "slice_den"."retry_polite_output" USING btree ("step");

CREATE INDEX "__retry_result_ix_step_outcome_n5dv4vpxjy" ON "slice_den"."retry_result" USING btree ("step", "outcome");

CREATE INDEX "__retry_retry_ix_step_4y7ukujr4x" ON "slice_den"."retry_retry" USING btree ("step");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice_den"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_skipped_ix_scope_pj72ptncqt" ON "slice_den"."retry_skipped" USING btree ("scope");

CREATE INDEX "__retry_steadfast_input_ix_step_g5c4vpti3l" ON "slice_den"."retry_steadfast_input" USING btree ("step");

CREATE INDEX "__retry_steadfast_output_ix_step_xu5p4zs52x" ON "slice_den"."retry_steadfast_output" USING btree ("step");

CREATE INDEX "__retry_step_ix_root_scope_ogbhay3han" ON "slice_den"."retry_step" USING btree ("root", "scope");

CREATE INDEX "__retry_step_ix_scope_kind_step_m6ufaqcqmk" ON "slice_den"."retry_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__retry_step_ix_step_czjfzqdiex" ON "slice_den"."retry_step" USING btree ("step");

CREATE INDEX "__retry_throttled_input_ix_scope_srrsrnmwfp" ON "slice_den"."retry_throttled_input" USING btree ("scope");

CREATE INDEX "__retry_unhurried_input_ix_scope_4drrri4lgl" ON "slice_den"."retry_unhurried_input" USING btree ("scope");

CREATE INDEX "__review_admitted_ix_scope_uaz2e2unre" ON "slice_den"."review_admitted" USING btree ("scope");

CREATE INDEX "__review_analyze_input_ix_step_ljn4v2untp" ON "slice_den"."review_analyze_input" USING btree ("step");

CREATE INDEX "__review_analyze_output_ix_step_t5p7no2i5e" ON "slice_den"."review_analyze_output" USING btree ("step");

CREATE INDEX "__review_claim_ix_step_root_yewsvvtcyz_pred_attempt_53g43drm5l" ON "slice_den"."review_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__review_fenced_ix_step_k2afeb3irz" ON "slice_den"."review_fenced" USING btree ("step");

CREATE INDEX "__review_finish_ix_scope_step_4k6s2nqgyy" ON "slice_den"."review_finish" USING btree ("scope", "step");

CREATE INDEX "__review_finish_ix_step_luhj6362cj" ON "slice_den"."review_finish" USING btree ("step");

CREATE INDEX "__review_gather_input_ix_review_f2zafhsmtj" ON "slice_den"."review_gather_input" USING btree ("review");

CREATE INDEX "__review_gather_input_ix_step_lhfi35wvgq" ON "slice_den"."review_gather_input" USING btree ("step");

CREATE INDEX "__review_gather_input_sizes_ix_step_root_yjobx_7_7uihmnh7ih" ON "slice_den"."review_gather_input_sizes" USING btree ("step", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_held_ix_step_xvtsgiwapv" ON "slice_den"."review_held" USING btree ("step");

CREATE INDEX "__review_hold_ix_resource_seat_3p66dnxzad" ON "slice_den"."review_hold" USING btree ("resource", "seat");

CREATE INDEX "__review_hold_ix_step_daijcrisdf" ON "slice_den"."review_hold" USING btree ("step");

CREATE INDEX "__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" ON "slice_den"."review_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__review_questions_finish_output_ix_step_snk4x6oh75" ON "slice_den"."review_questions_finish_output" USING btree ("step");

CREATE INDEX "__review_questions_input_ix_scope_di7h2fezlw" ON "slice_den"."review_questions_input" USING btree ("scope");

CREATE INDEX "__review_result_ix_step_outcome_jpbt7ff4mi" ON "slice_den"."review_result" USING btree ("step", "outcome");

CREATE INDEX "__review_retry_ix_step_c7roln6cyz" ON "slice_den"."review_retry" USING btree ("step");

CREATE INDEX "__review_review_run_input_ix_scope_pjiclt36mp" ON "slice_den"."review_review_run_input" USING btree ("scope");

CREATE INDEX "__review_review_run_input_sizes_ix_scope_root_yjobx_q27b4rjhuv" ON "slice_den"."review_review_run_input_sizes" USING btree ("scope", "__root_yjobx7uyrd", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_save_input_ix_step_bgbjanular" ON "slice_den"."review_save_input" USING btree ("step");

CREATE INDEX "__review_save_output_ix_step_uj4wo4gdyl" ON "slice_den"."review_save_output" USING btree ("step");

CREATE INDEX "__review_skipped_ix_by_6z5g634njq" ON "slice_den"."review_skipped" USING btree ("by");

CREATE INDEX "__review_skipped_ix_scope_ypzvqrmdce" ON "slice_den"."review_skipped" USING btree ("scope");

CREATE INDEX "__review_step_ix_root_scope_jvmzqg2kjy" ON "slice_den"."review_step" USING btree ("root", "scope");

CREATE INDEX "__review_step_ix_scope_kind_step_udhxex4i5c" ON "slice_den"."review_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__review_step_ix_step_oeu3hhy3ey" ON "slice_den"."review_step" USING btree ("step");

CREATE INDEX "__review_within_ix_parent_kind_scope_dtilr5xomp" ON "slice_den"."review_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__review_within_ix_parent_root_ajpsgwldly" ON "slice_den"."review_within" USING btree ("parent", "root");

CREATE INDEX "__review_within_ix_scope_mgsn3p5nkt" ON "slice_den"."review_within" USING btree ("scope");

CREATE INDEX "__sync_admitted_ix_scope_iqmg6cfxd7" ON "slice_den"."sync_admitted" USING btree ("scope");

CREATE INDEX "__sync_build_input_ix_step_7oxdkrhcm4" ON "slice_den"."sync_build_input" USING btree ("step");

CREATE INDEX "__sync_claim_ix_step_root_yewsvvtcyz_pred_attempt_fiq4h65yco" ON "slice_den"."sync_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__sync_copy_input_ix_step_kl3k2wc6gt" ON "slice_den"."sync_copy_input" USING btree ("step");

CREATE INDEX "__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" ON "slice_den"."sync_exclusive" USING btree ("kind", "key", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_exclusive_key_ix_scope_odlg62uodv" ON "slice_den"."sync_exclusive_key" USING btree ("scope");

CREATE INDEX "__sync_fenced_ix_step_z7k6qcdgfq" ON "slice_den"."sync_fenced" USING btree ("step");

CREATE INDEX "__sync_finish_ix_scope_step_owsw7m5w74" ON "slice_den"."sync_finish" USING btree ("scope", "step");

CREATE INDEX "__sync_finish_ix_step_uwcksqapnl" ON "slice_den"."sync_finish" USING btree ("step");

CREATE INDEX "__sync_gold_input_ix_scope_5czwxdxbjp" ON "slice_den"."sync_gold_input" USING btree ("scope");

CREATE INDEX "__sync_held_ix_step_hqbgboxgaj" ON "slice_den"."sync_held" USING btree ("step");

CREATE INDEX "__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" ON "slice_den"."sync_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_result_ix_step_g4pu37wr72" ON "slice_den"."sync_result" USING btree ("step");

CREATE INDEX "__sync_retry_ix_step_nqiv6tlf2k" ON "slice_den"."sync_retry" USING btree ("step");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice_den"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_skipped_ix_scope_d5pw2mcp56" ON "slice_den"."sync_skipped" USING btree ("scope");

CREATE INDEX "__sync_step_ix_scope_root_hppxk5gi6a" ON "slice_den"."sync_step" USING btree ("scope", "root");

CREATE INDEX "__sync_step_ix_step_27fulvjsit" ON "slice_den"."sync_step" USING btree ("step");

CREATE INDEX "__sync_sync_run_input_ix_scope_xmn3bafu67" ON "slice_den"."sync_sync_run_input" USING btree ("scope");

CREATE INDEX "__writeback_admitted_ix_scope_54lp3ihfk7" ON "slice_den"."writeback_admitted" USING btree ("scope");

CREATE INDEX "__writeback_claim_ix_step_root_yewsvvtcyz_pred_tplitkeoq2" ON "slice_den"."writeback_claim" USING btree ("step", "__root_yewsvvtcyz", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__writeback_deliver_input_ix_step_h2fh5zkyda" ON "slice_den"."writeback_deliver_input" USING btree ("step");

CREATE INDEX "__writeback_fenced_ix_step_iwrqegcnk6" ON "slice_den"."writeback_fenced" USING btree ("step");

CREATE INDEX "__writeback_finish_ix_scope_step_6ooh2ahmws" ON "slice_den"."writeback_finish" USING btree ("scope", "step");

CREATE INDEX "__writeback_held_ix_step_itsn6ncq5e" ON "slice_den"."writeback_held" USING btree ("step");

CREATE INDEX "__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" ON "slice_den"."writeback_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__writeback_result_ix_step_spqbojjjoj" ON "slice_den"."writeback_result" USING btree ("step");

CREATE INDEX "__writeback_retry_ix_step_xokcsjqehk" ON "slice_den"."writeback_retry" USING btree ("step");

CREATE INDEX "__writeback_skipped_ix_by_3ei4k4fj53" ON "slice_den"."writeback_skipped" USING btree ("by");

CREATE INDEX "__writeback_skipped_ix_scope_dwesxm2rrj" ON "slice_den"."writeback_skipped" USING btree ("scope");

CREATE INDEX "__writeback_step_ix_scope_root_ft5ap6qmlh" ON "slice_den"."writeback_step" USING btree ("scope", "root");

CREATE INDEX "__writeback_step_ix_step_al2iz5uibu" ON "slice_den"."writeback_step" USING btree ("step");

CREATE INDEX "__writeback_writeback_input_ix_scope_72jqfcjowv" ON "slice_den"."writeback_writeback_input" USING btree ("scope");

CREATE STATISTICS "slice_den"."__assign_finish_stats_scope_step_ld6jyxztu6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."assign_finish";

CREATE STATISTICS "slice_den"."__assign_step_stats_kind_scope_wiztsdmmtf" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."assign_step";

CREATE STATISTICS "slice_den"."__chain_finish_stats_scope_step_z7lvm6j2l6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."chain_finish";

CREATE STATISTICS "slice_den"."__chain_step_stats_kind_scope_tc5nmidpxu" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."chain_step";

CREATE STATISTICS "slice_den"."__clock_finish_stats_scope_step_ejqaucw3q4" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."clock_finish";

CREATE STATISTICS "slice_den"."__fan_finish_stats_scope_step_4mm4p6zm66" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."fan_finish";

CREATE STATISTICS "slice_den"."__fan_step_stats_kind_scope_xmuvugpu6n" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."fan_step";

CREATE STATISTICS "slice_den"."__fan_within_stats_kind_parent_3vvpgco4da" (ndistinct, dependencies, mcv) ON "kind", "parent" FROM "slice_den"."fan_within";

CREATE STATISTICS "slice_den"."__retry_finish_stats_scope_step_2nxi4d7tdj" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."retry_finish";

CREATE STATISTICS "slice_den"."__retry_step_stats_kind_scope_osnqmvpfhd" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."retry_step";

CREATE STATISTICS "slice_den"."__review_finish_stats_scope_step_ac6ft3yr6e" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."review_finish";

CREATE STATISTICS "slice_den"."__review_step_stats_kind_scope_kgaij4jpus" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."review_step";

CREATE STATISTICS "slice_den"."__review_within_stats_kind_parent_w3ajh3gekc" (ndistinct, dependencies, mcv) ON "kind", "parent" FROM "slice_den"."review_within";

CREATE STATISTICS "slice_den"."__sync_exclusive_stats_key_kind_smed76p3zh" (ndistinct, dependencies, mcv) ON "key", "kind" FROM "slice_den"."sync_exclusive";

CREATE STATISTICS "slice_den"."__sync_finish_stats_scope_step_xiaq6np7mf" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."sync_finish";

CREATE STATISTICS "slice_den"."__writeback_finish_stats_scope_step_3knpjnabow" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."writeback_finish";
