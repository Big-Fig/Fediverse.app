// ignore_for_file: no-magic-number
import 'mastodon_api_list_model_impl.dart';
import 'replies_policy_type/mastodon_api_card_replies_policy_type_sealed_mock_helper.dart';

class MastodonApiListMockHelper {
  static MastodonApiList generate({
    required String seed,
  }) =>
      MastodonApiList(
        title: seed + 'title',
        id: seed + 'id',
        repliesPolicy: MastodonApiListRepliesPolicyTypeMockHelper.generate(
          seed: seed + 'repliesPolicy',
        ).stringValue,
      );
}
