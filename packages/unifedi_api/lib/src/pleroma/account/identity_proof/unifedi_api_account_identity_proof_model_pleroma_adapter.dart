import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/account/identity_proof/unifedi_api_account_identity_proof_model.dart';

part 'unifedi_api_account_identity_proof_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_account_identity_proof_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAccountIdentityProofPleromaAdapter
    with _$UnifediApiAccountIdentityProofPleromaAdapter
    implements IUnifediApiAccountIdentityProof {
  const UnifediApiAccountIdentityProofPleromaAdapter._();
  const factory UnifediApiAccountIdentityProofPleromaAdapter(
    @HiveField(0) PleromaApiAccountIdentityProof value,
  ) = _UnifediApiAccountIdentityProofPleromaAdapter;

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
  factory UnifediApiAccountIdentityProofPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAccountIdentityProofPleromaAdapterFromJson(json);
}

extension PleromaApiAccountIdentityProofUnifediExtension
    on IPleromaApiAccountIdentityProof {
  UnifediApiAccountIdentityProofPleromaAdapter
      toUnifediApiAccountIdentityProofPleromaAdapter() =>
          UnifediApiAccountIdentityProofPleromaAdapter(
            toPleromaApiAccountIdentityProof(),
          );
}

extension PleromaApiAccountIdentityProofUnifediListExtension
    on List<IPleromaApiAccountIdentityProof> {
  List<UnifediApiAccountIdentityProofPleromaAdapter>
      toUnifediApiAccountIdentityProofPleromaAdapterList() => map(
            (item) => item.toUnifediApiAccountIdentityProofPleromaAdapter(),
          ).toList();
}
