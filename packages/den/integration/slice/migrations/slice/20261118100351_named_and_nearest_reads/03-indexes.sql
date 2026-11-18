CREATE INDEX "__assign_claim_ix_step_fxyms_236_d_4_pred_attempt_x24ydo4nq6" ON "slice"."assign_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox");

CREATE INDEX "__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" ON "slice"."assign_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_step_ix_scope_kind_4jyx7qz4gq" ON "slice"."assign_step" USING btree ("scope", "kind");

CREATE INDEX "__assign_within_ix_parent_pf64og3aei" ON "slice"."assign_within" USING btree ("parent");

CREATE INDEX "__passage_ix_topic_lzh6djzwn4" ON "slice"."passage" USING btree ("topic");

CREATE INDEX "__passage_ix_embedding_ujugi77ft2" ON "slice"."passage" USING hnsw ("embedding" "vector_ext"."vector_cosine_ops");

CREATE STATISTICS "slice"."__assign_step_stats_kind_scope_wiztsdmmtf" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."assign_step";
