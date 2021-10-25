import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_account_identity_proof_model.dart';

part 'mastodon_api_account_identity_proof_model_impl.freezed.dart';

part 'mastodon_api_account_identity_proof_model_impl.g.dart';

// ignore_for_file: no-magic-number

@freezed
@HiveType(typeId: 0)
class MastodonApiAccountIdentityProof
    with _$MastodonApiAccountIdentityProof
    implements IMastodonApiAccountIdentityProof {
  const factory MastodonApiAccountIdentityProof({
    @JsonKey(name: 'profile_url') @HiveField(0) required String? profileUrl,
    @JsonKey(name: 'proof_url') @HiveField(1) required String? proofUrl,
    @HiveField(2) required String? provider,
    @JsonKey(name: 'provider_username')
    @HiveField(3)
        required String? providerUsername,
    @HiveField(4) required DateTime? updatedAt,
  }) = _MastodonApiAccountIdentityProof;

  factory MastodonApiAccountIdentityProof.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAccountIdentityProofFromJson(json);
}

extension IMastodonApiAccountIdentityProofInterfaceExtension
    on IMastodonApiAccountIdentityProof {
  MastodonApiAccountIdentityProof toMastodonApiAccountIdentityProof({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAccountIdentityProof(
          profileUrl: profileUrl,
          proofUrl: proofUrl,
          provider: provider,
          providerUsername: providerUsername,
          updatedAt: updatedAt,
        ),
        forceNewObject: forceNewObject,
      );
}
