import '../../mastodon_api_model.dart';

abstract class IMastodonApiAccountIdentityProof
    implements IMastodonApiResponse {
  String? get provider;

  String? get providerUsername;

  DateTime? get updatedAt;

  String? get proofUrl;

  String? get profileUrl;
}
