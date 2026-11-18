ALTER TABLE "slice"."assign_finish" DROP CONSTRAINT "__assign_finish_fk_scope_dics3axamv";

ALTER TABLE "slice"."assign_skipped" DROP CONSTRAINT "__assign_skipped_fk_by_wh4scgpwln";

ALTER TABLE "slice"."assign_start_scope" DROP CONSTRAINT "__assign_start_scope_fk_scope_rpodhhkcp6";

ALTER TABLE "slice"."assign_start_step" DROP CONSTRAINT "__assign_start_step_fk_scope_qt2dm2vnjb";

ALTER TABLE "slice"."assign_step" DROP CONSTRAINT "__assign_step_fk_scope_gkjcwbwjuf";

ALTER TABLE "slice"."assign_admitted"
  DROP CONSTRAINT "__assign_admitted_pk_gj2obtfaxk",
  ADD CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" PRIMARY KEY USING INDEX "__next_assign_admitted_pk_gj_2_obtfaxk_r6nkp6jlax";

ALTER TABLE "slice"."assign_assignment_input_exclude" DROP CONSTRAINT "__assign_assignment_input_exclude_fk_scope_iphjwo2xrf";

ALTER TABLE "slice"."assign_assignment_input"
  DROP CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt",
  ADD CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" PRIMARY KEY USING INDEX "__next_assign_assignment_input_pk_rhoa_22_jovt_rpkdozy74w";

ALTER TABLE "slice"."assign_assignment_input_exclude" DROP CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_7ogcceo32v";

ALTER TABLE "slice"."assign_assignment_input_exclude"
  DROP CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q",
  ADD CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" PRIMARY KEY USING INDEX "__next_assign_assignment_input_exclude_pk_53_cp_6_hxpu7oe4qj";

ALTER TABLE "slice"."assign_assignment_input" DROP CONSTRAINT "__assign_assignment_input_fk_scope_esvfiv3erb";

ALTER TABLE "slice"."assign_assignment_input_mode_nearest"
  DROP CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a",
  ADD CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" PRIMARY KEY USING INDEX "__next_assign_assignment_input_mode_nearest_pk_fztb_c7fgo56eze";

ALTER TABLE "slice"."assign_assignment_input" DROP CONSTRAINT "__assign_assignment_input_fk_scope_ephkx6dc57";

ALTER TABLE "slice"."assign_assignment_input_mode_within"
  DROP CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq",
  ADD CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" PRIMARY KEY USING INDEX "__next_assign_assignment_input_mode_within_pk_76ouhj4gal";

ALTER TABLE "slice"."assign_claim" DROP CONSTRAINT "__assign_claim_fk_step_pred_attempt_2byinvx4o3";

ALTER TABLE "slice"."assign_fenced" DROP CONSTRAINT "__assign_fenced_fk_step_attempt_2rttvkznpl";

ALTER TABLE "slice"."assign_held" DROP CONSTRAINT "__assign_held_fk_step_attempt_fklmb2xym3";

ALTER TABLE "slice"."assign_retry" DROP CONSTRAINT "__assign_retry_fk_step_attempt_benkemwswa";

ALTER TABLE "slice"."assign_claim"
  DROP CONSTRAINT "__assign_claim_pk_gy4yhzk2me",
  ADD CONSTRAINT "__assign_claim_pk_gy4yhzk2me" PRIMARY KEY USING INDEX "__next_assign_claim_pk_gy_4_yhzk_2_me_k5nze6oexc";

ALTER TABLE "slice"."assign_decide_input_exclude" DROP CONSTRAINT "__assign_decide_input_exclude_fk_step_py5qnbqlfp";

ALTER TABLE "slice"."assign_decide_output" DROP CONSTRAINT "__assign_decide_output_fk_step_uegzp2ojlf";

ALTER TABLE "slice"."assign_decide_input"
  DROP CONSTRAINT "__assign_decide_input_pk_phi7dovwvq",
  ADD CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" PRIMARY KEY USING INDEX "__next_assign_decide_input_pk_phi_7_dovwvq_iuisqncnlg";

ALTER TABLE "slice"."assign_decide_input_exclude" DROP CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_uw3d7lbfy5";

ALTER TABLE "slice"."assign_decide_input_exclude"
  DROP CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk",
  ADD CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" PRIMARY KEY USING INDEX "__next_assign_decide_input_exclude_pk_emksiazulk_qsw5gqo4sr";

ALTER TABLE "slice"."assign_decide_input" DROP CONSTRAINT "__assign_decide_input_fk_step_smeb6dksjy";

ALTER TABLE "slice"."assign_decide_input_mode_nearest"
  DROP CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl",
  ADD CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" PRIMARY KEY USING INDEX "__next_assign_decide_input_mode_nearest_pk_ajsecg_3_f4jglsk665";

ALTER TABLE "slice"."assign_decide_input" DROP CONSTRAINT "__assign_decide_input_fk_step_vlinncoes5";

ALTER TABLE "slice"."assign_decide_input_mode_within"
  DROP CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar",
  ADD CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" PRIMARY KEY USING INDEX "__next_assign_decide_input_mode_within_pk_5_ir_7_6wdu23bkum";

ALTER TABLE "slice"."assign_decide_nearest_read"
  DROP CONSTRAINT "__assign_decide_nearest_read_pk_jc4zqvfwss",
  ADD CONSTRAINT "__assign_decide_nearest_read_pk_jc4zqvfwss" PRIMARY KEY USING INDEX "__next_assign_decide_nearest_read_pk_jc_4_zqvfwss_todllgmp5u";

ALTER TABLE "slice"."assign_decide_output_weighed" DROP CONSTRAINT "__assign_decide_output_weighed_fk_step_ii3cwlqbeg";

ALTER TABLE "slice"."assign_decide_output"
  DROP CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse",
  ADD CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" PRIMARY KEY USING INDEX "__next_assign_decide_output_pk_tf_6_r_7_wtfse_ejgjhnm3f3";

ALTER TABLE "slice"."assign_decide_output" DROP CONSTRAINT "__assign_decide_output_fk_step_6eza3ipk3z";

ALTER TABLE "slice"."assign_decide_output_stage_rest"
  DROP CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx",
  ADD CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" PRIMARY KEY USING INDEX "__next_assign_decide_output_stage_rest_pk_6_5th4lnxe3o";

ALTER TABLE "slice"."assign_decide_output" DROP CONSTRAINT "__assign_decide_output_fk_step_uf2quv342e";

ALTER TABLE "slice"."assign_decide_output_stage_serve"
  DROP CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow",
  ADD CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" PRIMARY KEY USING INDEX "__next_assign_decide_output_stage_serve_pk_g_54_mny6ekiahm";

ALTER TABLE "slice"."assign_decide_output_weighed" DROP CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_nfcwpmjkm3";

ALTER TABLE "slice"."assign_decide_output_weighed"
  DROP CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw",
  ADD CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" PRIMARY KEY USING INDEX "__next_assign_decide_output_weighed_pk_gf_74_rfsfbw_lneyws3bf7";

ALTER TABLE "slice"."assign_decide_seen_read"
  DROP CONSTRAINT "__assign_decide_seen_read_pk_sczf2f7gz7",
  ADD CONSTRAINT "__assign_decide_seen_read_pk_sczf2f7gz7" PRIMARY KEY USING INDEX "__next_assign_decide_seen_read_pk_sczf_2_f_7_gz_7_wsnkukw3db";

ALTER TABLE "slice"."assign_decide_output" DROP CONSTRAINT "__assign_decide_output_fk_step_6birgjscft";

ALTER TABLE "slice"."assign_done"
  DROP CONSTRAINT "__assign_done_pk_gzil7jvxpz",
  ADD CONSTRAINT "__assign_done_pk_gzil7jvxpz" PRIMARY KEY USING INDEX "__next_assign_done_pk_gzil_7_jvxpz_tumphahf2d";

ALTER TABLE "slice"."assign_due"
  DROP CONSTRAINT "__assign_due_pk_mgahvzt6eh",
  ADD CONSTRAINT "__assign_due_pk_mgahvzt6eh" PRIMARY KEY USING INDEX "__next_assign_due_pk_mgahvzt_6_eh_wrism7vtg6";

ALTER TABLE "slice"."assign_exhausted"
  DROP CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6",
  ADD CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" PRIMARY KEY USING INDEX "__next_assign_exhausted_pk_utz_6_lwqgv_6_n3voajeii6";

ALTER TABLE "slice"."assign_exhausted" DROP CONSTRAINT "__assign_exhausted_fk_step_cxx7syotgn";

ALTER TABLE "slice"."assign_refusal" DROP CONSTRAINT "__assign_refusal_fk_step_aqlyzlq3fc";

ALTER TABLE "slice"."assign_failed"
  DROP CONSTRAINT "__assign_failed_pk_ygxslcya4o",
  ADD CONSTRAINT "__assign_failed_pk_ygxslcya4o" PRIMARY KEY USING INDEX "__next_assign_failed_pk_ygxslcya_4_o_ogr4rqnhss";

ALTER TABLE "slice"."assign_fenced"
  DROP CONSTRAINT "__assign_fenced_pk_y6jyfviepa",
  ADD CONSTRAINT "__assign_fenced_pk_y6jyfviepa" PRIMARY KEY USING INDEX "__next_assign_fenced_pk_y_6_jyfviepa_7tussjtcok";

ALTER TABLE "slice"."assign_finish"
  DROP CONSTRAINT "__assign_finish_pk_kfe2ztwv2z",
  ADD CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" PRIMARY KEY USING INDEX "__next_assign_finish_pk_kfe_2_ztwv_2_z_kir232nazl";

ALTER TABLE "slice"."assign_held"
  DROP CONSTRAINT "__assign_held_pk_by245z7t45",
  ADD CONSTRAINT "__assign_held_pk_by245z7t45" PRIMARY KEY USING INDEX "__next_assign_held_pk_by_245_z_7_t_45_flsdzhzvhb";

ALTER TABLE "slice"."assign_refusal"
  DROP CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k",
  ADD CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" PRIMARY KEY USING INDEX "__next_assign_refusal_pk_xs_5_e_4_ryh_4_k_ug5p642czq";

ALTER TABLE "slice"."assign_decide_nearest_read" DROP CONSTRAINT "__assign_decide_nearest_read_fk_step_ahvahshsfy";

ALTER TABLE "slice"."assign_decide_seen_read" DROP CONSTRAINT "__assign_decide_seen_read_fk_step_xfllym5krc";

ALTER TABLE "slice"."assign_held" DROP CONSTRAINT "__assign_held_fk_step_ww2k5nnc4c";

ALTER TABLE "slice"."assign_result"
  DROP CONSTRAINT "__assign_result_pk_i2yxmpkyzr",
  ADD CONSTRAINT "__assign_result_pk_i2yxmpkyzr" PRIMARY KEY USING INDEX "__next_assign_result_pk_i_2_yxmpkyzr_owvl6l7upy";

ALTER TABLE "slice"."assign_retry"
  DROP CONSTRAINT "__assign_retry_pk_4dcm5yzzhe",
  ADD CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" PRIMARY KEY USING INDEX "__next_assign_retry_pk_4_dcm_5_yzzhe_6cxpia4id6";

ALTER TABLE "slice"."assign_admitted" DROP CONSTRAINT "__assign_admitted_fk_scope_vfepaqjqyi";

ALTER TABLE "slice"."assign_root" DROP CONSTRAINT "__assign_root_fk_scope_344txuecsh";

ALTER TABLE "slice"."assign_start_scope" DROP CONSTRAINT "__assign_start_scope_fk_child_niiue7y5lb";

ALTER TABLE "slice"."assign_within" DROP CONSTRAINT "__assign_within_fk_parent_kq5ksmcoez";

ALTER TABLE "slice"."assign_within" DROP CONSTRAINT "__assign_within_fk_scope_2yvr2lbtxd";

ALTER TABLE "slice"."assign_scope"
  DROP CONSTRAINT "__assign_scope_pk_xytntbncid",
  ADD CONSTRAINT "__assign_scope_pk_xytntbncid" PRIMARY KEY USING INDEX "__next_assign_scope_pk_xytntbncid_zr6m2djm3z";

ALTER TABLE "slice"."assign_skipped"
  DROP CONSTRAINT "__assign_skipped_pk_5qhgbueof7",
  ADD CONSTRAINT "__assign_skipped_pk_5qhgbueof7" PRIMARY KEY USING INDEX "__next_assign_skipped_pk_5_qhgbueof_7_wozhwh5jwy";

ALTER TABLE "slice"."assign_start_scope"
  DROP CONSTRAINT "__assign_start_scope_pk_ldqdb5b25z",
  ADD CONSTRAINT "__assign_start_scope_pk_ldqdb5b25z" PRIMARY KEY USING INDEX "__next_assign_start_scope_pk_ldqdb_5_b_25_z_mir2frb354";

ALTER TABLE "slice"."assign_start_step"
  DROP CONSTRAINT "__assign_start_step_pk_jjcfkvptmp",
  ADD CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" PRIMARY KEY USING INDEX "__next_assign_start_step_pk_jjcfkvptmp_4l342htmfl";

ALTER TABLE "slice"."assign_claim" DROP CONSTRAINT "__assign_claim_fk_step_4p6buiqtrc";

ALTER TABLE "slice"."assign_due" DROP CONSTRAINT "__assign_due_fk_step_dbtohril7u";

ALTER TABLE "slice"."assign_finish" DROP CONSTRAINT "__assign_finish_fk_step_i3ke2hxa66";

ALTER TABLE "slice"."assign_result" DROP CONSTRAINT "__assign_result_fk_step_4pnas55m6w";

ALTER TABLE "slice"."assign_start_step" DROP CONSTRAINT "__assign_start_step_fk_step_2sej5uze4v";

ALTER TABLE "slice"."assign_step"
  DROP CONSTRAINT "__assign_step_pk_2oc4ehvfzd",
  ADD CONSTRAINT "__assign_step_pk_2oc4ehvfzd" PRIMARY KEY USING INDEX "__next_assign_step_pk_2_oc_4_ehvfzd_no4wpymyzk";

ALTER TABLE "slice"."assign_within"
  DROP CONSTRAINT "__assign_within_pk_vvbm6qryed",
  ADD CONSTRAINT "__assign_within_pk_vvbm6qryed" PRIMARY KEY USING INDEX "__next_assign_within_pk_vvbm_6_qryed_53p4acsm5f";

ALTER TABLE "slice"."chain_finish" DROP CONSTRAINT "__chain_finish_fk_scope_cfnzgc3ln5";

ALTER TABLE "slice"."chain_skipped" DROP CONSTRAINT "__chain_skipped_fk_by_6rnf2fiiiy";

ALTER TABLE "slice"."chain_start_scope" DROP CONSTRAINT "__chain_start_scope_fk_scope_j7b72gqt5h";

ALTER TABLE "slice"."chain_start_step" DROP CONSTRAINT "__chain_start_step_fk_scope_fo4zcmg3hw";

ALTER TABLE "slice"."chain_step" DROP CONSTRAINT "__chain_step_fk_scope_gig4dsmris";

ALTER TABLE "slice"."chain_admitted"
  DROP CONSTRAINT "__chain_admitted_pk_iexc6ruxuv",
  ADD CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" PRIMARY KEY USING INDEX "__next_chain_admitted_pk_iexc_6_ruxuv_yfnhkc7vbn";

ALTER TABLE "slice"."chain_chain_run_input"
  DROP CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha",
  ADD CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" PRIMARY KEY USING INDEX "__next_chain_chain_run_input_pk_ezbgzw_4_jha_p4qhm7ld2m";

ALTER TABLE "slice"."chain_claim" DROP CONSTRAINT "__chain_claim_fk_step_pred_attempt_eaxsvkfnat";

ALTER TABLE "slice"."chain_fenced" DROP CONSTRAINT "__chain_fenced_fk_step_attempt_tr357gwkw2";

ALTER TABLE "slice"."chain_held" DROP CONSTRAINT "__chain_held_fk_step_attempt_ha67r6xn73";

ALTER TABLE "slice"."chain_retry" DROP CONSTRAINT "__chain_retry_fk_step_attempt_ezek5vymkn";

ALTER TABLE "slice"."chain_claim"
  DROP CONSTRAINT "__chain_claim_pk_nrr2rn3gui",
  ADD CONSTRAINT "__chain_claim_pk_nrr2rn3gui" PRIMARY KEY USING INDEX "__next_chain_claim_pk_nrr_2_rn_3_gui_logsrbsawm";

ALTER TABLE "slice"."chain_page_output" DROP CONSTRAINT "__chain_page_output_fk_step_ski2uzorzn";

ALTER TABLE "slice"."chain_done"
  DROP CONSTRAINT "__chain_done_pk_tyyx2hmu3r",
  ADD CONSTRAINT "__chain_done_pk_tyyx2hmu3r" PRIMARY KEY USING INDEX "__next_chain_done_pk_tyyx_2_hmu_3_r_wk4pbvrfpr";

ALTER TABLE "slice"."chain_due"
  DROP CONSTRAINT "__chain_due_pk_d5xdvmzepr",
  ADD CONSTRAINT "__chain_due_pk_d5xdvmzepr" PRIMARY KEY USING INDEX "__next_chain_due_pk_d_5_xdvmzepr_knnqkt7k57";

ALTER TABLE "slice"."chain_exhausted"
  DROP CONSTRAINT "__chain_exhausted_pk_nc4gvildnw",
  ADD CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" PRIMARY KEY USING INDEX "__next_chain_exhausted_pk_nc_4_gvildnw_rhk45e5ux3";

ALTER TABLE "slice"."chain_exhausted" DROP CONSTRAINT "__chain_exhausted_fk_step_fa2jqgxojj";

ALTER TABLE "slice"."chain_refusal" DROP CONSTRAINT "__chain_refusal_fk_step_bac3stmrn3";

ALTER TABLE "slice"."chain_failed"
  DROP CONSTRAINT "__chain_failed_pk_m7o5m3xzrr",
  ADD CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" PRIMARY KEY USING INDEX "__next_chain_failed_pk_m_7_o_5_m_3_xzrr_wywxmvfkvi";

ALTER TABLE "slice"."chain_fenced"
  DROP CONSTRAINT "__chain_fenced_pk_wwbie4qq5k",
  ADD CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" PRIMARY KEY USING INDEX "__next_chain_fenced_pk_wwbie_4_qq_5_k_i764llhws5";

ALTER TABLE "slice"."chain_finish"
  DROP CONSTRAINT "__chain_finish_pk_ebe75jmnzy",
  ADD CONSTRAINT "__chain_finish_pk_ebe75jmnzy" PRIMARY KEY USING INDEX "__next_chain_finish_pk_ebe_75_jmnzy_fmqbr6l3ew";

ALTER TABLE "slice"."chain_held"
  DROP CONSTRAINT "__chain_held_pk_73idl7oo5c",
  ADD CONSTRAINT "__chain_held_pk_73idl7oo5c" PRIMARY KEY USING INDEX "__next_chain_held_pk_73_idl_7_oo_5_c_lui2ma4hdr";

ALTER TABLE "slice"."chain_next"
  DROP CONSTRAINT "__chain_next_pk_qeumlilvtk",
  ADD CONSTRAINT "__chain_next_pk_qeumlilvtk" PRIMARY KEY USING INDEX "__next_chain_next_pk_qeumlilvtk_ry6l537iaa";

ALTER TABLE "slice"."chain_ordered_input"
  DROP CONSTRAINT "__chain_ordered_input_pk_iv2357obqh",
  ADD CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" PRIMARY KEY USING INDEX "__next_chain_ordered_input_pk_iv_2357_obqh_vcv4s3qpi5";

ALTER TABLE "slice"."chain_next" DROP CONSTRAINT "__chain_next_fk_from_y5is7epime";

ALTER TABLE "slice"."chain_next" DROP CONSTRAINT "__chain_next_fk_to_4dtheiiigt";

ALTER TABLE "slice"."chain_page_input_after" DROP CONSTRAINT "__chain_page_input_after_fk_step_lfprg2mtrc";

ALTER TABLE "slice"."chain_page_output" DROP CONSTRAINT "__chain_page_output_fk_step_g37yommeoy";

ALTER TABLE "slice"."chain_page_input"
  DROP CONSTRAINT "__chain_page_input_pk_xuafsbu5vz",
  ADD CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" PRIMARY KEY USING INDEX "__next_chain_page_input_pk_xuafsbu_5_vz_e35pwm5ak5";

ALTER TABLE "slice"."chain_page_input_after"
  DROP CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam",
  ADD CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" PRIMARY KEY USING INDEX "__next_chain_page_input_after_pk_zsdylv_6_pam_yxkl75qgwr";

ALTER TABLE "slice"."chain_page_output_next" DROP CONSTRAINT "__chain_page_output_next_fk_step_azw5pfnnsa";

ALTER TABLE "slice"."chain_page_output"
  DROP CONSTRAINT "__chain_page_output_pk_whwnpdfgmi",
  ADD CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" PRIMARY KEY USING INDEX "__next_chain_page_output_pk_whwnpdfgmi_wsb3rozbog";

ALTER TABLE "slice"."chain_page_output_next"
  DROP CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq",
  ADD CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" PRIMARY KEY USING INDEX "__next_chain_page_output_next_pk_h_55_uzx_4_bbq_utflmtrj57";

ALTER TABLE "slice"."chain_page_weights_read"
  DROP CONSTRAINT "__chain_page_weights_read_pk_mvr5jc4gry",
  ADD CONSTRAINT "__chain_page_weights_read_pk_mvr5jc4gry" PRIMARY KEY USING INDEX "__next_chain_page_weights_read_pk_mvr_5_jc_4_gry_rdormzdjxp";

ALTER TABLE "slice"."chain_refusal"
  DROP CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m",
  ADD CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" PRIMARY KEY USING INDEX "__next_chain_refusal_pk_4_j_4_yw_3_qc_6_m_krtuhw7rfi";

ALTER TABLE "slice"."audit" DROP CONSTRAINT "__audit_fk_step_zgfyapbfme";

ALTER TABLE "slice"."chain_held" DROP CONSTRAINT "__chain_held_fk_step_gn4a3vhis4";

ALTER TABLE "slice"."chain_page_weights_read" DROP CONSTRAINT "__chain_page_weights_read_fk_step_gpovo4cp33";

ALTER TABLE "slice"."chain_result"
  DROP CONSTRAINT "__chain_result_pk_btw3jzlkgl",
  ADD CONSTRAINT "__chain_result_pk_btw3jzlkgl" PRIMARY KEY USING INDEX "__next_chain_result_pk_btw_3_jzlkgl_75h5bzjaa5";

ALTER TABLE "slice"."chain_retry"
  DROP CONSTRAINT "__chain_retry_pk_522nodru3s",
  ADD CONSTRAINT "__chain_retry_pk_522nodru3s" PRIMARY KEY USING INDEX "__next_chain_retry_pk_522_nodru_3_s_v5ybqv3nqa";

ALTER TABLE "slice"."chain_admitted" DROP CONSTRAINT "__chain_admitted_fk_scope_ayutazf7v2";

ALTER TABLE "slice"."chain_root" DROP CONSTRAINT "__chain_root_fk_scope_g7gu2qhyp2";

ALTER TABLE "slice"."chain_start_scope" DROP CONSTRAINT "__chain_start_scope_fk_child_bz3czs5on4";

ALTER TABLE "slice"."chain_within" DROP CONSTRAINT "__chain_within_fk_parent_n3pon4mlxe";

ALTER TABLE "slice"."chain_within" DROP CONSTRAINT "__chain_within_fk_scope_gzdy7afflv";

ALTER TABLE "slice"."chain_scope"
  DROP CONSTRAINT "__chain_scope_pk_fxzt444lf6",
  ADD CONSTRAINT "__chain_scope_pk_fxzt444lf6" PRIMARY KEY USING INDEX "__next_chain_scope_pk_fxzt_444_lf_6_6ewfaalfo2";

ALTER TABLE "slice"."chain_skipped"
  DROP CONSTRAINT "__chain_skipped_pk_cjdtdttlyx",
  ADD CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" PRIMARY KEY USING INDEX "__next_chain_skipped_pk_cjdtdttlyx_ts5b2sb76v";

ALTER TABLE "slice"."chain_start_scope"
  DROP CONSTRAINT "__chain_start_scope_pk_t4giphzblt",
  ADD CONSTRAINT "__chain_start_scope_pk_t4giphzblt" PRIMARY KEY USING INDEX "__next_chain_start_scope_pk_t_4_giphzblt_yqmw5vzcvc";

ALTER TABLE "slice"."chain_start_step"
  DROP CONSTRAINT "__chain_start_step_pk_dgda7shxb4",
  ADD CONSTRAINT "__chain_start_step_pk_dgda7shxb4" PRIMARY KEY USING INDEX "__next_chain_start_step_pk_dgda_7_shxb_4_njtzbizh7y";

ALTER TABLE "slice"."chain_claim" DROP CONSTRAINT "__chain_claim_fk_step_tlgqnv6mzi";

ALTER TABLE "slice"."chain_due" DROP CONSTRAINT "__chain_due_fk_step_dcq52t54ph";

ALTER TABLE "slice"."chain_finish" DROP CONSTRAINT "__chain_finish_fk_step_djulfbbhyv";

ALTER TABLE "slice"."chain_result" DROP CONSTRAINT "__chain_result_fk_step_dbmjl746t7";

ALTER TABLE "slice"."chain_start_step" DROP CONSTRAINT "__chain_start_step_fk_step_yqr6ccimjq";

ALTER TABLE "slice"."chain_step"
  DROP CONSTRAINT "__chain_step_pk_u6x5wnvfbv",
  ADD CONSTRAINT "__chain_step_pk_u6x5wnvfbv" PRIMARY KEY USING INDEX "__next_chain_step_pk_u_6_x_5_wnvfbv_kiwhmbg2dj";

ALTER TABLE "slice"."chain_within"
  DROP CONSTRAINT "__chain_within_pk_ihqzjavdib",
  ADD CONSTRAINT "__chain_within_pk_ihqzjavdib" PRIMARY KEY USING INDEX "__next_chain_within_pk_ihqzjavdib_j4ty3djyan";

ALTER TABLE "slice"."fan_finish" DROP CONSTRAINT "__fan_finish_fk_scope_7bafbqarll";

ALTER TABLE "slice"."fan_skipped" DROP CONSTRAINT "__fan_skipped_fk_by_ofiy7h4yez";

ALTER TABLE "slice"."fan_start_scope" DROP CONSTRAINT "__fan_start_scope_fk_scope_ewnvx2xo4c";

ALTER TABLE "slice"."fan_start_step" DROP CONSTRAINT "__fan_start_step_fk_scope_jcmkodvipd";

ALTER TABLE "slice"."fan_step" DROP CONSTRAINT "__fan_step_fk_scope_p7ymxnnzil";

ALTER TABLE "slice"."fan_admitted"
  DROP CONSTRAINT "__fan_admitted_pk_jzt7rtrzny",
  ADD CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" PRIMARY KEY USING INDEX "__next_fan_admitted_pk_jzt_7_rtrzny_4occmtmhby";

ALTER TABLE "slice"."fan_batch_input"
  DROP CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw",
  ADD CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" PRIMARY KEY USING INDEX "__next_fan_batch_input_pk_bmhyfuy_2_bw_a3dyetngo7";

ALTER TABLE "slice"."fan_claim" DROP CONSTRAINT "__fan_claim_fk_step_pred_attempt_r5pt5cwztz";

ALTER TABLE "slice"."fan_fenced" DROP CONSTRAINT "__fan_fenced_fk_step_attempt_ykbq3jv4ri";

ALTER TABLE "slice"."fan_held" DROP CONSTRAINT "__fan_held_fk_step_attempt_zol2no7gql";

ALTER TABLE "slice"."fan_retry" DROP CONSTRAINT "__fan_retry_fk_step_attempt_ch6qjnmtkt";

ALTER TABLE "slice"."fan_claim"
  DROP CONSTRAINT "__fan_claim_pk_e7zimqppco",
  ADD CONSTRAINT "__fan_claim_pk_e7zimqppco" PRIMARY KEY USING INDEX "__next_fan_claim_pk_e_7_zimqppco_wd2r22gtdx";

ALTER TABLE "slice"."fan_square_output" DROP CONSTRAINT "__fan_square_output_fk_step_ho2zf7mac5";

ALTER TABLE "slice"."fan_done"
  DROP CONSTRAINT "__fan_done_pk_5u65252q52",
  ADD CONSTRAINT "__fan_done_pk_5u65252q52" PRIMARY KEY USING INDEX "__next_fan_done_pk_5_u_65252_q_52_x35qewdgik";

ALTER TABLE "slice"."fan_due"
  DROP CONSTRAINT "__fan_due_pk_yc6ppd3zm6",
  ADD CONSTRAINT "__fan_due_pk_yc6ppd3zm6" PRIMARY KEY USING INDEX "__next_fan_due_pk_yc_6_ppd_3_zm_6_ejwpua64px";

ALTER TABLE "slice"."fan_exhausted"
  DROP CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd",
  ADD CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" PRIMARY KEY USING INDEX "__next_fan_exhausted_pk_4_t_3_sxjskvd_rzonpmsquw";

ALTER TABLE "slice"."fan_exhausted" DROP CONSTRAINT "__fan_exhausted_fk_step_j42evr2xp3";

ALTER TABLE "slice"."fan_refusal" DROP CONSTRAINT "__fan_refusal_fk_step_otwlhohyvs";

ALTER TABLE "slice"."fan_failed"
  DROP CONSTRAINT "__fan_failed_pk_z4etp5dmax",
  ADD CONSTRAINT "__fan_failed_pk_z4etp5dmax" PRIMARY KEY USING INDEX "__next_fan_failed_pk_z_4_etp_5_dmax_vq6g4s7drn";

ALTER TABLE "slice"."fan_fan_run_input"
  DROP CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g",
  ADD CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" PRIMARY KEY USING INDEX "__next_fan_fan_run_input_pk_tbzpgbwe_7_g_jkk6zqiq2m";

ALTER TABLE "slice"."fan_fenced"
  DROP CONSTRAINT "__fan_fenced_pk_6tkvirerez",
  ADD CONSTRAINT "__fan_fenced_pk_6tkvirerez" PRIMARY KEY USING INDEX "__next_fan_fenced_pk_6_tkvirerez_i6gld6nw6y";

ALTER TABLE "slice"."fan_finish"
  DROP CONSTRAINT "__fan_finish_pk_6mb33urjra",
  ADD CONSTRAINT "__fan_finish_pk_6mb33urjra" PRIMARY KEY USING INDEX "__next_fan_finish_pk_6_mb_33_urjra_l4vrua653d";

ALTER TABLE "slice"."fan_held"
  DROP CONSTRAINT "__fan_held_pk_4ic6tjvac4",
  ADD CONSTRAINT "__fan_held_pk_4ic6tjvac4" PRIMARY KEY USING INDEX "__next_fan_held_pk_4_ic_6_tjvac_4_yzywgzje3m";

ALTER TABLE "slice"."fan_refusal"
  DROP CONSTRAINT "__fan_refusal_pk_7va55wo2wj",
  ADD CONSTRAINT "__fan_refusal_pk_7va55wo2wj" PRIMARY KEY USING INDEX "__next_fan_refusal_pk_7_va_55_wo_2_wj_taxxdxrkly";

ALTER TABLE "slice"."fan_held" DROP CONSTRAINT "__fan_held_fk_step_6tkjkyjp3h";

ALTER TABLE "slice"."fan_result"
  DROP CONSTRAINT "__fan_result_pk_yeear352sx",
  ADD CONSTRAINT "__fan_result_pk_yeear352sx" PRIMARY KEY USING INDEX "__next_fan_result_pk_yeear_352_sx_nm6k4cpp6q";

ALTER TABLE "slice"."fan_retry"
  DROP CONSTRAINT "__fan_retry_pk_7xubce4v66",
  ADD CONSTRAINT "__fan_retry_pk_7xubce4v66" PRIMARY KEY USING INDEX "__next_fan_retry_pk_7_xubce_4_v_66_lpkm4qrqyy";

ALTER TABLE "slice"."fan_admitted" DROP CONSTRAINT "__fan_admitted_fk_scope_zsdeiuzwyh";

ALTER TABLE "slice"."fan_root" DROP CONSTRAINT "__fan_root_fk_scope_7k4byqnauw";

ALTER TABLE "slice"."fan_start_scope" DROP CONSTRAINT "__fan_start_scope_fk_child_ngma7ay7kq";

ALTER TABLE "slice"."fan_within" DROP CONSTRAINT "__fan_within_fk_parent_koa6wzyqvq";

ALTER TABLE "slice"."fan_within" DROP CONSTRAINT "__fan_within_fk_scope_5a7dtldf3w";

ALTER TABLE "slice"."fan_scope"
  DROP CONSTRAINT "__fan_scope_pk_7bvjfihnef",
  ADD CONSTRAINT "__fan_scope_pk_7bvjfihnef" PRIMARY KEY USING INDEX "__next_fan_scope_pk_7_bvjfihnef_oum4pftayh";

ALTER TABLE "slice"."fan_skipped"
  DROP CONSTRAINT "__fan_skipped_pk_22erbmfzer",
  ADD CONSTRAINT "__fan_skipped_pk_22erbmfzer" PRIMARY KEY USING INDEX "__next_fan_skipped_pk_22_erbmfzer_i5liagvcdz";

ALTER TABLE "slice"."fan_square_output" DROP CONSTRAINT "__fan_square_output_fk_step_prwr7wqv35";

ALTER TABLE "slice"."fan_square_input"
  DROP CONSTRAINT "__fan_square_input_pk_uzumoizv53",
  ADD CONSTRAINT "__fan_square_input_pk_uzumoizv53" PRIMARY KEY USING INDEX "__next_fan_square_input_pk_uzumoizv_53_f37444ig4s";

ALTER TABLE "slice"."fan_square_output"
  DROP CONSTRAINT "__fan_square_output_pk_wcgarjqvhr",
  ADD CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" PRIMARY KEY USING INDEX "__next_fan_square_output_pk_wcgarjqvhr_2qjhagbcxj";

ALTER TABLE "slice"."fan_start_scope"
  DROP CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi",
  ADD CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" PRIMARY KEY USING INDEX "__next_fan_start_scope_pk_nnms_2_gjwyi_dnceza3fyk";

ALTER TABLE "slice"."fan_start_step"
  DROP CONSTRAINT "__fan_start_step_pk_7e247xk4mz",
  ADD CONSTRAINT "__fan_start_step_pk_7e247xk4mz" PRIMARY KEY USING INDEX "__next_fan_start_step_pk_7_e_247_xk_4_mz_fyyq7wd6bc";

ALTER TABLE "slice"."fan_claim" DROP CONSTRAINT "__fan_claim_fk_step_ihp5bkdfc7";

ALTER TABLE "slice"."fan_due" DROP CONSTRAINT "__fan_due_fk_step_ddpvumwcis";

ALTER TABLE "slice"."fan_finish" DROP CONSTRAINT "__fan_finish_fk_step_f3he376omz";

ALTER TABLE "slice"."fan_result" DROP CONSTRAINT "__fan_result_fk_step_kzt2ms65pp";

ALTER TABLE "slice"."fan_start_step" DROP CONSTRAINT "__fan_start_step_fk_step_vjwo5huhik";

ALTER TABLE "slice"."fan_step"
  DROP CONSTRAINT "__fan_step_pk_2f4tcxnofk",
  ADD CONSTRAINT "__fan_step_pk_2f4tcxnofk" PRIMARY KEY USING INDEX "__next_fan_step_pk_2_f_4_tcxnofk_cungsdj5b7";

ALTER TABLE "slice"."fan_within"
  DROP CONSTRAINT "__fan_within_pk_g5tswgjfa6",
  ADD CONSTRAINT "__fan_within_pk_g5tswgjfa6" PRIMARY KEY USING INDEX "__next_fan_within_pk_g_5_tswgjfa_6_mtvh3ujn6r";

ALTER TABLE "slice"."retry_finish" DROP CONSTRAINT "__retry_finish_fk_scope_fwo5tjrgbx";

ALTER TABLE "slice"."retry_skipped" DROP CONSTRAINT "__retry_skipped_fk_by_xhx6i6337v";

ALTER TABLE "slice"."retry_start_scope" DROP CONSTRAINT "__retry_start_scope_fk_scope_bmkrykqxr3";

ALTER TABLE "slice"."retry_start_step" DROP CONSTRAINT "__retry_start_step_fk_scope_aijgs4np4p";

ALTER TABLE "slice"."retry_step" DROP CONSTRAINT "__retry_step_fk_scope_ouksmumzap";

ALTER TABLE "slice"."retry_admitted"
  DROP CONSTRAINT "__retry_admitted_pk_qyp7cminjx",
  ADD CONSTRAINT "__retry_admitted_pk_qyp7cminjx" PRIMARY KEY USING INDEX "__next_retry_admitted_pk_qyp_7_cminjx_y676yq5k3c";

ALTER TABLE "slice"."retry_brittle_output" DROP CONSTRAINT "__retry_brittle_output_fk_step_yzpan63y25";

ALTER TABLE "slice"."retry_brittle_input"
  DROP CONSTRAINT "__retry_brittle_input_pk_tlqssexohy",
  ADD CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" PRIMARY KEY USING INDEX "__next_retry_brittle_input_pk_tlqssexohy_ffiepmjqji";

ALTER TABLE "slice"."retry_brittle_output"
  DROP CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4",
  ADD CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" PRIMARY KEY USING INDEX "__next_retry_brittle_output_pk_oecjcng_2_s_4_qq75ygrffl";

ALTER TABLE "slice"."retry_claim" DROP CONSTRAINT "__retry_claim_fk_step_pred_attempt_eub2tikpeh";

ALTER TABLE "slice"."retry_fenced" DROP CONSTRAINT "__retry_fenced_fk_step_attempt_5lvusmnjjt";

ALTER TABLE "slice"."retry_held" DROP CONSTRAINT "__retry_held_fk_step_attempt_g534cnd4ee";

ALTER TABLE "slice"."retry_retry" DROP CONSTRAINT "__retry_retry_fk_step_attempt_ykromtpll2";

ALTER TABLE "slice"."retry_claim"
  DROP CONSTRAINT "__retry_claim_pk_aayzt5ni6z",
  ADD CONSTRAINT "__retry_claim_pk_aayzt5ni6z" PRIMARY KEY USING INDEX "__next_retry_claim_pk_aayzt_5_ni_6_z_sizwgqso2m";

ALTER TABLE "slice"."retry_brittle_output" DROP CONSTRAINT "__retry_brittle_output_fk_step_2duuaxh72x";

ALTER TABLE "slice"."retry_steadfast_output" DROP CONSTRAINT "__retry_steadfast_output_fk_step_gzrgos6ptu";

ALTER TABLE "slice"."retry_done"
  DROP CONSTRAINT "__retry_done_pk_vtkpce7rkq",
  ADD CONSTRAINT "__retry_done_pk_vtkpce7rkq" PRIMARY KEY USING INDEX "__next_retry_done_pk_vtkpce_7_rkq_ravfi7ys5s";

ALTER TABLE "slice"."retry_due"
  DROP CONSTRAINT "__retry_due_pk_lerzzlnz7o",
  ADD CONSTRAINT "__retry_due_pk_lerzzlnz7o" PRIMARY KEY USING INDEX "__next_retry_due_pk_lerzzlnz_7_o_xaqozki5sj";

ALTER TABLE "slice"."retry_exhausted"
  DROP CONSTRAINT "__retry_exhausted_pk_v56c23krid",
  ADD CONSTRAINT "__retry_exhausted_pk_v56c23krid" PRIMARY KEY USING INDEX "__next_retry_exhausted_pk_v_56_c_23_krid_kzqwgsjled";

ALTER TABLE "slice"."retry_exhausted" DROP CONSTRAINT "__retry_exhausted_fk_step_sanifiwunj";

ALTER TABLE "slice"."retry_refusal" DROP CONSTRAINT "__retry_refusal_fk_step_lcou3dggjh";

ALTER TABLE "slice"."retry_failed"
  DROP CONSTRAINT "__retry_failed_pk_mygc4onczp",
  ADD CONSTRAINT "__retry_failed_pk_mygc4onczp" PRIMARY KEY USING INDEX "__next_retry_failed_pk_mygc_4_onczp_c6tdy4fyky";

ALTER TABLE "slice"."retry_fenced"
  DROP CONSTRAINT "__retry_fenced_pk_umzicmiruo",
  ADD CONSTRAINT "__retry_fenced_pk_umzicmiruo" PRIMARY KEY USING INDEX "__next_retry_fenced_pk_umzicmiruo_z2u7j6tffr";

ALTER TABLE "slice"."retry_finish"
  DROP CONSTRAINT "__retry_finish_pk_yhwp5uk5cg",
  ADD CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" PRIMARY KEY USING INDEX "__next_retry_finish_pk_yhwp_5_uk_5_cg_wvcqqgrfxv";

ALTER TABLE "slice"."retry_held"
  DROP CONSTRAINT "__retry_held_pk_nvgeylmjp2",
  ADD CONSTRAINT "__retry_held_pk_nvgeylmjp2" PRIMARY KEY USING INDEX "__next_retry_held_pk_nvgeylmjp_2_kndueoje3k";

ALTER TABLE "slice"."retry_ladders_input"
  DROP CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x",
  ADD CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" PRIMARY KEY USING INDEX "__next_retry_ladders_input_pk_5_cdnkfgg_3_x_iu3jln2r4c";

ALTER TABLE "slice"."retry_refusal"
  DROP CONSTRAINT "__retry_refusal_pk_nifndsd6pp",
  ADD CONSTRAINT "__retry_refusal_pk_nifndsd6pp" PRIMARY KEY USING INDEX "__next_retry_refusal_pk_nifndsd_6_pp_ce2d3o7kzt";

ALTER TABLE "slice"."retry_held" DROP CONSTRAINT "__retry_held_fk_step_rlbcm6phjy";

ALTER TABLE "slice"."retry_result"
  DROP CONSTRAINT "__retry_result_pk_5fegihvmml",
  ADD CONSTRAINT "__retry_result_pk_5fegihvmml" PRIMARY KEY USING INDEX "__next_retry_result_pk_5_fegihvmml_islnkiwgnn";

ALTER TABLE "slice"."retry_retry"
  DROP CONSTRAINT "__retry_retry_pk_slrwn4rt5d",
  ADD CONSTRAINT "__retry_retry_pk_slrwn4rt5d" PRIMARY KEY USING INDEX "__next_retry_retry_pk_slrwn_4_rt_5_d_zzpxy24l2h";

ALTER TABLE "slice"."retry_admitted" DROP CONSTRAINT "__retry_admitted_fk_scope_o3jg25sttd";

ALTER TABLE "slice"."retry_root" DROP CONSTRAINT "__retry_root_fk_scope_sq2qa4m6ld";

ALTER TABLE "slice"."retry_start_scope" DROP CONSTRAINT "__retry_start_scope_fk_child_ive3vl5wpv";

ALTER TABLE "slice"."retry_within" DROP CONSTRAINT "__retry_within_fk_parent_d2h4ezdtjn";

ALTER TABLE "slice"."retry_within" DROP CONSTRAINT "__retry_within_fk_scope_zng7hmvot6";

ALTER TABLE "slice"."retry_scope"
  DROP CONSTRAINT "__retry_scope_pk_fgji2phvxy",
  ADD CONSTRAINT "__retry_scope_pk_fgji2phvxy" PRIMARY KEY USING INDEX "__next_retry_scope_pk_fgji_2_phvxy_mxzaotwdeo";

ALTER TABLE "slice"."retry_skipped"
  DROP CONSTRAINT "__retry_skipped_pk_au5z33ql7a",
  ADD CONSTRAINT "__retry_skipped_pk_au5z33ql7a" PRIMARY KEY USING INDEX "__next_retry_skipped_pk_au_5_z_33_ql_7_a_hnifjhyl5r";

ALTER TABLE "slice"."retry_start_scope"
  DROP CONSTRAINT "__retry_start_scope_pk_wsif6notdn",
  ADD CONSTRAINT "__retry_start_scope_pk_wsif6notdn" PRIMARY KEY USING INDEX "__next_retry_start_scope_pk_wsif_6_notdn_5cwuhxwemo";

ALTER TABLE "slice"."retry_start_step"
  DROP CONSTRAINT "__retry_start_step_pk_mp77csmi26",
  ADD CONSTRAINT "__retry_start_step_pk_mp77csmi26" PRIMARY KEY USING INDEX "__next_retry_start_step_pk_mp_77_csmi_26_2hxzwfntrz";

ALTER TABLE "slice"."retry_steadfast_output" DROP CONSTRAINT "__retry_steadfast_output_fk_step_ifxk5bkk6h";

ALTER TABLE "slice"."retry_steadfast_input"
  DROP CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3",
  ADD CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" PRIMARY KEY USING INDEX "__next_retry_steadfast_input_pk_omubooh_2_k_3_uedajitrb7";

ALTER TABLE "slice"."retry_steadfast_output"
  DROP CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w",
  ADD CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" PRIMARY KEY USING INDEX "__next_retry_steadfast_output_pk_xyvfgnpd_5_w_4nowqhrcyf";

ALTER TABLE "slice"."retry_claim" DROP CONSTRAINT "__retry_claim_fk_step_t3456bndar";

ALTER TABLE "slice"."retry_due" DROP CONSTRAINT "__retry_due_fk_step_sm2v4p4wn5";

ALTER TABLE "slice"."retry_finish" DROP CONSTRAINT "__retry_finish_fk_step_rjhqbqx2wh";

ALTER TABLE "slice"."retry_result" DROP CONSTRAINT "__retry_result_fk_step_6eyc56xk3a";

ALTER TABLE "slice"."retry_start_step" DROP CONSTRAINT "__retry_start_step_fk_step_lj6wlrxxh4";

ALTER TABLE "slice"."retry_step"
  DROP CONSTRAINT "__retry_step_pk_opjqidwhzg",
  ADD CONSTRAINT "__retry_step_pk_opjqidwhzg" PRIMARY KEY USING INDEX "__next_retry_step_pk_opjqidwhzg_ta5l4l4no3";

ALTER TABLE "slice"."retry_within"
  DROP CONSTRAINT "__retry_within_pk_t64odgwbuc",
  ADD CONSTRAINT "__retry_within_pk_t64odgwbuc" PRIMARY KEY USING INDEX "__next_retry_within_pk_t_64_odgwbuc_dtiykwjbvn";

ALTER TABLE "slice"."sync_finish" DROP CONSTRAINT "__sync_finish_fk_scope_bv3hsrlx5y";

ALTER TABLE "slice"."sync_skipped" DROP CONSTRAINT "__sync_skipped_fk_by_shlpjbklec";

ALTER TABLE "slice"."sync_start_scope" DROP CONSTRAINT "__sync_start_scope_fk_scope_f3rtdt5nag";

ALTER TABLE "slice"."sync_start_step" DROP CONSTRAINT "__sync_start_step_fk_scope_m2ya6p5z52";

ALTER TABLE "slice"."sync_step" DROP CONSTRAINT "__sync_step_fk_scope_ficxssqmik";

ALTER TABLE "slice"."sync_admitted"
  DROP CONSTRAINT "__sync_admitted_pk_ral53o3fpi",
  ADD CONSTRAINT "__sync_admitted_pk_ral53o3fpi" PRIMARY KEY USING INDEX "__next_sync_admitted_pk_ral_53_o_3_fpi_ubj7y5obpo";

ALTER TABLE "slice"."sync_build_output" DROP CONSTRAINT "__sync_build_output_fk_step_4psndc3t3d";

ALTER TABLE "slice"."sync_build_input"
  DROP CONSTRAINT "__sync_build_input_pk_wtjr2xzecg",
  ADD CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" PRIMARY KEY USING INDEX "__next_sync_build_input_pk_wtjr_2_xzecg_oxvpf6i7hn";

ALTER TABLE "slice"."sync_build_output"
  DROP CONSTRAINT "__sync_build_output_pk_rhnco3epch",
  ADD CONSTRAINT "__sync_build_output_pk_rhnco3epch" PRIMARY KEY USING INDEX "__next_sync_build_output_pk_rhnco_3_epch_p3wzjgxi6a";

ALTER TABLE "slice"."sync_claim" DROP CONSTRAINT "__sync_claim_fk_step_pred_attempt_4du2uws4ru";

ALTER TABLE "slice"."sync_fenced" DROP CONSTRAINT "__sync_fenced_fk_step_attempt_ypmzavzbgy";

ALTER TABLE "slice"."sync_held" DROP CONSTRAINT "__sync_held_fk_step_attempt_r37vvfdble";

ALTER TABLE "slice"."sync_retry" DROP CONSTRAINT "__sync_retry_fk_step_attempt_dbfp7g6nwv";

ALTER TABLE "slice"."sync_claim"
  DROP CONSTRAINT "__sync_claim_pk_s2tqnziq4u",
  ADD CONSTRAINT "__sync_claim_pk_s2tqnziq4u" PRIMARY KEY USING INDEX "__next_sync_claim_pk_s_2_tqnziq_4_u_qgk4pa6qme";

ALTER TABLE "slice"."sync_copy_output" DROP CONSTRAINT "__sync_copy_output_fk_step_ydkxdq3bkd";

ALTER TABLE "slice"."sync_copy_input"
  DROP CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5",
  ADD CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" PRIMARY KEY USING INDEX "__next_sync_copy_input_pk_nzsbbbp_6_o_5_asg6pxtkol";

ALTER TABLE "slice"."sync_copy_output"
  DROP CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot",
  ADD CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" PRIMARY KEY USING INDEX "__next_sync_copy_output_pk_x_6_s_2_tcx_7_ot_kn75k3yrbz";

ALTER TABLE "slice"."sync_build_output" DROP CONSTRAINT "__sync_build_output_fk_step_i3x7e6uuln";

ALTER TABLE "slice"."sync_copy_output" DROP CONSTRAINT "__sync_copy_output_fk_step_vgu5ci7zsn";

ALTER TABLE "slice"."sync_done"
  DROP CONSTRAINT "__sync_done_pk_nllomjb7og",
  ADD CONSTRAINT "__sync_done_pk_nllomjb7og" PRIMARY KEY USING INDEX "__next_sync_done_pk_nllomjb_7_og_2qo565fjkq";

ALTER TABLE "slice"."sync_due"
  DROP CONSTRAINT "__sync_due_pk_hkeoswqthe",
  ADD CONSTRAINT "__sync_due_pk_hkeoswqthe" PRIMARY KEY USING INDEX "__next_sync_due_pk_hkeoswqthe_bqewzb3vvm";

ALTER TABLE "slice"."sync_exclusive_key"
  DROP CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5",
  ADD CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" PRIMARY KEY USING INDEX "__next_sync_exclusive_key_pk_dba_4_nxbky_5_p4k5o6ech7";

ALTER TABLE "slice"."sync_exhausted"
  DROP CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it",
  ADD CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" PRIMARY KEY USING INDEX "__next_sync_exhausted_pk_ek_6_zxvo_6_it_skpvwhgnfk";

ALTER TABLE "slice"."sync_exhausted" DROP CONSTRAINT "__sync_exhausted_fk_step_qdkuopifxf";

ALTER TABLE "slice"."sync_refusal" DROP CONSTRAINT "__sync_refusal_fk_step_pkbm4yq2hj";

ALTER TABLE "slice"."sync_failed"
  DROP CONSTRAINT "__sync_failed_pk_gqykngewxb",
  ADD CONSTRAINT "__sync_failed_pk_gqykngewxb" PRIMARY KEY USING INDEX "__next_sync_failed_pk_gqykngewxb_y3blwwzwj6";

ALTER TABLE "slice"."sync_fenced"
  DROP CONSTRAINT "__sync_fenced_pk_tszx4qm2gz",
  ADD CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" PRIMARY KEY USING INDEX "__next_sync_fenced_pk_tszx_4_qm_2_gz_ow2enoaeev";

ALTER TABLE "slice"."sync_finish"
  DROP CONSTRAINT "__sync_finish_pk_hn7tmx25xc",
  ADD CONSTRAINT "__sync_finish_pk_hn7tmx25xc" PRIMARY KEY USING INDEX "__next_sync_finish_pk_hn_7_tmx_25_xc_e2rjd6fplz";

ALTER TABLE "slice"."sync_gold_input"
  DROP CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e",
  ADD CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" PRIMARY KEY USING INDEX "__next_sync_gold_input_pk_wp_7_hfx_6_n_2_e_uihp4hwegr";

ALTER TABLE "slice"."sync_held"
  DROP CONSTRAINT "__sync_held_pk_wsme4moka4",
  ADD CONSTRAINT "__sync_held_pk_wsme4moka4" PRIMARY KEY USING INDEX "__next_sync_held_pk_wsme_4_moka_4_j44mgbptjy";

ALTER TABLE "slice"."sync_refusal"
  DROP CONSTRAINT "__sync_refusal_pk_mbmfornc5c",
  ADD CONSTRAINT "__sync_refusal_pk_mbmfornc5c" PRIMARY KEY USING INDEX "__next_sync_refusal_pk_mbmfornc_5_c_tbpuehnvrs";

ALTER TABLE "slice"."sync_held" DROP CONSTRAINT "__sync_held_fk_step_cko2wzco3r";

ALTER TABLE "slice"."sync_result"
  DROP CONSTRAINT "__sync_result_pk_jmwy2p3mqf",
  ADD CONSTRAINT "__sync_result_pk_jmwy2p3mqf" PRIMARY KEY USING INDEX "__next_sync_result_pk_jmwy_2_p_3_mqf_jfwanxwupk";

ALTER TABLE "slice"."sync_retry"
  DROP CONSTRAINT "__sync_retry_pk_6q52red7iw",
  ADD CONSTRAINT "__sync_retry_pk_6q52red7iw" PRIMARY KEY USING INDEX "__next_sync_retry_pk_6_q_52_red_7_iw_k7hoxbj4ma";

ALTER TABLE "slice"."sync_admitted" DROP CONSTRAINT "__sync_admitted_fk_scope_jli7ioqs7e";

ALTER TABLE "slice"."sync_exclusive_key" DROP CONSTRAINT "__sync_exclusive_key_fk_scope_cy4cbhycir";

ALTER TABLE "slice"."sync_root" DROP CONSTRAINT "__sync_root_fk_scope_ku5xrga5hw";

ALTER TABLE "slice"."sync_start_scope" DROP CONSTRAINT "__sync_start_scope_fk_child_khciqf3gvg";

ALTER TABLE "slice"."sync_within" DROP CONSTRAINT "__sync_within_fk_parent_gy7kgf4tam";

ALTER TABLE "slice"."sync_within" DROP CONSTRAINT "__sync_within_fk_scope_rkiw3n47nn";

ALTER TABLE "slice"."sync_scope"
  DROP CONSTRAINT "__sync_scope_pk_bg72sm6p4z",
  ADD CONSTRAINT "__sync_scope_pk_bg72sm6p4z" PRIMARY KEY USING INDEX "__next_sync_scope_pk_bg_72_sm_6_p_4_z_d4f6i3du6f";

ALTER TABLE "slice"."sync_skipped"
  DROP CONSTRAINT "__sync_skipped_pk_yutjqacvws",
  ADD CONSTRAINT "__sync_skipped_pk_yutjqacvws" PRIMARY KEY USING INDEX "__next_sync_skipped_pk_yutjqacvws_k2llylfnku";

ALTER TABLE "slice"."sync_start_scope"
  DROP CONSTRAINT "__sync_start_scope_pk_zsezuom4ll",
  ADD CONSTRAINT "__sync_start_scope_pk_zsezuom4ll" PRIMARY KEY USING INDEX "__next_sync_start_scope_pk_zsezuom_4_ll_rw7bjkogpt";

ALTER TABLE "slice"."sync_start_step"
  DROP CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3",
  ADD CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" PRIMARY KEY USING INDEX "__next_sync_start_step_pk_4_dv_7_h_6_kuu_3_6jsqwisqnr";

ALTER TABLE "slice"."sync_claim" DROP CONSTRAINT "__sync_claim_fk_step_l27dgy3dwh";

ALTER TABLE "slice"."sync_due" DROP CONSTRAINT "__sync_due_fk_step_o5af5jr33h";

ALTER TABLE "slice"."sync_finish" DROP CONSTRAINT "__sync_finish_fk_step_vhog6r5pu5";

ALTER TABLE "slice"."sync_result" DROP CONSTRAINT "__sync_result_fk_step_4ueb5frgri";

ALTER TABLE "slice"."sync_start_step" DROP CONSTRAINT "__sync_start_step_fk_step_xlobk7ohaz";

ALTER TABLE "slice"."sync_step"
  DROP CONSTRAINT "__sync_step_pk_wfgcxdvbwo",
  ADD CONSTRAINT "__sync_step_pk_wfgcxdvbwo" PRIMARY KEY USING INDEX "__next_sync_step_pk_wfgcxdvbwo_pwisdojpmy";

ALTER TABLE "slice"."sync_sync_run_input"
  DROP CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv",
  ADD CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" PRIMARY KEY USING INDEX "__next_sync_sync_run_input_pk_cpbaujyjwv_hnztsb6spm";

ALTER TABLE "slice"."sync_within"
  DROP CONSTRAINT "__sync_within_pk_xcfutikja2",
  ADD CONSTRAINT "__sync_within_pk_xcfutikja2" PRIMARY KEY USING INDEX "__next_sync_within_pk_xcfutikja_2_j3537ifkfz";

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_key_scope_root_bchsw4ix2g" UNIQUE USING INDEX "__assign_assignment_input_key_scope_root_bchsw4ix2g";

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_key_scope_root_gibc2wxiel" UNIQUE USING INDEX "__assign_assignment_input_key_scope_root_gibc2wxiel";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_key_step_root_wkkmcf3pki" UNIQUE USING INDEX "__assign_decide_input_key_step_root_wkkmcf3pki";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_key_step_root_kr2gl2vduy" UNIQUE USING INDEX "__assign_decide_input_key_step_root_kr2gl2vduy";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_key_step_root_wxkoynzs3a" UNIQUE USING INDEX "__assign_decide_output_key_step_root_wxkoynzs3a";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_key_step_root_vlmv6k3h4l" UNIQUE USING INDEX "__assign_decide_output_key_step_root_vlmv6k3h4l";

ALTER TABLE "slice"."assign_finish" ADD CONSTRAINT "__assign_finish_key_step_root_4woj5zibbd" UNIQUE USING INDEX "__assign_finish_key_step_root_4woj5zibbd";

ALTER TABLE "slice"."assign_result" ADD CONSTRAINT "__assign_result_key_step_root_outcome_abohxidqgh" UNIQUE USING INDEX "__assign_result_key_step_root_outcome_abohxidqgh";

ALTER TABLE "slice"."assign_root" ADD CONSTRAINT "__assign_root_key_scope_77r36z7vhn" UNIQUE USING INDEX "__assign_root_key_scope_77r36z7vhn";

ALTER TABLE "slice"."assign_scope" ADD CONSTRAINT "__assign_scope_key_scope_root_kind_r44d3akhzm" UNIQUE USING INDEX "__assign_scope_key_scope_root_kind_r44d3akhzm";

ALTER TABLE "slice"."assign_start_scope" ADD CONSTRAINT "__assign_start_scope_key_child_root_dlh7bpcpep" UNIQUE USING INDEX "__assign_start_scope_key_child_root_dlh7bpcpep";

ALTER TABLE "slice"."assign_start_step" ADD CONSTRAINT "__assign_start_step_key_step_root_k27j2tutjj" UNIQUE USING INDEX "__assign_start_step_key_step_root_k27j2tutjj";

ALTER TABLE "slice"."assign_step" ADD CONSTRAINT "__assign_step_key_step_root_kind_gglnf6zhrr" UNIQUE USING INDEX "__assign_step_key_step_root_kind_gglnf6zhrr";

ALTER TABLE "slice"."chain_finish" ADD CONSTRAINT "__chain_finish_key_step_root_5aj26igjty" UNIQUE USING INDEX "__chain_finish_key_step_root_5aj26igjty";

ALTER TABLE "slice"."chain_next" ADD CONSTRAINT "__chain_next_key_to_root_qxqaughmvp" UNIQUE USING INDEX "__chain_next_key_to_root_qxqaughmvp";

ALTER TABLE "slice"."chain_result" ADD CONSTRAINT "__chain_result_key_step_root_outcome_gzg5dgd4yf" UNIQUE USING INDEX "__chain_result_key_step_root_outcome_gzg5dgd4yf";

ALTER TABLE "slice"."chain_root" ADD CONSTRAINT "__chain_root_key_scope_prbadyie6j" UNIQUE USING INDEX "__chain_root_key_scope_prbadyie6j";

ALTER TABLE "slice"."chain_scope" ADD CONSTRAINT "__chain_scope_key_scope_root_kind_f66lrzuxpl" UNIQUE USING INDEX "__chain_scope_key_scope_root_kind_f66lrzuxpl";

ALTER TABLE "slice"."chain_start_scope" ADD CONSTRAINT "__chain_start_scope_key_child_root_qaucku2a5l" UNIQUE USING INDEX "__chain_start_scope_key_child_root_qaucku2a5l";

ALTER TABLE "slice"."chain_start_step" ADD CONSTRAINT "__chain_start_step_key_step_root_sgonmabfyw" UNIQUE USING INDEX "__chain_start_step_key_step_root_sgonmabfyw";

ALTER TABLE "slice"."chain_step" ADD CONSTRAINT "__chain_step_key_step_root_kind_5usafjldb4" UNIQUE USING INDEX "__chain_step_key_step_root_kind_5usafjldb4";

ALTER TABLE "slice"."fan_finish" ADD CONSTRAINT "__fan_finish_key_step_root_xshxj2rwb2" UNIQUE USING INDEX "__fan_finish_key_step_root_xshxj2rwb2";

ALTER TABLE "slice"."fan_result" ADD CONSTRAINT "__fan_result_key_step_root_outcome_pigdtsfrtf" UNIQUE USING INDEX "__fan_result_key_step_root_outcome_pigdtsfrtf";

ALTER TABLE "slice"."fan_root" ADD CONSTRAINT "__fan_root_key_scope_i3qel4nyj5" UNIQUE USING INDEX "__fan_root_key_scope_i3qel4nyj5";

ALTER TABLE "slice"."fan_scope" ADD CONSTRAINT "__fan_scope_key_scope_root_kind_4tsq5wlw2m" UNIQUE USING INDEX "__fan_scope_key_scope_root_kind_4tsq5wlw2m";

ALTER TABLE "slice"."fan_start_scope" ADD CONSTRAINT "__fan_start_scope_key_child_root_twylnvawre" UNIQUE USING INDEX "__fan_start_scope_key_child_root_twylnvawre";

ALTER TABLE "slice"."fan_start_step" ADD CONSTRAINT "__fan_start_step_key_step_root_h32wwrpq3c" UNIQUE USING INDEX "__fan_start_step_key_step_root_h32wwrpq3c";

ALTER TABLE "slice"."fan_step" ADD CONSTRAINT "__fan_step_key_step_root_kind_ybszf77kal" UNIQUE USING INDEX "__fan_step_key_step_root_kind_ybszf77kal";

ALTER TABLE "slice"."retry_finish" ADD CONSTRAINT "__retry_finish_key_step_root_a7vhiwagne" UNIQUE USING INDEX "__retry_finish_key_step_root_a7vhiwagne";

ALTER TABLE "slice"."retry_result" ADD CONSTRAINT "__retry_result_key_step_root_outcome_rartod3xj4" UNIQUE USING INDEX "__retry_result_key_step_root_outcome_rartod3xj4";

ALTER TABLE "slice"."retry_root" ADD CONSTRAINT "__retry_root_key_scope_yc7em5k35u" UNIQUE USING INDEX "__retry_root_key_scope_yc7em5k35u";

ALTER TABLE "slice"."retry_scope" ADD CONSTRAINT "__retry_scope_key_scope_root_kind_pcegt2scnb" UNIQUE USING INDEX "__retry_scope_key_scope_root_kind_pcegt2scnb";

ALTER TABLE "slice"."retry_start_scope" ADD CONSTRAINT "__retry_start_scope_key_child_root_yq5q4xexcm" UNIQUE USING INDEX "__retry_start_scope_key_child_root_yq5q4xexcm";

ALTER TABLE "slice"."retry_start_step" ADD CONSTRAINT "__retry_start_step_key_step_root_fudt2vk7zs" UNIQUE USING INDEX "__retry_start_step_key_step_root_fudt2vk7zs";

ALTER TABLE "slice"."retry_step" ADD CONSTRAINT "__retry_step_key_step_root_kind_xonebqedgz" UNIQUE USING INDEX "__retry_step_key_step_root_kind_xonebqedgz";

ALTER TABLE "slice"."sync_finish" ADD CONSTRAINT "__sync_finish_key_step_root_kpt2idultt" UNIQUE USING INDEX "__sync_finish_key_step_root_kpt2idultt";

ALTER TABLE "slice"."sync_result" ADD CONSTRAINT "__sync_result_key_step_root_outcome_c673vsbm4i" UNIQUE USING INDEX "__sync_result_key_step_root_outcome_c673vsbm4i";

ALTER TABLE "slice"."sync_root" ADD CONSTRAINT "__sync_root_key_scope_lxj4sb3mcx" UNIQUE USING INDEX "__sync_root_key_scope_lxj4sb3mcx";

ALTER TABLE "slice"."sync_scope" ADD CONSTRAINT "__sync_scope_key_scope_root_kind_hda5oz5d4v" UNIQUE USING INDEX "__sync_scope_key_scope_root_kind_hda5oz5d4v";

ALTER TABLE "slice"."sync_start_scope" ADD CONSTRAINT "__sync_start_scope_key_child_root_bqxek2fkcn" UNIQUE USING INDEX "__sync_start_scope_key_child_root_bqxek2fkcn";

ALTER TABLE "slice"."sync_start_step" ADD CONSTRAINT "__sync_start_step_key_step_root_rkceslwobo" UNIQUE USING INDEX "__sync_start_step_key_step_root_rkceslwobo";

ALTER TABLE "slice"."sync_step" ADD CONSTRAINT "__sync_step_key_step_root_kind_6xdmzwacqb" UNIQUE USING INDEX "__sync_step_key_step_root_kind_6xdmzwacqb";

ALTER TABLE "slice"."assign_admitted" ADD CONSTRAINT "__assign_admitted_fk_root_a4ab52rbpf" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_admitted" VALIDATE CONSTRAINT "__assign_admitted_fk_root_a4ab52rbpf";

ALTER TABLE "slice"."assign_admitted" ADD CONSTRAINT "__assign_admitted_fk_scope_root_axpol5zgcd" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_admitted" VALIDATE CONSTRAINT "__assign_admitted_fk_scope_root_axpol5zgcd";

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_fk_root_7vcxtkof42" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_root_7vcxtkof42";

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_fk_scope_root_tag_kind_ige6b2tsmh" FOREIGN KEY ("scope", "root", "__tag_kind_assignment_iybfg5upmr") REFERENCES "slice"."assign_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_scope_root_tag_kind_ige6b2tsmh";

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_fk_scope_root_tncpy5cmvv" FOREIGN KEY ("__scope_44i2s4kbue", "__root_h2ohpjyioe") REFERENCES "slice"."assign_assignment_input_mode_nearest" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_scope_root_tncpy5cmvv";

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_fk_scope_root_aoqws6tmme" FOREIGN KEY ("__scope_3owcvq3eou", "__root_i3j5qytpxw") REFERENCES "slice"."assign_assignment_input_mode_within" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input" VALIDATE CONSTRAINT "__assign_assignment_input_fk_scope_root_aoqws6tmme";

ALTER TABLE "slice"."assign_assignment_input_exclude" ADD CONSTRAINT "__assign_assignment_input_exclude_fk_root_kuvjl3s6t5" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_exclude" VALIDATE CONSTRAINT "__assign_assignment_input_exclude_fk_root_kuvjl3s6t5";

ALTER TABLE "slice"."assign_assignment_input_exclude" ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_root_z5moccsgvx" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_assignment_input" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_exclude" VALIDATE CONSTRAINT "__assign_assignment_input_exclude_fk_scope_root_z5moccsgvx";

ALTER TABLE "slice"."assign_assignment_input_exclude" ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_gg2bohya6p" FOREIGN KEY ("__scope_u6ypqf2r2z", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd") REFERENCES "slice"."assign_assignment_input_exclude" ("scope", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_exclude" VALIDATE CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_gg2bohya6p";

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_t23ef5vjhv" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" VALIDATE CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_t23ef5vjhv";

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_root_znjzoj5sqp" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_assignment_input" ("__scope_44i2s4kbue", "__root_h2ohpjyioe") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" VALIDATE CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_root_znjzoj5sqp";

ALTER TABLE "slice"."assign_assignment_input_mode_within" ADD CONSTRAINT "__assign_assignment_input_mode_within_fk_root_jimtsl3pcm" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_within" VALIDATE CONSTRAINT "__assign_assignment_input_mode_within_fk_root_jimtsl3pcm";

ALTER TABLE "slice"."assign_assignment_input_mode_within" ADD CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_root_lqrytrymw7" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_assignment_input" ("__scope_3owcvq3eou", "__root_i3j5qytpxw") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_mode_within" VALIDATE CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_root_lqrytrymw7";

ALTER TABLE "slice"."assign_claim" ADD CONSTRAINT "__assign_claim_fk_root_tccogfd3gj" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_claim" VALIDATE CONSTRAINT "__assign_claim_fk_root_tccogfd3gj";

ALTER TABLE "slice"."assign_claim" ADD CONSTRAINT "__assign_claim_fk_step_root_i4wvemd6lc" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_claim" VALIDATE CONSTRAINT "__assign_claim_fk_step_root_i4wvemd6lc";

ALTER TABLE "slice"."assign_claim" ADD CONSTRAINT "__assign_claim_fk_step_pred_attempt_root_wmdynbkcix" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp") REFERENCES "slice"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_claim" VALIDATE CONSTRAINT "__assign_claim_fk_step_pred_attempt_root_wmdynbkcix";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_fk_root_2ru7zbrfcg" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_root_2ru7zbrfcg";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_fk_step_root_tag_kind_decide_l6m3oymdxi" FOREIGN KEY ("step", "root", "__tag_kind_decide_ggginylxcj") REFERENCES "slice"."assign_step" ("step", "root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_step_root_tag_kind_decide_l6m3oymdxi";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_fk_step_root_r5raxgv3qz" FOREIGN KEY ("__step_rbt3e5bpyf", "__root_h2ohpjyioe") REFERENCES "slice"."assign_decide_input_mode_nearest" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_step_root_r5raxgv3qz";

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_fk_step_root_3ri6rctgq4" FOREIGN KEY ("__step_5ftuveszke", "__root_i3j5qytpxw") REFERENCES "slice"."assign_decide_input_mode_within" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input" VALIDATE CONSTRAINT "__assign_decide_input_fk_step_root_3ri6rctgq4";

ALTER TABLE "slice"."assign_decide_input_exclude" ADD CONSTRAINT "__assign_decide_input_exclude_fk_root_ms4jvh65c5" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_exclude" VALIDATE CONSTRAINT "__assign_decide_input_exclude_fk_root_ms4jvh65c5";

ALTER TABLE "slice"."assign_decide_input_exclude" ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_root_in6yyrl43w" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_exclude" VALIDATE CONSTRAINT "__assign_decide_input_exclude_fk_step_root_in6yyrl43w";

ALTER TABLE "slice"."assign_decide_input_exclude" ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_7st2gu5z77" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd") REFERENCES "slice"."assign_decide_input_exclude" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_exclude" VALIDATE CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_7st2gu5z77";

ALTER TABLE "slice"."assign_decide_input_mode_nearest" ADD CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_vgxth6ulqd" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_nearest" VALIDATE CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_vgxth6ulqd";

ALTER TABLE "slice"."assign_decide_input_mode_nearest" ADD CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_root_qz3rvpvaf2" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("__step_rbt3e5bpyf", "__root_h2ohpjyioe") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_nearest" VALIDATE CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_root_qz3rvpvaf2";

ALTER TABLE "slice"."assign_decide_input_mode_within" ADD CONSTRAINT "__assign_decide_input_mode_within_fk_root_5fhvbm7o2j" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_within" VALIDATE CONSTRAINT "__assign_decide_input_mode_within_fk_root_5fhvbm7o2j";

ALTER TABLE "slice"."assign_decide_input_mode_within" ADD CONSTRAINT "__assign_decide_input_mode_within_fk_step_root_pzugpauw4o" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("__step_5ftuveszke", "__root_i3j5qytpxw") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_mode_within" VALIDATE CONSTRAINT "__assign_decide_input_mode_within_fk_step_root_pzugpauw4o";

ALTER TABLE "slice"."assign_decide_nearest_read" ADD CONSTRAINT "__assign_decide_nearest_read_fk_root_bofoevlhaq" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_nearest_read" VALIDATE CONSTRAINT "__assign_decide_nearest_read_fk_root_bofoevlhaq";

ALTER TABLE "slice"."assign_decide_nearest_read" ADD CONSTRAINT "__assign_decide_nearest_read_fk_step_root_bdcjrgm56g" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_nearest_read" VALIDATE CONSTRAINT "__assign_decide_nearest_read_fk_step_root_bdcjrgm56g";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_fk_root_keez6pmczm" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "__assign_decide_output_fk_root_keez6pmczm";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_fk_step_root_oxey3s55bw" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "__assign_decide_output_fk_step_root_oxey3s55bw";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_fk_step_root_b4qrx4ukam" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_done" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "__assign_decide_output_fk_step_root_b4qrx4ukam";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_fk_step_root_7g22ekvp7m" FOREIGN KEY ("__step_zqzc7m2bzh", "__root_safjiw7jol") REFERENCES "slice"."assign_decide_output_stage_rest" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "__assign_decide_output_fk_step_root_7g22ekvp7m";

ALTER TABLE "slice"."assign_decide_output" ADD CONSTRAINT "__assign_decide_output_fk_step_root_tycn2t2kae" FOREIGN KEY ("__step_7f435gey6a", "__root_dp4c6pzr4n") REFERENCES "slice"."assign_decide_output_stage_serve" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output" VALIDATE CONSTRAINT "__assign_decide_output_fk_step_root_tycn2t2kae";

ALTER TABLE "slice"."assign_decide_output_stage_rest" ADD CONSTRAINT "__assign_decide_output_stage_rest_fk_root_emwjzdjgvs" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_stage_rest" VALIDATE CONSTRAINT "__assign_decide_output_stage_rest_fk_root_emwjzdjgvs";

ALTER TABLE "slice"."assign_decide_output_stage_rest" ADD CONSTRAINT "__assign_decide_output_stage_rest_fk_step_root_fnzfalcnrc" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_output" ("__step_zqzc7m2bzh", "__root_safjiw7jol") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_stage_rest" VALIDATE CONSTRAINT "__assign_decide_output_stage_rest_fk_step_root_fnzfalcnrc";

ALTER TABLE "slice"."assign_decide_output_stage_serve" ADD CONSTRAINT "__assign_decide_output_stage_serve_fk_root_nv2zgv5hrt" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_stage_serve" VALIDATE CONSTRAINT "__assign_decide_output_stage_serve_fk_root_nv2zgv5hrt";

ALTER TABLE "slice"."assign_decide_output_stage_serve" ADD CONSTRAINT "__assign_decide_output_stage_serve_fk_step_root_n4b5lyao3i" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_output" ("__step_7f435gey6a", "__root_dp4c6pzr4n") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_stage_serve" VALIDATE CONSTRAINT "__assign_decide_output_stage_serve_fk_step_root_n4b5lyao3i";

ALTER TABLE "slice"."assign_decide_output_weighed" ADD CONSTRAINT "__assign_decide_output_weighed_fk_root_tymno4wjr4" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_weighed" VALIDATE CONSTRAINT "__assign_decide_output_weighed_fk_root_tymno4wjr4";

ALTER TABLE "slice"."assign_decide_output_weighed" ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_root_nkudthcgg2" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_weighed" VALIDATE CONSTRAINT "__assign_decide_output_weighed_fk_step_root_nkudthcgg2";

ALTER TABLE "slice"."assign_decide_output_weighed" ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_zt6dalxe4q" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd") REFERENCES "slice"."assign_decide_output_weighed" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_output_weighed" VALIDATE CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_zt6dalxe4q";

ALTER TABLE "slice"."assign_decide_seen_read" ADD CONSTRAINT "__assign_decide_seen_read_fk_root_padlqqdvnt" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_seen_read" VALIDATE CONSTRAINT "__assign_decide_seen_read_fk_root_padlqqdvnt";

ALTER TABLE "slice"."assign_decide_seen_read" ADD CONSTRAINT "__assign_decide_seen_read_fk_step_root_lfxhtzprjs" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_seen_read" VALIDATE CONSTRAINT "__assign_decide_seen_read_fk_step_root_lfxhtzprjs";

ALTER TABLE "slice"."assign_done" ADD CONSTRAINT "__assign_done_fk_root_bm6oxygwbu" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_done" VALIDATE CONSTRAINT "__assign_done_fk_root_bm6oxygwbu";

ALTER TABLE "slice"."assign_done" ADD CONSTRAINT "__assign_done_fk_step_root_tag_outcome_done_jmgpbmloey" FOREIGN KEY ("step", "root", "__tag_outcome_done_3n46zakkk3") REFERENCES "slice"."assign_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_done" VALIDATE CONSTRAINT "__assign_done_fk_step_root_tag_outcome_done_jmgpbmloey";

ALTER TABLE "slice"."assign_due" ADD CONSTRAINT "__assign_due_fk_root_wmzjy6jkdr" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_due" VALIDATE CONSTRAINT "__assign_due_fk_root_wmzjy6jkdr";

ALTER TABLE "slice"."assign_due" ADD CONSTRAINT "__assign_due_fk_step_root_xxrlwthpgp" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_due" VALIDATE CONSTRAINT "__assign_due_fk_step_root_xxrlwthpgp";

ALTER TABLE "slice"."assign_exhausted" ADD CONSTRAINT "__assign_exhausted_fk_root_vljhubi73b" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_exhausted" VALIDATE CONSTRAINT "__assign_exhausted_fk_root_vljhubi73b";

ALTER TABLE "slice"."assign_exhausted" ADD CONSTRAINT "__assign_exhausted_fk_step_root_juabgscovy" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_exhausted" VALIDATE CONSTRAINT "__assign_exhausted_fk_step_root_juabgscovy";

ALTER TABLE "slice"."assign_failed" ADD CONSTRAINT "__assign_failed_fk_root_oyplqvhznf" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_failed" VALIDATE CONSTRAINT "__assign_failed_fk_root_oyplqvhznf";

ALTER TABLE "slice"."assign_failed" ADD CONSTRAINT "__assign_failed_fk_step_root_tag_outcome_failed_p7wvqfw4dg" FOREIGN KEY ("step", "root", "__tag_outcome_failed_bxttnpdkga") REFERENCES "slice"."assign_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_failed" VALIDATE CONSTRAINT "__assign_failed_fk_step_root_tag_outcome_failed_p7wvqfw4dg";

ALTER TABLE "slice"."assign_fenced" ADD CONSTRAINT "__assign_fenced_fk_root_53vovdvcd2" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_fenced" VALIDATE CONSTRAINT "__assign_fenced_fk_root_53vovdvcd2";

ALTER TABLE "slice"."assign_fenced" ADD CONSTRAINT "__assign_fenced_fk_step_attempt_root_ycfgkdukim" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_fenced" VALIDATE CONSTRAINT "__assign_fenced_fk_step_attempt_root_ycfgkdukim";

ALTER TABLE "slice"."assign_finish" ADD CONSTRAINT "__assign_finish_fk_root_6bbfqqziln" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_finish" VALIDATE CONSTRAINT "__assign_finish_fk_root_6bbfqqziln";

ALTER TABLE "slice"."assign_finish" ADD CONSTRAINT "__assign_finish_fk_scope_root_fasrssafod" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_finish" VALIDATE CONSTRAINT "__assign_finish_fk_scope_root_fasrssafod";

ALTER TABLE "slice"."assign_finish" ADD CONSTRAINT "__assign_finish_fk_step_root_uqhlnaqgqc" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_finish" VALIDATE CONSTRAINT "__assign_finish_fk_step_root_uqhlnaqgqc";

ALTER TABLE "slice"."assign_held" ADD CONSTRAINT "__assign_held_fk_root_ugjqx6ie3f" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_held" VALIDATE CONSTRAINT "__assign_held_fk_root_ugjqx6ie3f";

ALTER TABLE "slice"."assign_held" ADD CONSTRAINT "__assign_held_fk_step_attempt_root_5ffh4ch5vo" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_held" VALIDATE CONSTRAINT "__assign_held_fk_step_attempt_root_5ffh4ch5vo";

ALTER TABLE "slice"."assign_held" ADD CONSTRAINT "__assign_held_fk_step_root_yvbigkwvhi" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_held" VALIDATE CONSTRAINT "__assign_held_fk_step_root_yvbigkwvhi";

ALTER TABLE "slice"."assign_refusal" ADD CONSTRAINT "__assign_refusal_fk_root_ikkkxnypbg" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_refusal" VALIDATE CONSTRAINT "__assign_refusal_fk_root_ikkkxnypbg";

ALTER TABLE "slice"."assign_refusal" ADD CONSTRAINT "__assign_refusal_fk_step_root_4pwostl6w4" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_refusal" VALIDATE CONSTRAINT "__assign_refusal_fk_step_root_4pwostl6w4";

ALTER TABLE "slice"."assign_result" ADD CONSTRAINT "__assign_result_fk_root_mbig2yym5s" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_result" VALIDATE CONSTRAINT "__assign_result_fk_root_mbig2yym5s";

ALTER TABLE "slice"."assign_result" ADD CONSTRAINT "__assign_result_fk_step_root_ie57r22uco" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_result" VALIDATE CONSTRAINT "__assign_result_fk_step_root_ie57r22uco";

ALTER TABLE "slice"."assign_retry" ADD CONSTRAINT "__assign_retry_fk_root_g7cxz6uouh" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_retry" VALIDATE CONSTRAINT "__assign_retry_fk_root_g7cxz6uouh";

ALTER TABLE "slice"."assign_retry" ADD CONSTRAINT "__assign_retry_fk_step_attempt_root_ezozngsv5b" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_retry" VALIDATE CONSTRAINT "__assign_retry_fk_step_attempt_root_ezozngsv5b";

ALTER TABLE "slice"."assign_scope" ADD CONSTRAINT "__assign_scope_fk_root_aqbd5fs63t" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_scope" VALIDATE CONSTRAINT "__assign_scope_fk_root_aqbd5fs63t";

ALTER TABLE "slice"."assign_skipped" VALIDATE CONSTRAINT "__assign_skipped_fk_by_yi4ixsfumz";

ALTER TABLE "slice"."assign_skipped" ADD CONSTRAINT "__assign_skipped_fk_root_uyud3yb6zy" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_skipped" VALIDATE CONSTRAINT "__assign_skipped_fk_root_uyud3yb6zy";

ALTER TABLE "slice"."assign_start_scope" ADD CONSTRAINT "__assign_start_scope_fk_child_root_unb2sahoa2" FOREIGN KEY ("child", "root") REFERENCES "slice"."assign_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_start_scope" VALIDATE CONSTRAINT "__assign_start_scope_fk_child_root_unb2sahoa2";

ALTER TABLE "slice"."assign_start_scope" ADD CONSTRAINT "__assign_start_scope_fk_root_csyxhr5qfs" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_start_scope" VALIDATE CONSTRAINT "__assign_start_scope_fk_root_csyxhr5qfs";

ALTER TABLE "slice"."assign_start_scope" ADD CONSTRAINT "__assign_start_scope_fk_scope_root_cgft7ovcb4" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_start_scope" VALIDATE CONSTRAINT "__assign_start_scope_fk_scope_root_cgft7ovcb4";

ALTER TABLE "slice"."assign_start_step" ADD CONSTRAINT "__assign_start_step_fk_root_me4zj64243" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_start_step" VALIDATE CONSTRAINT "__assign_start_step_fk_root_me4zj64243";

ALTER TABLE "slice"."assign_start_step" ADD CONSTRAINT "__assign_start_step_fk_scope_root_grairzt42v" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_start_step" VALIDATE CONSTRAINT "__assign_start_step_fk_scope_root_grairzt42v";

ALTER TABLE "slice"."assign_start_step" ADD CONSTRAINT "__assign_start_step_fk_step_root_2bw3dd6v6d" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_start_step" VALIDATE CONSTRAINT "__assign_start_step_fk_step_root_2bw3dd6v6d";

ALTER TABLE "slice"."assign_step" ADD CONSTRAINT "__assign_step_fk_root_qky3m5h2ys" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_step" VALIDATE CONSTRAINT "__assign_step_fk_root_qky3m5h2ys";

ALTER TABLE "slice"."assign_step" ADD CONSTRAINT "__assign_step_fk_scope_root_rr5jplc2ua" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."assign_step" VALIDATE CONSTRAINT "__assign_step_fk_scope_root_rr5jplc2ua";

ALTER TABLE "slice"."assign_within" ADD CONSTRAINT "__assign_within_fk_parent_root_r7meyh6lci" FOREIGN KEY ("parent", "root") REFERENCES "slice"."assign_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_within" VALIDATE CONSTRAINT "__assign_within_fk_parent_root_r7meyh6lci";

ALTER TABLE "slice"."assign_within" ADD CONSTRAINT "__assign_within_fk_root_6jsrxij73c" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_within" VALIDATE CONSTRAINT "__assign_within_fk_root_6jsrxij73c";

ALTER TABLE "slice"."assign_within" ADD CONSTRAINT "__assign_within_fk_scope_root_mjox635vdp" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_within" VALIDATE CONSTRAINT "__assign_within_fk_scope_root_mjox635vdp";

ALTER TABLE "slice"."audit" ADD CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."audit" VALIDATE CONSTRAINT "__audit_fk_step_root_eb7inhsrbm";

ALTER TABLE "slice"."chain_admitted" ADD CONSTRAINT "__chain_admitted_fk_root_abvywhprzd" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_admitted" VALIDATE CONSTRAINT "__chain_admitted_fk_root_abvywhprzd";

ALTER TABLE "slice"."chain_admitted" ADD CONSTRAINT "__chain_admitted_fk_scope_root_ee5yuzxero" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_admitted" VALIDATE CONSTRAINT "__chain_admitted_fk_scope_root_ee5yuzxero";

ALTER TABLE "slice"."chain_chain_run_input" ADD CONSTRAINT "__chain_chain_run_input_fk_root_eyhkir2ten" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_chain_run_input" VALIDATE CONSTRAINT "__chain_chain_run_input_fk_root_eyhkir2ten";

ALTER TABLE "slice"."chain_chain_run_input" ADD CONSTRAINT "__chain_chain_run_input_fk_scope_root_tag_kind_chain_5co3lkpgyw" FOREIGN KEY ("scope", "root", "__tag_kind_chain_run_ufow3vhuwb") REFERENCES "slice"."chain_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_chain_run_input" VALIDATE CONSTRAINT "__chain_chain_run_input_fk_scope_root_tag_kind_chain_5co3lkpgyw";

ALTER TABLE "slice"."chain_claim" ADD CONSTRAINT "__chain_claim_fk_root_e4z56epu62" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_claim" VALIDATE CONSTRAINT "__chain_claim_fk_root_e4z56epu62";

ALTER TABLE "slice"."chain_claim" ADD CONSTRAINT "__chain_claim_fk_step_root_dz35k5kajb" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_claim" VALIDATE CONSTRAINT "__chain_claim_fk_step_root_dz35k5kajb";

ALTER TABLE "slice"."chain_claim" ADD CONSTRAINT "__chain_claim_fk_step_pred_attempt_root_hf2626wosn" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp") REFERENCES "slice"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_claim" VALIDATE CONSTRAINT "__chain_claim_fk_step_pred_attempt_root_hf2626wosn";

ALTER TABLE "slice"."chain_done" ADD CONSTRAINT "__chain_done_fk_root_p5unbx53ay" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_done" VALIDATE CONSTRAINT "__chain_done_fk_root_p5unbx53ay";

ALTER TABLE "slice"."chain_done" ADD CONSTRAINT "__chain_done_fk_step_root_tag_outcome_done_jdaqfgpo2u" FOREIGN KEY ("step", "root", "__tag_outcome_done_uhpvxcbhg2") REFERENCES "slice"."chain_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_done" VALIDATE CONSTRAINT "__chain_done_fk_step_root_tag_outcome_done_jdaqfgpo2u";

ALTER TABLE "slice"."chain_due" ADD CONSTRAINT "__chain_due_fk_root_k5aesh6gjx" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_due" VALIDATE CONSTRAINT "__chain_due_fk_root_k5aesh6gjx";

ALTER TABLE "slice"."chain_due" ADD CONSTRAINT "__chain_due_fk_step_root_33wex3hch5" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_due" VALIDATE CONSTRAINT "__chain_due_fk_step_root_33wex3hch5";

ALTER TABLE "slice"."chain_exhausted" ADD CONSTRAINT "__chain_exhausted_fk_root_az7it7tady" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_exhausted" VALIDATE CONSTRAINT "__chain_exhausted_fk_root_az7it7tady";

ALTER TABLE "slice"."chain_exhausted" ADD CONSTRAINT "__chain_exhausted_fk_step_root_x7otp3oe7t" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_exhausted" VALIDATE CONSTRAINT "__chain_exhausted_fk_step_root_x7otp3oe7t";

ALTER TABLE "slice"."chain_failed" ADD CONSTRAINT "__chain_failed_fk_root_ku7hd36hr4" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_failed" VALIDATE CONSTRAINT "__chain_failed_fk_root_ku7hd36hr4";

ALTER TABLE "slice"."chain_failed" ADD CONSTRAINT "__chain_failed_fk_step_root_tag_outcome_failed_bmg2beeawf" FOREIGN KEY ("step", "root", "__tag_outcome_failed_lrxbpw73ih") REFERENCES "slice"."chain_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_failed" VALIDATE CONSTRAINT "__chain_failed_fk_step_root_tag_outcome_failed_bmg2beeawf";

ALTER TABLE "slice"."chain_fenced" ADD CONSTRAINT "__chain_fenced_fk_root_dpd2zsy45p" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_fenced" VALIDATE CONSTRAINT "__chain_fenced_fk_root_dpd2zsy45p";

ALTER TABLE "slice"."chain_fenced" ADD CONSTRAINT "__chain_fenced_fk_step_attempt_root_2h5dov2hfr" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_fenced" VALIDATE CONSTRAINT "__chain_fenced_fk_step_attempt_root_2h5dov2hfr";

ALTER TABLE "slice"."chain_finish" ADD CONSTRAINT "__chain_finish_fk_root_b4s3b6gb4a" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_finish" VALIDATE CONSTRAINT "__chain_finish_fk_root_b4s3b6gb4a";

ALTER TABLE "slice"."chain_finish" ADD CONSTRAINT "__chain_finish_fk_scope_root_bm7lzlvp35" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_finish" VALIDATE CONSTRAINT "__chain_finish_fk_scope_root_bm7lzlvp35";

ALTER TABLE "slice"."chain_finish" ADD CONSTRAINT "__chain_finish_fk_step_root_7gwsgngr6z" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_finish" VALIDATE CONSTRAINT "__chain_finish_fk_step_root_7gwsgngr6z";

ALTER TABLE "slice"."chain_held" ADD CONSTRAINT "__chain_held_fk_root_7gjoucbs6t" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_held" VALIDATE CONSTRAINT "__chain_held_fk_root_7gjoucbs6t";

ALTER TABLE "slice"."chain_held" ADD CONSTRAINT "__chain_held_fk_step_attempt_root_aqmobtk3xc" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_held" VALIDATE CONSTRAINT "__chain_held_fk_step_attempt_root_aqmobtk3xc";

ALTER TABLE "slice"."chain_held" ADD CONSTRAINT "__chain_held_fk_step_root_mrcpyhmlko" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_held" VALIDATE CONSTRAINT "__chain_held_fk_step_root_mrcpyhmlko";

ALTER TABLE "slice"."chain_next" ADD CONSTRAINT "__chain_next_fk_from_root_ohfyewhufb" FOREIGN KEY ("from", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_next" VALIDATE CONSTRAINT "__chain_next_fk_from_root_ohfyewhufb";

ALTER TABLE "slice"."chain_next" ADD CONSTRAINT "__chain_next_fk_root_ymhq5qkp7g" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_next" VALIDATE CONSTRAINT "__chain_next_fk_root_ymhq5qkp7g";

ALTER TABLE "slice"."chain_next" ADD CONSTRAINT "__chain_next_fk_to_root_juwf5tsgbs" FOREIGN KEY ("to", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_next" VALIDATE CONSTRAINT "__chain_next_fk_to_root_juwf5tsgbs";

ALTER TABLE "slice"."chain_ordered_input" ADD CONSTRAINT "__chain_ordered_input_fk_root_yo2fvi6v6v" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_ordered_input" VALIDATE CONSTRAINT "__chain_ordered_input_fk_root_yo2fvi6v6v";

ALTER TABLE "slice"."chain_ordered_input" ADD CONSTRAINT "__chain_ordered_input_fk_scope_root_tag_kind_ordered_67li62ghxx" FOREIGN KEY ("scope", "root", "__tag_kind_ordered_bcobbqxaja") REFERENCES "slice"."chain_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_ordered_input" VALIDATE CONSTRAINT "__chain_ordered_input_fk_scope_root_tag_kind_ordered_67li62ghxx";

ALTER TABLE "slice"."chain_page_input" ADD CONSTRAINT "__chain_page_input_fk_root_s74r6jkeai" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_input" VALIDATE CONSTRAINT "__chain_page_input_fk_root_s74r6jkeai";

ALTER TABLE "slice"."chain_page_input" ADD CONSTRAINT "__chain_page_input_fk_step_root_tag_kind_page_25a3ht7nmv" FOREIGN KEY ("step", "root", "__tag_kind_page_wmj4dlxrkf") REFERENCES "slice"."chain_step" ("step", "root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_input" VALIDATE CONSTRAINT "__chain_page_input_fk_step_root_tag_kind_page_25a3ht7nmv";

ALTER TABLE "slice"."chain_page_input_after" ADD CONSTRAINT "__chain_page_input_after_fk_root_uksq5ttkd4" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_input_after" VALIDATE CONSTRAINT "__chain_page_input_after_fk_root_uksq5ttkd4";

ALTER TABLE "slice"."chain_page_input_after" ADD CONSTRAINT "__chain_page_input_after_fk_step_root_pqhheaahab" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_input_after" VALIDATE CONSTRAINT "__chain_page_input_after_fk_step_root_pqhheaahab";

ALTER TABLE "slice"."chain_page_output" ADD CONSTRAINT "__chain_page_output_fk_root_ez5wgbipj5" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_output" VALIDATE CONSTRAINT "__chain_page_output_fk_root_ez5wgbipj5";

ALTER TABLE "slice"."chain_page_output" ADD CONSTRAINT "__chain_page_output_fk_step_root_nesuhzkml5" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_done" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_page_output" VALIDATE CONSTRAINT "__chain_page_output_fk_step_root_nesuhzkml5";

ALTER TABLE "slice"."chain_page_output" ADD CONSTRAINT "__chain_page_output_fk_step_root_gyxfrq7ubp" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_output" VALIDATE CONSTRAINT "__chain_page_output_fk_step_root_gyxfrq7ubp";

ALTER TABLE "slice"."chain_page_output_next" ADD CONSTRAINT "__chain_page_output_next_fk_root_x6esxudkux" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_output_next" VALIDATE CONSTRAINT "__chain_page_output_next_fk_root_x6esxudkux";

ALTER TABLE "slice"."chain_page_output_next" ADD CONSTRAINT "__chain_page_output_next_fk_step_root_srapg45mao" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_page_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_output_next" VALIDATE CONSTRAINT "__chain_page_output_next_fk_step_root_srapg45mao";

ALTER TABLE "slice"."chain_page_weights_read" ADD CONSTRAINT "__chain_page_weights_read_fk_root_jeksctdxbs" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_weights_read" VALIDATE CONSTRAINT "__chain_page_weights_read_fk_root_jeksctdxbs";

ALTER TABLE "slice"."chain_page_weights_read" ADD CONSTRAINT "__chain_page_weights_read_fk_step_root_cs5oeb2hng" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_page_weights_read" VALIDATE CONSTRAINT "__chain_page_weights_read_fk_step_root_cs5oeb2hng";

ALTER TABLE "slice"."chain_refusal" ADD CONSTRAINT "__chain_refusal_fk_root_np3fiq6hlf" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_refusal" VALIDATE CONSTRAINT "__chain_refusal_fk_root_np3fiq6hlf";

ALTER TABLE "slice"."chain_refusal" ADD CONSTRAINT "__chain_refusal_fk_step_root_2xohwjf6ov" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_refusal" VALIDATE CONSTRAINT "__chain_refusal_fk_step_root_2xohwjf6ov";

ALTER TABLE "slice"."chain_result" ADD CONSTRAINT "__chain_result_fk_root_cqy7fgz6gd" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_result" VALIDATE CONSTRAINT "__chain_result_fk_root_cqy7fgz6gd";

ALTER TABLE "slice"."chain_result" ADD CONSTRAINT "__chain_result_fk_step_root_rytllwqxot" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_result" VALIDATE CONSTRAINT "__chain_result_fk_step_root_rytllwqxot";

ALTER TABLE "slice"."chain_retry" ADD CONSTRAINT "__chain_retry_fk_root_mrtnq2ndso" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_retry" VALIDATE CONSTRAINT "__chain_retry_fk_root_mrtnq2ndso";

ALTER TABLE "slice"."chain_retry" ADD CONSTRAINT "__chain_retry_fk_step_attempt_root_dgakh6chs4" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_retry" VALIDATE CONSTRAINT "__chain_retry_fk_step_attempt_root_dgakh6chs4";

ALTER TABLE "slice"."chain_scope" ADD CONSTRAINT "__chain_scope_fk_root_5dnilqnmua" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_scope" VALIDATE CONSTRAINT "__chain_scope_fk_root_5dnilqnmua";

ALTER TABLE "slice"."chain_skipped" VALIDATE CONSTRAINT "__chain_skipped_fk_by_zwz72yquyv";

ALTER TABLE "slice"."chain_skipped" ADD CONSTRAINT "__chain_skipped_fk_root_yi73nwhhy4" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_skipped" VALIDATE CONSTRAINT "__chain_skipped_fk_root_yi73nwhhy4";

ALTER TABLE "slice"."chain_start_scope" ADD CONSTRAINT "__chain_start_scope_fk_child_root_3akc5v73xx" FOREIGN KEY ("child", "root") REFERENCES "slice"."chain_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_start_scope" VALIDATE CONSTRAINT "__chain_start_scope_fk_child_root_3akc5v73xx";

ALTER TABLE "slice"."chain_start_scope" ADD CONSTRAINT "__chain_start_scope_fk_root_kp7nzhmkrn" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_start_scope" VALIDATE CONSTRAINT "__chain_start_scope_fk_root_kp7nzhmkrn";

ALTER TABLE "slice"."chain_start_scope" ADD CONSTRAINT "__chain_start_scope_fk_scope_root_q6ze2pghlq" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_start_scope" VALIDATE CONSTRAINT "__chain_start_scope_fk_scope_root_q6ze2pghlq";

ALTER TABLE "slice"."chain_start_step" ADD CONSTRAINT "__chain_start_step_fk_root_gh44bcwmwg" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_start_step" VALIDATE CONSTRAINT "__chain_start_step_fk_root_gh44bcwmwg";

ALTER TABLE "slice"."chain_start_step" ADD CONSTRAINT "__chain_start_step_fk_scope_root_eab47owgce" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_start_step" VALIDATE CONSTRAINT "__chain_start_step_fk_scope_root_eab47owgce";

ALTER TABLE "slice"."chain_start_step" ADD CONSTRAINT "__chain_start_step_fk_step_root_llhvckjbu2" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_start_step" VALIDATE CONSTRAINT "__chain_start_step_fk_step_root_llhvckjbu2";

ALTER TABLE "slice"."chain_step" ADD CONSTRAINT "__chain_step_fk_root_n4wedmpzhn" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_step" VALIDATE CONSTRAINT "__chain_step_fk_root_n4wedmpzhn";

ALTER TABLE "slice"."chain_step" ADD CONSTRAINT "__chain_step_fk_scope_root_jmx7nw7i4f" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."chain_step" VALIDATE CONSTRAINT "__chain_step_fk_scope_root_jmx7nw7i4f";

ALTER TABLE "slice"."chain_within" ADD CONSTRAINT "__chain_within_fk_parent_root_qcmegji4lp" FOREIGN KEY ("parent", "root") REFERENCES "slice"."chain_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_within" VALIDATE CONSTRAINT "__chain_within_fk_parent_root_qcmegji4lp";

ALTER TABLE "slice"."chain_within" ADD CONSTRAINT "__chain_within_fk_root_sh46agmkgi" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_within" VALIDATE CONSTRAINT "__chain_within_fk_root_sh46agmkgi";

ALTER TABLE "slice"."chain_within" ADD CONSTRAINT "__chain_within_fk_scope_root_ifxt6ilqws" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."chain_within" VALIDATE CONSTRAINT "__chain_within_fk_scope_root_ifxt6ilqws";

ALTER TABLE "slice"."fan_admitted" ADD CONSTRAINT "__fan_admitted_fk_root_ui6p5vdrhk" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_admitted" VALIDATE CONSTRAINT "__fan_admitted_fk_root_ui6p5vdrhk";

ALTER TABLE "slice"."fan_admitted" ADD CONSTRAINT "__fan_admitted_fk_scope_root_zj52ntgcx6" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_admitted" VALIDATE CONSTRAINT "__fan_admitted_fk_scope_root_zj52ntgcx6";

ALTER TABLE "slice"."fan_batch_input" ADD CONSTRAINT "__fan_batch_input_fk_root_d4g2u2spvl" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_batch_input" VALIDATE CONSTRAINT "__fan_batch_input_fk_root_d4g2u2spvl";

ALTER TABLE "slice"."fan_batch_input" ADD CONSTRAINT "__fan_batch_input_fk_scope_root_tag_kind_batch_viognqxr2c" FOREIGN KEY ("scope", "root", "__tag_kind_batch_fkqwrqkogg") REFERENCES "slice"."fan_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_batch_input" VALIDATE CONSTRAINT "__fan_batch_input_fk_scope_root_tag_kind_batch_viognqxr2c";

ALTER TABLE "slice"."fan_claim" ADD CONSTRAINT "__fan_claim_fk_root_t3hwth6mh7" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_claim" VALIDATE CONSTRAINT "__fan_claim_fk_root_t3hwth6mh7";

ALTER TABLE "slice"."fan_claim" ADD CONSTRAINT "__fan_claim_fk_step_root_6jsjsejmab" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_claim" VALIDATE CONSTRAINT "__fan_claim_fk_step_root_6jsjsejmab";

ALTER TABLE "slice"."fan_claim" ADD CONSTRAINT "__fan_claim_fk_step_pred_attempt_root_msshdcusww" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp") REFERENCES "slice"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_claim" VALIDATE CONSTRAINT "__fan_claim_fk_step_pred_attempt_root_msshdcusww";

ALTER TABLE "slice"."fan_done" ADD CONSTRAINT "__fan_done_fk_root_cfizuozacw" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_done" VALIDATE CONSTRAINT "__fan_done_fk_root_cfizuozacw";

ALTER TABLE "slice"."fan_done" ADD CONSTRAINT "__fan_done_fk_step_root_tag_outcome_done_t2ofw76cf5" FOREIGN KEY ("step", "root", "__tag_outcome_done_tulqbccryg") REFERENCES "slice"."fan_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_done" VALIDATE CONSTRAINT "__fan_done_fk_step_root_tag_outcome_done_t2ofw76cf5";

ALTER TABLE "slice"."fan_due" ADD CONSTRAINT "__fan_due_fk_root_6e42fnfds2" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_due" VALIDATE CONSTRAINT "__fan_due_fk_root_6e42fnfds2";

ALTER TABLE "slice"."fan_due" ADD CONSTRAINT "__fan_due_fk_step_root_xposal5kpr" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_due" VALIDATE CONSTRAINT "__fan_due_fk_step_root_xposal5kpr";

ALTER TABLE "slice"."fan_exhausted" ADD CONSTRAINT "__fan_exhausted_fk_root_mlbxyrjdjk" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_exhausted" VALIDATE CONSTRAINT "__fan_exhausted_fk_root_mlbxyrjdjk";

ALTER TABLE "slice"."fan_exhausted" ADD CONSTRAINT "__fan_exhausted_fk_step_root_jyggt4fgpd" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_exhausted" VALIDATE CONSTRAINT "__fan_exhausted_fk_step_root_jyggt4fgpd";

ALTER TABLE "slice"."fan_failed" ADD CONSTRAINT "__fan_failed_fk_root_3gq7ifprza" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_failed" VALIDATE CONSTRAINT "__fan_failed_fk_root_3gq7ifprza";

ALTER TABLE "slice"."fan_failed" ADD CONSTRAINT "__fan_failed_fk_step_root_tag_outcome_failed_oddalhdclf" FOREIGN KEY ("step", "root", "__tag_outcome_failed_3kga3qw77n") REFERENCES "slice"."fan_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_failed" VALIDATE CONSTRAINT "__fan_failed_fk_step_root_tag_outcome_failed_oddalhdclf";

ALTER TABLE "slice"."fan_fan_run_input" ADD CONSTRAINT "__fan_fan_run_input_fk_root_oztqak3s27" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_fan_run_input" VALIDATE CONSTRAINT "__fan_fan_run_input_fk_root_oztqak3s27";

ALTER TABLE "slice"."fan_fan_run_input" ADD CONSTRAINT "__fan_fan_run_input_fk_scope_root_tag_kind_fan_run_sri3xfs45t" FOREIGN KEY ("scope", "root", "__tag_kind_fan_run_eorldhk2ce") REFERENCES "slice"."fan_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_fan_run_input" VALIDATE CONSTRAINT "__fan_fan_run_input_fk_scope_root_tag_kind_fan_run_sri3xfs45t";

ALTER TABLE "slice"."fan_fenced" ADD CONSTRAINT "__fan_fenced_fk_root_2vu32qtss5" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_fenced" VALIDATE CONSTRAINT "__fan_fenced_fk_root_2vu32qtss5";

ALTER TABLE "slice"."fan_fenced" ADD CONSTRAINT "__fan_fenced_fk_step_attempt_root_3hdoippknh" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_fenced" VALIDATE CONSTRAINT "__fan_fenced_fk_step_attempt_root_3hdoippknh";

ALTER TABLE "slice"."fan_finish" ADD CONSTRAINT "__fan_finish_fk_root_evgrt3slao" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_finish" VALIDATE CONSTRAINT "__fan_finish_fk_root_evgrt3slao";

ALTER TABLE "slice"."fan_finish" ADD CONSTRAINT "__fan_finish_fk_scope_root_xpvycdjjiy" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_finish" VALIDATE CONSTRAINT "__fan_finish_fk_scope_root_xpvycdjjiy";

ALTER TABLE "slice"."fan_finish" ADD CONSTRAINT "__fan_finish_fk_step_root_bpqxxtu4ab" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_finish" VALIDATE CONSTRAINT "__fan_finish_fk_step_root_bpqxxtu4ab";

ALTER TABLE "slice"."fan_held" ADD CONSTRAINT "__fan_held_fk_root_cnpqjrp534" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_held" VALIDATE CONSTRAINT "__fan_held_fk_root_cnpqjrp534";

ALTER TABLE "slice"."fan_held" ADD CONSTRAINT "__fan_held_fk_step_attempt_root_c33imj7zo6" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_held" VALIDATE CONSTRAINT "__fan_held_fk_step_attempt_root_c33imj7zo6";

ALTER TABLE "slice"."fan_held" ADD CONSTRAINT "__fan_held_fk_step_root_ob2yj5i5h3" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_held" VALIDATE CONSTRAINT "__fan_held_fk_step_root_ob2yj5i5h3";

ALTER TABLE "slice"."fan_refusal" ADD CONSTRAINT "__fan_refusal_fk_root_zep5evjd2e" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_refusal" VALIDATE CONSTRAINT "__fan_refusal_fk_root_zep5evjd2e";

ALTER TABLE "slice"."fan_refusal" ADD CONSTRAINT "__fan_refusal_fk_step_root_5qjei2ie7w" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_refusal" VALIDATE CONSTRAINT "__fan_refusal_fk_step_root_5qjei2ie7w";

ALTER TABLE "slice"."fan_result" ADD CONSTRAINT "__fan_result_fk_root_m233bhejob" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_result" VALIDATE CONSTRAINT "__fan_result_fk_root_m233bhejob";

ALTER TABLE "slice"."fan_result" ADD CONSTRAINT "__fan_result_fk_step_root_kkph4igmst" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_result" VALIDATE CONSTRAINT "__fan_result_fk_step_root_kkph4igmst";

ALTER TABLE "slice"."fan_retry" ADD CONSTRAINT "__fan_retry_fk_root_hoqgudhhyh" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_retry" VALIDATE CONSTRAINT "__fan_retry_fk_root_hoqgudhhyh";

ALTER TABLE "slice"."fan_retry" ADD CONSTRAINT "__fan_retry_fk_step_attempt_root_mkghdiqon7" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_retry" VALIDATE CONSTRAINT "__fan_retry_fk_step_attempt_root_mkghdiqon7";

ALTER TABLE "slice"."fan_scope" ADD CONSTRAINT "__fan_scope_fk_root_3c5fvemkr6" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_scope" VALIDATE CONSTRAINT "__fan_scope_fk_root_3c5fvemkr6";

ALTER TABLE "slice"."fan_skipped" VALIDATE CONSTRAINT "__fan_skipped_fk_by_o76cwxye2w";

ALTER TABLE "slice"."fan_skipped" ADD CONSTRAINT "__fan_skipped_fk_root_j6gpqvvx57" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_skipped" VALIDATE CONSTRAINT "__fan_skipped_fk_root_j6gpqvvx57";

ALTER TABLE "slice"."fan_square_input" ADD CONSTRAINT "__fan_square_input_fk_root_gpj7rrapja" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_square_input" VALIDATE CONSTRAINT "__fan_square_input_fk_root_gpj7rrapja";

ALTER TABLE "slice"."fan_square_input" ADD CONSTRAINT "__fan_square_input_fk_step_root_tag_kind_square_4xfxkafkn7" FOREIGN KEY ("step", "root", "__tag_kind_square_q3stoybx3v") REFERENCES "slice"."fan_step" ("step", "root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_square_input" VALIDATE CONSTRAINT "__fan_square_input_fk_step_root_tag_kind_square_4xfxkafkn7";

ALTER TABLE "slice"."fan_square_output" ADD CONSTRAINT "__fan_square_output_fk_root_dpyr2dahw3" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_square_output" VALIDATE CONSTRAINT "__fan_square_output_fk_root_dpyr2dahw3";

ALTER TABLE "slice"."fan_square_output" ADD CONSTRAINT "__fan_square_output_fk_step_root_ibp6l2tkc5" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_done" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_square_output" VALIDATE CONSTRAINT "__fan_square_output_fk_step_root_ibp6l2tkc5";

ALTER TABLE "slice"."fan_square_output" ADD CONSTRAINT "__fan_square_output_fk_step_root_kilcbg5jn4" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_square_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_square_output" VALIDATE CONSTRAINT "__fan_square_output_fk_step_root_kilcbg5jn4";

ALTER TABLE "slice"."fan_start_scope" ADD CONSTRAINT "__fan_start_scope_fk_child_root_dn65r3vwqt" FOREIGN KEY ("child", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_start_scope" VALIDATE CONSTRAINT "__fan_start_scope_fk_child_root_dn65r3vwqt";

ALTER TABLE "slice"."fan_start_scope" ADD CONSTRAINT "__fan_start_scope_fk_root_24pfkxnibn" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_start_scope" VALIDATE CONSTRAINT "__fan_start_scope_fk_root_24pfkxnibn";

ALTER TABLE "slice"."fan_start_scope" ADD CONSTRAINT "__fan_start_scope_fk_scope_root_clsa2be3m7" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_start_scope" VALIDATE CONSTRAINT "__fan_start_scope_fk_scope_root_clsa2be3m7";

ALTER TABLE "slice"."fan_start_step" ADD CONSTRAINT "__fan_start_step_fk_root_4rwp7q56wg" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_start_step" VALIDATE CONSTRAINT "__fan_start_step_fk_root_4rwp7q56wg";

ALTER TABLE "slice"."fan_start_step" ADD CONSTRAINT "__fan_start_step_fk_scope_root_vh2ut5ssmk" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_start_step" VALIDATE CONSTRAINT "__fan_start_step_fk_scope_root_vh2ut5ssmk";

ALTER TABLE "slice"."fan_start_step" ADD CONSTRAINT "__fan_start_step_fk_step_root_din6bp4kp3" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_start_step" VALIDATE CONSTRAINT "__fan_start_step_fk_step_root_din6bp4kp3";

ALTER TABLE "slice"."fan_step" ADD CONSTRAINT "__fan_step_fk_root_eueisdyp32" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_step" VALIDATE CONSTRAINT "__fan_step_fk_root_eueisdyp32";

ALTER TABLE "slice"."fan_step" ADD CONSTRAINT "__fan_step_fk_scope_root_dyjpxhnjhz" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."fan_step" VALIDATE CONSTRAINT "__fan_step_fk_scope_root_dyjpxhnjhz";

ALTER TABLE "slice"."fan_within" ADD CONSTRAINT "__fan_within_fk_parent_root_uep5w6udoh" FOREIGN KEY ("parent", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_within" VALIDATE CONSTRAINT "__fan_within_fk_parent_root_uep5w6udoh";

ALTER TABLE "slice"."fan_within" ADD CONSTRAINT "__fan_within_fk_root_k7476egnhf" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_within" VALIDATE CONSTRAINT "__fan_within_fk_root_k7476egnhf";

ALTER TABLE "slice"."fan_within" ADD CONSTRAINT "__fan_within_fk_scope_root_ej3crstjip" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."fan_within" VALIDATE CONSTRAINT "__fan_within_fk_scope_root_ej3crstjip";

ALTER TABLE "slice"."retry_admitted" ADD CONSTRAINT "__retry_admitted_fk_root_n65ucxnw7g" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_admitted" VALIDATE CONSTRAINT "__retry_admitted_fk_root_n65ucxnw7g";

ALTER TABLE "slice"."retry_admitted" ADD CONSTRAINT "__retry_admitted_fk_scope_root_kufu5v4g3v" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_admitted" VALIDATE CONSTRAINT "__retry_admitted_fk_scope_root_kufu5v4g3v";

ALTER TABLE "slice"."retry_brittle_input" ADD CONSTRAINT "__retry_brittle_input_fk_root_3kdpo5sepg" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_brittle_input" VALIDATE CONSTRAINT "__retry_brittle_input_fk_root_3kdpo5sepg";

ALTER TABLE "slice"."retry_brittle_input" ADD CONSTRAINT "__retry_brittle_input_fk_step_root_tag_kind_brittle_qnzv3qlfo5" FOREIGN KEY ("step", "root", "__tag_kind_brittle_wzfwqdkbkg") REFERENCES "slice"."retry_step" ("step", "root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_brittle_input" VALIDATE CONSTRAINT "__retry_brittle_input_fk_step_root_tag_kind_brittle_qnzv3qlfo5";

ALTER TABLE "slice"."retry_brittle_output" ADD CONSTRAINT "__retry_brittle_output_fk_root_baznemh4df" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_brittle_output" VALIDATE CONSTRAINT "__retry_brittle_output_fk_root_baznemh4df";

ALTER TABLE "slice"."retry_brittle_output" ADD CONSTRAINT "__retry_brittle_output_fk_step_root_o5pt3hukix" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_brittle_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_brittle_output" VALIDATE CONSTRAINT "__retry_brittle_output_fk_step_root_o5pt3hukix";

ALTER TABLE "slice"."retry_brittle_output" ADD CONSTRAINT "__retry_brittle_output_fk_step_root_jnbgyogqxn" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_done" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_brittle_output" VALIDATE CONSTRAINT "__retry_brittle_output_fk_step_root_jnbgyogqxn";

ALTER TABLE "slice"."retry_claim" ADD CONSTRAINT "__retry_claim_fk_root_ilxn6ulsuq" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_claim" VALIDATE CONSTRAINT "__retry_claim_fk_root_ilxn6ulsuq";

ALTER TABLE "slice"."retry_claim" ADD CONSTRAINT "__retry_claim_fk_step_root_zffmzj357l" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_claim" VALIDATE CONSTRAINT "__retry_claim_fk_step_root_zffmzj357l";

ALTER TABLE "slice"."retry_claim" ADD CONSTRAINT "__retry_claim_fk_step_pred_attempt_root_jmq6tipywk" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp") REFERENCES "slice"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_claim" VALIDATE CONSTRAINT "__retry_claim_fk_step_pred_attempt_root_jmq6tipywk";

ALTER TABLE "slice"."retry_done" ADD CONSTRAINT "__retry_done_fk_root_eegigvha5p" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_done" VALIDATE CONSTRAINT "__retry_done_fk_root_eegigvha5p";

ALTER TABLE "slice"."retry_done" ADD CONSTRAINT "__retry_done_fk_step_root_tag_outcome_done_gydqih3xgi" FOREIGN KEY ("step", "root", "__tag_outcome_done_k5wikz4kly") REFERENCES "slice"."retry_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_done" VALIDATE CONSTRAINT "__retry_done_fk_step_root_tag_outcome_done_gydqih3xgi";

ALTER TABLE "slice"."retry_due" ADD CONSTRAINT "__retry_due_fk_root_mwvrowgwb3" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_due" VALIDATE CONSTRAINT "__retry_due_fk_root_mwvrowgwb3";

ALTER TABLE "slice"."retry_due" ADD CONSTRAINT "__retry_due_fk_step_root_q3iqhwjvtk" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_due" VALIDATE CONSTRAINT "__retry_due_fk_step_root_q3iqhwjvtk";

ALTER TABLE "slice"."retry_exhausted" ADD CONSTRAINT "__retry_exhausted_fk_root_fetyfw4rhv" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_exhausted" VALIDATE CONSTRAINT "__retry_exhausted_fk_root_fetyfw4rhv";

ALTER TABLE "slice"."retry_exhausted" ADD CONSTRAINT "__retry_exhausted_fk_step_root_pj2owyq2rw" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_exhausted" VALIDATE CONSTRAINT "__retry_exhausted_fk_step_root_pj2owyq2rw";

ALTER TABLE "slice"."retry_failed" ADD CONSTRAINT "__retry_failed_fk_root_uy6ypbkhl7" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_failed" VALIDATE CONSTRAINT "__retry_failed_fk_root_uy6ypbkhl7";

ALTER TABLE "slice"."retry_failed" ADD CONSTRAINT "__retry_failed_fk_step_root_tag_outcome_failed_nodqbw6cvx" FOREIGN KEY ("step", "root", "__tag_outcome_failed_446fx3eezg") REFERENCES "slice"."retry_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_failed" VALIDATE CONSTRAINT "__retry_failed_fk_step_root_tag_outcome_failed_nodqbw6cvx";

ALTER TABLE "slice"."retry_fenced" ADD CONSTRAINT "__retry_fenced_fk_root_q2hes57bil" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_fenced" VALIDATE CONSTRAINT "__retry_fenced_fk_root_q2hes57bil";

ALTER TABLE "slice"."retry_fenced" ADD CONSTRAINT "__retry_fenced_fk_step_attempt_root_b4uk64byz5" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_fenced" VALIDATE CONSTRAINT "__retry_fenced_fk_step_attempt_root_b4uk64byz5";

ALTER TABLE "slice"."retry_finish" ADD CONSTRAINT "__retry_finish_fk_root_iv6szs7lco" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_finish" VALIDATE CONSTRAINT "__retry_finish_fk_root_iv6szs7lco";

ALTER TABLE "slice"."retry_finish" ADD CONSTRAINT "__retry_finish_fk_scope_root_odh4hpe5hc" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_finish" VALIDATE CONSTRAINT "__retry_finish_fk_scope_root_odh4hpe5hc";

ALTER TABLE "slice"."retry_finish" ADD CONSTRAINT "__retry_finish_fk_step_root_o54jpsxlmy" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_finish" VALIDATE CONSTRAINT "__retry_finish_fk_step_root_o54jpsxlmy";

ALTER TABLE "slice"."retry_held" ADD CONSTRAINT "__retry_held_fk_root_3v46rzikqg" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_held" VALIDATE CONSTRAINT "__retry_held_fk_root_3v46rzikqg";

ALTER TABLE "slice"."retry_held" ADD CONSTRAINT "__retry_held_fk_step_attempt_root_cnveo6n2ex" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_held" VALIDATE CONSTRAINT "__retry_held_fk_step_attempt_root_cnveo6n2ex";

ALTER TABLE "slice"."retry_held" ADD CONSTRAINT "__retry_held_fk_step_root_m5b3t566ya" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_held" VALIDATE CONSTRAINT "__retry_held_fk_step_root_m5b3t566ya";

ALTER TABLE "slice"."retry_ladders_input" ADD CONSTRAINT "__retry_ladders_input_fk_root_cnlwmpha3w" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_ladders_input" VALIDATE CONSTRAINT "__retry_ladders_input_fk_root_cnlwmpha3w";

ALTER TABLE "slice"."retry_ladders_input" ADD CONSTRAINT "__retry_ladders_input_fk_scope_root_tag_kind_ladders_xj5lywbiap" FOREIGN KEY ("scope", "root", "__tag_kind_ladders_gimfs6gp4j") REFERENCES "slice"."retry_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_ladders_input" VALIDATE CONSTRAINT "__retry_ladders_input_fk_scope_root_tag_kind_ladders_xj5lywbiap";

ALTER TABLE "slice"."retry_refusal" ADD CONSTRAINT "__retry_refusal_fk_root_jr53wy3j5v" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_refusal" VALIDATE CONSTRAINT "__retry_refusal_fk_root_jr53wy3j5v";

ALTER TABLE "slice"."retry_refusal" ADD CONSTRAINT "__retry_refusal_fk_step_root_sqt67v76ib" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_refusal" VALIDATE CONSTRAINT "__retry_refusal_fk_step_root_sqt67v76ib";

ALTER TABLE "slice"."retry_result" ADD CONSTRAINT "__retry_result_fk_root_zoskj252jz" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_result" VALIDATE CONSTRAINT "__retry_result_fk_root_zoskj252jz";

ALTER TABLE "slice"."retry_result" ADD CONSTRAINT "__retry_result_fk_step_root_ulmjckkvmq" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_result" VALIDATE CONSTRAINT "__retry_result_fk_step_root_ulmjckkvmq";

ALTER TABLE "slice"."retry_retry" ADD CONSTRAINT "__retry_retry_fk_root_gfdc3bi7a3" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_retry" VALIDATE CONSTRAINT "__retry_retry_fk_root_gfdc3bi7a3";

ALTER TABLE "slice"."retry_retry" ADD CONSTRAINT "__retry_retry_fk_step_attempt_root_ldqa5lz2mu" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_retry" VALIDATE CONSTRAINT "__retry_retry_fk_step_attempt_root_ldqa5lz2mu";

ALTER TABLE "slice"."retry_scope" ADD CONSTRAINT "__retry_scope_fk_root_veata66enh" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_scope" VALIDATE CONSTRAINT "__retry_scope_fk_root_veata66enh";

ALTER TABLE "slice"."retry_skipped" VALIDATE CONSTRAINT "__retry_skipped_fk_by_iokgypc6cl";

ALTER TABLE "slice"."retry_skipped" ADD CONSTRAINT "__retry_skipped_fk_root_rfxaxqegr7" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_skipped" VALIDATE CONSTRAINT "__retry_skipped_fk_root_rfxaxqegr7";

ALTER TABLE "slice"."retry_start_scope" ADD CONSTRAINT "__retry_start_scope_fk_child_root_qaa27gkwr7" FOREIGN KEY ("child", "root") REFERENCES "slice"."retry_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_start_scope" VALIDATE CONSTRAINT "__retry_start_scope_fk_child_root_qaa27gkwr7";

ALTER TABLE "slice"."retry_start_scope" ADD CONSTRAINT "__retry_start_scope_fk_root_wh7mjbpwzn" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_start_scope" VALIDATE CONSTRAINT "__retry_start_scope_fk_root_wh7mjbpwzn";

ALTER TABLE "slice"."retry_start_scope" ADD CONSTRAINT "__retry_start_scope_fk_scope_root_vxvoiw5spy" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_start_scope" VALIDATE CONSTRAINT "__retry_start_scope_fk_scope_root_vxvoiw5spy";

ALTER TABLE "slice"."retry_start_step" ADD CONSTRAINT "__retry_start_step_fk_root_lgh6lskept" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_start_step" VALIDATE CONSTRAINT "__retry_start_step_fk_root_lgh6lskept";

ALTER TABLE "slice"."retry_start_step" ADD CONSTRAINT "__retry_start_step_fk_scope_root_va3ypig5rc" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_start_step" VALIDATE CONSTRAINT "__retry_start_step_fk_scope_root_va3ypig5rc";

ALTER TABLE "slice"."retry_start_step" ADD CONSTRAINT "__retry_start_step_fk_step_root_wftarsumzh" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_start_step" VALIDATE CONSTRAINT "__retry_start_step_fk_step_root_wftarsumzh";

ALTER TABLE "slice"."retry_steadfast_input" ADD CONSTRAINT "__retry_steadfast_input_fk_root_4xkwhc353t" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_steadfast_input" VALIDATE CONSTRAINT "__retry_steadfast_input_fk_root_4xkwhc353t";

ALTER TABLE "slice"."retry_steadfast_input" ADD CONSTRAINT "__retry_steadfast_input_fk_step_root_tag_kind_etgiqb7tal" FOREIGN KEY ("step", "root", "__tag_kind_steadfast_4rudtmco65") REFERENCES "slice"."retry_step" ("step", "root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_steadfast_input" VALIDATE CONSTRAINT "__retry_steadfast_input_fk_step_root_tag_kind_etgiqb7tal";

ALTER TABLE "slice"."retry_steadfast_output" ADD CONSTRAINT "__retry_steadfast_output_fk_root_ypuiq33fkv" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_steadfast_output" VALIDATE CONSTRAINT "__retry_steadfast_output_fk_root_ypuiq33fkv";

ALTER TABLE "slice"."retry_steadfast_output" ADD CONSTRAINT "__retry_steadfast_output_fk_step_root_3x6tbszpyw" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_done" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_steadfast_output" VALIDATE CONSTRAINT "__retry_steadfast_output_fk_step_root_3x6tbszpyw";

ALTER TABLE "slice"."retry_steadfast_output" ADD CONSTRAINT "__retry_steadfast_output_fk_step_root_y3we3qusrs" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_steadfast_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_steadfast_output" VALIDATE CONSTRAINT "__retry_steadfast_output_fk_step_root_y3we3qusrs";

ALTER TABLE "slice"."retry_step" ADD CONSTRAINT "__retry_step_fk_root_zww4hkltkz" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_step" VALIDATE CONSTRAINT "__retry_step_fk_root_zww4hkltkz";

ALTER TABLE "slice"."retry_step" ADD CONSTRAINT "__retry_step_fk_scope_root_xl7rht6tyq" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."retry_step" VALIDATE CONSTRAINT "__retry_step_fk_scope_root_xl7rht6tyq";

ALTER TABLE "slice"."retry_within" ADD CONSTRAINT "__retry_within_fk_parent_root_ih6e44xo3t" FOREIGN KEY ("parent", "root") REFERENCES "slice"."retry_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_within" VALIDATE CONSTRAINT "__retry_within_fk_parent_root_ih6e44xo3t";

ALTER TABLE "slice"."retry_within" ADD CONSTRAINT "__retry_within_fk_root_zznwq6jdjx" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_within" VALIDATE CONSTRAINT "__retry_within_fk_root_zznwq6jdjx";

ALTER TABLE "slice"."retry_within" ADD CONSTRAINT "__retry_within_fk_scope_root_6md7lilvxc" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."retry_within" VALIDATE CONSTRAINT "__retry_within_fk_scope_root_6md7lilvxc";

ALTER TABLE "slice"."sync_admitted" ADD CONSTRAINT "__sync_admitted_fk_root_pazobscutb" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_admitted" VALIDATE CONSTRAINT "__sync_admitted_fk_root_pazobscutb";

ALTER TABLE "slice"."sync_admitted" ADD CONSTRAINT "__sync_admitted_fk_scope_root_ieiyxemub7" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_admitted" VALIDATE CONSTRAINT "__sync_admitted_fk_scope_root_ieiyxemub7";

ALTER TABLE "slice"."sync_build_input" ADD CONSTRAINT "__sync_build_input_fk_root_qlycqp6gk2" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_build_input" VALIDATE CONSTRAINT "__sync_build_input_fk_root_qlycqp6gk2";

ALTER TABLE "slice"."sync_build_input" ADD CONSTRAINT "__sync_build_input_fk_step_root_tag_kind_build_embx45msmt" FOREIGN KEY ("step", "root", "__tag_kind_build_pslevsssox") REFERENCES "slice"."sync_step" ("step", "root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_build_input" VALIDATE CONSTRAINT "__sync_build_input_fk_step_root_tag_kind_build_embx45msmt";

ALTER TABLE "slice"."sync_build_output" ADD CONSTRAINT "__sync_build_output_fk_root_grwezm3fcr" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_build_output" VALIDATE CONSTRAINT "__sync_build_output_fk_root_grwezm3fcr";

ALTER TABLE "slice"."sync_build_output" ADD CONSTRAINT "__sync_build_output_fk_step_root_o3zx5hom3t" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_build_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_build_output" VALIDATE CONSTRAINT "__sync_build_output_fk_step_root_o3zx5hom3t";

ALTER TABLE "slice"."sync_build_output" ADD CONSTRAINT "__sync_build_output_fk_step_root_aksn6onpma" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_done" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_build_output" VALIDATE CONSTRAINT "__sync_build_output_fk_step_root_aksn6onpma";

ALTER TABLE "slice"."sync_claim" ADD CONSTRAINT "__sync_claim_fk_root_4qbs7pxn2t" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_claim" VALIDATE CONSTRAINT "__sync_claim_fk_root_4qbs7pxn2t";

ALTER TABLE "slice"."sync_claim" ADD CONSTRAINT "__sync_claim_fk_step_root_gvtcn764xc" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_claim" VALIDATE CONSTRAINT "__sync_claim_fk_step_root_gvtcn764xc";

ALTER TABLE "slice"."sync_claim" ADD CONSTRAINT "__sync_claim_fk_step_pred_attempt_root_rrog54g4mf" FOREIGN KEY ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp") REFERENCES "slice"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_claim" VALIDATE CONSTRAINT "__sync_claim_fk_step_pred_attempt_root_rrog54g4mf";

ALTER TABLE "slice"."sync_copy_input" ADD CONSTRAINT "__sync_copy_input_fk_root_d7u63yuxxs" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_copy_input" VALIDATE CONSTRAINT "__sync_copy_input_fk_root_d7u63yuxxs";

ALTER TABLE "slice"."sync_copy_input" ADD CONSTRAINT "__sync_copy_input_fk_step_root_tag_kind_copy_inrne672nm" FOREIGN KEY ("step", "root", "__tag_kind_copy_wfaj52nfh7") REFERENCES "slice"."sync_step" ("step", "root", "kind") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_copy_input" VALIDATE CONSTRAINT "__sync_copy_input_fk_step_root_tag_kind_copy_inrne672nm";

ALTER TABLE "slice"."sync_copy_output" ADD CONSTRAINT "__sync_copy_output_fk_root_x2xt2l75vg" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_copy_output" VALIDATE CONSTRAINT "__sync_copy_output_fk_root_x2xt2l75vg";

ALTER TABLE "slice"."sync_copy_output" ADD CONSTRAINT "__sync_copy_output_fk_step_root_65fyg7xb6t" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_copy_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_copy_output" VALIDATE CONSTRAINT "__sync_copy_output_fk_step_root_65fyg7xb6t";

ALTER TABLE "slice"."sync_copy_output" ADD CONSTRAINT "__sync_copy_output_fk_step_root_gfjlcri22w" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_done" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_copy_output" VALIDATE CONSTRAINT "__sync_copy_output_fk_step_root_gfjlcri22w";

ALTER TABLE "slice"."sync_done" ADD CONSTRAINT "__sync_done_fk_root_kbt6t66k7r" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_done" VALIDATE CONSTRAINT "__sync_done_fk_root_kbt6t66k7r";

ALTER TABLE "slice"."sync_done" ADD CONSTRAINT "__sync_done_fk_step_root_tag_outcome_done_zk6igchbo3" FOREIGN KEY ("step", "root", "__tag_outcome_done_pkvv6jrgpq") REFERENCES "slice"."sync_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_done" VALIDATE CONSTRAINT "__sync_done_fk_step_root_tag_outcome_done_zk6igchbo3";

ALTER TABLE "slice"."sync_due" ADD CONSTRAINT "__sync_due_fk_root_ascq4gdhcl" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_due" VALIDATE CONSTRAINT "__sync_due_fk_root_ascq4gdhcl";

ALTER TABLE "slice"."sync_due" ADD CONSTRAINT "__sync_due_fk_step_root_kgwge6lib7" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_due" VALIDATE CONSTRAINT "__sync_due_fk_step_root_kgwge6lib7";

ALTER TABLE "slice"."sync_exclusive_key" ADD CONSTRAINT "__sync_exclusive_key_fk_root_jfvgxfgxk7" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_exclusive_key" VALIDATE CONSTRAINT "__sync_exclusive_key_fk_root_jfvgxfgxk7";

ALTER TABLE "slice"."sync_exclusive_key" ADD CONSTRAINT "__sync_exclusive_key_fk_scope_root_cl36evoxyb" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_exclusive_key" VALIDATE CONSTRAINT "__sync_exclusive_key_fk_scope_root_cl36evoxyb";

ALTER TABLE "slice"."sync_exhausted" ADD CONSTRAINT "__sync_exhausted_fk_root_w5rujdfs5u" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_exhausted" VALIDATE CONSTRAINT "__sync_exhausted_fk_root_w5rujdfs5u";

ALTER TABLE "slice"."sync_exhausted" ADD CONSTRAINT "__sync_exhausted_fk_step_root_vd7jhdnvet" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_exhausted" VALIDATE CONSTRAINT "__sync_exhausted_fk_step_root_vd7jhdnvet";

ALTER TABLE "slice"."sync_failed" ADD CONSTRAINT "__sync_failed_fk_root_utdobwjqln" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_failed" VALIDATE CONSTRAINT "__sync_failed_fk_root_utdobwjqln";

ALTER TABLE "slice"."sync_failed" ADD CONSTRAINT "__sync_failed_fk_step_root_tag_outcome_failed_n4oc4imnsd" FOREIGN KEY ("step", "root", "__tag_outcome_failed_26do6twsnf") REFERENCES "slice"."sync_result" ("step", "root", "outcome") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_failed" VALIDATE CONSTRAINT "__sync_failed_fk_step_root_tag_outcome_failed_n4oc4imnsd";

ALTER TABLE "slice"."sync_fenced" ADD CONSTRAINT "__sync_fenced_fk_root_pft7kt3u6c" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_fenced" VALIDATE CONSTRAINT "__sync_fenced_fk_root_pft7kt3u6c";

ALTER TABLE "slice"."sync_fenced" ADD CONSTRAINT "__sync_fenced_fk_step_attempt_root_5tuvabpoxw" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_fenced" VALIDATE CONSTRAINT "__sync_fenced_fk_step_attempt_root_5tuvabpoxw";

ALTER TABLE "slice"."sync_finish" ADD CONSTRAINT "__sync_finish_fk_root_jesvnqpmqt" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_finish" VALIDATE CONSTRAINT "__sync_finish_fk_root_jesvnqpmqt";

ALTER TABLE "slice"."sync_finish" ADD CONSTRAINT "__sync_finish_fk_scope_root_bjgk4nxo7e" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_finish" VALIDATE CONSTRAINT "__sync_finish_fk_scope_root_bjgk4nxo7e";

ALTER TABLE "slice"."sync_finish" ADD CONSTRAINT "__sync_finish_fk_step_root_mmscezhzyq" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_finish" VALIDATE CONSTRAINT "__sync_finish_fk_step_root_mmscezhzyq";

ALTER TABLE "slice"."sync_gold_input" ADD CONSTRAINT "__sync_gold_input_fk_root_dearji3wtq" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_gold_input" VALIDATE CONSTRAINT "__sync_gold_input_fk_root_dearji3wtq";

ALTER TABLE "slice"."sync_gold_input" ADD CONSTRAINT "__sync_gold_input_fk_scope_root_tag_kind_gold_kfo5edtr3r" FOREIGN KEY ("scope", "root", "__tag_kind_gold_7mgmvxjg34") REFERENCES "slice"."sync_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_gold_input" VALIDATE CONSTRAINT "__sync_gold_input_fk_scope_root_tag_kind_gold_kfo5edtr3r";

ALTER TABLE "slice"."sync_held" ADD CONSTRAINT "__sync_held_fk_root_62s5pmsoqa" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_held" VALIDATE CONSTRAINT "__sync_held_fk_root_62s5pmsoqa";

ALTER TABLE "slice"."sync_held" ADD CONSTRAINT "__sync_held_fk_step_attempt_root_46zydmfnyy" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_held" VALIDATE CONSTRAINT "__sync_held_fk_step_attempt_root_46zydmfnyy";

ALTER TABLE "slice"."sync_held" ADD CONSTRAINT "__sync_held_fk_step_root_waydyqivsc" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_held" VALIDATE CONSTRAINT "__sync_held_fk_step_root_waydyqivsc";

ALTER TABLE "slice"."sync_refusal" ADD CONSTRAINT "__sync_refusal_fk_root_3f2zmczqcu" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_refusal" VALIDATE CONSTRAINT "__sync_refusal_fk_root_3f2zmczqcu";

ALTER TABLE "slice"."sync_refusal" ADD CONSTRAINT "__sync_refusal_fk_step_root_igzyfxl4o3" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_failed" ("step", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_refusal" VALIDATE CONSTRAINT "__sync_refusal_fk_step_root_igzyfxl4o3";

ALTER TABLE "slice"."sync_result" ADD CONSTRAINT "__sync_result_fk_root_vnymla3qhz" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_result" VALIDATE CONSTRAINT "__sync_result_fk_root_vnymla3qhz";

ALTER TABLE "slice"."sync_result" ADD CONSTRAINT "__sync_result_fk_step_root_x2umddyh22" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_result" VALIDATE CONSTRAINT "__sync_result_fk_step_root_x2umddyh22";

ALTER TABLE "slice"."sync_retry" ADD CONSTRAINT "__sync_retry_fk_root_wl34w4vs2m" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_retry" VALIDATE CONSTRAINT "__sync_retry_fk_root_wl34w4vs2m";

ALTER TABLE "slice"."sync_retry" ADD CONSTRAINT "__sync_retry_fk_step_attempt_root_7rpqzqdnqb" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_retry" VALIDATE CONSTRAINT "__sync_retry_fk_step_attempt_root_7rpqzqdnqb";

ALTER TABLE "slice"."sync_scope" ADD CONSTRAINT "__sync_scope_fk_root_whqzszw2jj" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_scope" VALIDATE CONSTRAINT "__sync_scope_fk_root_whqzszw2jj";

ALTER TABLE "slice"."sync_skipped" VALIDATE CONSTRAINT "__sync_skipped_fk_by_zsxc5osgwh";

ALTER TABLE "slice"."sync_skipped" ADD CONSTRAINT "__sync_skipped_fk_root_33hfwafoud" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_skipped" VALIDATE CONSTRAINT "__sync_skipped_fk_root_33hfwafoud";

ALTER TABLE "slice"."sync_start_scope" ADD CONSTRAINT "__sync_start_scope_fk_child_root_bfah526wa7" FOREIGN KEY ("child", "root") REFERENCES "slice"."sync_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_start_scope" VALIDATE CONSTRAINT "__sync_start_scope_fk_child_root_bfah526wa7";

ALTER TABLE "slice"."sync_start_scope" ADD CONSTRAINT "__sync_start_scope_fk_root_4ys6ftxnzl" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_start_scope" VALIDATE CONSTRAINT "__sync_start_scope_fk_root_4ys6ftxnzl";

ALTER TABLE "slice"."sync_start_scope" ADD CONSTRAINT "__sync_start_scope_fk_scope_root_d2xbykpoy6" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_start_scope" VALIDATE CONSTRAINT "__sync_start_scope_fk_scope_root_d2xbykpoy6";

ALTER TABLE "slice"."sync_start_step" ADD CONSTRAINT "__sync_start_step_fk_root_2jg4xkdldt" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_start_step" VALIDATE CONSTRAINT "__sync_start_step_fk_root_2jg4xkdldt";

ALTER TABLE "slice"."sync_start_step" ADD CONSTRAINT "__sync_start_step_fk_scope_root_vedcbu54xe" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_start_step" VALIDATE CONSTRAINT "__sync_start_step_fk_scope_root_vedcbu54xe";

ALTER TABLE "slice"."sync_start_step" ADD CONSTRAINT "__sync_start_step_fk_step_root_jas4o3xkqs" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_start_step" VALIDATE CONSTRAINT "__sync_start_step_fk_step_root_jas4o3xkqs";

ALTER TABLE "slice"."sync_step" ADD CONSTRAINT "__sync_step_fk_root_rmc4nivt3i" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_step" VALIDATE CONSTRAINT "__sync_step_fk_root_rmc4nivt3i";

ALTER TABLE "slice"."sync_step" ADD CONSTRAINT "__sync_step_fk_scope_root_sfdyvsar2y" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_admitted" ("scope", "root") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_step" VALIDATE CONSTRAINT "__sync_step_fk_scope_root_sfdyvsar2y";

ALTER TABLE "slice"."sync_sync_run_input" ADD CONSTRAINT "__sync_sync_run_input_fk_root_ifd4bfberz" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_sync_run_input" VALIDATE CONSTRAINT "__sync_sync_run_input_fk_root_ifd4bfberz";

ALTER TABLE "slice"."sync_sync_run_input" ADD CONSTRAINT "__sync_sync_run_input_fk_scope_root_tag_kind_sync_nywcyhb4rh" FOREIGN KEY ("scope", "root", "__tag_kind_sync_run_wcjtzgltvo") REFERENCES "slice"."sync_scope" ("scope", "root", "kind") MATCH SIMPLE NOT VALID;

ALTER TABLE "slice"."sync_sync_run_input" VALIDATE CONSTRAINT "__sync_sync_run_input_fk_scope_root_tag_kind_sync_nywcyhb4rh";

ALTER TABLE "slice"."sync_within" ADD CONSTRAINT "__sync_within_fk_parent_root_xuxk3jxvng" FOREIGN KEY ("parent", "root") REFERENCES "slice"."sync_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_within" VALIDATE CONSTRAINT "__sync_within_fk_parent_root_xuxk3jxvng";

ALTER TABLE "slice"."sync_within" ADD CONSTRAINT "__sync_within_fk_root_wq5xadgno2" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_within" VALIDATE CONSTRAINT "__sync_within_fk_root_wq5xadgno2";

ALTER TABLE "slice"."sync_within" ADD CONSTRAINT "__sync_within_fk_scope_root_zwg5s2mvrv" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_scope" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."sync_within" VALIDATE CONSTRAINT "__sync_within_fk_scope_root_zwg5s2mvrv";
