CREATE INDEX "__chain_claim_ix_step_fxyms_236_d_4_pred_attempt_cgz4fqmrbd" ON "slice"."chain_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox");

CREATE INDEX "__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" ON "slice"."chain_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_step_ix_scope_kind_spn3gys2vi" ON "slice"."chain_step" USING btree ("scope", "kind");

CREATE INDEX "__chain_within_ix_parent_3xemf3jvuy" ON "slice"."chain_within" USING btree ("parent");

CREATE INDEX "__fan_claim_ix_step_fxyms_236_d_4_pred_attempt_rdwu35kano" ON "slice"."fan_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox");

CREATE INDEX "__fan_hold_ix_resource_seat_pred_turn_qryngij_6_c_4_khwnztqprz" ON "slice"."fan_hold" USING btree ("resource", "seat", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" ON "slice"."fan_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_step_ix_scope_kind_h2wuapaqs3" ON "slice"."fan_step" USING btree ("scope", "kind");

CREATE INDEX "__fan_within_ix_parent_7swblvcobd" ON "slice"."fan_within" USING btree ("parent");

CREATE INDEX "__retry_claim_ix_step_fxyms_236_d_4_pred_attempt_ln4othihnf" ON "slice"."retry_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox");

CREATE INDEX "__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" ON "slice"."retry_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_step_ix_scope_kind_gvjz7p6rcr" ON "slice"."retry_step" USING btree ("scope", "kind");

CREATE INDEX "__retry_within_ix_parent_d7nkgphtnq" ON "slice"."retry_within" USING btree ("parent");

CREATE INDEX "__sync_claim_ix_step_fxyms_236_d_4_pred_attempt_ltqcryx7yu" ON "slice"."sync_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox");

CREATE INDEX "__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" ON "slice"."sync_exclusive" USING btree ("kind", "key", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" ON "slice"."sync_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_step_ix_scope_qlsdbwk3lt" ON "slice"."sync_step" USING btree ("scope");

CREATE INDEX "__sync_within_ix_parent_xnkjm556so" ON "slice"."sync_within" USING btree ("parent");

CREATE STATISTICS "slice"."__chain_step_stats_kind_scope_tc5nmidpxu" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."chain_step";

CREATE STATISTICS "slice"."__fan_hold_stats_resource_seat_a5wbxdv46u" (ndistinct, dependencies, mcv) ON "resource", "seat" FROM "slice"."fan_hold";

CREATE STATISTICS "slice"."__fan_step_stats_kind_scope_xmuvugpu6n" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."fan_step";

CREATE STATISTICS "slice"."__retry_step_stats_kind_scope_osnqmvpfhd" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."retry_step";

CREATE STATISTICS "slice"."__sync_exclusive_stats_key_kind_smed76p3zh" (ndistinct, dependencies, mcv) ON "key", "kind" FROM "slice"."sync_exclusive";
