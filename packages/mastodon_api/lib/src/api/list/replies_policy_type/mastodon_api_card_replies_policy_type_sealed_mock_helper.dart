import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'mastodon_api_card_replies_policy_type_sealed.dart';

abstract class MastodonApiListRepliesPolicyTypeMockHelper {
  static MastodonApiListRepliesPolicyType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: MastodonApiListRepliesPolicyType.values,
      );
}
