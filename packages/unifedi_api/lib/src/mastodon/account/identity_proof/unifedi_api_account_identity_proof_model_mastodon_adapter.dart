import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/account/identity_proof/unifedi_api_account_identity_proof_model.dart';

part 'unifedi_api_account_identity_proof_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_account_identity_proof_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountIdentityProofMastodonAdapter
    with _$UnifediApiAccountIdentityProofMastodonAdapter
    implements IUnifediApiAccountIdentityProof {
  const UnifediApiAccountIdentityProofMastodonAdapter._();
  const factory UnifediApiAccountIdentityProofMastodonAdapter(
    @HiveField(0) MastodonApiAccountIdentityProof value,
  ) = _UnifediApiAccountIdentityProofMastodonAdapter;

  @override
  String? get profileUrl => value.profileUrl;

  @override
  String? get proofUrl => value.proofUrl;

  @override
  String? get provider => value.provider;

  @override
  String? get providerUsername => value.providerUsername;

  @override
  DateTime? get updatedAt => value.updatedAt;
  factory UnifediApiAccountIdentityProofMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountIdentityProofMastodonAdapterFromJson(json);
}

extension MastodonApiAccountIdentityProofUnifediExtension
    on IMastodonApiAccountIdentityProof {
  UnifediApiAccountIdentityProofMastodonAdapter
      toUnifediApiAccountIdentityProofMastodonAdapter() =>
          UnifediApiAccountIdentityProofMastodonAdapter(
            toMastodonApiAccountIdentityProof(),
          );
}

extension MastodonApiAccountIdentityProofUnifediListExtension
    on List<IMastodonApiAccountIdentityProof> {
  List<UnifediApiAccountIdentityProofMastodonAdapter>
      toUnifediApiAccountIdentityProofMastodonAdapterList() => map(
            (item) => item.toUnifediApiAccountIdentityProofMastodonAdapter(),
          ).toList();
}
