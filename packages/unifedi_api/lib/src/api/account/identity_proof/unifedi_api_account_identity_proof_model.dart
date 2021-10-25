import '../../unifedi_api_model.dart';

abstract class IUnifediApiAccountIdentityProof
    implements IUnifediApiResponsePart {
  String? get provider;

  String? get providerUsername;

  DateTime? get updatedAt;

  String? get proofUrl;

  String? get profileUrl;
}
