import '../mastodon_api_model.dart';
import 'replies_policy_type/mastodon_api_card_replies_policy_type_sealed.dart';

abstract class IMastodonApiList implements IMastodonApiResponse {
  String get id;

  String get title;

  String? get repliesPolicy;
}

extension IMastodonApiListTypExtension on IMastodonApiList {
  MastodonApiListRepliesPolicyType? get repliesPolicyAsMastodonApi =>
      repliesPolicy?.toMastodonApiListRepliesPolicyType();
}
